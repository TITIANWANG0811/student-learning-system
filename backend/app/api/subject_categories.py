"""
学科分类API路由
"""
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List, Optional

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.subject_category import SubjectCategory
from app.schemas.subject_category import (
    SubjectCategoryResponse,
    SubjectCategoryCreate,
    SubjectCategoryUpdate,
    SubjectCategoryWithSubjects
)

router = APIRouter()


@router.get("/", response_model=List[SubjectCategoryResponse])
def get_categories(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    is_active: Optional[bool] = Query(None),
    db: Session = Depends(get_db)
):
    """获取学科分类列表"""
    query = db.query(SubjectCategory)
    
    if is_active is not None:
        query = query.filter(SubjectCategory.is_active == is_active)
    
    categories = query.order_by(SubjectCategory.sort_order, SubjectCategory.name).offset(skip).limit(limit).all()
    return categories


@router.get("/{category_id}", response_model=SubjectCategoryWithSubjects)
def get_category(
    category_id: str,
    db: Session = Depends(get_db)
):
    """获取单个学科分类详情"""
    category = db.query(SubjectCategory).filter(SubjectCategory.id == category_id).first()
    if not category:
        raise HTTPException(status_code=404, detail="学科分类不存在")
    return category


@router.post("/", response_model=SubjectCategoryResponse)
def create_category(
    category: SubjectCategoryCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """创建学科分类（需要管理员权限）"""
    # 检查代码是否已存在
    existing = db.query(SubjectCategory).filter(SubjectCategory.code == category.code).first()
    if existing:
        raise HTTPException(status_code=400, detail="分类代码已存在")
    
    db_category = SubjectCategory(**category.dict())
    db.add(db_category)
    db.commit()
    db.refresh(db_category)
    return db_category


@router.put("/{category_id}", response_model=SubjectCategoryResponse)
def update_category(
    category_id: str,
    category: SubjectCategoryUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """更新学科分类（需要管理员权限）"""
    db_category = db.query(SubjectCategory).filter(SubjectCategory.id == category_id).first()
    if not db_category:
        raise HTTPException(status_code=404, detail="学科分类不存在")
    
    # 检查代码是否已存在（如果更新了代码）
    if category.code and category.code != db_category.code:
        existing = db.query(SubjectCategory).filter(SubjectCategory.code == category.code).first()
        if existing:
            raise HTTPException(status_code=400, detail="分类代码已存在")
    
    update_data = category.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_category, field, value)
    
    db.commit()
    db.refresh(db_category)
    return db_category


@router.delete("/{category_id}")
def delete_category(
    category_id: str,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """删除学科分类（需要管理员权限）"""
    db_category = db.query(SubjectCategory).filter(SubjectCategory.id == category_id).first()
    if not db_category:
        raise HTTPException(status_code=404, detail="学科分类不存在")
    
    # 检查是否有关联的学科
    if db_category.subjects:
        raise HTTPException(status_code=400, detail="该分类下还有学科，无法删除")
    
    db.delete(db_category)
    db.commit()
    return {"message": "学科分类删除成功"}
