from sqlalchemy import Column, String, Text, Integer, Boolean, DateTime, Date, ForeignKey
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship
import uuid

from app.core.database import Base

class EnglishVocabulary(Base):
    """英语词汇表"""
    __tablename__ = "english_vocabulary"

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id = Column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"), nullable=False, comment="用户ID")
    subject_id = Column(UUID(as_uuid=True), ForeignKey("subjects.id", ondelete="CASCADE"), nullable=False, comment="学科ID")
    word = Column(String(255), nullable=False, comment="单词")
    phonetic = Column(String(255), comment="音标")
    part_of_speech = Column(String(100), comment="词性")
    meaning = Column(Text, comment="中文释义")
    examples = Column(Text, comment="例句")
    memory_method = Column(Text, comment="联想记忆")
    related_words = Column(Text, comment="相关词汇")
    grade_level = Column(String(50), nullable=False, comment="年级")
    unit_name = Column(String(100), comment="单元名称")
    difficulty_level = Column(Integer, default=1, comment="难度等级")
    is_memorized = Column(Boolean, default=False, comment="是否已背诵")
    practice_count = Column(Integer, default=0, comment="练习次数")
    last_practice_date = Column(DateTime, comment="最后练习时间")
    is_public = Column(Boolean, default=False, comment="是否公开")
    is_shared = Column(Boolean, default=False, comment="是否分享给同学")
    created_at = Column(DateTime, default=func.now(), comment="创建时间")
    updated_at = Column(DateTime, default=func.now(), onupdate=func.now(), comment="更新时间")
    
    # 关系
    user = relationship("User", back_populates="english_vocabulary")
    subject = relationship("Subject", back_populates="english_vocabulary")
