"""
词汇管理API
"""
from fastapi import APIRouter, Depends, HTTPException, status, Query
from sqlalchemy.orm import Session
from typing import List, Optional
from uuid import UUID
import json
import os

from app.core.database import get_db
from app.schemas.recitation import RecitationCreate, RecitationResponse
from app.models.recitation import Recitation
from app.core.security import get_current_user

router = APIRouter()

@router.post("/import-grade1-english", status_code=status.HTTP_201_CREATED)
def import_grade1_english_vocabulary(
    student_id: UUID,
    db: Session = Depends(get_db),
    current_user: dict = Depends(get_current_user)
):
    """导入初一英语单词表"""
    try:
        # 读取词汇JSON文件
        vocab_file = os.path.join(os.path.dirname(__file__), "../../../database/vocabulary/grade1_english_vocabulary.json")
        
        if not os.path.exists(vocab_file):
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="词汇文件不存在"
            )
        
        with open(vocab_file, 'r', encoding='utf-8') as f:
            vocabulary_data = json.load(f)
        
        # 检查是否已经导入过
        existing_count = db.query(Recitation).filter(
            Recitation.student_id == student_id,
            Recitation.subject_id == '550e8400-e29b-41d4-a716-446655440002'  # 初一英语学科ID
        ).count()
        
        if existing_count > 0:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"该学生已经导入了 {existing_count} 个单词，请先清空或使用更新接口"
            )
        
        # 导入单词
        imported_count = 0
        for word_data in vocabulary_data:
            recitation = Recitation(
                student_id=student_id,
                subject_id='550e8400-e29b-41d4-a716-446655440002',  # 初一英语学科ID
                title=word_data['word'],
                content=word_data['meaning'],
                recitation_type='vocabulary',
                difficulty_level=word_data.get('difficulty_level', 1)
            )
            db.add(recitation)
            imported_count += 1
        
        db.commit()
        
        return {
            "message": f"成功导入 {imported_count} 个初一英语单词",
            "imported_count": imported_count,
            "student_id": str(student_id)
        }
        
    except FileNotFoundError:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="词汇文件不存在"
        )
    except Exception as e:
        db.rollback()
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"导入失败: {str(e)}"
        )

@router.get("/grade1-english", response_model=List[RecitationResponse])
def get_grade1_english_vocabulary(
    student_id: Optional[UUID] = Query(None, description="学生ID"),
    unit: Optional[str] = Query(None, description="单元名称"),
    difficulty_level: Optional[int] = Query(None, ge=1, le=5, description="难度等级"),
    is_memorized: Optional[bool] = Query(None, description="是否已背诵"),
    db: Session = Depends(get_db),
    current_user: dict = Depends(get_current_user)
):
    """获取初一英语单词表"""
    query = db.query(Recitation).filter(
        Recitation.subject_id == '550e8400-e29b-41d4-a716-446655440002',  # 初一英语学科ID
        Recitation.recitation_type == 'vocabulary'
    )
    
    # 权限检查
    if current_user["role"] == "student":
        query = query.filter(Recitation.student_id == current_user["id"])
    elif student_id:
        query = query.filter(Recitation.student_id == student_id)
    else:
        return []
    
    # 过滤条件
    if difficulty_level:
        query = query.filter(Recitation.difficulty_level == difficulty_level)
    if is_memorized is not None:
        query = query.filter(Recitation.is_memorized == is_memorized)
    
    # 按单元过滤（需要从标题中提取单元信息）
    if unit:
        # 这里可以根据实际需求实现单元过滤逻辑
        pass
    
    vocabulary = query.order_by(Recitation.title).all()
    return vocabulary

@router.delete("/grade1-english", status_code=status.HTTP_200_OK)
def clear_grade1_english_vocabulary(
    student_id: UUID,
    db: Session = Depends(get_db),
    current_user: dict = Depends(get_current_user)
):
    """清空初一英语单词表"""
    # 权限检查
    if current_user["role"] == "student" and str(current_user["id"]) != str(student_id):
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="无权清空其他学生的单词表"
        )
    
    # 删除该学生的初一英语单词
    deleted_count = db.query(Recitation).filter(
        Recitation.student_id == student_id,
        Recitation.subject_id == '550e8400-e29b-41d4-a716-446655440002',
        Recitation.recitation_type == 'vocabulary'
    ).delete()
    
    db.commit()
    
    return {
        "message": f"成功清空 {deleted_count} 个初一英语单词",
        "deleted_count": deleted_count,
        "student_id": str(student_id)
    }

@router.get("/vocabulary-stats")
def get_vocabulary_stats(
    student_id: UUID,
    db: Session = Depends(get_db),
    current_user: dict = Depends(get_current_user)
):
    """获取词汇学习统计"""
    # 权限检查
    if current_user["role"] == "student" and str(current_user["id"]) != str(student_id):
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="无权查看其他学生的统计信息"
        )
    
    # 总单词数
    total_words = db.query(Recitation).filter(
        Recitation.student_id == student_id,
        Recitation.subject_id == '550e8400-e29b-41d4-a716-446655440002',
        Recitation.recitation_type == 'vocabulary'
    ).count()
    
    # 已背诵单词数
    memorized_words = db.query(Recitation).filter(
        Recitation.student_id == student_id,
        Recitation.subject_id == '550e8400-e29b-41d4-a716-446655440002',
        Recitation.recitation_type == 'vocabulary',
        Recitation.is_memorized == True
    ).count()
    
    # 按难度等级统计
    difficulty_stats = {}
    for level in range(1, 6):
        count = db.query(Recitation).filter(
            Recitation.student_id == student_id,
            Recitation.subject_id == '550e8400-e29b-41d4-a716-446655440002',
            Recitation.recitation_type == 'vocabulary',
            Recitation.difficulty_level == level
        ).count()
        difficulty_stats[f"level_{level}"] = count
    
    # 练习次数统计
    practice_stats = db.query(Recitation).filter(
        Recitation.student_id == student_id,
        Recitation.subject_id == '550e8400-e29b-41d4-a716-446655440002',
        Recitation.recitation_type == 'vocabulary'
    ).with_entities(
        db.func.sum(Recitation.practice_count).label('total_practice'),
        db.func.avg(Recitation.practice_count).label('avg_practice')
    ).first()
    
    return {
        "student_id": str(student_id),
        "total_words": total_words,
        "memorized_words": memorized_words,
        "memorization_rate": round(memorized_words / total_words * 100, 2) if total_words > 0 else 0,
        "difficulty_stats": difficulty_stats,
        "total_practice_count": practice_stats.total_practice or 0,
        "average_practice_count": round(practice_stats.avg_practice or 0, 2)
    }
