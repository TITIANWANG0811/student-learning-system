"""
用户相关模式
"""
from pydantic import BaseModel, EmailStr
from typing import Optional
from datetime import datetime
from uuid import UUID


class UserBase(BaseModel):
    """用户基础模式"""
    username: str
    email: EmailStr
    full_name: str
    grade: Optional[str] = None
    class_name: Optional[str] = None
    role: str


class UserCreate(UserBase):
    """创建用户模式"""
    password: str


class UserUpdate(BaseModel):
    """更新用户模式"""
    full_name: Optional[str] = None
    grade: Optional[str] = None
    class_name: Optional[str] = None
    avatar_url: Optional[str] = None


class UserResponse(UserBase):
    """用户响应模式"""
    id: UUID
    avatar_url: Optional[str] = None
    is_active: bool
    created_at: datetime
    updated_at: datetime

    class Config:
        from_attributes = True


class UserLogin(BaseModel):
    """用户登录模式"""
    username: str
    password: str


class Token(BaseModel):
    """令牌模式"""
    access_token: str
    token_type: str


class ParentStudentRelationCreate(BaseModel):
    """创建家长-学生关系模式"""
    student_id: UUID
    relationship: str = "parent"


class ParentStudentRelationResponse(BaseModel):
    """家长-学生关系响应模式"""
    id: UUID
    parent_id: UUID
    student_id: UUID
    relationship: str
    created_at: datetime

    class Config:
        from_attributes = True
