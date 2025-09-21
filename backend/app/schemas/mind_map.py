"""
思维导图相关模式
"""
from pydantic import BaseModel, Field
from typing import Optional, List, Dict, Any
from datetime import datetime
from uuid import UUID


class MindMapBase(BaseModel):
    """思维导图基础模式"""
    title: str = Field(..., description="思维导图标题")
    description: Optional[str] = Field(None, description="描述")
    content: Optional[Dict[str, Any]] = Field(None, description="思维导图数据")
    tags: Optional[List[str]] = Field(default=[], description="标签")
    is_public: bool = Field(False, description="是否公开")


class MindMapCreate(MindMapBase):
    """创建思维导图模式"""
    subject_id: UUID = Field(..., description="学科ID")
    chapter_id: Optional[UUID] = Field(None, description="章节ID")


class MindMapUpdate(BaseModel):
    """更新思维导图模式"""
    title: Optional[str] = Field(None, description="思维导图标题")
    description: Optional[str] = Field(None, description="描述")
    content: Optional[Dict[str, Any]] = Field(None, description="思维导图数据")
    tags: Optional[List[str]] = Field(None, description="标签")
    is_public: Optional[bool] = Field(None, description="是否公开")


class MindMapResponse(MindMapBase):
    """思维导图响应模式"""
    id: UUID = Field(..., description="思维导图ID")
    student_id: UUID = Field(..., description="学生ID")
    subject_id: UUID = Field(..., description="学科ID")
    chapter_id: Optional[UUID] = Field(None, description="章节ID")
    created_at: datetime = Field(..., description="创建时间")
    updated_at: datetime = Field(..., description="更新时间")
    
    class Config:
        from_attributes = True


class MindMapWithSubject(MindMapResponse):
    """包含学科信息的思维导图响应模式"""
    subject: Optional['SubjectResponse'] = None
    
    class Config:
        from_attributes = True


# 导入SubjectResponse以避免循环导入
from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from app.schemas.subject import SubjectResponse
