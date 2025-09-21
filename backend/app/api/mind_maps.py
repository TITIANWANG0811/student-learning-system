"""
思维导图API路由
"""
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from typing import List, Optional
from uuid import UUID

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.mind_map import MindMap
from app.schemas.mind_map import (
    MindMapResponse,
    MindMapCreate,
    MindMapUpdate,
    MindMapWithSubject
)

router = APIRouter()


@router.get("/", response_model=List[MindMapWithSubject])
def get_mind_maps(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    subject_id: Optional[UUID] = Query(None, description="学科ID"),
    chapter_id: Optional[UUID] = Query(None, description="章节ID"),
    is_public: Optional[bool] = Query(None, description="是否公开"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取思维导图列表"""
    query = db.query(MindMap).filter(MindMap.student_id == current_user.id)
    
    if subject_id:
        query = query.filter(MindMap.subject_id == subject_id)
    if chapter_id:
        query = query.filter(MindMap.chapter_id == chapter_id)
    if is_public is not None:
        query = query.filter(MindMap.is_public == is_public)
    
    mind_maps = query.order_by(MindMap.updated_at.desc()).offset(skip).limit(limit).all()
    return mind_maps


@router.get("/{mind_map_id}", response_model=MindMapWithSubject)
def get_mind_map(
    mind_map_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取单个思维导图详情"""
    mind_map = db.query(MindMap).filter(
        MindMap.id == mind_map_id,
        MindMap.student_id == current_user.id
    ).first()
    if not mind_map:
        raise HTTPException(status_code=404, detail="思维导图不存在")
    return mind_map


@router.post("/", response_model=MindMapResponse)
def create_mind_map(
    mind_map: MindMapCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """创建思维导图"""
    db_mind_map = MindMap(
        **mind_map.dict(),
        student_id=current_user.id
    )
    db.add(db_mind_map)
    db.commit()
    db.refresh(db_mind_map)
    return db_mind_map


@router.put("/{mind_map_id}", response_model=MindMapResponse)
def update_mind_map(
    mind_map_id: UUID,
    mind_map: MindMapUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """更新思维导图"""
    db_mind_map = db.query(MindMap).filter(
        MindMap.id == mind_map_id,
        MindMap.student_id == current_user.id
    ).first()
    if not db_mind_map:
        raise HTTPException(status_code=404, detail="思维导图不存在")
    
    update_data = mind_map.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_mind_map, field, value)
    
    db.commit()
    db.refresh(db_mind_map)
    return db_mind_map


@router.delete("/{mind_map_id}")
def delete_mind_map(
    mind_map_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """删除思维导图"""
    db_mind_map = db.query(MindMap).filter(
        MindMap.id == mind_map_id,
        MindMap.student_id == current_user.id
    ).first()
    if not db_mind_map:
        raise HTTPException(status_code=404, detail="思维导图不存在")
    
    db.delete(db_mind_map)
    db.commit()
    return {"message": "思维导图删除成功"}
