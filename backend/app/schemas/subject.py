"""
学科相关模式
"""
from pydantic import BaseModel, Field
from typing import Optional, List
from datetime import datetime
from uuid import UUID


class SubjectResponse(BaseModel):
    """学科响应模式"""
    id: UUID
    name: str
    code: str
    category_id: Optional[UUID] = None
    description: Optional[str] = None
    color: Optional[str] = None
    icon: Optional[str] = None
    difficulty_level: int = Field(1, description="难度等级")
    is_core_subject: bool = Field(False, description="是否核心科目")
    is_active: bool
    created_at: datetime

    class Config:
        from_attributes = True


class SubjectWithCategory(SubjectResponse):
    """包含分类信息的学科响应模式"""
    category: Optional['SubjectCategoryResponse'] = None
    
    class Config:
        from_attributes = True


class TextbookChapterBase(BaseModel):
    """教材章节基础模式"""
    grade: str
    semester: str
    chapter_number: int
    title: str
    description: Optional[str] = None
    order_index: int


class TextbookChapterCreate(TextbookChapterBase):
    """创建教材章节模式"""
    subject_id: UUID


class TextbookChapterUpdate(BaseModel):
    """更新教材章节模式"""
    title: Optional[str] = None
    description: Optional[str] = None
    order_index: Optional[int] = None


class TextbookChapterResponse(TextbookChapterBase):
    """教材章节响应模式"""
    id: UUID
    subject_id: UUID
    created_at: datetime

    class Config:
        from_attributes = True


class KnowledgePointBase(BaseModel):
    """知识点基础模式"""
    title: str
    content: str
    difficulty_level: Optional[int] = None
    tags: Optional[List[str]] = None
    order_index: Optional[int] = None


class KnowledgePointCreate(KnowledgePointBase):
    """创建知识点模式"""
    subject_id: UUID
    chapter_id: Optional[UUID] = None


class KnowledgePointUpdate(BaseModel):
    """更新知识点模式"""
    title: Optional[str] = None
    content: Optional[str] = None
    difficulty_level: Optional[int] = None
    tags: Optional[List[str]] = None
    order_index: Optional[int] = None


class KnowledgePointResponse(KnowledgePointBase):
    """知识点响应模式"""
    id: UUID
    subject_id: UUID
    chapter_id: Optional[UUID] = None
    created_at: datetime

    class Config:
        from_attributes = True
