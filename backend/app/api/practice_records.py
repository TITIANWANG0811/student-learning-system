"""
练习记录API路由
"""
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List, Optional
from uuid import UUID

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.practice_record import PracticeRecord
from app.schemas.practice_record import (
    PracticeRecordResponse,
    PracticeRecordCreate,
    PracticeRecordUpdate,
    PracticeRecordWithSubject
)

router = APIRouter()


@router.get("/", response_model=List[PracticeRecordWithSubject])
def get_practice_records(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    subject_id: Optional[UUID] = Query(None, description="学科ID"),
    practice_type: Optional[str] = Query(None, description="练习类型"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取练习记录列表"""
    query = db.query(PracticeRecord).filter(PracticeRecord.student_id == current_user.id)
    
    if subject_id:
        query = query.filter(PracticeRecord.subject_id == subject_id)
    if practice_type:
        query = query.filter(PracticeRecord.practice_type == practice_type)
    
    practice_records = query.order_by(PracticeRecord.created_at.desc()).offset(skip).limit(limit).all()
    return practice_records


@router.get("/{practice_record_id}", response_model=PracticeRecordWithSubject)
def get_practice_record(
    practice_record_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取单个练习记录详情"""
    practice_record = db.query(PracticeRecord).filter(
        PracticeRecord.id == practice_record_id,
        PracticeRecord.student_id == current_user.id
    ).first()
    if not practice_record:
        raise HTTPException(status_code=404, detail="练习记录不存在")
    return practice_record


@router.post("/", response_model=PracticeRecordResponse)
def create_practice_record(
    practice_record: PracticeRecordCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """创建练习记录"""
    db_practice_record = PracticeRecord(
        **practice_record.dict(),
        student_id=current_user.id
    )
    db.add(db_practice_record)
    db.commit()
    db.refresh(db_practice_record)
    return db_practice_record


@router.put("/{practice_record_id}", response_model=PracticeRecordResponse)
def update_practice_record(
    practice_record_id: UUID,
    practice_record: PracticeRecordUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """更新练习记录"""
    db_practice_record = db.query(PracticeRecord).filter(
        PracticeRecord.id == practice_record_id,
        PracticeRecord.student_id == current_user.id
    ).first()
    if not db_practice_record:
        raise HTTPException(status_code=404, detail="练习记录不存在")
    
    update_data = practice_record.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_practice_record, field, value)
    
    db.commit()
    db.refresh(db_practice_record)
    return db_practice_record


@router.delete("/{practice_record_id}")
def delete_practice_record(
    practice_record_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """删除练习记录"""
    db_practice_record = db.query(PracticeRecord).filter(
        PracticeRecord.id == practice_record_id,
        PracticeRecord.student_id == current_user.id
    ).first()
    if not db_practice_record:
        raise HTTPException(status_code=404, detail="练习记录不存在")
    
    db.delete(db_practice_record)
    db.commit()
    return {"message": "练习记录删除成功"}
