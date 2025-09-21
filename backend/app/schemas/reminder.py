"""
提醒相关数据模式
"""
from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime
from uuid import UUID


class ReminderCreate(BaseModel):
    """创建提醒"""
    title: str = Field(..., min_length=1, max_length=100)
    content: Optional[str] = None
    reminder_type: str = Field(..., pattern="^(study|exam|assignment|review)$")
    reminder_time: datetime


class ReminderResponse(BaseModel):
    """提醒响应"""
    id: UUID
    user_id: UUID
    title: str
    content: Optional[str]
    reminder_type: str
    reminder_time: datetime
    is_sent: bool
    created_at: datetime
    
    class Config:
        from_attributes = True
