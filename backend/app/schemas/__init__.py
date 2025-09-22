"""
数据模式模块
"""
from .user import UserCreate, UserResponse, UserUpdate, UserLogin
from .subject import SubjectResponse, TextbookChapterResponse, KnowledgePointResponse
from .study import StudyPlanCreate, StudyPlanResponse, StudyTaskCreate, StudyTaskResponse
from .content import NoteCreate, NoteResponse, AssignmentCreate, AssignmentResponse
from .exam import ExamCreate, ExamResponse
from .reminder import ReminderCreate, ReminderResponse
from .mind_map import MindMapCreate, MindMapResponse, MindMapUpdate
from .recitation import RecitationCreate, RecitationResponse, RecitationUpdate
from .practice_record import PracticeRecordCreate, PracticeRecordResponse, PracticeRecordUpdate
from .wrong_question import WrongQuestionCreate, WrongQuestionResponse, WrongQuestionUpdate

__all__ = [
    "UserCreate",
    "UserResponse", 
    "UserUpdate",
    "UserLogin",
    "SubjectResponse",
    "TextbookChapterResponse",
    "KnowledgePointResponse",
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
    "ReminderResponse",
    "MindMapCreate",
    "MindMapResponse",
    "MindMapUpdate",
    "RecitationCreate",
    "RecitationResponse",
    "RecitationUpdate",
    "PracticeRecordCreate",
    "PracticeRecordResponse",
    "PracticeRecordUpdate",
    "WrongQuestionCreate",
    "WrongQuestionResponse",
    "WrongQuestionUpdate"
]