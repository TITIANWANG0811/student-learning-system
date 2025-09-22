#!/usr/bin/env python3
"""
迁移英语词汇数据，解析Markdown内容到各个字段
"""
import os
import sys
import re
from pathlib import Path

# 添加backend目录到Python路径
sys.path.append('/Users/titianwang/Workspace/App/StudentLearningSystem/backend')

from sqlalchemy.orm import Session
from app.core.database import SessionLocal
from app.models.english_vocabulary import EnglishVocabulary
from app.models.recitation import Recitation

def parse_markdown_content(markdown_content):
    """解析Markdown内容，提取各个字段"""
    if not markdown_content:
        return {}
    
    result = {}
    
    # 提取音标
    phonetic_pattern = r'\*\*音标\*\*: (.*?)(?:\n|$)'
    phonetic_match = re.search(phonetic_pattern, markdown_content)
    if phonetic_match:
        result['phonetic'] = phonetic_match.group(1).strip()
    
    # 提取词性
    pos_pattern = r'\*\*词性\*\*: (.*?)(?:\n|$)'
    pos_match = re.search(pos_pattern, markdown_content)
    if pos_match:
        result['part_of_speech'] = pos_match.group(1).strip()
    
    # 提取中文释义
    meaning_pattern = r'\*\*中文释义\*\*: (.*?)(?:\n|$)'
    meaning_match = re.search(meaning_pattern, markdown_content)
    if meaning_match:
        result['meaning'] = meaning_match.group(1).strip()
    
    # 提取例句
    examples_pattern = r'> \[!note\] 例句\s*>\s*\n(.*?)(?=\n> \[!|\n##|\Z)'
    examples_match = re.search(examples_pattern, markdown_content, re.DOTALL)
    if examples_match:
        examples_text = examples_match.group(1)
        # 清理格式
        examples_text = re.sub(r'^>\s*', '', examples_text, flags=re.MULTILINE)
        examples_text = re.sub(r'^\d+\.\s*', '', examples_text, flags=re.MULTILINE)
        result['examples'] = examples_text.strip()
    
    # 提取联想记忆
    memory_pattern = r'> \[!tip\] 联想记忆\s*>\s*\n(.*?)(?=\n> \[!|\n##|\Z)'
    memory_match = re.search(memory_pattern, markdown_content, re.DOTALL)
    if memory_match:
        memory_text = memory_match.group(1)
        # 清理格式
        memory_text = re.sub(r'^>\s*', '', memory_text, flags=re.MULTILINE)
        result['memory_method'] = memory_text.strip()
    
    # 提取相关词汇
    related_pattern = r'> \[!abstract\] 相关词汇\s*>\s*\n(.*?)(?=\n> \[!|\n##|\Z)'
    related_match = re.search(related_pattern, markdown_content, re.DOTALL)
    if related_match:
        related_text = related_match.group(1)
        # 清理格式
        related_text = re.sub(r'^>\s*', '', related_text, flags=re.MULTILINE)
        result['related_words'] = related_text.strip()
    
    return result

def migrate_vocabulary_data():
    """迁移词汇数据"""
    db = SessionLocal()
    
    try:
        # 获取所有英语词汇
        vocabularies = db.query(EnglishVocabulary).all()
        
        print(f"开始迁移 {len(vocabularies)} 个英语词汇...")
        
        for i, vocab in enumerate(vocabularies, 1):
            # 从原表获取Markdown内容
            original_recitation = db.query(Recitation).filter(
                Recitation.id == vocab.id,
                Recitation.recitation_type == 'vocabulary'
            ).first()
            
            if original_recitation and original_recitation.markdown_content:
                # 解析Markdown内容
                parsed_data = parse_markdown_content(original_recitation.markdown_content)
                
                # 更新字段
                for field, value in parsed_data.items():
                    if hasattr(vocab, field):
                        setattr(vocab, field, value)
            
            if i % 100 == 0:
                print(f"已处理 {i} 个词汇...")
        
        # 提交更改
        db.commit()
        print(f"成功迁移 {len(vocabularies)} 个英语词汇！")
        
    except Exception as e:
        print(f"迁移过程中出错: {e}")
        db.rollback()
    finally:
        db.close()

if __name__ == "__main__":
    migrate_vocabulary_data()
