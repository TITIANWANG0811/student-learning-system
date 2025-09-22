#!/usr/bin/env python3
"""
导入初二英语单词到数据库
"""
import os
import sys
import re
import uuid
from pathlib import Path

# 添加backend目录到Python路径
sys.path.append('/Users/titianwang/Workspace/App/StudentLearningSystem/backend')

from sqlalchemy.orm import Session
from app.core.database import SessionLocal
from app.models.recitation import Recitation
from app.models.user import User
from app.models.subject import Subject

def parse_markdown_file(file_path):
    """解析Markdown文件，提取单词信息"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 提取单词名称（从文件名）
    word_name = Path(file_path).stem.split('.', 1)[1]  # 去掉数字前缀
    
    # 提取音标
    phonetic_pattern = r'\*\*音标\*\*: (.*?)(?:\n|$)'
    phonetic_match = re.search(phonetic_pattern, content)
    phonetic = phonetic_match.group(1).strip() if phonetic_match else ""
    
    # 提取词性
    pos_pattern = r'\*\*词性\*\*: (.*?)(?:\n|$)'
    pos_match = re.search(pos_pattern, content)
    pos = pos_match.group(1).strip() if pos_match else ""
    
    # 提取中文释义
    meaning_pattern = r'\*\*中文释义\*\*: (.*?)(?:\n|$)'
    meaning_match = re.search(meaning_pattern, content)
    meaning = meaning_match.group(1).strip() if meaning_match else ""
    
    # 提取例句
    examples_pattern = r'> \[!note\] 例句\s*>\s*\n(.*?)(?=\n> \[!|\n##|\Z)'
    examples_match = re.search(examples_pattern, content, re.DOTALL)
    examples = ""
    if examples_match:
        examples_text = examples_match.group(1)
        # 清理格式
        examples_text = re.sub(r'^>\s*', '', examples_text, flags=re.MULTILINE)
        examples_text = re.sub(r'^\d+\.\s*', '', examples_text, flags=re.MULTILINE)
        examples = examples_text.strip()
    
    # 提取联想记忆
    memory_pattern = r'> \[!tip\] 联想记忆\s*>\s*\n(.*?)(?=\n> \[!|\n##|\Z)'
    memory_match = re.search(memory_pattern, content, re.DOTALL)
    memory = ""
    if memory_match:
        memory_text = memory_match.group(1)
        # 清理格式
        memory_text = re.sub(r'^>\s*', '', memory_text, flags=re.MULTILINE)
        memory_text = re.sub(r'^\*\*([^*]+)\*\*：', r'**\1**：', memory_text, flags=re.MULTILINE)
        memory = memory_text.strip()
    
    # 提取相关词汇
    related_pattern = r'> \[!abstract\] 相关词汇\s*>\s*\n(.*?)(?=\n> \[!|\n##|\Z)'
    related_match = re.search(related_pattern, content, re.DOTALL)
    related = ""
    if related_match:
        related_text = related_match.group(1)
        # 清理格式
        related_text = re.sub(r'^>\s*', '', related_text, flags=re.MULTILINE)
        related = related_text.strip()
    
    # 构建完整内容
    full_content = f"""# {word_name}

## 单词信息

> [!info] 单词基本信息
> - **单词**: {word_name}
> - **音标**: {phonetic}
> - **词性**: {pos}
> - **中文释义**: {meaning}

## 详细内容

> [!note] 例句
>
> {examples}

> [!tip] 联想记忆
>
> {memory}

> [!abstract] 相关词汇
> {related}
"""
    
    return {
        'word_name': word_name,
        'phonetic': phonetic,
        'pos': pos,
        'meaning': meaning,
        'examples': examples,
        'memory': memory,
        'related': related,
        'full_content': full_content
    }

def get_or_create_user_and_subject(db: Session):
    """获取或创建用户和学科"""
    # 获取或创建测试用户
    user = db.query(User).filter(User.username == "test_student").first()
    if not user:
        user = User(
            id=uuid.uuid4(),
            username="test_student",
            email="test@example.com",
            full_name="测试学生",
            grade="初二",
            is_active=True
        )
        db.add(user)
        db.commit()
        print("创建了测试用户")
    
    # 获取或创建英语学科
    subject = db.query(Subject).filter(Subject.name == "英语").first()
    if not subject:
        subject = Subject(
            id=uuid.uuid4(),
            name="英语",
            code="english",
            description="英语学科",
            color="#1890ff",
            icon="📚",
            difficulty_level=2,
            is_core_subject=True,
            is_active=True
        )
        db.add(subject)
        db.commit()
        print("创建了英语学科")
    
    return user.id, subject.id

def import_grade2_english():
    """导入初二英语单词"""
    # 设置路径
    base_path = Path("/Users/titianwang/Workspace/Obsidian/work/工作/01. 生活/02. 子女教育/小初中英语/02. 初二/01. 生词表")
    
    # 获取数据库连接
    db = SessionLocal()
    
    try:
        # 获取用户和学科ID
        user_id, subject_id = get_or_create_user_and_subject(db)
        
        # 统计信息
        total_imported = 0
        total_skipped = 0
        
        # 遍历所有单元
        for unit_dir in sorted(base_path.iterdir()):
            if unit_dir.is_dir() and unit_dir.name.startswith(('01', '02', '03', '04', '05', '06')):
                unit_name = unit_dir.name.split('.', 1)[1]  # 去掉数字前缀
                print(f"\n处理单元: {unit_name}")
                
                # 遍历单元中的所有单词文件
                for word_file in sorted(unit_dir.glob("*.md")):
                    try:
                        # 解析文件
                        word_data = parse_markdown_file(word_file)
                        word_name = word_data['word_name']
                        
                        # 检查是否已存在
                        existing = db.query(Recitation).filter(
                            Recitation.title == word_name,
                            Recitation.grade_level == "初二",
                            Recitation.unit_name == unit_name
                        ).first()
                        
                        if existing:
                            print(f"  跳过已存在的单词: {word_name}")
                            total_skipped += 1
                            continue
                        
                        # 确定词汇类型
                        vocabulary_type = "word"  # 初二英语单词默认为word类型
                        
                        # 创建记录
                        recitation = Recitation(
                            id=uuid.uuid4(),
                            student_id=user_id,
                            subject_id=subject_id,
                            title=word_name,
                            content=word_data['full_content'],
                            markdown_content=word_data['full_content'],
                            recitation_type="vocabulary",
                            vocabulary_type=vocabulary_type,
                            grade_level="初二",
                            unit_name=unit_name,
                            difficulty_level=2,  # 初二难度
                            is_memorized=False,
                            practice_count=0
                        )
                        
                        db.add(recitation)
                        total_imported += 1
                        print(f"  导入单词: {word_name}")
                        
                    except Exception as e:
                        print(f"  处理文件 {word_file.name} 时出错: {e}")
                        continue
                
                # 提交当前单元的数据
                db.commit()
                print(f"  单元 {unit_name} 导入完成")
        
        print(f"\n导入完成!")
        print(f"总共导入: {total_imported} 个单词")
        print(f"跳过重复: {total_skipped} 个单词")
        
    except Exception as e:
        print(f"导入过程中出错: {e}")
        db.rollback()
    finally:
        db.close()

if __name__ == "__main__":
    import_grade2_english()
