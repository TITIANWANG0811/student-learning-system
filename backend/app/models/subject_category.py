"""
学科分类模型
"""
from sqlalchemy import Column, String, Text, Integer, Boolean, DateTime
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid

from app.core.database import Base


class SubjectCategory(Base):
    """学科分类表"""
    __tablename__ = "subject_categories"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name = Column(String(50), nullable=False, comment="分类名称")
    code = Column(String(20), unique=True, nullable=False, comment="分类代码")
    description = Column(Text, comment="分类描述")
    color = Column(String(7), comment="主题色")
    icon = Column(String(50), comment="图标名称")
    sort_order = Column(Integer, default=0, comment="排序")
    is_active = Column(Boolean, default=True, comment="是否激活")
    created_at = Column(DateTime(timezone=True), server_default=func.now(), comment="创建时间")

    # 关系
    subjects = relationship("Subject", back_populates="category")
