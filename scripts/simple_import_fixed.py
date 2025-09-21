#!/usr/bin/env python3
"""
简化的Markdown词汇导入脚本 - 修复版本
"""
import os
import sys
import uuid
from datetime import datetime
from pathlib import Path
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker

# 添加项目根目录到Python路径
project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
backend_path = os.path.join(project_root, 'backend')

# 激活虚拟环境
venv_python = os.path.join(backend_path, 'venv', 'bin', 'python')
if os.path.exists(venv_python):
    sys.executable = venv_python

sys.path.append(project_root)
sys.path.append(backend_path)

# 设置环境变量
os.environ['PYTHONPATH'] = f"{project_root}:{backend_path}"

# 切换到backend目录
os.chdir(backend_path)

# 数据库连接字符串
DATABASE_URL = "postgresql://titianwang@localhost:5432/student_learning_system"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def import_markdown_vocabulary():
    """导入Markdown格式的词汇到数据库"""
    # 词汇目录路径
    vocab_base_path = "/Users/titianwang/Workspace/Obsidian/work/工作/01. 生活/02. 子女教育/小初中英语/01. 初一/01. 生词表"
    
    if not os.path.exists(vocab_base_path):
        print(f"词汇目录不存在: {vocab_base_path}")
        return

    db = SessionLocal()
    
    try:
        print("开始导入Markdown格式的初一英语词汇...")
        
        # 清空现有的初一英语词汇数据
        print("清空现有的初一英语词汇数据...")
        db.execute(text("""
            DELETE FROM recitations 
            WHERE recitation_type = 'vocabulary' 
            AND grade_level = '初一'
        """))
        db.commit()
        print("现有数据清空完成。")

        imported_count = 0
        failed_count = 0
        
        # 遍历所有单元目录
        for unit_dir_name in sorted(os.listdir(vocab_base_path)):
            unit_path = os.path.join(vocab_base_path, unit_dir_name)
            if not os.path.isdir(unit_path) or unit_dir_name.startswith('.'):
                continue
                
            print(f"处理单元: {unit_dir_name}")
            
            # 遍历单元内的所有Markdown文件
            for root, dirs, files in os.walk(unit_path):
                for file in files:
                    if file.endswith('.md') and '单词默写' not in file and '默写' not in file:
                        file_path = os.path.join(root, file)
                        
                        try:
                            with open(file_path, 'r', encoding='utf-8') as f:
                                markdown_content = f.read()
                            
                            # 从文件名提取单词
                            word_name = os.path.splitext(file)[0]
                            if '.' in word_name:
                                word_name = word_name.split('.', 1)[-1].strip()
                            
                            # 确定词汇类型、学籍等级和单元名称
                            grade_level = "初一"
                            # 提取单元名称，去掉数字前缀
                            unit_name = unit_dir_name.split('.', 1)[-1].strip()
                            
                            # 根据单元名称和单词内容确定词汇类型
                            if unit_name == "Proper":
                                # 在专有名词单元中进一步分类
                                # 真正的地名关键词
                                if any(keyword in word_name.lower() for keyword in ['canada', 'mexico', 'ocean', 'rainforest', 'indian', 'great', 'bear']):
                                    vocabulary_type = "proper_place"  # 地名
                                # 人名关键词（常见的英文名字）
                                elif any(keyword in word_name.lower() for keyword in ['tania', 'dorothy', 'emilia', 'robert', 'confucius', 'tony', 'tina', 'mia', 'mary', 'jack', 'josh', 'jones', 'emma', 'oliver', 'jim', 'eric', 'taylor', 'nick', 'catherine', 'john', 'mencius']):
                                    vocabulary_type = "proper_name"  # 人名
                                else:
                                    vocabulary_type = "proper_other"  # 其他（节日、文化名称、书名等）
                            else:
                                vocabulary_type = "word"  # 其他单元都是单词
                            
                            # 创建新的数据库会话用于单个插入
                            single_db = SessionLocal()
                            try:
                                # 插入到数据库
                                new_recitation = {
                                    'id': str(uuid.uuid4()),
                                    'student_id': '00000000-0000-0000-0000-000000000000',
                                    'subject_id': '2805649b-408e-4ef9-b467-5fced388585f',
                                    'chapter_id': None,
                                    'title': word_name,
                                    'content': '',  # 简化内容可以为空
                                    'markdown_content': markdown_content,
                                    'recitation_type': 'vocabulary',
                                    'vocabulary_type': vocabulary_type,
                                    'grade_level': grade_level,
                                    'unit_name': unit_name,
                                    'difficulty_level': 1,
                                    'is_memorized': False,
                                    'practice_count': 0,
                                    'created_at': datetime.now(),
                                    'updated_at': datetime.now()
                                }
                                
                                # 使用原生SQL插入，避免ORM问题
                                single_db.execute(text("""
                                    INSERT INTO recitations (
                                        id, student_id, subject_id, chapter_id, title, content, 
                                        markdown_content, recitation_type, vocabulary_type, 
                                        grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
                                        created_at, updated_at
                                    ) VALUES (
                                        :id, :student_id, :subject_id, :chapter_id, :title, :content,
                                        :markdown_content, :recitation_type, :vocabulary_type,
                                        :grade_level, :unit_name, :difficulty_level, :is_memorized, :practice_count,
                                        :created_at, :updated_at
                                    )
                                """), new_recitation)
                                
                                single_db.commit()
                                imported_count += 1
                                print(f"  ✅ 导入: {word_name} ({unit_name})")
                                
                            except Exception as e:
                                print(f"  ❌ 插入失败 {word_name}: {e}")
                                single_db.rollback()
                                failed_count += 1
                            finally:
                                single_db.close()
                                
                        except Exception as e:
                            print(f"  ❌ 读取文件失败 {file_path}: {e}")
                            failed_count += 1
                            continue
        
        print(f"\n✅ 导入完成！")
        print(f"成功导入: {imported_count} 个词汇")
        print(f"失败: {failed_count} 个文件")
        
        # 验证导入数量
        final_db = SessionLocal()
        try:
            total_in_db = final_db.execute(text("""
                SELECT COUNT(*) 
                FROM recitations 
                WHERE recitation_type = 'vocabulary' 
                AND grade_level = '初一'
            """)).fetchone()[0]
            print(f"数据库中初一英语词汇总数: {total_in_db}")
        finally:
            final_db.close()
        
    except Exception as e:
        print(f"❌ 导入过程中发生错误: {e}")
    finally:
        db.close()
    print("导入完成！")

if __name__ == "__main__":
    import_markdown_vocabulary()
