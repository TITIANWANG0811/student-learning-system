"""
错题本模型
"""
from sqlalchemy import Column, String, Text, Boolean, DateTime, Integer, ForeignKey, CheckConstraint
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid

from app.core.database import Base


class WrongQuestion(Base):
    """错题本表"""
    __tablename__ = "wrong_questions"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    student_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False)
    practice_record_id = Column(UUID(as_uuid=True), ForeignKey("practice_records.id", ondelete="SET NULL"), nullable=True)
    question_content = Column(Text, nullable=False)
    correct_answer = Column(Text, nullable=False)
    student_answer = Column(Text)
    explanation = Column(Text)  # 解析
    difficulty_level = Column(Integer, default=1)  # 1-5难度等级
    is_mastered = Column(Boolean, default=False)  # 是否已掌握
    review_count = Column(Integer, default=0)  # 复习次数
    last_review_date = Column(DateTime(timezone=True))
    is_public = Column(Boolean, default=False, comment="是否公开")
    is_shared = Column(Boolean, default=False, comment="是否分享给同学")
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    student = relationship("User", back_populates="wrong_questions")
    subject = relationship("Subject", back_populates="wrong_questions")
    practice_record = relationship("PracticeRecord", back_populates="wrong_questions")
    
    __table_args__ = (
        CheckConstraint("difficulty_level BETWEEN 1 AND 5", name="check_difficulty_level"),
    )
