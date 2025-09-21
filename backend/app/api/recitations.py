"""
默写API路由
"""
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List, Optional
from uuid import UUID

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.recitation import Recitation
from app.schemas.recitation import (
    RecitationResponse,
    RecitationCreate,
    RecitationUpdate,
    RecitationWithSubject
)

router = APIRouter()


@router.get("/", response_model=List[RecitationWithSubject])
def get_recitations(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    subject_id: Optional[UUID] = Query(None, description="学科ID"),
    chapter_id: Optional[UUID] = Query(None, description="章节ID"),
    recitation_type: Optional[str] = Query(None, description="默写类型"),
    difficulty_level: Optional[int] = Query(None, ge=1, le=5, description="难度等级"),
    is_memorized: Optional[bool] = Query(None, description="是否已背诵"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取默写列表"""
    query = db.query(Recitation).filter(Recitation.student_id == current_user.id)
    
    if subject_id:
        query = query.filter(Recitation.subject_id == subject_id)
    if chapter_id:
        query = query.filter(Recitation.chapter_id == chapter_id)
    if recitation_type:
        query = query.filter(Recitation.recitation_type == recitation_type)
    if difficulty_level:
        query = query.filter(Recitation.difficulty_level == difficulty_level)
    if is_memorized is not None:
        query = query.filter(Recitation.is_memorized == is_memorized)
    
    recitations = query.order_by(Recitation.created_at.desc()).offset(skip).limit(limit).all()
    return recitations


@router.get("/{recitation_id}", response_model=RecitationWithSubject)
def get_recitation(
    recitation_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取单个默写详情"""
    recitation = db.query(Recitation).filter(
        Recitation.id == recitation_id,
        Recitation.student_id == current_user.id
    ).first()
    if not recitation:
        raise HTTPException(status_code=404, detail="默写不存在")
    return recitation


@router.post("/", response_model=RecitationResponse)
def create_recitation(
    recitation: RecitationCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """创建默写"""
    db_recitation = Recitation(
        **recitation.dict(),
        student_id=current_user.id
    )
    db.add(db_recitation)
    db.commit()
    db.refresh(db_recitation)
    return db_recitation


@router.put("/{recitation_id}", response_model=RecitationResponse)
def update_recitation(
    recitation_id: UUID,
    recitation: RecitationUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """更新默写"""
    db_recitation = db.query(Recitation).filter(
        Recitation.id == recitation_id,
        Recitation.student_id == current_user.id
    ).first()
    if not db_recitation:
        raise HTTPException(status_code=404, detail="默写不存在")
    
    update_data = recitation.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_recitation, field, value)
    
    db.commit()
    db.refresh(db_recitation)
    return db_recitation


@router.post("/{recitation_id}/practice")
def practice_recitation(
    recitation_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """练习默写（增加练习次数）"""
    db_recitation = db.query(Recitation).filter(
        Recitation.id == recitation_id,
        Recitation.student_id == current_user.id
    ).first()
    if not db_recitation:
        raise HTTPException(status_code=404, detail="默写不存在")
    
    db_recitation.practice_count += 1
    db_recitation.last_practice_date = func.now()
    
    db.commit()
    db.refresh(db_recitation)
    return {"message": "练习记录已更新", "practice_count": db_recitation.practice_count}


@router.delete("/{recitation_id}")
def delete_recitation(
    recitation_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """删除默写"""
    db_recitation = db.query(Recitation).filter(
        Recitation.id == recitation_id,
        Recitation.student_id == current_user.id
    ).first()
    if not db_recitation:
        raise HTTPException(status_code=404, detail="默写不存在")
    
    db.delete(db_recitation)
    db.commit()
    return {"message": "默写删除成功"}
