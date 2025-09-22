#!/usr/bin/env python3
"""
修复数据库结构脚本
"""
import psycopg2
import sys
import os

# 数据库连接
DATABASE_URL = "postgresql://titianwang@localhost:5432/student_learning_system"

def fix_database():
    try:
        # 连接数据库
        conn = psycopg2.connect(DATABASE_URL)
        cursor = conn.cursor()
        
        print("1. 清空初一词汇数据...")
        cursor.execute("DELETE FROM recitations WHERE recitation_type = 'vocabulary' AND grade_level = '初一';")
        print(f"删除了 {cursor.rowcount} 条记录")
        
        print("2. 添加 proper_noun_type 列...")
        try:
            cursor.execute("ALTER TABLE recitations ADD COLUMN proper_noun_type VARCHAR(50);")
            print("列添加成功")
        except psycopg2.errors.DuplicateColumn:
            print("列已存在，跳过")
        
        print("3. 提交更改...")
        conn.commit()
        print("数据库修复完成！")
        
    except Exception as e:
        print(f"错误: {e}")
        sys.exit(1)
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    fix_database()

