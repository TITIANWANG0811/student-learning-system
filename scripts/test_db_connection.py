#!/usr/bin/env python3
"""
测试数据库连接和字段
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

try:
    from app.core.database import engine
    from sqlalchemy import text
    
    # 测试数据库连接
    with engine.connect() as conn:
        # 检查recitations表是否存在markdown_content字段
        result = conn.execute(text("""
            SELECT column_name, data_type 
            FROM information_schema.columns 
            WHERE table_name = 'recitations' 
            AND column_name = 'markdown_content'
        """))
        
        columns = result.fetchall()
        if columns:
            print("✅ markdown_content字段已存在")
            for col in columns:
                print(f"  字段: {col[0]}, 类型: {col[1]}")
        else:
            print("❌ markdown_content字段不存在，需要添加")
            
            # 添加字段
            try:
                conn.execute(text("""
                    ALTER TABLE recitations 
                    ADD COLUMN markdown_content TEXT
                """))
                conn.commit()
                print("✅ 成功添加markdown_content字段")
            except Exception as e:
                print(f"❌ 添加字段失败: {e}")
        
        # 检查表结构
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
    print(f"❌ 数据库连接失败: {e}")
