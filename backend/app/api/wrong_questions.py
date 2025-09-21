"""
错题本API路由
"""
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List, Optional
from uuid import UUID

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.wrong_question import WrongQuestion
from app.schemas.wrong_question import (
    WrongQuestionResponse,
    WrongQuestionCreate,
    WrongQuestionUpdate,
    WrongQuestionWithSubject
)

router = APIRouter()


@router.get("/", response_model=List[WrongQuestionWithSubject])
def get_wrong_questions(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    subject_id: Optional[UUID] = Query(None, description="学科ID"),
    difficulty_level: Optional[int] = Query(None, ge=1, le=5, description="难度等级"),
    is_mastered: Optional[bool] = Query(None, description="是否已掌握"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取错题列表"""
    query = db.query(WrongQuestion).filter(WrongQuestion.student_id == current_user.id)
    
    if subject_id:
        query = query.filter(WrongQuestion.subject_id == subject_id)
    if difficulty_level:
        query = query.filter(WrongQuestion.difficulty_level == difficulty_level)
    if is_mastered is not None:
        query = query.filter(WrongQuestion.is_mastered == is_mastered)
    
    wrong_questions = query.order_by(WrongQuestion.created_at.desc()).offset(skip).limit(limit).all()
    return wrong_questions


@router.get("/{wrong_question_id}", response_model=WrongQuestionWithSubject)
def get_wrong_question(
    wrong_question_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取单个错题详情"""
    wrong_question = db.query(WrongQuestion).filter(
        WrongQuestion.id == wrong_question_id,
        WrongQuestion.student_id == current_user.id
    ).first()
    if not wrong_question:
        raise HTTPException(status_code=404, detail="错题不存在")
    return wrong_question


@router.post("/", response_model=WrongQuestionResponse)
def create_wrong_question(
    wrong_question: WrongQuestionCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """创建错题"""
    db_wrong_question = WrongQuestion(
        **wrong_question.dict(),
        student_id=current_user.id
    )
    db.add(db_wrong_question)
    db.commit()
    db.refresh(db_wrong_question)
    return db_wrong_question


@router.put("/{wrong_question_id}", response_model=WrongQuestionResponse)
def update_wrong_question(
    wrong_question_id: UUID,
    wrong_question: WrongQuestionUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """更新错题"""
    db_wrong_question = db.query(WrongQuestion).filter(
        WrongQuestion.id == wrong_question_id,
        WrongQuestion.student_id == current_user.id
    ).first()
    if not db_wrong_question:
        raise HTTPException(status_code=404, detail="错题不存在")
    
    update_data = wrong_question.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_wrong_question, field, value)
    
    db.commit()
    db.refresh(db_wrong_question)
    return db_wrong_question


@router.post("/{wrong_question_id}/review")
def review_wrong_question(
    wrong_question_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """复习错题（增加复习次数）"""
    db_wrong_question = db.query(WrongQuestion).filter(
        WrongQuestion.id == wrong_question_id,
        WrongQuestion.student_id == current_user.id
    ).first()
    if not db_wrong_question:
        raise HTTPException(status_code=404, detail="错题不存在")
    
    db_wrong_question.review_count += 1
    db_wrong_question.last_review_date = func.now()
    
    db.commit()
    db.refresh(db_wrong_question)
    return {"message": "复习记录已更新", "review_count": db_wrong_question.review_count}


@router.delete("/{wrong_question_id}")
def delete_wrong_question(
    wrong_question_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """删除错题"""
    db_wrong_question = db.query(WrongQuestion).filter(
        WrongQuestion.id == wrong_question_id,
        WrongQuestion.student_id == current_user.id
    ).first()
    if not db_wrong_question:
        raise HTTPException(status_code=404, detail="错题不存在")
    
    db.delete(db_wrong_question)
    db.commit()
    return {"message": "错题删除成功"}
