"""
应用配置文件
"""
import os
from pydantic_settings import BaseSettings
from typing import Optional


class Settings(BaseSettings):
    """应用配置类"""
    
    # 数据库配置
    database_url: str = "postgresql://titianwang@localhost:5432/student_learning_system"
    redis_url: str = "redis://localhost:6379/1"  # 使用数据库1，避免与其他项目冲突
    
    # JWT配置
    secret_key: str = "your-secret-key-here-change-in-production"
    algorithm: str = "HS256"
    access_token_expire_minutes: int = 30
    
    # 应用配置
    app_name: str = "初中生学习管理系统"
    app_version: str = "1.0.0"
    debug: bool = True
    host: str = "0.0.0.0"
    port: int = 9002
    
    # 文件上传配置
    upload_dir: str = "uploads"
    max_file_size: int = 10485760  # 10MB
    
    # CORS配置
    allowed_origins: list = ["http://localhost:9003", "http://127.0.0.1:9003"]
    
    class Config:
        env_file = ".env"
        case_sensitive = False


# 创建全局配置实例
settings = Settings()
