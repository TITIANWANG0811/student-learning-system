"""
考试管理API
"""
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List, Optional
from datetime import datetime

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.exam import Exam
from app.models.subject import Subject
from app.schemas.exam import ExamCreate, ExamResponse

router = APIRouter()


@router.get("/", response_model=List[ExamResponse])
def get_exams(
    subject_id: Optional[str] = None,
    exam_type: Optional[str] = None,
    status: Optional[str] = None,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取考试列表"""
    query = db.query(Exam).filter(Exam.user_id == current_user.id)
    
    if subject_id:
        query = query.filter(Exam.subject_id == subject_id)
    if exam_type:
        query = query.filter(Exam.exam_type == exam_type)
    if status:
        query = query.filter(Exam.status == status)
    
    exams = query.all()
    return exams


@router.post("/", response_model=ExamResponse)
def create_exam(
    exam: ExamCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """创建考试"""
    # 验证学科是否存在
    subject = db.query(Subject).filter(Subject.id == exam.subject_id).first()
    if not subject:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学科不存在"
        )
    
    # 创建考试
    new_exam = Exam(
        user_id=current_user.id,
        subject_id=exam.subject_id,
        title=exam.title,
        exam_type=exam.exam_type,
        exam_date=exam.exam_date,
        duration=exam.duration,
        total_score=exam.total_score
    )
    
    db.add(new_exam)
    db.commit()
    db.refresh(new_exam)
    
    return new_exam


@router.get("/{exam_id}", response_model=ExamResponse)
def get_exam(
    exam_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取考试详情"""
    exam = db.query(Exam).filter(
        Exam.id == exam_id,
        Exam.user_id == current_user.id
    ).first()
    
    if not exam:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="考试不存在"
        )
    
    return exam


@router.put("/{exam_id}", response_model=ExamResponse)
def update_exam(
    exam_id: str,
    exam_update: ExamCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新考试信息"""
    exam = db.query(Exam).filter(
        Exam.id == exam_id,
        Exam.user_id == current_user.id
    ).first()
    
    if not exam:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="考试不存在"
        )
    
    # 更新考试信息
    for field, value in exam_update.dict(exclude_unset=True).items():
        setattr(exam, field, value)
    
    db.commit()
    db.refresh(exam)
    
    return exam


@router.put("/{exam_id}/score")
def update_exam_score(
    exam_id: str,
    score: int,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新考试分数"""
    exam = db.query(Exam).filter(
        Exam.id == exam_id,
        Exam.user_id == current_user.id
    ).first()
    
    if not exam:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="考试不存在"
        )
    
    if score > exam.total_score:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="分数不能超过总分"
        )
    
    exam.score = score
    exam.status = "completed"
    db.commit()
    
    return {"message": "考试分数已更新"}


@router.delete("/{exam_id}")
def delete_exam(
    exam_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """删除考试"""
    exam = db.query(Exam).filter(
        Exam.id == exam_id,
        Exam.user_id == current_user.id
    ).first()
    
    if not exam:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="考试不存在"
        )
    
    db.delete(exam)
    db.commit()
    
    return {"message": "考试已删除"}


@router.get("/upcoming/", response_model=List[ExamResponse])
def get_upcoming_exams(
    days: int = 7,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取即将到来的考试"""
    from datetime import datetime, timedelta
    
    end_date = datetime.now() + timedelta(days=days)
    
    exams = db.query(Exam).filter(
        Exam.user_id == current_user.id,
        Exam.exam_date >= datetime.now(),
        Exam.exam_date <= end_date,
        Exam.status == "scheduled"
    ).all()
    
    return exams
