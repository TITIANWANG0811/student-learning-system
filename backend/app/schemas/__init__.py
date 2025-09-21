"""
数据模式模块
"""
from .user import UserCreate, UserResponse, UserUpdate, UserLogin
from .subject import SubjectResponse
from .study import StudyPlanCreate, StudyPlanResponse, StudyTaskCreate, StudyTaskResponse
from .content import NoteCreate, NoteResponse, AssignmentCreate, AssignmentResponse
from .exam import ExamCreate, ExamResponse
from .reminder import ReminderCreate, ReminderResponse

__all__ = [
    "UserCreate",
    "UserResponse", 
    "UserUpdate",
    "UserLogin",
    "SubjectResponse",
    "StudyPlanCreate",
    "StudyPlanResponse",
    "StudyTaskCreate", 
    "StudyTaskResponse",
    "NoteCreate",
    "NoteResponse",
    "AssignmentCreate",
    "AssignmentResponse",
    "ExamCreate",
    "ExamResponse",
    "ReminderCreate",
    "ReminderResponse"
]