from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from uuid import UUID

from app.core.database import get_db
from app.models.chinese_notes import ChineseNotes
from app.models.user import User
from app.schemas.chinese_notes import ChineseNotesResponse, ChineseNotesCreate, ChineseNotesUpdate, ChineseNotesWithUserResponse
from app.api.auth import oauth2_scheme
from app.core.security import verify_token

router = APIRouter()

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    """获取当前用户"""
    try:
        payload = verify_token(token)
        if payload is None:
            raise HTTPException(
                status_code=401,
                detail="无效的令牌",
                headers={"WWW-Authenticate": "Bearer"},
            )
        
        user_id = payload.get("sub")
        user = db.query(User).filter(User.id == user_id).first()
        if user is None:
            raise HTTPException(
                status_code=404,
                detail="用户不存在"
            )
        
        return user
    except Exception as e:
        raise HTTPException(
            status_code=401,
            detail="认证失败",
            headers={"WWW-Authenticate": "Bearer"},
        )

@router.get("/", response_model=List[ChineseNotesWithUserResponse])
async def get_chinese_notes(
    grade_level: Optional[str] = None,
    subject: Optional[str] = None,
    note_date: Optional[str] = None,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """获取语文笔记列表 - 支持用户权限控制"""
    print(f"Current user: {current_user.username if current_user else 'None'}")  # 调试信息
    
    # 构建查询：用户可以看到自己的笔记 + 公开的笔记 + 分享给同学的笔记
    query = db.query(ChineseNotes).filter(
        (ChineseNotes.user_id == current_user.id) |  # 自己的笔记
        (ChineseNotes.is_public == True) |           # 公开的笔记
        (ChineseNotes.is_shared == True)              # 分享的笔记
    )
    
    if grade_level:
        query = query.filter(ChineseNotes.grade_level == grade_level)
    if subject:
        query = query.filter(ChineseNotes.subject == subject)
    if note_date:
        query = query.filter(ChineseNotes.note_date == note_date)
    
    notes = query.all()
    print(f"Found {len(notes)} notes for user {current_user.username}")
    
    # 转换为包含用户信息的响应格式
    result = []
    for note in notes:
        # 获取用户信息
        user = db.query(User).filter(User.id == note.user_id).first()
        
        note_dict = {
            "id": note.id,
            "user_id": note.user_id,
            "subject_id": note.subject_id,
            "title": note.title,
            "content": note.content,
            "markdown_content": note.markdown_content,
            "note_date": note.note_date,
            "grade_level": note.grade_level,
            "subject": note.subject,
            "unit_name": note.unit_name,
            "difficulty_level": note.difficulty_level,
            "is_public": note.is_public,
            "is_shared": note.is_shared,
            "created_at": note.created_at,
            "updated_at": note.updated_at,
            "author_username": user.username if user else None,
            "author_full_name": user.full_name if user else None,
        }
        result.append(note_dict)
    
    return result

@router.get("/{note_id}", response_model=ChineseNotesResponse)
async def get_chinese_note_by_id(
    note_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """根据ID获取语文笔记 - 支持用户权限控制"""
    note = db.query(ChineseNotes).filter(ChineseNotes.id == note_id).first()
    if not note:
        raise HTTPException(status_code=404, detail="语文笔记不存在")
    
    # 检查权限：用户可以看到自己的笔记 + 公开的笔记 + 分享的笔记
    if (note.user_id != current_user.id and 
        not note.is_public and 
        not note.is_shared):
        raise HTTPException(status_code=403, detail="无权访问此笔记")
    
    return note

@router.post("/", response_model=ChineseNotesResponse)
async def create_chinese_note(
    note: ChineseNotesCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """创建语文笔记 - 自动关联到当前用户"""
    note_data = note.dict()
    note_data['user_id'] = current_user.id
    db_note = ChineseNotes(**note_data)
    db.add(db_note)
    db.commit()
    db.refresh(db_note)
    return db_note

@router.put("/{note_id}", response_model=ChineseNotesResponse)
async def update_chinese_note(
    note_id: UUID,
    note: ChineseNotesUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """更新语文笔记 - 只有笔记所有者可以更新"""
    db_note = db.query(ChineseNotes).filter(ChineseNotes.id == note_id).first()
    if not db_note:
        raise HTTPException(status_code=404, detail="语文笔记不存在")
    
    # 只有笔记所有者可以更新
    if db_note.user_id != current_user.id:
        raise HTTPException(status_code=403, detail="无权修改此笔记")
    
    update_data = note.dict(exclude_unset=True)
    for field, value in update_data.items():
        setattr(db_note, field, value)
    
    db.commit()
    db.refresh(db_note)
    return db_note

@router.delete("/{note_id}")
async def delete_chinese_note(
    note_id: UUID,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    """删除语文笔记 - 只有笔记所有者可以删除"""
    db_note = db.query(ChineseNotes).filter(ChineseNotes.id == note_id).first()
    if not db_note:
        raise HTTPException(status_code=404, detail="语文笔记不存在")
    
    # 只有笔记所有者可以删除
    if db_note.user_id != current_user.id:
        raise HTTPException(status_code=403, detail="无权删除此笔记")
    
    db.delete(db_note)
    db.commit()
    return {"message": "语文笔记删除成功"}
