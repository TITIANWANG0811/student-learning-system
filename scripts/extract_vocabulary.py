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
        phonetic_match = re.search(r'> \*\*音标\*\*: (.+)', content)
        pos_match = re.search(r'> \*\*词性\*\*: (.+)', content)
        meaning_match = re.search(r'> \*\*释义\*\*: (.+)', content)
        
        # 提取例句
        examples = []
        # 匹配格式：- We have lunch in the **dining hall** at school.
        example_pattern = r'- (.+?)(?=\n- |\n> \[!tip\]|\n> \[!abstract\]|\n## |$)'
        example_matches = re.findall(example_pattern, content, re.DOTALL)
        
        for example in example_matches:
            # 清理例句格式，去掉markdown标记
            example = example.strip()
            if example and not example.startswith('[') and '**' in example:
                # 清理markdown格式
                example = re.sub(r'\*\*(.+?)\*\*', r'\1', example)
                examples.append(example)
        
        # 提取相关词汇
        related_words = []
        # 匹配格式：- **cafeteria**: n. 自助餐厅，食堂
        related_pattern = r'- \*\*([^*]+)\*\*: (.+)'
        related_matches = re.findall(related_pattern, content)
        for word, desc in related_matches:
            related_words.append(f"{word}: {desc}")
        
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

def determine_vocabulary_type(file_path: str, word_name: str) -> str:
    """根据文件路径确定词汇类型"""
    file_path = Path(file_path)
    
    # 根据目录结构判断词汇类型
    if "01. 生词表" in str(file_path):
        return "word"  # 生词表中的都是单词
    elif "02. 短语" in str(file_path):
        return "phrase"  # 短语目录中的都是短语
    else:
        # 如果不在指定目录中，根据单词名称判断
        if ' ' in word_name or '-' in word_name:
            return "phrase"  # 包含空格或连字符的默认为短语
        else:
            return "word"  # 单个词默认为单词

def determine_grade_level(file_path: str) -> str:
    """根据文件路径确定学籍等级"""
    file_path = Path(file_path)
    
    if "01. 初一" in str(file_path):
        return "初一"
    elif "02. 初二" in str(file_path):
        return "初二"
    elif "03. 初三" in str(file_path):
        return "初三"
    else:
        return "初一"  # 默认为初一

def determine_unit_name(file_path: str) -> str:
    """根据文件路径确定单元名称"""
    file_path = Path(file_path)
    
    # 从路径中提取单元名称
    parts = file_path.parts
    for part in parts:
        if part.startswith(("01. Starter", "02. Unit", "03. Unit", "04. Unit", "05. Unit", "06. Unit", "07. Unit", "08. Unit")):
            # 提取单元名称，去掉数字前缀
            if "Starter" in part:
                return "Starter"
            elif "Unit" in part:
                # 提取Unit后面的数字
                import re
                match = re.search(r'Unit (\d+)', part)
                if match:
                    return f"Unit {match.group(1)}"
    
    return "Unknown"  # 默认值

