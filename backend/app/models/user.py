"""
用户相关模型
"""
from sqlalchemy import Column, String, Boolean, DateTime, ForeignKey, CheckConstraint
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
import uuid

from app.core.database import Base


class User(Base):
    """用户表"""
    __tablename__ = "users"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    username = Column(String(50), unique=True, nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    hashed_password = Column(String(255), nullable=False)
    role = Column(String(20), nullable=False)
    full_name = Column(String(100), nullable=False)
    grade = Column(String(10))  # 年级
    class_name = Column(String(50))  # 班级
    avatar_url = Column(String(255))
    is_active = Column(Boolean, default=True)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())
    
    # 添加检查约束
    __table_args__ = (
        CheckConstraint("role IN ('student', 'parent', 'teacher')", name='check_user_role'),
    )
    
    # 关系
    study_plans = relationship("StudyPlan", back_populates="user")
    study_tasks = relationship("StudyTask", back_populates="user")
    notes = relationship("Note", back_populates="user")
    assignments = relationship("Assignment", back_populates="user")
    exams = relationship("Exam", back_populates="user")
    reminders = relationship("Reminder", back_populates="user")
    mind_maps = relationship("MindMap", back_populates="student")
    recitations = relationship("Recitation", back_populates="student")
    practice_records = relationship("PracticeRecord", back_populates="student")
    wrong_questions = relationship("WrongQuestion", back_populates="student")
    chinese_notes = relationship("ChineseNotes", back_populates="user")
    english_vocabulary = relationship("EnglishVocabulary", back_populates="user")
    
    # 家长关系
    parent_relations = relationship("ParentStudentRelation", foreign_keys="ParentStudentRelation.parent_id", back_populates="parent")
    student_relations = relationship("ParentStudentRelation", foreign_keys="ParentStudentRelation.student_id", back_populates="student")


class ParentStudentRelation(Base):
    """家长-学生关系表"""
    __tablename__ = "parent_student_relations"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    parent_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    student_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    relation_type = Column(String(20), default="parent")
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    
    # 关系
    parent = relationship("User", foreign_keys=[parent_id], back_populates="parent_relations")
    student = relationship("User", foreign_keys=[student_id], back_populates="student_relations")
    
    __table_args__ = (
        CheckConstraint("relation_type IN ('parent', 'guardian')", name='check_relation_type'),
    )
