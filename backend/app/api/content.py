"""
内容管理API
"""
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List, Optional

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.content import Note, Assignment
from app.models.subject import Subject
from app.schemas.content import NoteCreate, NoteResponse, AssignmentCreate, AssignmentResponse

router = APIRouter()


@router.get("/notes", response_model=List[NoteResponse])
def get_notes(
    subject_id: Optional[str] = None,
    note_type: Optional[str] = None,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取笔记列表"""
    query = db.query(Note).filter(Note.user_id == current_user.id)
    
    if subject_id:
        query = query.filter(Note.subject_id == subject_id)
    if note_type:
        query = query.filter(Note.note_type == note_type)
    
    notes = query.all()
    return notes


@router.post("/notes", response_model=NoteResponse)
def create_note(
    note: NoteCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """创建笔记"""
    # 验证学科是否存在
    subject = db.query(Subject).filter(Subject.id == note.subject_id).first()
    if not subject:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学科不存在"
        )
    
    # 创建笔记
    new_note = Note(
        user_id=current_user.id,
        subject_id=note.subject_id,
        title=note.title,
        content=note.content,
        note_type=note.note_type,
        tags=note.tags or [],
        is_public=note.is_public or False
    )
    
    db.add(new_note)
    db.commit()
    db.refresh(new_note)
    
    return new_note


@router.get("/notes/{note_id}", response_model=NoteResponse)
def get_note(
    note_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取笔记详情"""
    note = db.query(Note).filter(
        Note.id == note_id,
        Note.user_id == current_user.id
    ).first()
    
    if not note:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="笔记不存在"
        )
    
    return note


@router.put("/notes/{note_id}", response_model=NoteResponse)
def update_note(
    note_id: str,
    note_update: NoteCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新笔记"""
    note = db.query(Note).filter(
        Note.id == note_id,
        Note.user_id == current_user.id
    ).first()
    
    if not note:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="笔记不存在"
        )
    
    # 更新笔记信息
    for field, value in note_update.dict(exclude_unset=True).items():
        setattr(note, field, value)
    
    db.commit()
    db.refresh(note)
    
    return note


@router.delete("/notes/{note_id}")
def delete_note(
    note_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """删除笔记"""
    note = db.query(Note).filter(
        Note.id == note_id,
        Note.user_id == current_user.id
    ).first()
    
    if not note:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="笔记不存在"
        )
    
    db.delete(note)
    db.commit()
    
    return {"message": "笔记已删除"}


@router.get("/assignments", response_model=List[AssignmentResponse])
def get_assignments(
    subject_id: Optional[str] = None,
    status: Optional[str] = None,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取作业列表"""
    query = db.query(Assignment).filter(Assignment.user_id == current_user.id)
    
    if subject_id:
        query = query.filter(Assignment.subject_id == subject_id)
    if status:
        query = query.filter(Assignment.status == status)
    
    assignments = query.all()
    return assignments


@router.post("/assignments", response_model=AssignmentResponse)
def create_assignment(
    assignment: AssignmentCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """创建作业"""
    # 验证学科是否存在
    subject = db.query(Subject).filter(Subject.id == assignment.subject_id).first()
    if not subject:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学科不存在"
        )
    
    # 创建作业
    new_assignment = Assignment(
        user_id=current_user.id,
        subject_id=assignment.subject_id,
        title=assignment.title,
        description=assignment.description,
        assignment_type=assignment.assignment_type,
        due_date=assignment.due_date
    )
    
    db.add(new_assignment)
    db.commit()
    db.refresh(new_assignment)
    
    return new_assignment


@router.put("/assignments/{assignment_id}/status")
def update_assignment_status(
    assignment_id: str,
    status: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新作业状态"""
    assignment = db.query(Assignment).filter(
        Assignment.id == assignment_id,
        Assignment.user_id == current_user.id
    ).first()
    
    if not assignment:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="作业不存在"
        )
    
    assignment.status = status
    db.commit()
    
    return {"message": "作业状态已更新"}


@router.put("/assignments/{assignment_id}/score")
def update_assignment_score(
    assignment_id: str,
    score: int,
    feedback: Optional[str] = None,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新作业分数"""
    assignment = db.query(Assignment).filter(
        Assignment.id == assignment_id,
        Assignment.user_id == current_user.id
    ).first()
    
    if not assignment:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="作业不存在"
        )
    
    assignment.score = score
    if feedback:
        assignment.feedback = feedback
    
    db.commit()
    
    return {"message": "作业分数已更新"}
