-- 初中生学习管理系统数据库表结构
-- 创建时间: 2024年

-- 用户表
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('student', 'parent', 'teacher')),
    full_name VARCHAR(100) NOT NULL,
    grade VARCHAR(10), -- 年级，如 '初一', '初二', '初三'
    class_name VARCHAR(50), -- 班级
    avatar_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 家长-学生关系表
CREATE TABLE parent_student_relations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    parent_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    relationship VARCHAR(20) DEFAULT 'parent', -- parent, guardian
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(parent_id, student_id)
);

-- 学科分类表
CREATE TABLE subject_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL, -- 分类名称：文科、理科、综合
    code VARCHAR(20) UNIQUE NOT NULL, -- liberal_arts, science, comprehensive
    description TEXT,
    color VARCHAR(7), -- 主题色
    icon VARCHAR(50), -- 图标名称
    sort_order INTEGER DEFAULT 0, -- 排序
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 学科表
CREATE TABLE subjects (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL, -- 语文、数学、英语、道法、历史
    code VARCHAR(10) UNIQUE NOT NULL, -- chinese, math, english, ethics, history
    category_id UUID REFERENCES subject_categories(id) ON DELETE SET NULL, -- 分类ID
    description TEXT,
    color VARCHAR(7), -- 主题色，如 #FF6B6B
    icon VARCHAR(50), -- 图标名称
    difficulty_level INTEGER DEFAULT 1, -- 难度等级 1-5
    is_core_subject BOOLEAN DEFAULT FALSE, -- 是否核心科目
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 教材章节表
CREATE TABLE textbook_chapters (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    grade VARCHAR(10) NOT NULL, -- 年级
    semester VARCHAR(10) NOT NULL, -- 学期：上学期、下学期
    chapter_number INTEGER NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    order_index INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(subject_id, grade, semester, chapter_number)
);

-- 知识点表
CREATE TABLE knowledge_points (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES textbook_chapters(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    difficulty_level INTEGER CHECK (difficulty_level BETWEEN 1 AND 5), -- 1-5难度等级
    tags TEXT[], -- 标签数组
    order_index INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 学习计划表
CREATE TABLE study_plans (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    plan_type VARCHAR(20) NOT NULL CHECK (plan_type IN ('daily', 'weekly', 'monthly', 'exam_prep')),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 学习任务表
CREATE TABLE study_tasks (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plan_id UUID NOT NULL REFERENCES study_plans(id) ON DELETE CASCADE,
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    task_type VARCHAR(20) NOT NULL CHECK (task_type IN ('reading', 'homework', 'recitation', 'dictation', 'practice', 'review')),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    content TEXT, -- 具体内容，如背诵的课文、默写的单词等
    scheduled_date DATE NOT NULL,
    completed_date TIMESTAMP,
    is_completed BOOLEAN DEFAULT FALSE,
    priority INTEGER DEFAULT 1 CHECK (priority BETWEEN 1 AND 3), -- 1-3优先级
    estimated_duration INTEGER, -- 预计完成时间（分钟）
    actual_duration INTEGER, -- 实际完成时间（分钟）
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 笔记表
CREATE TABLE notes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES textbook_chapters(id) ON DELETE SET NULL,
    knowledge_point_id UUID REFERENCES knowledge_points(id) ON DELETE SET NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    note_type VARCHAR(20) DEFAULT 'general' CHECK (note_type IN ('general', 'formula', 'vocabulary', 'concept', 'summary')),
    tags TEXT[],
    is_important BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 作业表
CREATE TABLE assignments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    content TEXT, -- 作业内容
    due_date DATE NOT NULL,
    submitted_date TIMESTAMP,
    is_submitted BOOLEAN DEFAULT FALSE,
    grade VARCHAR(10), -- 成绩
    feedback TEXT, -- 教师反馈
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 练习题表
CREATE TABLE practice_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES textbook_chapters(id) ON DELETE CASCADE,
    knowledge_point_id UUID REFERENCES knowledge_points(id) ON DELETE CASCADE,
    question_type VARCHAR(20) NOT NULL CHECK (question_type IN ('choice', 'fill_blank', 'short_answer', 'essay', 'calculation')),
    question_text TEXT NOT NULL,
    options JSONB, -- 选择题选项
    correct_answer TEXT NOT NULL,
    explanation TEXT, -- 解析
    difficulty_level INTEGER CHECK (difficulty_level BETWEEN 1 AND 5),
    points INTEGER DEFAULT 1, -- 分值
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 练习记录表
CREATE TABLE practice_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES practice_questions(id) ON DELETE CASCADE,
    student_answer TEXT,
    is_correct BOOLEAN,
    time_spent INTEGER, -- 答题时间（秒）
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 错题本表
CREATE TABLE wrong_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    question_id UUID NOT NULL REFERENCES practice_questions(id) ON DELETE CASCADE,
    wrong_answer TEXT,
    correct_answer TEXT,
    explanation TEXT,
    review_count INTEGER DEFAULT 0, -- 复习次数
    last_reviewed_at TIMESTAMP,
    is_mastered BOOLEAN DEFAULT FALSE, -- 是否已掌握
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(student_id, question_id)
);

-- 考试表
CREATE TABLE exams (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    exam_type VARCHAR(20) NOT NULL CHECK (exam_type IN ('quiz', 'midterm', 'final', 'mock', 'practice')),
    title VARCHAR(200) NOT NULL,
    description TEXT,
    exam_date DATE NOT NULL,
    duration INTEGER, -- 考试时长（分钟）
    total_score INTEGER,
    achieved_score INTEGER,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 学习进度表
CREATE TABLE learning_progress (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES textbook_chapters(id) ON DELETE CASCADE,
    knowledge_point_id UUID REFERENCES knowledge_points(id) ON DELETE CASCADE,
    progress_percentage INTEGER DEFAULT 0 CHECK (progress_percentage BETWEEN 0 AND 100),
    study_time INTEGER DEFAULT 0, -- 学习时间（分钟）
    last_studied_at TIMESTAMP,
    mastery_level INTEGER DEFAULT 0 CHECK (mastery_level BETWEEN 0 AND 5), -- 掌握程度
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(student_id, knowledge_point_id)
);

-- 学习统计表
CREATE TABLE learning_statistics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    stat_date DATE NOT NULL,
    study_time INTEGER DEFAULT 0, -- 当日学习时间（分钟）
    tasks_completed INTEGER DEFAULT 0, -- 完成任务数
    questions_answered INTEGER DEFAULT 0, -- 答题数
    correct_answers INTEGER DEFAULT 0, -- 正确答题数
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(student_id, subject_id, stat_date)
);

-- 思维导图表
CREATE TABLE mind_maps (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES textbook_chapters(id) ON DELETE SET NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    content JSONB, -- 思维导图数据（节点和连接）
    tags TEXT[],
    is_public BOOLEAN DEFAULT FALSE, -- 是否公开分享
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 默写表
CREATE TABLE recitations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    chapter_id UUID REFERENCES textbook_chapters(id) ON DELETE SET NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL, -- 默写内容
    recitation_type VARCHAR(20) NOT NULL CHECK (recitation_type IN ('poetry', 'prose', 'formula', 'vocabulary', 'definition', 'other')),
    difficulty_level INTEGER DEFAULT 1 CHECK (difficulty_level BETWEEN 1 AND 5),
    is_memorized BOOLEAN DEFAULT FALSE, -- 是否已背诵
    practice_count INTEGER DEFAULT 0, -- 练习次数
    last_practice_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 练习记录表
CREATE TABLE practice_records (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    practice_type VARCHAR(20) NOT NULL CHECK (practice_type IN ('exercise', 'quiz', 'simulation', 'review')),
    title VARCHAR(200) NOT NULL,
    content JSONB, -- 练习题目和答案
    total_questions INTEGER NOT NULL,
    correct_answers INTEGER DEFAULT 0,
    score DECIMAL(5,2), -- 分数
    duration INTEGER, -- 用时（分钟）
    completed_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 错题本表
CREATE TABLE wrong_questions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    subject_id UUID NOT NULL REFERENCES subjects(id) ON DELETE CASCADE,
    practice_record_id UUID REFERENCES practice_records(id) ON DELETE SET NULL,
    question_content TEXT NOT NULL,
    correct_answer TEXT NOT NULL,
    student_answer TEXT,
    explanation TEXT, -- 解析
    difficulty_level INTEGER DEFAULT 1 CHECK (difficulty_level BETWEEN 1 AND 5),
    is_mastered BOOLEAN DEFAULT FALSE, -- 是否已掌握
    review_count INTEGER DEFAULT 0, -- 复习次数
    last_review_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 学习提醒表
CREATE TABLE study_reminders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    parent_id UUID REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    reminder_type VARCHAR(20) NOT NULL CHECK (reminder_type IN ('study', 'exam', 'homework', 'review')),
    scheduled_time TIMESTAMP NOT NULL,
    is_sent BOOLEAN DEFAULT FALSE,
    is_recurring BOOLEAN DEFAULT FALSE,
    recurrence_pattern VARCHAR(20), -- daily, weekly, monthly
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 创建索引
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_grade ON users(grade);
CREATE INDEX idx_study_tasks_student_date ON study_tasks(student_id, scheduled_date);
CREATE INDEX idx_study_tasks_completed ON study_tasks(is_completed);
CREATE INDEX idx_notes_student_subject ON notes(student_id, subject_id);
CREATE INDEX idx_assignments_student_due ON assignments(student_id, due_date);
CREATE INDEX idx_practice_records_student ON practice_records(student_id);
CREATE INDEX idx_wrong_questions_student ON wrong_questions(student_id);
CREATE INDEX idx_learning_progress_student ON learning_progress(student_id);
CREATE INDEX idx_learning_statistics_student_date ON learning_statistics(student_id, stat_date);
CREATE INDEX idx_mind_maps_student_subject ON mind_maps(student_id, subject_id);
CREATE INDEX idx_recitations_student_subject ON recitations(student_id, subject_id);
CREATE INDEX idx_recitations_type ON recitations(recitation_type);
CREATE INDEX idx_practice_records_student_subject ON practice_records(student_id, subject_id);
CREATE INDEX idx_wrong_questions_student_subject ON wrong_questions(student_id, subject_id);
CREATE INDEX idx_wrong_questions_mastered ON wrong_questions(is_mastered);

-- 插入初始学科分类数据
INSERT INTO subject_categories (name, code, description, color, icon, sort_order) VALUES
('文科', 'liberal_arts', '语言文学类学科', '#FF6B6B', 'book', 1),
('理科', 'science', '数理科学类学科', '#4ECDC4', 'calculator', 2),
('综合', 'comprehensive', '综合类学科', '#96CEB4', 'star', 3);

-- 插入初始学科数据
INSERT INTO subjects (name, code, category_id, description, color, icon, difficulty_level, is_core_subject) 
SELECT 
    s.name, 
    s.code, 
    sc.id, 
    s.description, 
    s.color, 
    s.icon, 
    s.difficulty_level, 
    s.is_core_subject
FROM (VALUES
    ('语文', 'chinese', 'liberal_arts', '初中语文学习', '#FF6B6B', 'book', 3, true),
    ('数学', 'math', 'science', '初中数学学习', '#4ECDC4', 'calculator', 4, true),
    ('英语', 'english', 'liberal_arts', '初中英语学习', '#45B7D1', 'globe', 3, true),
    ('道德与法治', 'ethics', 'comprehensive', '初中道法学习', '#96CEB4', 'heart', 2, false),
    ('历史', 'history', 'liberal_arts', '初中历史学习', '#FFEAA7', 'clock', 2, false)
) AS s(name, code, category_code, description, color, icon, difficulty_level, is_core_subject)
JOIN subject_categories sc ON sc.code = s.category_code;

-- 创建触发器函数用于自动更新 updated_at 字段
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- 为需要的表创建触发器
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_study_plans_updated_at BEFORE UPDATE ON study_plans FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_study_tasks_updated_at BEFORE UPDATE ON study_tasks FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_notes_updated_at BEFORE UPDATE ON notes FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_assignments_updated_at BEFORE UPDATE ON assignments FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_wrong_questions_updated_at BEFORE UPDATE ON wrong_questions FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_exams_updated_at BEFORE UPDATE ON exams FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_learning_progress_updated_at BEFORE UPDATE ON learning_progress FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
