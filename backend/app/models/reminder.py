"""
提醒相关数据模型
"""
from sqlalchemy import Column, String, Text, DateTime, ForeignKey, Boolean, Enum
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
import uuid
import enum

from app.core.database import Base


class ReminderType(str, enum.Enum):
    """提醒类型"""
    STUDY = "study"
    EXAM = "exam"
    ASSIGNMENT = "assignment"
    REVIEW = "review"


class Reminder(Base):
    """提醒模型"""
    __tablename__ = "reminders"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    title = Column(String(100), nullable=False)
    content = Column(Text)
    reminder_type = Column(Enum(ReminderType), nullable=False)
    reminder_time = Column(DateTime, nullable=False)
    is_sent = Column(Boolean, default=False)
    created_at = Column(DateTime, nullable=False)
    
    # 关系
    user = relationship("User", back_populates="reminders")