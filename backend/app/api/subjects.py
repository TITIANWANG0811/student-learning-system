"""
学科相关API
"""
from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy.orm import Session
from typing import List, Optional

from app.core.database import get_db
from app.schemas.subject import SubjectResponse, SubjectWithCategory, TextbookChapterResponse, KnowledgePointResponse
from app.models.subject import Subject, TextbookChapter, KnowledgePoint
from app.models.subject_category import SubjectCategory

router = APIRouter()


@router.get("/", response_model=List[SubjectResponse])
def get_subjects(
    category_id: Optional[str] = Query(None, description="分类ID"),
    is_core_subject: Optional[bool] = Query(None, description="是否核心科目"),
    difficulty_level: Optional[int] = Query(None, ge=1, le=5, description="难度等级"),
    db: Session = Depends(get_db)
):
    """获取所有学科"""
    query = db.query(Subject).filter(Subject.is_active == True)
    
    if category_id:
        query = query.filter(Subject.category_id == category_id)
    if is_core_subject is not None:
        query = query.filter(Subject.is_core_subject == is_core_subject)
    if difficulty_level:
        query = query.filter(Subject.difficulty_level == difficulty_level)
    
    subjects = query.order_by(Subject.name).all()
    return subjects


@router.get("/by-category", response_model=List[SubjectResponse])
def get_subjects_by_category(db: Session = Depends(get_db)):
    """按分类获取学科"""
    subjects = db.query(Subject).filter(Subject.is_active == True).order_by(Subject.name).all()
    return subjects


@router.get("/{subject_id}/chapters", response_model=List[TextbookChapterResponse])
def get_chapters(subject_id: str, grade: str = None, semester: str = None, db: Session = Depends(get_db)):
    """获取学科章节"""
    query = db.query(TextbookChapter).filter(TextbookChapter.subject_id == subject_id)
    
    if grade:
        query = query.filter(TextbookChapter.grade == grade)
    if semester:
        query = query.filter(TextbookChapter.semester == semester)
    
    chapters = query.order_by(TextbookChapter.order_index).all()
    return chapters


@router.get("/{subject_id}/knowledge-points", response_model=List[KnowledgePointResponse])
def get_knowledge_points(subject_id: str, chapter_id: str = None, db: Session = Depends(get_db)):
    """获取知识点"""
    query = db.query(KnowledgePoint).filter(KnowledgePoint.subject_id == subject_id)
    
    if chapter_id:
        query = query.filter(KnowledgePoint.chapter_id == chapter_id)
    
    knowledge_points = query.order_by(KnowledgePoint.order_index).all()
    return knowledge_points
