"""
提醒管理API
"""
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List, Optional
from datetime import datetime

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.reminder import Reminder
from app.schemas.reminder import ReminderCreate, ReminderResponse

router = APIRouter()


@router.get("/", response_model=List[ReminderResponse])
def get_reminders(
    reminder_type: Optional[str] = None,
    is_sent: Optional[bool] = None,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取提醒列表"""
    query = db.query(Reminder).filter(Reminder.user_id == current_user.id)
    
    if reminder_type:
        query = query.filter(Reminder.reminder_type == reminder_type)
    if is_sent is not None:
        query = query.filter(Reminder.is_sent == is_sent)
    
    reminders = query.all()
    return reminders


@router.post("/", response_model=ReminderResponse)
def create_reminder(
    reminder: ReminderCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """创建提醒"""
    # 创建提醒
    new_reminder = Reminder(
        user_id=current_user.id,
        title=reminder.title,
        content=reminder.content,
        reminder_type=reminder.reminder_type,
        reminder_time=reminder.reminder_time
    )
    
    db.add(new_reminder)
    db.commit()
    db.refresh(new_reminder)
    
    return new_reminder


@router.get("/{reminder_id}", response_model=ReminderResponse)
def get_reminder(
    reminder_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取提醒详情"""
    reminder = db.query(Reminder).filter(
        Reminder.id == reminder_id,
        Reminder.user_id == current_user.id
    ).first()
    
    if not reminder:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="提醒不存在"
        )
    
    return reminder


@router.put("/{reminder_id}", response_model=ReminderResponse)
def update_reminder(
    reminder_id: str,
    reminder_update: ReminderCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新提醒"""
    reminder = db.query(Reminder).filter(
        Reminder.id == reminder_id,
        Reminder.user_id == current_user.id
    ).first()
    
    if not reminder:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="提醒不存在"
        )
    
    # 更新提醒信息
    for field, value in reminder_update.dict(exclude_unset=True).items():
        setattr(reminder, field, value)
    
    db.commit()
    db.refresh(reminder)
    
    return reminder


@router.delete("/{reminder_id}")
def delete_reminder(
    reminder_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """删除提醒"""
    reminder = db.query(Reminder).filter(
        Reminder.id == reminder_id,
        Reminder.user_id == current_user.id
    ).first()
    
    if not reminder:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="提醒不存在"
        )
    
    db.delete(reminder)
    db.commit()
    
    return {"message": "提醒已删除"}


@router.get("/upcoming/", response_model=List[ReminderResponse])
def get_upcoming_reminders(
    hours: int = 24,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取即将到来的提醒"""
    from datetime import datetime, timedelta
    
    end_time = datetime.now() + timedelta(hours=hours)
    
    reminders = db.query(Reminder).filter(
        Reminder.user_id == current_user.id,
        Reminder.reminder_time >= datetime.now(),
        Reminder.reminder_time <= end_time,
        Reminder.is_sent == False
    ).all()
    
    return reminders


@router.put("/{reminder_id}/mark-sent")
def mark_reminder_sent(
    reminder_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """标记提醒为已发送"""
    reminder = db.query(Reminder).filter(
        Reminder.id == reminder_id,
        Reminder.user_id == current_user.id
    ).first()
    
    if not reminder:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="提醒不存在"
        )
    
    reminder.is_sent = True
    db.commit()
    
    return {"message": "提醒已标记为已发送"}
