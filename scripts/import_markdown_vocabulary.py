#!/usr/bin/env python3
"""
将Markdown格式的词汇文件导入到数据库中
"""
import os
import sys
import uuid
from datetime import datetime
from pathlib import Path

# 添加项目根目录到Python路径
project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
backend_path = os.path.join(project_root, 'backend')

# 激活虚拟环境
venv_python = os.path.join(backend_path, 'venv', 'bin', 'python')
if os.path.exists(venv_python):
    # 如果虚拟环境存在，使用虚拟环境的Python
    sys.executable = venv_python

sys.path.append(project_root)
sys.path.append(backend_path)

# 设置环境变量
os.environ['PYTHONPATH'] = f"{project_root}:{backend_path}"

# 切换到backend目录
os.chdir(backend_path)

from app.core.database import get_db
from app.models.recitation import Recitation
from sqlalchemy.orm import Session

def import_markdown_vocabulary():
    """导入Markdown格式的词汇到数据库"""
    # 词汇目录路径
    vocab_base_path = "/Users/titianwang/Workspace/Obsidian/work/工作/01. 生活/02. 子女教育/小初中英语/01. 初一/01. 生词表"
    
    if not os.path.exists(vocab_base_path):
        print(f"词汇目录不存在: {vocab_base_path}")
        return
    
    # 获取数据库连接
    db = next(get_db())
    
    try:
        # 清空现有的初一英语词汇数据
        print("清空现有的初一英语词汇数据...")
        db.query(Recitation).filter(
            Recitation.recitation_type == "vocabulary",
            Recitation.grade_level == "初一"
        ).delete()
        db.commit()
        print("清空完成")
        
        imported_count = 0
        
        # 遍历所有单元目录
        for unit_dir in sorted(os.listdir(vocab_base_path)):
            unit_path = os.path.join(vocab_base_path, unit_dir)
            if not os.path.isdir(unit_path) or unit_dir.startswith('.'):
                continue
                
            print(f"处理单元: {unit_dir}")
            
            # 遍历单元内的所有Markdown文件
            for root, dirs, files in os.walk(unit_path):
                for file in files:
                    if file.endswith('.md') and '单词默写' not in file and '默写' not in file:
                        file_path = os.path.join(root, file)
                        
                        # 读取Markdown文件内容
                        try:
                            with open(file_path, 'r', encoding='utf-8') as f:
                                markdown_content = f.read()
                            
                            # 从文件名提取单词
                            word_name = os.path.splitext(file)[0]
                            if '.' in word_name:
                                word_name = word_name.split('.', 1)[-1].strip()
                            
                            # 确定词汇类型、学籍等级和单元名称
                            vocabulary_type = "word"  # 生词表中的都是单词
                            grade_level = "初一"
                            unit_name = unit_dir.replace("01. ", "").replace("02. ", "").replace("03. ", "").replace("04. ", "").replace("05. ", "").replace("06. ", "").replace("07. ", "").replace("08. ", "")
                            
                            # 创建简化的content用于搜索和显示
                            content_lines = []
                            for line in markdown_content.split('\n'):
                                if line.strip().startswith('> **音标**'):
                                    content_lines.append(line.replace('> **音标**: ', '音标: '))
                                elif line.strip().startswith('> **词性**'):
                                    content_lines.append(line.replace('> **词性**: ', '词性: '))
                                elif line.strip().startswith('> **释义**'):
                                    content_lines.append(line.replace('> **释义**: ', '中文释义: '))
                                elif line.strip().startswith('- ') and '**' in line and not line.strip().startswith('- **'):
                                    # 例句
                                    content_lines.append(line)
                            
                            simplified_content = '\n'.join(content_lines[:10])  # 只取前10行作为简化内容
                            
                            # 创建数据库记录
                            recitation = Recitation(
                                id=uuid.uuid4(),
                                student_id=uuid.UUID('00000000-0000-0000-0000-000000000000'),  # 默认学生ID
                                subject_id=uuid.UUID('550e8400-e29b-41d4-a716-446655440002'),  # 初一英语学科ID
                                chapter_id=None,
                                title=word_name,
                                content=simplified_content,
                                markdown_content=markdown_content,  # 存储完整的Markdown内容
                                recitation_type="vocabulary",
                                vocabulary_type=vocabulary_type,
                                grade_level=grade_level,
                                unit_name=unit_name,
                                difficulty_level=1,
                                is_memorized=False,
                                practice_count=0,
                                created_at=datetime.now(),
                                updated_at=datetime.now()
                            )
                            
                            db.add(recitation)
                            imported_count += 1
                            
                            if imported_count <= 3:  # 只打印前3个的调试信息
                                print(f"  导入单词: {word_name} ({vocabulary_type})")
                                
                        except Exception as e:
                            print(f"读取文件失败 {file_path}: {e}")
                            continue
        
        # 提交所有更改
        db.commit()
        print(f"\n成功导入 {imported_count} 个词汇到数据库")
        
        # 验证导入结果
        total_count = db.query(Recitation).filter(
            Recitation.recitation_type == "vocabulary",
            Recitation.grade_level == "初一"
        ).count()
        print(f"数据库中初一英语词汇总数: {total_count}")
        
    except Exception as e:
        print(f"导入过程中发生错误: {e}")
        db.rollback()
    finally:
        db.close()

if __name__ == "__main__":
    print("开始导入Markdown格式的初一英语词汇...")
    import_markdown_vocabulary()
    print("导入完成！")
