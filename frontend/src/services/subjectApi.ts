import api from './api';

// 学科分类相关接口
export interface SubjectCategory {
  id: string;
  name: string;
  code: string;
  description?: string;
  color?: string;
  icon?: string;
  sort_order: number;
  is_active: boolean;
  created_at: string;
}

export interface Subject {
  id: string;
  name: string;
  code: string;
  category_id?: string;
  description?: string;
  color?: string;
  icon?: string;
  difficulty_level: number;
  is_core_subject: boolean;
  is_active: boolean;
  created_at: string;
  category?: SubjectCategory;
}

// 获取学科分类列表
export const getSubjectCategories = async (): Promise<SubjectCategory[]> => {
  const response = await api.get('/subject-categories/');
  return response.data;
};

// 获取学科列表
export const getSubjects = async (params?: {
  category_id?: string;
  is_core_subject?: boolean;
  difficulty_level?: number;
}): Promise<Subject[]> => {
  const response = await api.get('/subjects/', { params });
  return response.data;
};

// 按分类获取学科
export const getSubjectsByCategory = async (): Promise<Subject[]> => {
  const response = await api.get('/subjects/by-category');
  return response.data;
};

// 学习内容相关接口
export interface MindMap {
  id: string;
  student_id: string;
  subject_id: string;
  chapter_id?: string;
  title: string;
  description?: string;
  content?: any;
  tags?: string[];
  is_public: boolean;
  created_at: string;
  updated_at: string;
}

export interface Recitation {
  id: string;
  student_id: string;
  subject_id: string;
  chapter_id?: string;
  title: string;
  content: string;
  recitation_type: string;
  difficulty_level: number;
  is_memorized: boolean;
  practice_count: number;
  last_practice_date?: string;
  created_at: string;
  updated_at: string;
}

export interface PracticeRecord {
  id: string;
  student_id: string;
  subject_id: string;
  practice_type: string;
  title: string;
  content?: any;
  total_questions: number;
  correct_answers: number;
  score?: number;
  duration?: number;
  completed_at?: string;
  created_at: string;
}

export interface WrongQuestion {
  id: string;
  student_id: string;
  subject_id: string;
  practice_record_id?: string;
  question_content: string;
  correct_answer: string;
  student_answer?: string;
  explanation?: string;
  difficulty_level: number;
  is_mastered: boolean;
  review_count: number;
  last_review_date?: string;
  created_at: string;
  updated_at: string;
}

// 思维导图API
export const getMindMaps = async (params?: { subject_id?: string; chapter_id?: string; is_public?: boolean }): Promise<MindMap[]> => {
  const response = await api.get('/mind-maps/', { params });
  return response.data;
};

export const createMindMap = async (data: Partial<MindMap>): Promise<MindMap> => {
  const response = await api.post('/mind-maps/', data);
  return response.data;
};

// 默写API
export const getRecitations = async (params?: { subject_id?: string; chapter_id?: string; recitation_type?: string; difficulty_level?: number; is_memorized?: boolean }): Promise<Recitation[]> => {
  const response = await api.get('/recitations/', { params });
  return response.data;
};

export const createRecitation = async (data: Partial<Recitation>): Promise<Recitation> => {
  const response = await api.post('/recitations/', data);
  return response.data;
};

// 练习记录API
export const getPracticeRecords = async (params?: { subject_id?: string; practice_type?: string }): Promise<PracticeRecord[]> => {
  const response = await api.get('/practice-records/', { params });
  return response.data;
};

export const createPracticeRecord = async (data: Partial<PracticeRecord>): Promise<PracticeRecord> => {
  const response = await api.post('/practice-records/', data);
  return response.data;
};

// 错题本API
export const getWrongQuestions = async (params?: { subject_id?: string; difficulty_level?: number; is_mastered?: boolean }): Promise<WrongQuestion[]> => {
  const response = await api.get('/wrong-questions/', { params });
  return response.data;
};

export const createWrongQuestion = async (data: Partial<WrongQuestion>): Promise<WrongQuestion> => {
  const response = await api.post('/wrong-questions/', data);
  return response.data;
};

// 获取单个学科详情
export const getSubject = async (id: string): Promise<Subject> => {
  const response = await api.get(`/subjects/${id}`);
  return response.data;
};

// 创建学科分类（管理员）
export const createSubjectCategory = async (data: Partial<SubjectCategory>): Promise<SubjectCategory> => {
  const response = await api.post('/subject-categories/', data);
  return response.data;
};

// 更新学科分类（管理员）
export const updateSubjectCategory = async (id: string, data: Partial<SubjectCategory>): Promise<SubjectCategory> => {
  const response = await api.put(`/subject-categories/${id}`, data);
  return response.data;
};

// 删除学科分类（管理员）
export const deleteSubjectCategory = async (id: string): Promise<void> => {
  await api.delete(`/subject-categories/${id}`);
};
