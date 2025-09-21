"""
简化的测试API
"""
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import json
import os

app = FastAPI(title="测试API")

# 添加CORS中间件
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:9003"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"message": "测试API运行中"}

@app.get("/api/v1/vocabulary/grade1-english")
def get_grade1_english_vocabulary():
    """获取初一英语词汇"""
    try:
        # 从JSON文件读取真实数据
        json_file_path = "/Users/titianwang/Workspace/App/StudentLearningSystem/database/vocabulary/grade1_english_vocabulary.json"
        
        if os.path.exists(json_file_path):
            with open(json_file_path, 'r', encoding='utf-8') as f:
                vocabulary_data = json.load(f)
            
            # 转换为API格式
            api_data = []
            for i, item in enumerate(vocabulary_data, 1):
                # 构建content字符串
                content_parts = []
                if item.get('phonetic'):
                    content_parts.append(f"音标: {item['phonetic']}")
                if item.get('part_of_speech'):
                    content_parts.append(f"词性: {item['part_of_speech']}")
                if item.get('meaning'):
                    content_parts.append(f"中文释义: {item['meaning']}")
                
                # 添加例句
                if item.get('examples') and len(item['examples']) > 0:
                    examples_text = "例句: "
                    for j, example in enumerate(item['examples'], 1):
                        examples_text += f"{j}. {example}\n"
                    content_parts.append(examples_text.strip())
                
                # 添加相关词汇
                if item.get('related_words') and len(item['related_words']) > 0:
                    related_text = "相关词汇: "
                    for word in item['related_words']:
                        related_text += f"- {word}\n"
                    content_parts.append(related_text.strip())
                
                api_item = {
                    "id": str(i),
                    "title": item.get('word', ''),
                    "content": "\n".join(content_parts),
                    "recitation_type": "vocabulary",
                    "difficulty_level": item.get('difficulty_level', 1),
                    "is_memorized": False,
                    "practice_count": 0,
                    "created_at": item.get('created_at', "2025-01-01T00:00:00Z"),
                    "updated_at": item.get('created_at', "2025-01-01T00:00:00Z")
                }
                api_data.append(api_item)
            
            return api_data
        else:
            # 如果文件不存在，返回模拟数据
            return [
                {
                    "id": "1",
                    "title": "ready",
                    "content": "音标: /ˈredi/\n词性: 形容词 (adjective)\n中文释义: 准备好(做某事)的\n例句: 1. I am ready for the exam. (我准备好考试了。)\n2. Are you ready to go? (你准备好走了吗？)\n联想记忆: 发音联想：ready发音类似瑞迪，想象一个叫瑞迪的人总是很准备好。\n相关词汇: - 近义词: prepared, set\n- 反义词: unready, unprepared\n- 派生词: readiness (n. 准备就绪), readily (adv. 乐意地)",
                    "recitation_type": "vocabulary",
                    "difficulty_level": 1,
                    "is_memorized": False,
                    "practice_count": 0,
                    "created_at": "2025-01-01T00:00:00Z",
                    "updated_at": "2025-01-01T00:00:00Z"
                }
            ]
    except Exception as e:
        print(f"读取词汇数据失败: {e}")
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

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=9002)
