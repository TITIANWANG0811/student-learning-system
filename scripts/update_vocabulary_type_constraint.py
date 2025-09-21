#!/usr/bin/env python3
"""
更新数据库中的vocabulary_type约束条件
"""
import os
import sys
from sqlalchemy import create_engine, text

# 添加项目根目录到Python路径
project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
backend_path = os.path.join(project_root, 'backend')
sys.path.append(project_root)
sys.path.append(backend_path)

# 数据库连接字符串
DATABASE_URL = "postgresql://titianwang@localhost:5432/student_learning_system"
engine = create_engine(DATABASE_URL)

def update_vocabulary_type_constraint():
    """更新vocabulary_type约束条件"""
    with engine.connect() as conn:
        try:
            # 删除旧的约束条件
            print("删除旧的vocabulary_type约束条件...")
            conn.execute(text("""
                ALTER TABLE recitations 
                DROP CONSTRAINT IF EXISTS check_vocabulary_type
            """))
            conn.commit()
            print("✅ 旧约束条件已删除")
            
            # 添加新的约束条件
            print("添加新的vocabulary_type约束条件...")
            conn.execute(text("""
                ALTER TABLE recitations 
                ADD CONSTRAINT check_vocabulary_type 
                CHECK (vocabulary_type IN ('word', 'phrase', 'idiom', 'expression', 'proper_name', 'proper_place', 'proper_other'))
            """))
            conn.commit()
            print("✅ 新约束条件已添加")
            
            # 验证约束条件
            print("验证约束条件...")
            result = conn.execute(text("""
                SELECT conname, consrc 
                FROM pg_constraint 
                WHERE conname = 'check_vocabulary_type'
            """))
            constraint = result.fetchone()
            if constraint:
                print(f"✅ 约束条件验证成功: {constraint[0]}")
                print(f"   内容: {constraint[1]}")
            else:
                print("❌ 约束条件验证失败")
                
        except Exception as e:
            print(f"❌ 更新约束条件失败: {e}")
            conn.rollback()

if __name__ == "__main__":
    update_vocabulary_type_constraint()
