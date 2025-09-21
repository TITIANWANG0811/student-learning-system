"""
练习记录相关模式
"""
from pydantic import BaseModel, Field
from typing import Optional, Dict, Any
from datetime import datetime
from uuid import UUID
from decimal import Decimal


class PracticeRecordBase(BaseModel):
    """练习记录基础模式"""
    practice_type: str = Field(..., description="练习类型")
    title: str = Field(..., description="练习标题")
    content: Optional[Dict[str, Any]] = Field(None, description="练习内容")
    total_questions: int = Field(..., description="总题数")
    correct_answers: int = Field(0, description="正确答案数")
    score: Optional[Decimal] = Field(None, description="分数")
    duration: Optional[int] = Field(None, description="用时（分钟）")


class PracticeRecordCreate(PracticeRecordBase):
    """创建练习记录模式"""
    subject_id: UUID = Field(..., description="学科ID")


class PracticeRecordUpdate(BaseModel):
    """更新练习记录模式"""
    title: Optional[str] = Field(None, description="练习标题")
    content: Optional[Dict[str, Any]] = Field(None, description="练习内容")
    correct_answers: Optional[int] = Field(None, description="正确答案数")
    score: Optional[Decimal] = Field(None, description="分数")
    duration: Optional[int] = Field(None, description="用时（分钟）")
    completed_at: Optional[datetime] = Field(None, description="完成时间")


class PracticeRecordResponse(PracticeRecordBase):
    """练习记录响应模式"""
    id: UUID = Field(..., description="练习记录ID")
    student_id: UUID = Field(..., description="学生ID")
    subject_id: UUID = Field(..., description="学科ID")
    completed_at: Optional[datetime] = Field(None, description="完成时间")
    created_at: datetime = Field(..., description="创建时间")
    
    class Config:
        from_attributes = True


class PracticeRecordWithSubject(PracticeRecordResponse):
    """包含学科信息的练习记录响应模式"""
    subject: Optional['SubjectResponse'] = None
    
    class Config:
        from_attributes = True


# 导入SubjectResponse以避免循环导入
from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from app.schemas.subject import SubjectResponse
