#!/usr/bin/env python3
"""
添加缺失的数据库字段
"""
import os
import sys

# 添加项目根目录到Python路径
project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
backend_path = os.path.join(project_root, 'backend')

sys.path.append(project_root)
sys.path.append(backend_path)

# 切换到backend目录
os.chdir(backend_path)

from app.core.database import engine
from sqlalchemy import text

def add_missing_columns():
    """添加缺失的数据库字段"""
    with engine.connect() as conn:
        trans = conn.begin()
        
        try:
            # 检查并添加vocabulary_type字段
            result = conn.execute(text("""
                SELECT column_name 
                FROM information_schema.columns 
                WHERE table_name = 'recitations' 
                AND column_name = 'vocabulary_type'
            """))
            
            if not result.fetchone():
                print("添加vocabulary_type字段...")
                conn.execute(text("""
                    ALTER TABLE recitations 
                    ADD COLUMN vocabulary_type VARCHAR(20)
                """))
                print("✅ vocabulary_type字段添加成功")
            else:
                print("✅ vocabulary_type字段已存在")
            
            # 检查并添加grade_level字段
            result = conn.execute(text("""
                SELECT column_name 
                FROM information_schema.columns 
                WHERE table_name = 'recitations' 
                AND column_name = 'grade_level'
            """))
            
            if not result.fetchone():
                print("添加grade_level字段...")
                conn.execute(text("""
                    ALTER TABLE recitations 
                    ADD COLUMN grade_level VARCHAR(10)
                """))
                print("✅ grade_level字段添加成功")
            else:
                print("✅ grade_level字段已存在")
            
            # 检查并添加unit_name字段
            result = conn.execute(text("""
                SELECT column_name 
                FROM information_schema.columns 
                WHERE table_name = 'recitations' 
                AND column_name = 'unit_name'
            """))
            
            if not result.fetchone():
                print("添加unit_name字段...")
                conn.execute(text("""
                    ALTER TABLE recitations 
                    ADD COLUMN unit_name VARCHAR(50)
                """))
                print("✅ unit_name字段添加成功")
            else:
                print("✅ unit_name字段已存在")
            
            trans.commit()
            print("\n✅ 所有字段添加完成")
            
            # 显示最终的表结构
            result = conn.execute(text("""
                SELECT column_name, data_type 
                FROM information_schema.columns 
                WHERE table_name = 'recitations' 
                ORDER BY ordinal_position
            """))
            
            print("\nrecitations表结构:")
            for col in result.fetchall():
                print(f"  {col[0]}: {col[1]}")
                
        except Exception as e:
            print(f"❌ 添加字段失败: {e}")
            trans.rollback()
            raise

if __name__ == "__main__":
    print("开始添加缺失的数据库字段...")
    add_missing_columns()
    print("完成！")
