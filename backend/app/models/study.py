"""
学习相关数据模型
"""
from sqlalchemy import Column, String, Text, DateTime, Date, ForeignKey, Integer, Enum
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.orm import relationship
import uuid
import enum

from app.core.database import Base


class PlanType(str, enum.Enum):
    """学习计划类型"""
    DAILY = "daily"
    WEEKLY = "weekly"
    MONTHLY = "monthly"
    SEMESTER = "semester"


class TaskType(str, enum.Enum):
    """学习任务类型"""
    READING = "reading"
    PRACTICE = "practice"
    MEMORIZATION = "memorization"
    DICTATION = "dictation"
    REVIEW = "review"


class TaskPriority(str, enum.Enum):
    """任务优先级"""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"


class TaskStatus(str, enum.Enum):
    """任务状态"""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    OVERDUE = "overdue"


class StudyPlan(Base):
    """学习计划模型"""
    __tablename__ = "study_plans"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id"), nullable=False)
    title = Column(String(100), nullable=False)
    description = Column(Text)
    plan_type = Column(Enum(PlanType), nullable=False)
    start_date = Column(Date, nullable=False)
    end_date = Column(Date, nullable=False)
    status = Column(String(20), default="active")
    created_at = Column(DateTime, nullable=False)
    
    # 关系
    user = relationship("User", back_populates="study_plans")
    subject = relationship("Subject", back_populates="study_plans")
    study_tasks = relationship("StudyTask", back_populates="study_plan")


class StudyTask(Base):
    """学习任务模型"""
    __tablename__ = "study_tasks"
    
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id"), nullable=False)
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id"), nullable=False)
    study_plan_id = Column(UUID(as_uuid=True), ForeignKey("study_plans.id"), nullable=True)
    title = Column(String(100), nullable=False)
    description = Column(Text)
    task_type = Column(Enum(TaskType), nullable=False)
    priority = Column(Enum(TaskPriority), default=TaskPriority.MEDIUM)
    due_date = Column(DateTime)
    status = Column(Enum(TaskStatus), default=TaskStatus.PENDING)
    created_at = Column(DateTime, nullable=False)
    
    # 关系
    user = relationship("User", back_populates="study_tasks")
    subject = relationship("Subject", back_populates="study_tasks")
    study_plan = relationship("StudyPlan", back_populates="study_tasks")