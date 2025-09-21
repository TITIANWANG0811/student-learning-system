"""
学科相关模型
"""
from sqlalchemy import Column, String, Text, Boolean, DateTime, Integer, ForeignKey, CheckConstraint, UniqueConstraint
from sqlalchemy.dialects.postgresql import UUID, ARRAY
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid

from app.core.database import Base


class Subject(Base):
    """学科表"""
    __tablename__ = "subjects"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name = Column(String(50), nullable=False)  # 语文、数学、英语、道法、历史
    code = Column(String(10), unique=True, nullable=False)  # chinese, math, english, ethics, history
    category_id = Column(UUID(as_uuid=True), ForeignKey("subject_categories.id", ondelete="SET NULL"), nullable=True)
    description = Column(Text)
    color = Column(String(7))  # 主题色
    icon = Column(String(50))  # 图标名称
    difficulty_level = Column(Integer, default=1)  # 难度等级 1-5
    is_core_subject = Column(Boolean, default=False)  # 是否核心科目
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    category = relationship("SubjectCategory", back_populates="subjects")
    chapters = relationship("TextbookChapter", back_populates="subject")
    knowledge_points = relationship("KnowledgePoint", back_populates="subject")
    study_plans = relationship("StudyPlan", back_populates="subject")
    study_tasks = relationship("StudyTask", back_populates="subject")
    notes = relationship("Note", back_populates="subject")
    assignments = relationship("Assignment", back_populates="subject")
    exams = relationship("Exam", back_populates="subject")
    mind_maps = relationship("MindMap", back_populates="subject")
    recitations = relationship("Recitation", back_populates="subject")
    practice_records = relationship("PracticeRecord", back_populates="subject")
    wrong_questions = relationship("WrongQuestion", back_populates="subject")


class TextbookChapter(Base):
    """教材章节表"""
    __tablename__ = "textbook_chapters"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False)
    grade = Column(String(10), nullable=False)  # 年级
    semester = Column(String(10), nullable=False)  # 学期
    chapter_number = Column(Integer, nullable=False)
    title = Column(String(200), nullable=False)
    description = Column(Text)
    order_index = Column(Integer, nullable=False)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    subject = relationship("Subject", back_populates="chapters")
    knowledge_points = relationship("KnowledgePoint", back_populates="chapter")
    mind_maps = relationship("MindMap", back_populates="chapter")
    recitations = relationship("Recitation", back_populates="chapter")
    
    __table_args__ = (
        UniqueConstraint("subject_id", "grade", "semester", "chapter_number", name="uq_chapter"),
    )


class KnowledgePoint(Base):
    """知识点表"""
    __tablename__ = "knowledge_points"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False)
    chapter_id = Column(UUID(as_uuid=True), ForeignKey("textbook_chapters.id", ondelete="CASCADE"))
    title = Column(String(200), nullable=False)
    content = Column(Text, nullable=False)
    difficulty_level = Column(Integer)  # 1-5难度等级
    tags = Column(ARRAY(String))  # 标签数组
    order_index = Column(Integer)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    subject = relationship("Subject", back_populates="knowledge_points")
    chapter = relationship("TextbookChapter", back_populates="knowledge_points")
    
    __table_args__ = (
        CheckConstraint("difficulty_level BETWEEN 1 AND 5", name="check_difficulty_level"),
    )
