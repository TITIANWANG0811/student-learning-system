"""
考试相关数据模型
"""
from sqlalchemy import Column, String, Text, DateTime, ForeignKey, Integer, Enum, Boolean
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
import uuid
import enum

from app.core.database import Base


class ExamType(str, enum.Enum):
    """考试类型"""
    QUIZ = "quiz"
    TEST = "test"
    MIDTERM = "midterm"
    FINAL = "final"


class ExamStatus(str, enum.Enum):
    """考试状态"""
    SCHEDULED = "scheduled"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    CANCELLED = "cancelled"


class Exam(Base):
    """考试模型"""
    __tablename__ = "exams"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id"), nullable=False)
    title = Column(String(100), nullable=False)
    exam_type = Column(Enum(ExamType), nullable=False)
    exam_date = Column(DateTime, nullable=False)
    duration = Column(Integer)  # 考试时长（分钟）
    total_score = Column(Integer, nullable=False)
    score = Column(Integer)
    status = Column(Enum(ExamStatus), default=ExamStatus.SCHEDULED)
    is_public = Column(Boolean, default=False, comment="是否公开")
    is_shared = Column(Boolean, default=False, comment="是否分享给同学")
    created_at = Column(DateTime, nullable=False)
    
    # 关系
    user = relationship("User", back_populates="exams")
    subject = relationship("Subject", back_populates="exams")