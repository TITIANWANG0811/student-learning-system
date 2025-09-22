"""
练习记录模型
"""
from sqlalchemy import Column, String, DateTime, Integer, ForeignKey, CheckConstraint, DECIMAL, Boolean
from sqlalchemy.dialects.postgresql import UUID, JSONB
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid

from app.core.database import Base


class PracticeRecord(Base):
    """练习记录表"""
    __tablename__ = "practice_records"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    student_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False)
    practice_type = Column(String(20), nullable=False)  # exercise, quiz, simulation, review
    title = Column(String(200), nullable=False)
    content = Column(JSONB)  # 练习题目和答案
    total_questions = Column(Integer, nullable=False)
    correct_answers = Column(Integer, default=0)
    score = Column(DECIMAL(5, 2))  # 分数
    duration = Column(Integer)  # 用时（分钟）
    completed_at = Column(DateTime(timezone=True))
    is_public = Column(Boolean, default=False, comment="是否公开")
    is_shared = Column(Boolean, default=False, comment="是否分享给同学")
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    student = relationship("User", back_populates="practice_records")
    subject = relationship("Subject", back_populates="practice_records")
    wrong_questions = relationship("WrongQuestion", back_populates="practice_record")
    
    __table_args__ = (
        CheckConstraint("practice_type IN ('exercise', 'quiz', 'simulation', 'review')", name="check_practice_type"),
    )
