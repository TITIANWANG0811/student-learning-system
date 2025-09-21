#!/usr/bin/env python3
"""
初一英语单词表提取工具
从Obsidian笔记中提取单词信息，生成学习管理系统可用的单词表
"""

import os
import re
import json
import uuid
from pathlib import Path
from typing import Dict, List, Any
from datetime import datetime

def extract_word_info(file_path: str) -> Dict[str, Any]:
    """从单个单词文件中提取信息"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 提取单词基本信息
        word_match = re.search(r'- \*\*单词\*\*: (.+)', content)
        phonetic_match = re.search(r'- \*\*音标\*\*: (.+)', content)
        pos_match = re.search(r'- \*\*词性\*\*: (.+)', content)
        meaning_match = re.search(r'- \*\*中文释义\*\*: (.+)', content)
        
        # 提取例句
        examples = []
        example_pattern = r'> (\d+\. .+?)(?=\n> \d+\. |\n> \[!tip\]|\n> \[!abstract\]|\n## |$)'
        example_matches = re.findall(example_pattern, content, re.DOTALL)
        
        for example in example_matches:
            # 清理例句格式
            example = example.strip()
            if example and not example.startswith('['):
                examples.append(example)
        
        # 提取相关词汇
        related_words = []
        related_pattern = r'- 近义词: (.+)'
        related_match = re.search(related_pattern, content)
        if related_match:
            related_words.extend([w.strip() for w in related_match.group(1).split(',')])
        
        # 获取文件名作为单词（备用）
        filename = Path(file_path).stem
        if filename and filename != '单词默写':
            word_name = filename.split('.', 1)[-1].strip()
        else:
            word_name = word_match.group(1) if word_match else filename
        
        return {
            'word': word_name,
            'phonetic': phonetic_match.group(1) if phonetic_match else '',
            'part_of_speech': pos_match.group(1) if pos_match else '',
            'meaning': meaning_match.group(1) if meaning_match else '',
            'examples': examples[:3],  # 只取前3个例句
            'related_words': related_words,
            'difficulty_level': 1,  # 初一单词默认为1级
            'source_file': file_path
        }
    except Exception as e:
        print(f"处理文件 {file_path} 时出错: {e}")
        return None

def scan_vocabulary_directory(base_path: str) -> List[Dict[str, Any]]:
    """扫描单词目录，提取所有单词"""
    vocabulary = []
    base_path = Path(base_path)
    
    if not base_path.exists():
        print(f"目录不存在: {base_path}")
        return vocabulary
    
    # 遍历所有单元目录
    for unit_dir in sorted(base_path.iterdir()):
        if unit_dir.is_dir() and not unit_dir.name.startswith('.'):
            print(f"处理单元: {unit_dir.name}")
            
            # 遍历单元内的所有文件
            for file_path in unit_dir.rglob('*.md'):
                # 排除默写文件
                if '单词默写' in file_path.name or '默写' in file_path.name:
                    continue
                
                word_info = extract_word_info(str(file_path))
                if word_info:
                    # 添加单元信息
                    word_info['unit'] = unit_dir.name
                    word_info['id'] = str(uuid.uuid4())
                    word_info['created_at'] = datetime.now().isoformat()
                    vocabulary.append(word_info)
                    print(f"  提取单词: {word_info['word']}")
    
    return vocabulary

def generate_sql_inserts(vocabulary: List[Dict[str, Any]]) -> str:
    """生成SQL插入语句"""
    sql_statements = []
    
    # 首先插入学科分类（如果不存在）
    sql_statements.append("""
-- 插入学科分类
INSERT INTO subject_categories (id, name, description, created_at) 
VALUES ('550e8400-e29b-41d4-a716-446655440000', '语言文学', '语言文学类学科', NOW())
ON CONFLICT (id) DO NOTHING;
""")
    
    # 插入英语学科（如果不存在）
    sql_statements.append("""
-- 插入英语学科
INSERT INTO subjects (id, name, code, description, category_id, created_at) 
VALUES ('550e8400-e29b-41d4-a716-446655440001', '英语', 'english', '英语学科', '550e8400-e29b-41d4-a716-446655440000', NOW())
ON CONFLICT (id) DO NOTHING;
""")
    
    # 插入年级信息（如果不存在）
    sql_statements.append("""
-- 插入年级信息
INSERT INTO subjects (id, name, code, description, category_id, created_at) 
VALUES ('550e8400-e29b-41d4-a716-446655440002', '初一英语', 'grade1_english', '初一英语', '550e8400-e29b-41d4-a716-446655440000', NOW())
ON CONFLICT (id) DO NOTHING;
""")
    
    # 为每个单词生成插入语句
    for word in vocabulary:
        # 插入到recitations表（默写表）
        sql_statements.append(f"""
-- 单词: {word['word']}
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '{word['id']}',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    '{word['word']}',
    '{word['meaning']}',
    'vocabulary',
    {word['difficulty_level']},
    false,
    0,
    NOW(),
    NOW()
);
""")
    
    return '\n'.join(sql_statements)

def generate_json_data(vocabulary: List[Dict[str, Any]]) -> str:
    """生成JSON格式的单词数据"""
    return json.dumps(vocabulary, ensure_ascii=False, indent=2)

def main():
    """主函数"""
    # 单词表目录路径
    vocab_path = "/Users/titianwang/Workspace/Obsidian/work/工作/01. 生活/02. 子女教育/小初中英语/01. 初一/01. 生词表"
    
    print("开始提取初一英语单词表...")
    print(f"扫描目录: {vocab_path}")
    
    # 提取单词
    vocabulary = scan_vocabulary_directory(vocab_path)
    
    print(f"\n总共提取到 {len(vocabulary)} 个单词")
    
    if not vocabulary:
        print("没有找到任何单词文件！")
        return
    
    # 按单元分组统计
    unit_stats = {}
    for word in vocabulary:
        unit = word['unit']
        if unit not in unit_stats:
            unit_stats[unit] = 0
        unit_stats[unit] += 1
    
    print("\n各单元单词统计:")
    for unit, count in sorted(unit_stats.items()):
        print(f"  {unit}: {count} 个单词")
    
    # 生成输出文件
    output_dir = Path("/Users/titianwang/Workspace/App/StudentLearningSystem/database/vocabulary")
    output_dir.mkdir(exist_ok=True)
    
    # 生成SQL文件
    sql_content = generate_sql_inserts(vocabulary)
    sql_file = output_dir / "grade1_english_vocabulary.sql"
    with open(sql_file, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    print(f"\nSQL文件已生成: {sql_file}")
    
    # 生成JSON文件
    json_content = generate_json_data(vocabulary)
    json_file = output_dir / "grade1_english_vocabulary.json"
    with open(json_file, 'w', encoding='utf-8') as f:
        f.write(json_content)
    print(f"JSON文件已生成: {json_file}")
    
    # 生成CSV文件（用于Excel查看）
    csv_file = output_dir / "grade1_english_vocabulary.csv"
    with open(csv_file, 'w', encoding='utf-8') as f:
        f.write("单词,音标,词性,中文释义,单元,例句1,例句2,例句3\n")
        for word in vocabulary:
            examples = '|'.join(word['examples'])
            f.write(f'"{word["word"]}","{word["phonetic"]}","{word["part_of_speech"]}","{word["meaning"]}","{word["unit"]}","{examples}"\n')
    print(f"CSV文件已生成: {csv_file}")
    
    print("\n单词表提取完成！")

if __name__ == "__main__":
    main()
