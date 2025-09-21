"""
考试相关数据模式
"""
from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime
from uuid import UUID


class ExamCreate(BaseModel):
    """创建考试"""
    subject_id: UUID
    title: str = Field(..., min_length=1, max_length=100)
    exam_type: str = Field(..., pattern="^(quiz|test|midterm|final)$")
    exam_date: datetime
    duration: Optional[int] = Field(None, ge=1, le=300)  # 1-300分钟
    total_score: int = Field(..., ge=1, le=1000)


class ExamResponse(BaseModel):
    """考试响应"""
    id: UUID
    user_id: UUID
    subject_id: UUID
    title: str
    exam_type: str
    exam_date: datetime
    duration: Optional[int]
    total_score: int
    score: Optional[int]
    status: str
    created_at: datetime
    
    class Config:
        from_attributes = True
