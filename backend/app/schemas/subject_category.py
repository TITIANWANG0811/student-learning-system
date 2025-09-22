"""
学科分类相关模式
"""
from pydantic import BaseModel, Field
from typing import Optional, List, TYPE_CHECKING
from datetime import datetime
from uuid import UUID

# 导入SubjectResponse以避免循环导入
if TYPE_CHECKING:
    from app.schemas.subject import SubjectResponse


class SubjectCategoryBase(BaseModel):
    """学科分类基础模式"""
    name: str = Field(..., description="分类名称")
    code: str = Field(..., description="分类代码")
    description: Optional[str] = Field(None, description="分类描述")
    color: Optional[str] = Field(None, description="主题色")
    icon: Optional[str] = Field(None, description="图标名称")
    sort_order: int = Field(0, description="排序")
    is_active: bool = Field(True, description="是否激活")


class SubjectCategoryCreate(SubjectCategoryBase):
    """创建学科分类模式"""
    pass


class SubjectCategoryUpdate(BaseModel):
    """更新学科分类模式"""
    name: Optional[str] = Field(None, description="分类名称")
    code: Optional[str] = Field(None, description="分类代码")
    description: Optional[str] = Field(None, description="分类描述")
    color: Optional[str] = Field(None, description="主题色")
    icon: Optional[str] = Field(None, description="图标名称")
    sort_order: Optional[int] = Field(None, description="排序")
    is_active: Optional[bool] = Field(None, description="是否激活")


class SubjectCategoryResponse(SubjectCategoryBase):
    """学科分类响应模式"""
    id: UUID = Field(..., description="分类ID")
    created_at: datetime = Field(..., description="创建时间")
    
    class Config:
        from_attributes = True


class SubjectCategoryWithSubjects(SubjectCategoryResponse):
    """包含学科的学科分类响应模式"""
    subjects: List[dict] = Field(default=[], description="学科列表")
    
    class Config:
        from_attributes = True


# 导入SubjectResponse以避免循环导入
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from app.schemas.subject import SubjectResponse
