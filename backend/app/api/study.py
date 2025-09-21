"""
学习管理API
"""
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from typing import List, Optional
from datetime import datetime, date

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.user import User
from app.models.study import StudyPlan, StudyTask
from app.models.subject import Subject
from app.schemas.study import StudyPlanCreate, StudyPlanResponse, StudyTaskCreate, StudyTaskResponse

router = APIRouter()


@router.get("/plans", response_model=List[StudyPlanResponse])
def get_study_plans(
    subject_id: Optional[str] = None,
    plan_type: Optional[str] = None,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取学习计划列表"""
    query = db.query(StudyPlan).filter(StudyPlan.user_id == current_user.id)
    
    if subject_id:
        query = query.filter(StudyPlan.subject_id == subject_id)
    if plan_type:
        query = query.filter(StudyPlan.plan_type == plan_type)
    
    plans = query.all()
    return plans


@router.post("/plans", response_model=StudyPlanResponse)
def create_study_plan(
    plan: StudyPlanCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """创建学习计划"""
    # 验证学科是否存在
    subject = db.query(Subject).filter(Subject.id == plan.subject_id).first()
    if not subject:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学科不存在"
        )
    
    # 创建学习计划
    study_plan = StudyPlan(
        user_id=current_user.id,
        subject_id=plan.subject_id,
        title=plan.title,
        description=plan.description,
        plan_type=plan.plan_type,
        start_date=plan.start_date,
        end_date=plan.end_date
    )
    
    db.add(study_plan)
    db.commit()
    db.refresh(study_plan)
    
    return study_plan


@router.get("/plans/{plan_id}", response_model=StudyPlanResponse)
def get_study_plan(
    plan_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取学习计划详情"""
    plan = db.query(StudyPlan).filter(
        StudyPlan.id == plan_id,
        StudyPlan.user_id == current_user.id
    ).first()
    
    if not plan:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学习计划不存在"
        )
    
    return plan


@router.put("/plans/{plan_id}", response_model=StudyPlanResponse)
def update_study_plan(
    plan_id: str,
    plan_update: StudyPlanCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新学习计划"""
    plan = db.query(StudyPlan).filter(
        StudyPlan.id == plan_id,
        StudyPlan.user_id == current_user.id
    ).first()
    
    if not plan:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学习计划不存在"
        )
    
    # 更新计划信息
    for field, value in plan_update.dict(exclude_unset=True).items():
        setattr(plan, field, value)
    
    db.commit()
    db.refresh(plan)
    
    return plan


@router.delete("/plans/{plan_id}")
def delete_study_plan(
    plan_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """删除学习计划"""
    plan = db.query(StudyPlan).filter(
        StudyPlan.id == plan_id,
        StudyPlan.user_id == current_user.id
    ).first()
    
    if not plan:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学习计划不存在"
        )
    
    db.delete(plan)
    db.commit()
    
    return {"message": "学习计划已删除"}


@router.get("/tasks", response_model=List[StudyTaskResponse])
def get_study_tasks(
    subject_id: Optional[str] = None,
    status: Optional[str] = None,
    due_date: Optional[date] = None,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """获取学习任务列表"""
    query = db.query(StudyTask).filter(StudyTask.user_id == current_user.id)
    
    if subject_id:
        query = query.filter(StudyTask.subject_id == subject_id)
    if status:
        query = query.filter(StudyTask.status == status)
    if due_date:
        query = query.filter(StudyTask.due_date == due_date)
    
    tasks = query.all()
    return tasks


@router.post("/tasks", response_model=StudyTaskResponse)
def create_study_task(
    task: StudyTaskCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """创建学习任务"""
    # 验证学科是否存在
    subject = db.query(Subject).filter(Subject.id == task.subject_id).first()
    if not subject:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学科不存在"
        )
    
    # 验证学习计划是否存在（如果提供了plan_id）
    if task.study_plan_id:
        plan = db.query(StudyPlan).filter(
            StudyPlan.id == task.study_plan_id,
            StudyPlan.user_id == current_user.id
        ).first()
        if not plan:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="学习计划不存在"
            )
    
    # 创建学习任务
    study_task = StudyTask(
        user_id=current_user.id,
        subject_id=task.subject_id,
        study_plan_id=task.study_plan_id,
        title=task.title,
        description=task.description,
        task_type=task.task_type,
        priority=task.priority,
        due_date=task.due_date
    )
    
    db.add(study_task)
    db.commit()
    db.refresh(study_task)
    
    return study_task


@router.put("/tasks/{task_id}/status")
def update_task_status(
    task_id: str,
    status: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """更新任务状态"""
    task = db.query(StudyTask).filter(
        StudyTask.id == task_id,
        StudyTask.user_id == current_user.id
    ).first()
    
    if not task:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学习任务不存在"
        )
    
    task.status = status
    db.commit()
    
    return {"message": "任务状态已更新"}


@router.delete("/tasks/{task_id}")
def delete_study_task(
    task_id: str,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """删除学习任务"""
    task = db.query(StudyTask).filter(
        StudyTask.id == task_id,
        StudyTask.user_id == current_user.id
    ).first()
    
    if not task:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="学习任务不存在"
        )
    
    db.delete(task)
    db.commit()
    
    return {"message": "学习任务已删除"}
