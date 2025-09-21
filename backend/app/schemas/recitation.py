"""
默写相关模式
"""
from pydantic import BaseModel, Field
from typing import Optional, TYPE_CHECKING
from datetime import datetime
from uuid import UUID

# 导入SubjectResponse以避免循环导入
if TYPE_CHECKING:
    from app.schemas.subject import SubjectResponse


class RecitationBase(BaseModel):
    """默写基础模式"""
    title: str = Field(..., description="默写标题")
    content: str = Field(..., description="默写内容")
    markdown_content: Optional[str] = Field(None, description="Markdown格式的完整内容")
    recitation_type: str = Field(..., description="默写类型")
    vocabulary_type: Optional[str] = Field(None, description="词汇类型")
    proper_noun_type: Optional[str] = Field(None, description="专有名词类型")
    grade_level: Optional[str] = Field(None, description="学籍等级")
    unit_name: Optional[str] = Field(None, description="单元名称")
    difficulty_level: int = Field(1, ge=1, le=5, description="难度等级")
    is_memorized: bool = Field(False, description="是否已背诵")


class RecitationCreate(RecitationBase):
    """创建默写模式"""
    subject_id: UUID = Field(..., description="学科ID")
    chapter_id: Optional[UUID] = Field(None, description="章节ID")


class RecitationUpdate(BaseModel):
    """更新默写模式"""
    title: Optional[str] = Field(None, description="默写标题")
    content: Optional[str] = Field(None, description="默写内容")
    markdown_content: Optional[str] = Field(None, description="Markdown格式的完整内容")
    recitation_type: Optional[str] = Field(None, description="默写类型")
    vocabulary_type: Optional[str] = Field(None, description="词汇类型")
    proper_noun_type: Optional[str] = Field(None, description="专有名词类型")
    grade_level: Optional[str] = Field(None, description="学籍等级")
    unit_name: Optional[str] = Field(None, description="单元名称")
    difficulty_level: Optional[int] = Field(None, ge=1, le=5, description="难度等级")
    is_memorized: Optional[bool] = Field(None, description="是否已背诵")


class RecitationResponse(RecitationBase):
    """默写响应模式"""
    id: UUID = Field(..., description="默写ID")
    student_id: UUID = Field(..., description="学生ID")
    subject_id: UUID = Field(..., description="学科ID")
    chapter_id: Optional[UUID] = Field(None, description="章节ID")
    practice_count: int = Field(0, description="练习次数")
    last_practice_date: Optional[datetime] = Field(None, description="最后练习时间")
    created_at: datetime = Field(..., description="创建时间")
    updated_at: datetime = Field(..., description="更新时间")
    
    class Config:
        from_attributes = True


class RecitationWithSubject(RecitationResponse):
    """包含学科信息的默写响应模式"""
    subject: Optional['SubjectResponse'] = None
    
    class Config:
        from_attributes = True


