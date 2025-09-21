"""
思维导图模型
"""
from sqlalchemy import Column, String, Text, Boolean, DateTime, ForeignKey
from sqlalchemy.dialects.postgresql import UUID, JSONB, ARRAY
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid

from app.core.database import Base


class MindMap(Base):
    """思维导图表"""
    __tablename__ = "mind_maps"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    student_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False)
    chapter_id = Column(UUID(as_uuid=True), ForeignKey("textbook_chapters.id", ondelete="SET NULL"), nullable=True)
    title = Column(String(200), nullable=False)
    description = Column(Text)
    content = Column(JSONB)  # 思维导图数据（节点和连接）
    tags = Column(ARRAY(String))
    is_public = Column(Boolean, default=False)  # 是否公开分享
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    student = relationship("User", back_populates="mind_maps")
    subject = relationship("Subject", back_populates="mind_maps")
    chapter = relationship("TextbookChapter", back_populates="mind_maps")
