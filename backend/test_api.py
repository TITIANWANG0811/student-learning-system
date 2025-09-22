"""
简化的测试API
数据库规范：只使用 student_learning_system 数据库
数据字段规范：只使用 markdown_content 字段存储词汇内容
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import json
import os
from sqlalchemy.orm import Session
from app.core.database import get_db
from app.models.recitation import Recitation
from app.models.subject import Subject
from app.api.v1.english_vocabulary import router as english_vocabulary_router
from app.api.v1.chinese_notes import router as chinese_notes_router
from app.api.auth import router as auth_router

app = FastAPI(title="测试API")

# 注册API路由
app.include_router(auth_router, prefix="/api/v1/auth", tags=["认证"])
app.include_router(english_vocabulary_router, prefix="/api/v1/english-vocabulary", tags=["英语词汇"])
app.include_router(chinese_notes_router, prefix="/api/v1/chinese-notes", tags=["语文笔记"])

# 添加CORS中间件
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:9003"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_vocabulary_type_display(vocab_type: str) -> str:
    """获取词汇类型的中文显示名称"""
    type_display = {
        'word': '单词',
        'phrase': '短语',
        'idiom': '习语',
        'proper_name': '人名',
        'proper_place': '地名',
        'proper_other': '专有名词'
    }
    return type_display.get(vocab_type, '单词')

@app.get("/")
def read_root():
    return {"message": "测试API运行中"}

@app.get("/api/v1/vocabulary/grade1-english")
def get_grade1_english_vocabulary():
    """获取初一英语词汇 - 从数据库读取Markdown内容"""
    try:
        # 获取数据库连接
        db = next(get_db())
        
        # 查询初一和初二英语词汇和定义
        vocabularies = db.query(Recitation).filter(
            Recitation.grade_level.in_(["初一", "初二"])
        ).filter(
            Recitation.recitation_type == "vocabulary"
        ).all()
        
        print(f"从数据库加载了 {len(vocabularies)} 个词汇")
        print(f"数据库查询结果: {len(vocabularies)} 个词汇")
        if len(vocabularies) > 0:
            print(f"第一个词汇: {vocabularies[0].title}")
        else:
            print("数据库中没有找到词汇数据")
        
        api_data = []
        for i, vocab in enumerate(vocabularies, 1):
            # 只使用markdown_content字段，确保数据一致性
            content = vocab.markdown_content or ""
            
            api_item = {
                "id": str(vocab.id),
                "title": vocab.title,
                "content": content,  # 使用Markdown内容
                "recitation_type": vocab.recitation_type,
                "vocabulary_type": vocab.vocabulary_type,
                "grade_level": vocab.grade_level,
                "unit_name": vocab.unit_name,
                "difficulty_level": vocab.difficulty_level,
                "is_memorized": vocab.is_memorized,
                "practice_count": vocab.practice_count,
                "created_at": vocab.created_at.isoformat() if vocab.created_at else "2025-01-01T00:00:00Z",
                "updated_at": vocab.updated_at.isoformat() if vocab.updated_at else "2025-01-01T00:00:00Z"
            }
            api_data.append(api_item)
            
            if i <= 3:  # 只打印前3个的调试信息
                print(f"Item {i}: word={vocab.title}, vocabulary_type={vocab.vocabulary_type}")
        
        return api_data
        
    except Exception as e:
        print(f"从数据库读取词汇数据失败: {e}")
        return []

@app.post("/api/v1/vocabulary/import-grade1-english")
def import_grade1_english_vocabulary():
    """导入初一英语单词表"""
    return {
        "message": "成功导入 3 个初一英语单词！",
        "imported_count": 3,
        "student_id": "test-user"
    }

@app.delete("/api/v1/vocabulary/grade1-english")
def clear_grade1_english_vocabulary():
    """清空初一英语单词表"""
    return {
        "message": "成功清空 3 个初一英语单词",
        "deleted_count": 3,
        "student_id": "test-user"
    }

@app.get("/api/v1/vocabulary/vocabulary-stats")
def get_vocabulary_stats():
    """获取词汇学习统计"""
    return {
        "total_words": 3,
        "memorized_words": 1,
        "memorization_rate": 33.3,
        "difficulty_stats": {
            "level_1": 2,
            "level_2": 1,
            "level_3": 0,
            "level_4": 0,
            "level_5": 0
        },
        "total_practice_count": 4,
        "average_practice_count": 1.3
    }

@app.patch("/api/v1/recitations/{recitation_id}")
def update_recitation(recitation_id: str, data: dict):
    """更新默写状态"""
    return {"message": "更新成功"}

@app.get("/api/v1/subjects/by-category")
def get_subjects_by_category():
    """获取按分类组织的学科列表"""
    try:
        # 获取数据库连接
        db = next(get_db())
        
        # 查询所有学科
        subjects = db.query(Subject).filter(Subject.is_active == True).all()
        
        # 按分类组织
        categories = {
            "核心学科": [],
            "文科": [],
            "理科": [],
            "其他": []
        }
        
        for subject in subjects:
            # 根据学科名称分类
            if subject.name in ["语文", "数学", "英语"]:
                categories["核心学科"].append({
                    "id": str(subject.id),
                    "name": subject.name,
                    "code": subject.code,
                    "description": subject.description,
                    "color": subject.color,
                    "icon": subject.icon,
                    "difficulty_level": subject.difficulty_level,
                    "is_core_subject": subject.is_core_subject
                })
            elif subject.name in ["历史", "地理", "政治", "道法"]:
                categories["文科"].append({
                    "id": str(subject.id),
                    "name": subject.name,
                    "code": subject.code,
                    "description": subject.description,
                    "color": subject.color,
                    "icon": subject.icon,
                    "difficulty_level": subject.difficulty_level,
                    "is_core_subject": subject.is_core_subject
                })
            elif subject.name in ["物理", "化学", "生物"]:
                categories["理科"].append({
                    "id": str(subject.id),
                    "name": subject.name,
                    "code": subject.code,
                    "description": subject.description,
                    "color": subject.color,
                    "icon": subject.icon,
                    "difficulty_level": subject.difficulty_level,
                    "is_core_subject": subject.is_core_subject
                })
            else:
                categories["其他"].append({
                    "id": str(subject.id),
                    "name": subject.name,
                    "code": subject.code,
                    "description": subject.description,
                    "color": subject.color,
                    "icon": subject.icon,
                    "difficulty_level": subject.difficulty_level,
                    "is_core_subject": subject.is_core_subject
                })
        
        return categories
        
    except Exception as e:
        print(f"获取学科分类失败: {e}")
        return {"error": str(e)}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=9002)
