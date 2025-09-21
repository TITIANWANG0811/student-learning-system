/**
 * 词汇管理API服务
 */
import api from './api';

export interface VocabularyItem {
  id: string;
  title: string;
  content: string;
  recitation_type: string;
  vocabulary_type?: string;
  grade_level?: string;
  unit_name?: string;
  difficulty_level: number;
  is_memorized: boolean;
  practice_count: number;
  created_at: string;
  updated_at: string;
}

export interface VocabularyStats {
  total_words: number;
  memorized_words: number;
  memorization_rate: number;
  difficulty_stats: Record<string, number>;
  total_practice_count: number;
  average_practice_count: number;
}

export interface ImportResponse {
  message: string;
  imported_count: number;
  student_id: string;
}

export interface ClearResponse {
  message: string;
  deleted_count: number;
  student_id: string;
}

/**
 * 获取初一英语词汇列表
 */
export const getGrade1EnglishVocabulary = async (params?: {
  unit?: string;
  difficulty_level?: number;
  is_memorized?: boolean;
}): Promise<VocabularyItem[]> => {
  const response = await api.get('/vocabulary/grade1-english', { params });
  return response.data;
};

/**
 * 导入初一英语单词表
 */
export const importGrade1EnglishVocabulary = async (studentId: string): Promise<ImportResponse> => {
  const response = await api.post('/vocabulary/import-grade1-english', null, {
    params: { student_id: studentId }
  });
  return response.data;
};

/**
 * 清空初一英语单词表
 */
export const clearGrade1EnglishVocabulary = async (studentId: string): Promise<ClearResponse> => {
  const response = await api.delete('/vocabulary/grade1-english', {
    params: { student_id: studentId }
  });
  return response.data;
};

/**
 * 获取词汇学习统计
 */
export const getVocabularyStats = async (studentId: string): Promise<VocabularyStats> => {
  const response = await api.get('/vocabulary/vocabulary-stats', {
    params: { student_id: studentId }
  });
  return response.data;
};

/**
 * 更新单词背诵状态
 */
export const updateVocabularyMemorized = async (id: string, isMemorized: boolean): Promise<void> => {
  await api.patch(`/recitations/${id}`, { is_memorized: isMemorized });
};
