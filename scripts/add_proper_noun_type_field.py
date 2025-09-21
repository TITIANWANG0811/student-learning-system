#!/usr/bin/env python3
"""
为数据库添加proper_noun_type字段
"""
import os
import sys
from sqlalchemy import create_engine, text

# 数据库连接字符串
DATABASE_URL = "postgresql://titianwang@localhost:5432/student_learning_system"
engine = create_engine(DATABASE_URL)

def add_proper_noun_type_field():
    """添加proper_noun_type字段"""
    with engine.connect() as conn:
        try:
            # 添加proper_noun_type字段
            print("添加proper_noun_type字段...")
            conn.execute(text("""
                ALTER TABLE recitations 
                ADD COLUMN IF NOT EXISTS proper_noun_type VARCHAR(20)
            """))
            conn.commit()
            print("✅ proper_noun_type字段已添加")
            
            # 更新约束条件
            print("更新约束条件...")
            conn.execute(text("""
                ALTER TABLE recitations 
                DROP CONSTRAINT IF EXISTS check_vocabulary_type
            """))
            conn.execute(text("""
                ALTER TABLE recitations 
                ADD CONSTRAINT check_vocabulary_type 
                CHECK (vocabulary_type IN ('word', 'phrase', 'idiom', 'expression', 'proper_noun'))
            """))
            conn.execute(text("""
                ALTER TABLE recitations 
                ADD CONSTRAINT check_proper_noun_type 
                CHECK (proper_noun_type IN ('person_name', 'place_name', 'other'))
            """))
            conn.commit()
            print("✅ 约束条件已更新")
            
        except Exception as e:
            print(f"❌ 添加字段失败: {e}")
            conn.rollback()

if __name__ == "__main__":
    add_proper_noun_type_field()
