"""
错题本相关模式
"""
from pydantic import BaseModel, Field
from typing import Optional, TYPE_CHECKING
from datetime import datetime
from uuid import UUID

# 导入SubjectResponse以避免循环导入
if TYPE_CHECKING:
    from app.schemas.subject import SubjectResponse


class WrongQuestionBase(BaseModel):
    """错题基础模式"""
    question_content: str = Field(..., description="题目内容")
    correct_answer: str = Field(..., description="正确答案")
    student_answer: Optional[str] = Field(None, description="学生答案")
    explanation: Optional[str] = Field(None, description="解析")
    difficulty_level: int = Field(1, ge=1, le=5, description="难度等级")
    is_mastered: bool = Field(False, description="是否已掌握")


class WrongQuestionCreate(WrongQuestionBase):
    """创建错题模式"""
    subject_id: UUID = Field(..., description="学科ID")
    practice_record_id: Optional[UUID] = Field(None, description="练习记录ID")


class WrongQuestionUpdate(BaseModel):
    """更新错题模式"""
    student_answer: Optional[str] = Field(None, description="学生答案")
    explanation: Optional[str] = Field(None, description="解析")
    difficulty_level: Optional[int] = Field(None, ge=1, le=5, description="难度等级")
    is_mastered: Optional[bool] = Field(None, description="是否已掌握")


class WrongQuestionResponse(WrongQuestionBase):
    """错题响应模式"""
    id: UUID = Field(..., description="错题ID")
    student_id: UUID = Field(..., description="学生ID")
    subject_id: UUID = Field(..., description="学科ID")
    practice_record_id: Optional[UUID] = Field(None, description="练习记录ID")
    review_count: int = Field(0, description="复习次数")
    last_review_date: Optional[datetime] = Field(None, description="最后复习时间")
    created_at: datetime = Field(..., description="创建时间")
    updated_at: datetime = Field(..., description="更新时间")
    
    class Config:
        from_attributes = True


class WrongQuestionWithSubject(WrongQuestionResponse):
    """包含学科信息的错题响应模式"""
    subject: Optional['SubjectResponse'] = None
    
    class Config:
        from_attributes = True


# 导入SubjectResponse以避免循环导入
from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from app.schemas.subject import SubjectResponse
