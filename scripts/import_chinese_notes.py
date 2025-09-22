#!/usr/bin/env python3
"""
导入语文笔记到数据库
"""
import psycopg2
import uuid
from datetime import datetime

# 数据库连接配置
DB_CONFIG = {
    'host': 'localhost',
    'port': 5432,
    'database': 'student_learning_system',
    'user': 'titianwang',
    'password': ''
}

def connect_to_db():
    """连接数据库"""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        return conn
    except Exception as e:
        print(f"数据库连接失败: {e}")
        return None

def import_chinese_notes():
    """导入语文笔记"""
    conn = connect_to_db()
    if not conn:
        return
    
    try:
        cursor = conn.cursor()
        
        # 使用现有的学生和学科ID
        student_id = '00000000-0000-0000-0000-000000000000'  # 现有测试学生
        subject_id = '23902fd2-568a-4665-ad12-2d3514f3b2cd'  # 现有语文学科
        
        # 语文笔记内容 - 2025年9月15日初一语文笔记
        chinese_notes = [
            {
                'title': '修辞手法 - 拟人',
                'content': '''# 修辞手法 - 拟人

## 定义
把事物当作人来写，赋予人的特征和情态。

## 答题模板
这句话运用了拟人的修辞，把……事物当作人来写，赋予了人的特征和情态，生动形象地突出了事物……的特征，表达了作者……的感情。

## 作用
- 使事物更加生动形象
- 增强表达效果
- 便于抒发情感''',
                'recitation_type': 'definition',
                'grade_level': '初一',
                'unit_name': '2025-09-15语文笔记',
                'difficulty_level': 2
            },
            {
                'title': '修辞手法 - 反复',
                'content': '''# 修辞手法 - 反复

## 定义
为了突出某个意思，强调某种感情，有意重复某个词语或句子。

## 答题模板
突出内容……；强调……情感；加强语气，反复咏叹，回环往复，语句整齐，有节奏感和韵律美，增强表现力。

## 分类
### 连续反复
词语或句子连续出现
- 例：盼望着，盼望着，东风来了，春天的脚步近了。

### 间隔反复
词语或句子间隔出现
- 例：我还不知道分别铜和银；还不知道分别布和绸；还不知道分别官和民。

## 作用
- 突出内容，强调情感
- 加强语气，增强节奏感
- 使语言更有韵律美''',
                'recitation_type': 'definition',
                'grade_level': '初一',
                'unit_name': '2025-09-15语文笔记',
                'difficulty_level': 2
            },
            {
                'title': '修辞手法 - 排比',
                'content': '''# 修辞手法 - 排比

## 定义
通常以三句或三句以上句子并排，句式工整，节奏感强。

## 答题模板
句式工整，节奏感强，强化语势，使语言精练、有力，强调了……的特点。

## 具体作用
- **用排比来说理**：可收到条理分明的效果
- **用排比来抒情**：节奏和谐，显得感情洋溢
- **用排比来叙事写景**：能使层次清楚、描写细腻、形象生动

## 特点
- 句式工整
- 节奏感强
- 强化语势
- 语言精练有力''',
                'recitation_type': 'definition',
                'grade_level': '初一',
                'unit_name': '2025-09-15语文笔记',
                'difficulty_level': 2
            }
        ]
        
        # 插入数据
        for note in chinese_notes:
            note_id = str(uuid.uuid4())
            current_time = datetime.now()
            
            insert_query = """
            INSERT INTO recitations (
                id, student_id, subject_id, chapter_id, title, content, markdown_content,
                recitation_type, vocabulary_type, proper_noun_type, grade_level, unit_name,
                difficulty_level, is_memorized, practice_count, last_practice_date,
                created_at, updated_at
            ) VALUES (
                %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s
            )
            """
            
            values = (
                note_id,
                student_id,  # 使用现有的学生ID
                subject_id,  # 使用现有的学科ID
                None,  # 章节ID
                note['title'],
                note['content'],
                note['content'],  # markdown_content 使用相同内容
                note['recitation_type'],
                None,  # vocabulary_type
                None,  # proper_noun_type
                note['grade_level'],
                note['unit_name'],
                note['difficulty_level'],
                False,  # is_memorized
                0,  # practice_count
                None,  # last_practice_date
                current_time,
                current_time
            )
            
            cursor.execute(insert_query, values)
            print(f"已插入: {note['title']}")
        
        conn.commit()
        print(f"成功导入 {len(chinese_notes)} 条语文笔记")
        
    except Exception as e:
        print(f"导入失败: {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    import_chinese_notes()
