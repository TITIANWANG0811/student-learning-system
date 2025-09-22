"""
默写模型
"""
from sqlalchemy import Column, String, Text, Boolean, DateTime, Integer, ForeignKey, CheckConstraint
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid

from app.core.database import Base


class Recitation(Base):
    """默写表"""
    __tablename__ = "recitations"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    student_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False)
    chapter_id = Column(UUID(as_uuid=True), ForeignKey("textbook_chapters.id", ondelete="SET NULL"), nullable=True)
    title = Column(String(200), nullable=False)
    content = Column(Text, nullable=False)  # 默写内容
    markdown_content = Column(Text, nullable=True)  # Markdown格式的完整内容
    recitation_type = Column(String(20), nullable=False)  # poetry, prose, formula, vocabulary, definition, other
    vocabulary_type = Column(String(20), nullable=True)  # word, phrase, idiom, expression, proper_noun
    proper_noun_type = Column(String(20), nullable=True)  # person_name, place_name, other (当vocabulary_type=proper_noun时使用)
    grade_level = Column(String(10), nullable=True)  # 初一, 初二, 初三
    unit_name = Column(String(50), nullable=True)  # Starter, Unit 1, Unit 2等
    difficulty_level = Column(Integer, default=1)  # 1-5难度等级
    is_memorized = Column(Boolean, default=False)  # 是否已背诵
    practice_count = Column(Integer, default=0)  # 练习次数
    last_practice_date = Column(DateTime(timezone=True))
    is_public = Column(Boolean, default=False, comment="是否公开")
    is_shared = Column(Boolean, default=False, comment="是否分享给同学")
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    student = relationship("User", back_populates="recitations")
    subject = relationship("Subject", back_populates="recitations")
    chapter = relationship("TextbookChapter", back_populates="recitations")
    
    __table_args__ = (
        CheckConstraint("recitation_type IN ('poetry', 'prose', 'formula', 'vocabulary', 'definition', 'other')", name="check_recitation_type"),
        CheckConstraint("vocabulary_type IN ('word', 'phrase', 'idiom', 'expression', 'proper_noun')", name="check_vocabulary_type"),
        CheckConstraint("proper_noun_type IN ('person_name', 'place_name', 'other')", name="check_proper_noun_type"),
        CheckConstraint("grade_level IN ('初一', '初二', '初三')", name="check_grade_level"),
        CheckConstraint("difficulty_level BETWEEN 1 AND 5", name="check_difficulty_level"),
    )
