from pydantic import BaseModel
from typing import Optional
from datetime import datetime, date
from uuid import UUID

class ChineseNotesBase(BaseModel):
    """语文笔记基础模式"""
    title: str
    content: Optional[str] = None
    markdown_content: Optional[str] = None
    note_date: Optional[date] = None
    grade_level: str
    subject: str
    unit_name: Optional[str] = None
    difficulty_level: int = 1
    is_public: bool = False
    is_shared: bool = False

class ChineseNotesCreate(ChineseNotesBase):
    """创建语文笔记模式"""
    pass

class ChineseNotesUpdate(BaseModel):
    """更新语文笔记模式"""
    title: Optional[str] = None
    content: Optional[str] = None
    markdown_content: Optional[str] = None
    note_date: Optional[date] = None
    grade_level: Optional[str] = None
    subject: Optional[str] = None
    unit_name: Optional[str] = None
    difficulty_level: Optional[int] = None
    is_public: Optional[bool] = None
    is_shared: Optional[bool] = None

class ChineseNotesResponse(ChineseNotesBase):
    """语文笔记响应模式"""
    id: UUID
    user_id: UUID
    subject_id: UUID
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True

class ChineseNotesWithUserResponse(ChineseNotesBase):
    """包含用户信息的语文笔记响应模式"""
    id: UUID
    user_id: UUID
    subject_id: UUID
    created_at: datetime
    updated_at: datetime
    # 用户信息
    author_username: Optional[str] = None
    author_full_name: Optional[str] = None

    class Config:
        from_attributes = True
