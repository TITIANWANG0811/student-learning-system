"""
内容相关数据模式
"""
from pydantic import BaseModel, Field
from typing import Optional, List
from datetime import datetime
from uuid import UUID


class NoteCreate(BaseModel):
    """创建笔记"""
    subject_id: UUID
    title: str = Field(..., min_length=1, max_length=100)
    content: str = Field(..., min_length=1)
    note_type: str = Field(..., pattern="^(class|reading|error|review)$")
    tags: Optional[List[str]] = None
    is_public: bool = False


class NoteResponse(BaseModel):
    """笔记响应"""
    id: UUID
    user_id: UUID
    subject_id: UUID
    title: str
    content: str
    note_type: str
    tags: List[str]
    is_public: bool
    created_at: datetime
    updated_at: datetime
    
    class Config:
        from_attributes = True


class AssignmentCreate(BaseModel):
    """创建作业"""
    subject_id: UUID
    title: str = Field(..., min_length=1, max_length=100)
    description: Optional[str] = None
    assignment_type: str = Field(..., pattern="^(daily|holiday|special|optional)$")
    due_date: datetime


class AssignmentResponse(BaseModel):
    """作业响应"""
    id: UUID
    user_id: UUID
    subject_id: UUID
    title: str
    description: Optional[str]
    assignment_type: str
    due_date: datetime
    status: str
    score: Optional[int]
    feedback: Optional[str]
    created_at: datetime
    
    class Config:
        from_attributes = True
