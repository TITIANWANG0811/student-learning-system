"""
学习相关数据模式
"""
from pydantic import BaseModel, Field
from typing import Optional
from datetime import datetime, date
from uuid import UUID


class StudyPlanCreate(BaseModel):
    """创建学习计划"""
    subject_id: UUID
    title: str = Field(..., min_length=1, max_length=100)
    description: Optional[str] = None
    plan_type: str = Field(..., pattern="^(daily|weekly|monthly|semester)$")
    start_date: date
    end_date: date


class StudyPlanResponse(BaseModel):
    """学习计划响应"""
    id: UUID
    user_id: UUID
    subject_id: UUID
    title: str
    description: Optional[str]
    plan_type: str
    start_date: date
    end_date: date
    status: str
    created_at: datetime
    
    class Config:
        from_attributes = True


class StudyTaskCreate(BaseModel):
    """创建学习任务"""
    subject_id: UUID
    study_plan_id: Optional[UUID] = None
    title: str = Field(..., min_length=1, max_length=100)
    description: Optional[str] = None
    task_type: str = Field(..., pattern="^(reading|practice|memorization|dictation|review)$")
    priority: str = Field(default="medium", pattern="^(low|medium|high)$")
    due_date: Optional[datetime] = None


class StudyTaskResponse(BaseModel):
    """学习任务响应"""
    id: UUID
    user_id: UUID
    subject_id: UUID
    study_plan_id: Optional[UUID]
    title: str
    description: Optional[str]
    task_type: str
    priority: str
    due_date: Optional[datetime]
    status: str
    created_at: datetime
    
    class Config:
        from_attributes = True
