-- 更新数据库以支持学科分类功能

-- 1. 创建学科分类表
CREATE TABLE IF NOT EXISTS subject_categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL,
    description TEXT,
    color VARCHAR(7),
    icon VARCHAR(50),
    sort_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 为学科表添加新列
ALTER TABLE subjects ADD COLUMN IF NOT EXISTS category_id UUID REFERENCES subject_categories(id) ON DELETE SET NULL;
ALTER TABLE subjects ADD COLUMN IF NOT EXISTS difficulty_level INTEGER DEFAULT 1;
ALTER TABLE subjects ADD COLUMN IF NOT EXISTS is_core_subject BOOLEAN DEFAULT FALSE;

-- 3. 插入初始学科分类数据
INSERT INTO subject_categories (name, code, description, color, icon, sort_order) VALUES
('文科', 'liberal_arts', '语言文学类学科', '#FF6B6B', 'book', 1),
('理科', 'science', '数理科学类学科', '#4ECDC4', 'calculator', 2),
('综合', 'comprehensive', '综合类学科', '#96CEB4', 'star', 3)
ON CONFLICT (code) DO NOTHING;

-- 4. 更新现有学科数据
UPDATE subjects SET 
    category_id = (SELECT id FROM subject_categories WHERE code = 'liberal_arts'),
    difficulty_level = 3,
    is_core_subject = true
WHERE code = 'chinese';

UPDATE subjects SET 
    category_id = (SELECT id FROM subject_categories WHERE code = 'science'),
    difficulty_level = 4,
    is_core_subject = true
WHERE code = 'math';

UPDATE subjects SET 
    category_id = (SELECT id FROM subject_categories WHERE code = 'liberal_arts'),
    difficulty_level = 3,
    is_core_subject = true
WHERE code = 'english';

UPDATE subjects SET 
    category_id = (SELECT id FROM subject_categories WHERE code = 'comprehensive'),
    difficulty_level = 2,
    is_core_subject = false
WHERE code = 'ethics';

UPDATE subjects SET 
    category_id = (SELECT id FROM subject_categories WHERE code = 'liberal_arts'),
    difficulty_level = 2,
    is_core_subject = false
WHERE code = 'history';
