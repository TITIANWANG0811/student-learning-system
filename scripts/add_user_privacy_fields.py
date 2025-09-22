#!/usr/bin/env python3
"""
为学习数据表添加用户属性和隐私属性字段
"""
import os
import sys
import uuid
from datetime import datetime

# 添加项目根目录到Python路径
sys.path.append('/Users/titianwang/Workspace/App/StudentLearningSystem/backend')

from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker
from config import settings

def add_user_privacy_fields():
    """为学习数据表添加用户属性和隐私属性字段"""
    
    # 获取数据库连接
    database_url = settings.database_url
    engine = create_engine(database_url)
    
    # 获取默认用户和学科ID（假设存在）
    with engine.connect() as conn:
        # 获取默认用户ID
        result = conn.execute(text("SELECT id FROM users LIMIT 1"))
        user_row = result.fetchone()
        if not user_row:
            print("错误：没有找到用户，请先创建用户")
            return
        default_user_id = user_row[0]
        print(f"使用默认用户ID: {default_user_id}")
        
        # 获取语文和英语学科ID
        result = conn.execute(text("SELECT id, name FROM subjects WHERE name IN ('语文', '英语')"))
        subjects = result.fetchall()
        subject_map = {name: id for id, name in subjects}
        
        if '语文' not in subject_map:
            print("错误：没有找到语文学科")
            return
        if '英语' not in subject_map:
            print("错误：没有找到英语学科")
            return
            
        chinese_subject_id = subject_map['语文']
        english_subject_id = subject_map['英语']
        print(f"语文学科ID: {chinese_subject_id}")
        print(f"英语学科ID: {english_subject_id}")
    
    try:
        with engine.connect() as conn:
            # 开始事务
            trans = conn.begin()
            
            try:
                # 1. 为 chinese_notes 表添加字段
                print("为 chinese_notes 表添加用户属性和隐私字段...")
                conn.execute(text("""
                    ALTER TABLE chinese_notes 
                    ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES users(id) ON DELETE CASCADE,
                    ADD COLUMN IF NOT EXISTS subject_id UUID REFERENCES subjects(id) ON DELETE CASCADE,
                    ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
                    ADD COLUMN IF NOT EXISTS is_shared BOOLEAN DEFAULT FALSE
                """))
                
                # 更新现有记录的user_id和subject_id
                conn.execute(text("""
                    UPDATE chinese_notes 
                    SET user_id = :user_id, subject_id = :subject_id
                    WHERE user_id IS NULL
                """), {"user_id": default_user_id, "subject_id": chinese_subject_id})
                
                # 设置NOT NULL约束
                conn.execute(text("ALTER TABLE chinese_notes ALTER COLUMN user_id SET NOT NULL"))
                conn.execute(text("ALTER TABLE chinese_notes ALTER COLUMN subject_id SET NOT NULL"))
                
                # 2. 为 english_vocabulary 表添加字段
                print("为 english_vocabulary 表添加用户属性和隐私字段...")
                conn.execute(text("""
                    ALTER TABLE english_vocabulary 
                    ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES users(id) ON DELETE CASCADE,
                    ADD COLUMN IF NOT EXISTS subject_id UUID REFERENCES subjects(id) ON DELETE CASCADE,
                    ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
                    ADD COLUMN IF NOT EXISTS is_shared BOOLEAN DEFAULT FALSE
                """))
                
                # 更新现有记录的user_id和subject_id
                conn.execute(text("""
                    UPDATE english_vocabulary 
                    SET user_id = :user_id, subject_id = :subject_id
                    WHERE user_id IS NULL
                """), {"user_id": default_user_id, "subject_id": english_subject_id})
                
                # 设置NOT NULL约束
                conn.execute(text("ALTER TABLE english_vocabulary ALTER COLUMN user_id SET NOT NULL"))
                conn.execute(text("ALTER TABLE english_vocabulary ALTER COLUMN subject_id SET NOT NULL"))
                
                # 3. 为 exams 表添加隐私字段
                print("为 exams 表添加隐私字段...")
                conn.execute(text("""
                    ALTER TABLE exams 
                    ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
                    ADD COLUMN IF NOT EXISTS is_shared BOOLEAN DEFAULT FALSE
                """))
                
                # 4. 为 practice_records 表添加隐私字段
                print("为 practice_records 表添加隐私字段...")
                conn.execute(text("""
                    ALTER TABLE practice_records 
                    ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
                    ADD COLUMN IF NOT EXISTS is_shared BOOLEAN DEFAULT FALSE
                """))
                
                # 5. 为 wrong_questions 表添加隐私字段
                print("为 wrong_questions 表添加隐私字段...")
                conn.execute(text("""
                    ALTER TABLE wrong_questions 
                    ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
                    ADD COLUMN IF NOT EXISTS is_shared BOOLEAN DEFAULT FALSE
                """))
                
                # 6. 为 recitations 表添加隐私字段
                print("为 recitations 表添加隐私字段...")
                conn.execute(text("""
                    ALTER TABLE recitations 
                    ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
                    ADD COLUMN IF NOT EXISTS is_shared BOOLEAN DEFAULT FALSE
                """))
                
                # 7. 为 assignments 表添加隐私字段
                print("为 assignments 表添加隐私字段...")
                conn.execute(text("""
                    ALTER TABLE assignments 
                    ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE,
                    ADD COLUMN IF NOT EXISTS is_shared BOOLEAN DEFAULT FALSE
                """))
                
                # 提交事务
                trans.commit()
                print("✅ 成功为所有学习数据表添加用户属性和隐私字段！")
                
                # 验证结果
                print("\n验证结果：")
                tables = ['chinese_notes', 'english_vocabulary', 'exams', 'practice_records', 'wrong_questions', 'recitations', 'assignments']
                for table in tables:
                    result = conn.execute(text(f"SELECT COUNT(*) FROM {table}"))
                    count = result.fetchone()[0]
                    print(f"  {table}: {count} 条记录")
                
            except Exception as e:
                trans.rollback()
                print(f"❌ 添加字段失败: {e}")
                raise
                
    except Exception as e:
        print(f"❌ 数据库操作失败: {e}")

if __name__ == "__main__":
    add_user_privacy_fields()
