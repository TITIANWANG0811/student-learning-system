"""
API路由模块
"""
from fastapi import APIRouter
from .auth import router as auth_router
from .users import router as users_router
from .subjects import router as subjects_router
from .subject_categories import router as subject_categories_router
from .study import router as study_router
from .content import router as content_router
from .exams import router as exams_router
from .reminders import router as reminders_router
from .mind_maps import router as mind_maps_router
from .recitations import router as recitations_router
from .practice_records import router as practice_records_router
from .wrong_questions import router as wrong_questions_router

# 创建主路由器
api_router = APIRouter()

# 注册子路由
api_router.include_router(auth_router, prefix="/auth", tags=["认证"])
api_router.include_router(users_router, prefix="/users", tags=["用户"])
api_router.include_router(subjects_router, prefix="/subjects", tags=["学科"])
api_router.include_router(subject_categories_router, prefix="/subject-categories", tags=["学科分类"])
api_router.include_router(study_router, prefix="/study", tags=["学习"])
api_router.include_router(content_router, prefix="/content", tags=["内容"])
api_router.include_router(exams_router, prefix="/exams", tags=["考试"])
api_router.include_router(reminders_router, prefix="/reminders", tags=["提醒"])
api_router.include_router(mind_maps_router, prefix="/mind-maps", tags=["思维导图"])
api_router.include_router(recitations_router, prefix="/recitations", tags=["默写"])
api_router.include_router(practice_records_router, prefix="/practice-records", tags=["练习记录"])
api_router.include_router(wrong_questions_router, prefix="/wrong-questions", tags=["错题本"])