def scan_vocabulary_directory(base_path: str) -> List[Dict[str, Any]]:
    """扫描单词目录，提取所有单词"""
    vocabulary = []
    base_path = Path(base_path)
    
    if not base_path.exists():
        print(f"目录不存在: {base_path}")
        return vocabulary
    
    # 直接扫描单元目录（生词表目录下直接就是单元）
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
                    word_info['category'] = '生词表'  # 固定为生词表
                    word_info['id'] = str(uuid.uuid4())
                    word_info['created_at'] = datetime.now().isoformat()
                    
                    # 确定词汇类型、学籍等级和单元名称
                    word_info['vocabulary_type'] = determine_vocabulary_type(str(file_path), word_info['word'])
                    word_info['grade_level'] = determine_grade_level(str(file_path))
                    word_info['unit_name'] = determine_unit_name(str(file_path))
                    
                    vocabulary.append(word_info)
                    print(f"  提取单词: {word_info['word']} ({word_info['vocabulary_type']})")
    
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
        # 构建content字符串
        content_parts = []
        if word.get('phonetic'):
            content_parts.append(f"音标: {word['phonetic']}")
        if word.get('part_of_speech'):
            content_parts.append(f"词性: {word['part_of_speech']}")
        if word.get('meaning'):
            content_parts.append(f"中文释义: {word['meaning']}")
        
        # 添加例句
        if word.get('examples') and len(word['examples']) > 0:
            examples_text = "例句: "
            for j, example in enumerate(word['examples'], 1):
                examples_text += f"{j}. {example}\n"
            content_parts.append(examples_text.strip())
        
        # 添加相关词汇
        if word.get('related_words') and len(word['related_words']) > 0:
            related_text = "相关词汇: "
            for related_word in word['related_words']:
                related_text += f"- {related_word}\n"
            content_parts.append(related_text.strip())
        
        # 添加词汇类型信息
        type_display = {
            'word': '单词',
            'phrase': '短语',
            'idiom': '习语',
            'proper_name': '人名',
            'proper_place': '地名',
            'proper_other': '专有名词'
        }
        content_parts.insert(0, f"类型: {type_display.get(word.get('vocabulary_type', 'word'), '单词')}")
        
        content = '\n'.join(content_parts).replace("'", "''")  # 转义单引号
        
        # 插入到recitations表（默写表）
        sql_statements.append(f"""
-- 单词: {word['word']} ({word.get('vocabulary_type', 'word')})
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '{word['id']}',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    '{word['word'].replace("'", "''")}',
    '{content}',
    'vocabulary',
    '{word.get('vocabulary_type', 'word')}',
    '{word.get('grade_level', '初一')}',
    '{word.get('unit_name', 'Unknown')}',
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
    type_stats = {}
    grade_stats = {}
    unit_name_stats = {}
    
    for word in vocabulary:
        unit = word['unit']
        vocab_type = word.get('vocabulary_type', 'word')
        grade_level = word.get('grade_level', '初一')
        unit_name = word.get('unit_name', 'Unknown')
        
        if unit not in unit_stats:
            unit_stats[unit] = 0
        unit_stats[unit] += 1
        
        if vocab_type not in type_stats:
            type_stats[vocab_type] = 0
        type_stats[vocab_type] += 1
        
        if grade_level not in grade_stats:
            grade_stats[grade_level] = 0
        grade_stats[grade_level] += 1
        
        if unit_name not in unit_name_stats:
            unit_name_stats[unit_name] = 0
        unit_name_stats[unit_name] += 1
    
    print("\n各单元单词统计:")
    for unit, count in sorted(unit_stats.items()):
        print(f"  {unit}: {count} 个单词")
    
    print("\n学籍等级统计:")
    for grade, count in sorted(grade_stats.items()):
        print(f"  {grade}: {count} 个单词")
    
    print("\n单元名称统计:")
    for unit_name, count in sorted(unit_name_stats.items()):
        print(f"  {unit_name}: {count} 个单词")
    
    print("\n词汇类型统计:")
    type_display = {
        'word': '单词',
        'phrase': '短语',
        'idiom': '习语',
        'proper_name': '人名',
        'proper_place': '地名',
        'proper_other': '专有名词'
    }
    for vocab_type, count in sorted(type_stats.items()):
        display_name = type_display.get(vocab_type, vocab_type)
        print(f"  {display_name}: {count} 个")
    
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
        f.write("单词,音标,词性,中文释义,单元,词汇类型,学籍等级,单元名称,例句1,例句2,例句3\n")
        for word in vocabulary:
            examples = '|'.join(word['examples'])
            vocab_type = word.get('vocabulary_type', 'word')
            type_display = {
                'word': '单词',
                'phrase': '短语',
                'idiom': '习语',
                'proper_name': '人名',
                'proper_place': '地名',
                'proper_other': '专有名词'
            }
            type_name = type_display.get(vocab_type, vocab_type)
            f.write(f'"{word["word"]}","{word["phonetic"]}","{word["part_of_speech"]}","{word["meaning"]}","{word["unit"]}","{type_name}","{word.get("grade_level", "初一")}","{word.get("unit_name", "Unknown")}","{examples}"\n')
    print(f"CSV文件已生成: {csv_file}")
    
    print("\n单词表提取完成！")

if __name__ == "__main__":
    main()
