"""
内容相关数据模型
"""
from sqlalchemy import Column, String, Text, DateTime, ForeignKey, Boolean, Integer, Enum
from sqlalchemy.dialects.postgresql import UUID, ARRAY
from sqlalchemy.orm import relationship
import uuid
import enum

from app.core.database import Base


class NoteType(str, enum.Enum):
    """笔记类型"""
    CLASS = "class"
    READING = "reading"
    ERROR = "error"
    REVIEW = "review"


class AssignmentType(str, enum.Enum):
    """作业类型"""
    DAILY = "daily"
    HOLIDAY = "holiday"
    SPECIAL = "special"
    OPTIONAL = "optional"


class AssignmentStatus(str, enum.Enum):
    """作业状态"""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    SUBMITTED = "submitted"
    GRADED = "graded"


class Note(Base):
    """笔记模型"""
    __tablename__ = "notes"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id"), nullable=False)
    title = Column(String(100), nullable=False)
    content = Column(Text, nullable=False)
    note_type = Column(Enum(NoteType), nullable=False)
    tags = Column(ARRAY(String), default=list)
    is_public = Column(Boolean, default=False)
    created_at = Column(DateTime, nullable=False)
    updated_at = Column(DateTime, nullable=False)
    
    # 关系
    user = relationship("User", back_populates="notes")
    subject = relationship("Subject", back_populates="notes")


class Assignment(Base):
    """作业模型"""
    __tablename__ = "assignments"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id"), nullable=False)
    title = Column(String(100), nullable=False)
    description = Column(Text)
    assignment_type = Column(Enum(AssignmentType), nullable=False)
    due_date = Column(DateTime, nullable=False)
    status = Column(Enum(AssignmentStatus), default=AssignmentStatus.PENDING)
    score = Column(Integer)
    feedback = Column(Text)
    created_at = Column(DateTime, nullable=False)
    
    # 关系
    user = relationship("User", back_populates="assignments")
    subject = relationship("Subject", back_populates="assignments")