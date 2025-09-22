from sqlalchemy import Column, String, Text, Integer, Date, DateTime, Boolean, ForeignKey
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship
import uuid

from app.core.database import Base

class ChineseNotes(Base):
    """语文笔记表"""
    __tablename__ = "chinese_notes"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False, comment="用户ID")
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False, comment="学科ID")
    title = Column(String(255), nullable=False, comment="笔记标题")
    content = Column(Text, comment="笔记内容")
    markdown_content = Column(Text, comment="Markdown格式内容")
    note_date = Column(Date, comment="笔记日期")
    grade_level = Column(String(50), nullable=False, comment="年级")
    subject = Column(String(100), nullable=False, comment="学科")
    unit_name = Column(String(100), comment="单元名称")
    difficulty_level = Column(Integer, default=1, comment="难度等级")
    is_public = Column(Boolean, default=False, comment="是否公开")
    is_shared = Column(Boolean, default=False, comment="是否分享给同学")
    created_at = Column(DateTime, default=func.now(), comment="创建时间")
    updated_at = Column(DateTime, default=func.now(), onupdate=func.now(), comment="更新时间")
    
    # 关系
    user = relationship("User", back_populates="chinese_notes")
    subject_rel = relationship("Subject", back_populates="chinese_notes")
