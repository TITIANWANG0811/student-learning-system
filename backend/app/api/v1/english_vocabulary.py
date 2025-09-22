from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from uuid import UUID

from app.core.database import get_db
from app.models.english_vocabulary import EnglishVocabulary
from app.schemas.english_vocabulary import EnglishVocabularyResponse, EnglishVocabularyCreate, EnglishVocabularyUpdate

router = APIRouter()

@router.get("/", response_model=List[EnglishVocabularyResponse])
async def get_english_vocabulary(
    grade_level: Optional[str] = None,
    unit_name: Optional[str] = None,
    is_memorized: Optional[bool] = None,
    db: Session = Depends(get_db)
):
    """获取英语词汇列表"""
    query = db.query(EnglishVocabulary)
    
    if grade_level:
        query = query.filter(EnglishVocabulary.grade_level == grade_level)
    if unit_name:
        query = query.filter(EnglishVocabulary.unit_name == unit_name)
    if is_memorized is not None:
        query = query.filter(EnglishVocabulary.is_memorized == is_memorized)
    
    return query.all()

@router.get("/{vocabulary_id}", response_model=EnglishVocabularyResponse)
async def get_english_vocabulary_by_id(
    vocabulary_id: UUID,
    db: Session = Depends(get_db)
):
    """根据ID获取英语词汇"""
    vocabulary = db.query(EnglishVocabulary).filter(EnglishVocabulary.id == vocabulary_id).first()
    if not vocabulary:
        raise HTTPException(status_code=404, detail="英语词汇不存在")
    return vocabulary

@router.post("/", response_model=EnglishVocabularyResponse)
async def create_english_vocabulary(
    vocabulary: EnglishVocabularyCreate,
    db: Session = Depends(get_db)
):
    """创建英语词汇"""
    db_vocabulary = EnglishVocabulary(**vocabulary.dict())
    db.add(db_vocabulary)
    db.commit()
    db.refresh(db_vocabulary)
    return db_vocabulary

@router.put("/{vocabulary_id}", response_model=EnglishVocabularyResponse)
async def update_english_vocabulary(
    vocabulary_id: UUID,
    vocabulary: EnglishVocabularyUpdate,
    db: Session = Depends(get_db)
):
    """更新英语词汇"""
    db_vocabulary = db.query(EnglishVocabulary).filter(EnglishVocabulary.id == vocabulary_id).first()
    if not db_vocabulary:
        raise HTTPException(status_code=404, detail="英语词汇不存在")
    
    update_data = vocabulary.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_vocabulary, field, value)
    
    db.commit()
    db.refresh(db_vocabulary)
    return db_vocabulary

@router.delete("/{vocabulary_id}")
async def delete_english_vocabulary(
    vocabulary_id: UUID,
    db: Session = Depends(get_db)
):
    """删除英语词汇"""
    db_vocabulary = db.query(EnglishVocabulary).filter(EnglishVocabulary.id == vocabulary_id).first()
    if not db_vocabulary:
        raise HTTPException(status_code=404, detail="英语词汇不存在")
    
    db.delete(db_vocabulary)
    db.commit()
    return {"message": "英语词汇删除成功"}
