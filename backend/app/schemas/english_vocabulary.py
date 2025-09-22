from pydantic import BaseModel
from typing import Optional
from datetime import datetime, date
from uuid import UUID

class EnglishVocabularyBase(BaseModel):
    """英语词汇基础模式"""
    word: str
    phonetic: Optional[str] = None
    part_of_speech: Optional[str] = None
    meaning: Optional[str] = None
    examples: Optional[str] = None
    memory_method: Optional[str] = None
    related_words: Optional[str] = None
    grade_level: str
    unit_name: Optional[str] = None
    difficulty_level: int = 1
    is_memorized: bool = False
    practice_count: int = 0
    last_practice_date: Optional[datetime] = None

class EnglishVocabularyCreate(EnglishVocabularyBase):
    """创建英语词汇模式"""
    pass

class EnglishVocabularyUpdate(BaseModel):
    """更新英语词汇模式"""
    word: Optional[str] = None
    phonetic: Optional[str] = None
    part_of_speech: Optional[str] = None
    meaning: Optional[str] = None
    examples: Optional[str] = None
    memory_method: Optional[str] = None
    related_words: Optional[str] = None
    grade_level: Optional[str] = None
    unit_name: Optional[str] = None
    difficulty_level: Optional[int] = None
    is_memorized: Optional[bool] = None
    practice_count: Optional[int] = None
    last_practice_date: Optional[datetime] = None

class EnglishVocabularyResponse(EnglishVocabularyBase):
    """英语词汇响应模式"""
    id: UUID
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True
