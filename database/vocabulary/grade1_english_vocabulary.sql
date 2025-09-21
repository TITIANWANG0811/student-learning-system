
-- 插入学科分类
INSERT INTO subject_categories (id, name, description, created_at) 
VALUES ('550e8400-e29b-41d4-a716-446655440000', '语言文学', '语言文学类学科', NOW())
ON CONFLICT (id) DO NOTHING;


-- 插入英语学科
INSERT INTO subjects (id, name, code, description, category_id, created_at) 
VALUES ('550e8400-e29b-41d4-a716-446655440001', '英语', 'english', '英语学科', '550e8400-e29b-41d4-a716-446655440000', NOW())
ON CONFLICT (id) DO NOTHING;


-- 插入年级信息
INSERT INTO subjects (id, name, code, description, category_id, created_at) 
VALUES ('550e8400-e29b-41d4-a716-446655440002', '初一英语', 'grade1_english', '初一英语', '550e8400-e29b-41d4-a716-446655440000', NOW())
ON CONFLICT (id) DO NOTHING;


-- 单词: nervous
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2b012389-4a7e-4bea-8b0c-2dd30bb4e0d9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'nervous',
    '神经紧张的，焦虑不安的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: start
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ffbadc29-d7dc-4b42-a06d-a43232065c26',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'start',
    '开始',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dining hall
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'bddb9d70-1314-44a2-9309-462931c85d61',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dining hall',
    '',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: yourself
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8b2009e7-3663-48dd-a47d-3cee89c6227b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'yourself',
    '你自己',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: join
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6479bab7-6f90-4a86-beac-c83f664f87d8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'join',
    '成为……的一员，加入',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: team
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2d7a1fff-53d4-4e2d-8d03-5c37977030de',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'team',
    '(游戏或体育比赛的)队',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: forget
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'edb6927c-57b6-4eb2-953e-6326176c376b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'forget',
    '',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: grey
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'df0adac5-c072-4526-97e5-107901fa615d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'grey',
    '灰色的；暗淡的；年老的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: T-shirt
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4a94239e-2956-4a04-95f0-c08f7d2165a0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'T-shirt',
    'T恤衫，短袖运动衫',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: each other
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9bcd5227-efb3-494e-b619-f931bf0deaf4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'each other',
    '互相，彼此',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: junior high
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '884ab20c-8fc7-4349-85b7-96815eee327c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'junior high',
    '初级中学',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: a bit
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd1ea3723-98fe-49b4-9ab3-ecd30cc26813',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'a bit',
    '有点儿，稍微',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lab
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f68e6cd9-2477-4d94-ba02-eaa21cc92427',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lab',
    '实验室',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: uniform
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4612c1c3-ed54-4076-b443-b58587119780',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'uniform',
    '制服；校服；统一的服装',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: explore
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '186edac1-7b51-45e6-b029-15ca2fbb420c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'explore',
    '探索；探讨，探究',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: biology
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1d5abf6e-db5f-46f8-a6ed-af10d7cb6977',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'biology',
    '生物',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: of course
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd5c245bf-c9e7-4e42-abfa-0f543b94248c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'of course',
    '当然，自然，毫无疑问',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: red scarf
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0ba9ccdc-d6b1-40d5-acdd-b63b385bd9b5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'red scarf',
    '',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: jacket
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '365accb8-5abd-4dc5-b084-7d6b09e98ead',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'jacket',
    '夹克，短上衣',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: eraser
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '96a84009-19b9-49de-9acd-cc6a0d8dc6b8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'eraser',
    '橡皮',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fun
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '115eb2a4-2c1b-4634-b0ab-78f2a38ca5cb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fun',
    '乐趣',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: introduce
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '375a2c96-cbf7-458a-a382-2b37a13a7f47',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'introduce',
    '介绍',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: school uniform
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c2de1c6f-e83b-4afe-a551-96b9ab11622a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'school uniform',
    '',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: textbook
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '80998b15-717f-4047-ba46-bb21df8bf773',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'textbook',
    '教科书，教材，课本',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: take part in
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ef421c75-6a24-4187-b53d-d118d688989c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'take part in',
    '参加，参与',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: everyone
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '334b458c-260c-4e55-ab39-168a60c723e2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'everyone',
    '每个人，人人',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hobby
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f24fd24d-4d87-4289-b872-43db7e862b54',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hobby',
    '业余爱好，嗜好',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: together
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f85bc674-f6f2-4735-b514-3131ee9febfb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'together',
    '一起，共同，一齐，一块儿',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ready
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3732d61e-6f0e-427d-b32b-e244182257e3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ready',
    '准备好(做某事)的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: history
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '57064182-ef56-4ca1-80f8-c8cf733c2143',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'history',
    '历史',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: geography
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '817f61fc-d476-4f87-b992-211df1cd4eea',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'geography',
    '地理',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: teaching building
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '904c7eec-1205-43ba-aee1-57ed6ea76ebc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'teaching building',
    '',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: problem
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c2e41315-a229-4ae0-a02c-506c57b99eee',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'problem',
    '问题，难题；困难',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: advice
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'af35bdaf-85f1-49e0-a8e7-1340d61c49da',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'advice',
    '意见，建议；忠告，劝告',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: homework
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'acb09267-8737-4ab0-918d-c56754cd248d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'homework',
    '家庭作业，功课',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: really
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e1c0b447-a72d-42fa-b5f0-b4852dacc63a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'really',
    '确实地，的确',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mind
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd8b03d21-6e60-47e2-9600-6bae36a6a56a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mind',
    '头脑；思想，思维',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: storm
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a6acc547-a3dd-4c5b-8ef4-bb727c70caa2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'storm',
    '暴风雨（雪）',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: towards
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b74d0eb4-b067-4acd-8300-fa13d01976ac',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'towards',
    '向着，朝着（某个方向）',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pool
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '76252306-41d7-4e1b-8901-ca58bcf5e354',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pool',
    '水塘，水洼',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: wind
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ed1f07f1-8872-4875-ad47-1a6d38d3d9e5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'wind',
    '风',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: need
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '490eca8f-19ff-4601-b478-e3996fde23d4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'need',
    '需要',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mistake
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0ec70b9b-c518-491d-891c-c513e5cce40a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mistake',
    '错误',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sail
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '06210bde-eb72-4caa-a970-50ac1cc5b2cb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sail',
    '驾驶（船只）',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sentence
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e02a2fa2-4012-4770-a743-6ab53766cc2c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sentence',
    '句子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: primary school
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '09fe0f94-6cec-47b7-82cb-84bc6a4dc031',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'primary school',
    '小学',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: protect
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'cc10a958-188c-4ef4-b246-ed2f5060e58a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'protect',
    '保护；防护',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: life
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '956dc6ce-9626-44dd-acb6-9a8ae947cf25',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'life',
    '生活',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: task
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a32b18af-6e89-4efb-9cce-3b25a435502f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'task',
    '工作，任务',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: important
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e30ebff6-7f17-4e5b-8ccd-b03b16115df4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'important',
    '重要的，重大的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: thought
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8c727cf2-6d3a-4851-9dcd-b98b956a41e0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'thought',
    '意见，主意，观点',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: journey
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7cab25fe-4a4f-48bf-a5eb-202ec1fcc0a2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'journey',
    '旅行，旅程；历程，过程',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: without
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '42d909fc-8610-48f6-b8b4-9a38edccfb66',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'without',
    '缺乏，没有',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: project
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3a1f6aae-d3ca-4008-bd24-c090a5cae059',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'project',
    '（学校的）课题，研究项目',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: something
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e20d63a6-1294-4c93-bca2-c75cf6589ecf',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'something',
    '某物，某事；某些东西',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: plan
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fb819bff-3e13-4155-bab3-9dba83cc0ec7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'plan',
    '计划',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: point out
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3f8a5fe9-c8c4-42f6-9222-3c5d80c92631',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'point out',
    '指出，指明',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: polite
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '17688815-96f7-428a-8d3b-6b9502288bc7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'polite',
    '有礼貌的，客气的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: meaning
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8ae8acb5-8935-426d-bf7b-bfb73b64de50',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'meaning',
    '意义，意思，含义',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hers
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '63d29f3c-2e71-4a3b-87c8-d1b90d40a01d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hers',
    '她的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hope
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4a892d4c-8ff5-4002-b8e1-bc4f30654eec',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hope',
    '希望，期望，指望',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dry
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'dd8e27ae-5a9d-4e61-aca0-d54730b0f4c3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dry',
    '干的，干燥的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: remember
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '323a1f86-6017-4515-aab2-902d32526864',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'remember',
    '记住，记得',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fact
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c4018ec5-1229-46bd-81d5-889230f0e9aa',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fact',
    '事实；真相',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: in fact
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c6cdec5b-d914-481f-a519-2afdee08a854',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'in fact',
    '事实上',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: wide
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'dd88b4d8-25cd-424e-afb7-c8f87c4f8c79',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'wide',
    '宽的，宽阔的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: through
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6302ca90-0e38-4fa1-ac4c-59600fb3ff8a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'through',
    '从一端至另一端，穿过，通过',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: nod
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '84277fea-b625-48f7-940a-5de60e512b83',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'nod',
    '点头',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ending
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '434fc930-a6f5-4264-8a87-ce75480b08f4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ending',
    '(故事、电影、活动等的)结局，结尾',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rush
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '692d2810-5120-4bc7-ad38-e7e2b261551f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rush',
    '冲，奔',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: tap
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '73419ea2-ee1c-4359-8f47-b7b6c26a0d94',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'tap',
    '(用手指)轻拍，轻叩，轻敲',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: heart
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '796241d4-c6af-46d5-aba9-94b8516235e1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'heart',
    '心(脏)',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: decide
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1efdcedf-a86e-40ea-a20a-fb5486723043',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'decide',
    '决定',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: festival
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '48bf62d5-df3a-4e7c-9fee-e339bcf2f6d5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'festival',
    '(电影、戏剧、音乐等的)节，节庆，汇演',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: different
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1b089e2c-fc23-483c-bb46-1a05fea54139',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'different',
    '不同的，不一样的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shelf
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'bfe0b5f6-e39d-40b5-a9c9-55b66e2a74f3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shelf',
    '搁板，架子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: paper-cutting
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3c2f7ded-3760-4916-8995-922650f340eb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'paper-cutting',
    '剪纸',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rock music
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '897e2836-6b2d-4f88-9e43-458d87ccb3c8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rock music',
    '摇滚乐',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hit
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '677b9776-9b0e-45ff-a052-e4117d52700c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hit',
    '使(某人)突然意识到',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: high
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ad97b4a2-b386-4b1a-8a21-819b8560c099',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'high',
    '高的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: classmate
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '72071bcc-9c2b-454c-9367-24f709a72f93',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'classmate',
    '同班同学',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: club
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c370b486-21af-40c0-9fc9-5a72c43e6d1c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'club',
    '俱乐部',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: everybody
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a8b92dad-bd47-4daa-b050-d57da70b7e4e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'everybody',
    '每个人，人人',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: enjoy
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd0da4825-066a-4ddf-83f9-cfaa252daceb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'enjoy',
    '喜欢；享受',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: magic
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ddf9ceec-71dd-4c71-978f-a177baf3b9aa',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'magic',
    '有魔力的，神奇的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: traditional
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3b600ca2-fa4d-4f4a-afc7-5ac71fbfac77',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'traditional',
    '传统的；习俗的；惯例的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: smile
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'aac159bc-d81c-4e4f-a18f-e895e6e4cc89',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'smile',
    '笑容；微笑',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lonely
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '765074f0-a0c2-4731-a9f3-301b9741150a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lonely',
    '孤单的，寂寞的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: practice
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ada6fc7c-38e4-42e0-b62f-535d38f3e64c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'practice',
    '练习',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: adventure
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'abed9ef5-67ac-4bcf-a9e3-92c4d14e1494',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'adventure',
    '历险；奇遇',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: midnight
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fc4a1bfc-1390-4c83-bf3f-2332584553b7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'midnight',
    '午夜',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: leave
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd8ba9e71-3895-4f38-966c-0313e6e205af',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'leave',
    '离开',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ground
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5f73aced-6312-418b-91e6-49825ee6b165',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ground',
    '地，地面',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: stage
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0c4992f2-b164-474c-a80d-c033f405b3ce',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'stage',
    '舞台',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: band
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c30633b7-87bb-448a-81bb-46f6030a526d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'band',
    '乐队，乐团',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: suddenly
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c57b6188-ff43-4b34-81cd-71b9f9d0b431',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'suddenly',
    '突然，突如其来地',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: electric
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '72e296e2-e58e-4f2a-9654-dba7636f40f1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'electric',
    '用电的；电动的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: volleyball
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5141a064-5225-4039-8a87-630f95da5367',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'volleyball',
    '排球(运动)',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: joy
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1f3bc53d-48ab-46c5-8846-951d1204374f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'joy',
    '欢欣，愉快，喜悦',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: nature
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '204c73ae-a855-4ed7-ac32-2f95ca3489ff',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'nature',
    '大自然，自然界',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: page
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7b4bc22a-2909-424f-8f26-575fdbf139e3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'page',
    '(书、报纸、文件等的)页，面',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: guitar
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '83413798-30dc-4377-9f24-cc24f70cb0d4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'guitar',
    '吉他',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: weak
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a56397f1-42d1-448c-8d5d-1b2194407c6f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'weak',
    '虚弱的，不强壮的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: instrument
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9c8e5229-9b43-468b-a573-b910a7ca512a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'instrument',
    '乐器',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shake
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f7cc8437-c3e0-4d46-822d-d4e5188365d9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shake',
    '摇动',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: almost
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd4d2ad3e-3911-4974-ab8e-d60ea25ce87f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'almost',
    '几乎，差不多',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hold
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a895f3b4-3daf-4507-a13a-a9864def8488',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hold',
    '握住，抓住；抱住',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: appear
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '25e843ff-0223-45f0-971e-e690d72af30d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'appear',
    '(尤指突然)出现，呈现',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: skate
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f894b6e7-e1a4-4924-ad16-6a6060b8654c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'skate',
    '滑冰，溜冰',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sound
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9eb77574-50e2-4e00-815f-a415f22abbeb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sound',
    '声音',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: notebook
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9aa29efc-a2e8-47d7-be42-81c6b393b1f4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'notebook',
    '笔记本',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: awake
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '675993ac-76ee-416c-8a49-8635a1ccdf4f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'awake',
    '醒着的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: son
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4ee19fc6-8d04-4e80-b4ed-d76a0f50862e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'son',
    '儿子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: queen
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '38fdb8db-2fb8-4ac5-bc56-f33f08813ee3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'queen',
    '女王',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: change
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1041f9bb-5c8e-43dd-855d-ddc792440155',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'change',
    '换(衣服)',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: growth
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b1f5c431-fdc9-46ad-8717-617303e96993',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'growth',
    '(性格、智力或情感的)发展，成长',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: memory
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e5594373-0343-479b-b494-77614823e608',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'memory',
    '记忆，回忆',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: trailer
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '613ee6f7-9439-4561-a7b9-819790f79c4b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'trailer',
    '拖车，挂车',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: care
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1ca852d2-5e30-4716-8723-44569a045451',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'care',
    '关心',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: road
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4a857dca-f3c0-4109-bb28-03e34486170b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'road',
    '路，道路，公路',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: race
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'edae9f58-85dc-4771-a5c9-c278d7268e31',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'race',
    '比赛',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: serious
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '15ffcf27-3610-453e-bc4e-5996cec211fb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'serious',
    '严重的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pick up
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6eedbe37-4522-4f66-acbf-6e4d2350a598',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pick up',
    '搭载，接载',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: handsome
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '88ca6880-21b4-40cf-bdd1-5325978b80fc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'handsome',
    '(男子)英俊的，漂亮的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: power
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a7b180d7-30ee-4f30-bac9-7008c52c586c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'power',
    '给(车辆或机器)提供动力',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: kiss
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fd65cbbe-063f-47a5-8f1c-2eae72ce7774',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'kiss',
    '吻',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hug
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1a5c69c0-b450-43fc-a9c3-3e9cbb97f302',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hug',
    '拥抱',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: result
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'abd288ab-e361-4618-bc3f-f50025b6ea5d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'result',
    '结果，后果',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: silent
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '48ee4f02-9037-4950-9197-ae94ed655ca6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'silent',
    '不作声的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: strict
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fdb0ef82-1e2b-428c-8bd0-51ff58b77401',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'strict',
    '严格的，严厉的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mountain
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '626b7c88-9ada-4014-8048-1d5b5264e633',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mountain',
    '高山，山岳',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: across
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '56b2a9af-6c6a-41b0-a936-f71d2812a8e7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'across',
    '从一边到另一边；穿过',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: along
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8a5e9e89-b919-44d1-886c-2d9a5b26d96a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'along',
    '顺着，沿着',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pull
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5eec8e7d-a071-4bb8-a172-39f20181ca82',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pull',
    '拉；扯；拖',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hide
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '06f06c27-c6fd-49c5-af5f-7f1e139e5113',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hide',
    '把……藏起来，隐藏',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: follow
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f95295a1-a816-4ff1-b935-8da203624a29',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'follow',
    '跟着，跟随',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: carry
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '20461289-fe7c-4398-84f2-3077ec376d4f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'carry',
    '把(某物或某人)带至(新的地点或位置)',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: matter
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1f0b0c62-8d1b-4b08-95e6-d7f33b9d8013',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'matter',
    '(尤指对某人自己或对发生之事)重要，要紧，有关系',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: seldom
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b0f5779f-89bf-439f-a21c-271cffc70138',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'seldom',
    '很少，罕见，不常',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: refuse
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '786697b9-4185-4fcc-92ac-3f754accd5c6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'refuse',
    '拒绝，回绝',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: position
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd6a246bb-264d-4701-9893-a5ae686144ac',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'position',
    '职位，职务',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: touching
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ebd20244-9efe-46d3-97f1-1cee6fce2181',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'touching',
    '感人的，动人的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: serve
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3dd2b40d-dbbd-4ddc-8c7c-c1e64f3467fb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'serve',
    '为……工作；供职',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: marry
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a9acb74e-ad15-410b-843d-facf585ba2d3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'marry',
    '结婚；娶；嫁',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: area
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '96bab13a-fd7b-4cf3-bba7-fea34be1430a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'area',
    '(国家，市镇等的)地区，区域',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: absent
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ba5dc34b-f22a-44ea-a71d-3612b452e5f9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'absent',
    '不在的，缺席的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: stay
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '14b1af2c-d8be-48f9-b926-232de684f7b2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'stay',
    '停留，逗留，留下',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: bright
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4e0d9e99-b2fa-43f0-b716-8cbf7bb4386e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'bright',
    '欢快的；充满生气的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: tear
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8eba1882-be57-49e7-8347-0b11e329c4ce',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'tear',
    '眼泪，泪水',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: actress
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '36918d78-5f94-406c-a1b8-53a4d73546d1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'actress',
    '女演员',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: postman
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b31b34af-afd3-4ed6-b7ca-fdf38759e17b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'postman',
    '邮递员，邮差',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: disease
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6cf104cd-65e5-4197-87ee-12aa0c1172cc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'disease',
    '疾病，病',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: throw away
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '445d3a69-95e4-43d5-a654-96dcec4679a2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'throw away',
    '扔掉，丢弃',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: regret
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '560ada34-806d-4d72-ad17-8cc4a3548f77',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'regret',
    '后悔(做了某事)；对…感到遗憾',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: laugh
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e21396c3-f9db-41fe-b9ec-23181bb1ec7d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'laugh',
    '发出笑声，(大)笑',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dish
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f8dc2a67-b8a2-4588-9095-eb519922cf45',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dish',
    '(烹制好的)菜肴，一道菜',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: balloon
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6d149f8c-18a0-4cee-a0f3-4cd4bb59e13d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'balloon',
    '气球',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: firework
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3e45c21c-54d8-4fee-9fb3-4c02864d2c29',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'firework',
    '烟火，烟花',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: knife
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8dd8519c-cf9f-4547-b991-fc91d708d5a6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'knife',
    '刀',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: meal
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '12600319-7419-4939-9a96-6798b7c9d66d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'meal',
    '一餐；饭',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: celebrate
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '47da1df5-e7fd-4fb4-82c2-2a3f776a2532',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'celebrate',
    '庆祝',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Christmas
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e7d83a00-2e39-428e-aaad-150ccbaa54bf',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Christmas',
    '圣诞节',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: reunion
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'acc68875-e93a-494f-a0d5-859121f68aae',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'reunion',
    '团圆，团聚',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: joke
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7a8c9564-77c2-4ac7-88c9-622eb4d55e51',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'joke',
    '说笑话；开玩笑',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: round
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b70be745-3962-4285-870f-7f9fb1d56e13',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'round',
    '圆形的，环形的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pork
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f76a6b40-7dc3-404d-b02e-94ced378452f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pork',
    '猪肉',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: cucumber
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'df7e88ef-bd4c-4d7e-aa99-497b774c711e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'cucumber',
    '黄瓜',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: break
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '90e0256e-9850-4f26-b605-8aa0aa660ffc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'break',
    '中断，暂停',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: waste
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c7406cbe-293e-4eb6-bd50-48cb690d38e1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'waste',
    '废料，废弃物',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: decision
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '882231df-bd59-4e5c-aa78-43fdf6fde746',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'decision',
    '决定，抉择',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: miss
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '643d5291-7fad-497b-8b91-5ba4f36372d9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'miss',
    '错过',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: thirsty
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a2dfd828-e423-401b-94cb-26c1b62b1847',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'thirsty',
    '渴的，口渴的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: against the law
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0216360d-6010-492c-a24b-7c60502803c2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'against the law',
    '违法',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: usually
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '724a1d83-08d7-4bf4-9bd7-94296f63b558',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'usually',
    '通常地；惯常地',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lantern
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ca3efa1a-209e-4bb5-bbdf-dac9e6abc78b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lantern',
    '灯笼；提灯',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: piece
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a646c5c7-8b93-4bf4-ba03-426241e2c7ff',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'piece',
    '块；片；段；截',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: situation
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '98b7c8a4-8fa9-4997-97f8-238ac6ff49ca',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'situation',
    '形势，情况，状况，局面',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: plastic
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '20659262-5c45-4083-90fb-1390d7ac24d8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'plastic',
    '塑料制的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fill
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'eef85925-7a3c-425b-b7d9-10e47ecfe9a3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fill',
    '弥漫，充满',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shine
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ab46c241-61e5-4824-a6d5-8010068f94f7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shine',
    '发光，发亮',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: university
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '618626ce-bf39-4a50-a2cf-95be16a725b2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'university',
    '大学',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: duty
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c3b412ea-1e0e-4a45-8906-19d661f080eb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'duty',
    '职责，义务',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shocked
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4ea227bb-3243-454d-85e0-058f4d0574db',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shocked',
    '吃惊的，震惊的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: smell
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2ad7e318-b19d-4442-97a4-a6b9554fef79',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'smell',
    '气味',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dumpling
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4b056af5-b339-4e02-af0c-f52aa750ea24',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dumpling',
    '水饺',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: emergency
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7e4359c4-802f-4fbe-a2d5-1ae6443931d8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'emergency',
    '紧急情况，不测事件',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pollution
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '250f0714-7491-4c3a-b098-cd6f01b9f1b3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pollution',
    '污染',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: unusual
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd6a7381b-9ff8-4142-b300-f1cedf0bcfb3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'unusual',
    '不平常的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hang
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2f1d56f7-44be-4686-b7fa-817da118f315',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hang',
    '悬挂',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shape
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6039f049-1d9f-4ed0-877e-324b7fc80173',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shape',
    '形，形状，外形',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: realise
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '906494a0-18eb-4af9-a742-dacb3bade1e3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'realise',
    '知道；明白；认识到',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: challenge
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '28ab494b-9c2b-43bf-bce9-38b4b2947f8e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'challenge',
    '挑战，具有挑战性的事物',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: treat
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '00dc13d5-6c81-4334-bf97-d58bb5248b36',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'treat',
    '请客，款待，招待',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: patient
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '210dfa75-1e7b-4472-97af-cf3f95439b48',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'patient',
    '病人，患者',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: medical
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd659918e-216d-4415-8408-e32ef7b95725',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'medical',
    '医学的；医疗的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: support
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1e458bab-4368-454c-a6f5-4ff8c3ea7589',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'support',
    '支持',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: whole
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f82cd7e3-816a-42c5-844a-3d7e80d59c8b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'whole',
    '整个的，全部的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rise
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ff5d94a3-90d4-4625-9719-1f02ca9b87a5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rise',
    '升高，上升',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: seed
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1add5292-0314-4281-9fd8-28c5db2b54a5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'seed',
    '种子，籽',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: soon
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e86b4ba4-067f-4c8c-ae72-603f57600dc0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'soon',
    '不久，即刻，很快',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: yard
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3a7a06ff-c143-4e69-bbe0-4843dafafc83',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'yard',
    '庭院',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rainforest
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0e1a65e3-9cfa-4f57-816c-a5e52f18c7fd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rainforest',
    '(热带)雨林',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: biscuit
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c838fa79-97ca-4daa-8d26-90a69f8766f3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'biscuit',
    '饼干',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: part
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '834b06cf-c44b-43ad-801a-186180826345',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'part',
    '部分',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: chat
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ee5ab398-ac06-476f-bb26-27a61e0145f6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'chat',
    '闲聊，闲谈，聊天',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: within
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4a7ce0a8-7dc3-4647-a23f-4c23730ef8b4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'within',
    '在(建筑或地区)里',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mix
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5d48e5f3-ce21-4d36-8ea0-7142f955480e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mix',
    '(使)混合',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: stem
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'da95f19f-e951-4fc5-8962-091bf7c56745',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'stem',
    '(植物的)茎，梗，柄',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: news
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '500fe4ec-b619-4d4d-aa50-04ec230e81d6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'news',
    '消息',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: natural
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4aeb4e14-8ad5-4114-b92d-6810a550b0a5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'natural',
    '自然的，天然的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: breathe
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e6a3d4d8-ac0e-4a93-9ff8-b17dafc89a9b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'breathe',
    '呼吸',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: quarter
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '52e8297f-b8bd-4355-834c-70f9b4211733',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'quarter',
    '一刻钟，十五分钟',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rest
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd7f59a6b-99e9-461b-a3d0-f10022b62b15',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rest',
    '休息(时间)',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: product
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3d1f7c10-2cda-4612-b7bb-bc419c59979c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'product',
    '(自然过程或化学反应的)生成物',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: coffee
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f7f8b9e9-35aa-4d78-a0e6-731bab14ef45',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'coffee',
    '咖啡',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: though
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a52e7c22-138b-432e-bae5-2664c266ff19',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'though',
    '可是，不过，然而',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: secret
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fb59fa7c-58ab-493b-a5fd-06ac6ea67c2a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'secret',
    '秘密',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: weekend
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ccd29c68-bb2a-4570-8051-ece1ac24d176',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'weekend',
    '周末',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: corn silk
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '34f42718-c351-43c9-813e-d650f6112cb9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'corn silk',
    '玉米须',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: produce
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '575b5749-35af-4f1a-bdde-3c26ed317f10',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'produce',
    '(自然地)生产，产生，出产',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: popular
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '385759c4-f527-4c13-8774-9f2233307a43',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'popular',
    '受大众喜爱的，受欢迎的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: collect
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8d79fce1-63f2-43af-92f4-148c8ef272fd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'collect',
    '收集，采集；使集中',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: each
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '477190ad-2520-43bb-a6ab-c52b860dce5f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'each',
    '(两个或两个以上物或人中的)每个，各',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: prefer
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8e6d9af6-ce32-473c-a9ff-de63daa7ed19',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'prefer',
    '更喜欢',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: send
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '26e8a833-49a4-4950-bf32-c28e6c856ddc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'send',
    '送出，发出',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: workshop
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4715133b-e3d1-48d1-ab37-78ba1f3720db',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'workshop',
    '车间，工场',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dark
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '138ac026-14bc-4a72-be3e-9c78fcb7bf1a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dark',
    '昏暗的；黑暗的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: culture
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5c9d0736-a8f5-4095-a2d7-3bead9301c7e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'culture',
    '文化',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: health
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '86477e71-35df-411c-b1df-39d3c8603e2c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'health',
    '健康(状况)',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: grow
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6d8b9618-155c-4566-9e31-9d708f74bdd4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'grow',
    '生长',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: human
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '702c1bec-8813-4aa2-a5f1-553d321ac262',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'human',
    '人类；人',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: relax
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9eb32873-8e86-4af6-930a-c09982297a67',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'relax',
    '放松，休息',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: oxygen
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'dc9811d1-880e-4212-b6e4-5e9f93715dc7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'oxygen',
    '氧',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: bamboo
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0bb27901-e05e-45c8-b101-f55cac34e1ab',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'bamboo',
    '竹，竹子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: connect
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '06b77775-aa5e-4655-8a43-6b9544932a01',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'connect',
    '沟通；连接',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sugar
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'eea83485-1eb1-4e07-9402-015b6e56f74a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sugar',
    '糖',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: leaf
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f944f1be-973e-4d5a-8664-a1d858952df0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'leaf',
    '叶，叶子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rose
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '30ebe793-c79e-4b6b-8418-d6f15b028d3b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rose',
    '玫瑰；蔷薇',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: husband
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9b95e1f0-fc1c-4657-a1a3-3dee03a7b510',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'husband',
    '丈夫',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: root
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '16371500-f58d-4009-bba1-c44ccc93b40f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'root',
    '根',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: key
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5163f442-a0a4-452a-8abd-e0bb724dcd1e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'key',
    '至关重要的；必不可少的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: adult
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'aa51377a-fdf4-494f-a022-6b89025ef026',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'adult',
    '成人，成年人',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: cotton
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '65fe95c6-9238-47fd-8879-f8d6a159f495',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'cotton',
    '棉花',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: droppings
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '43e850f2-5181-4ecc-9b52-89f887dc573b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'droppings',
    '(兽或鸟的)粪',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: themselves
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '79c0a764-bcd9-4d92-b8ff-799579784d7c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'themselves',
    '它们自己; 他们自己; 她们自己',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hero
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5ff8194b-b47e-4d21-ae4c-a398b1c4c29b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hero',
    '英雄',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: engineer
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fde31b4b-11b1-455b-ae10-c7a898978a3c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'engineer',
    '工程师; 设计师',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fantastic
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'caa85b7d-4408-4098-a119-4f02ce5cdb82',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fantastic',
    '极好的, 吸引人的, 有趣的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: speed
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5a724b3d-ed34-43ec-b6d9-8348b60cd9b6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'speed',
    '速度, 速率',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: plenty
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b256bfee-4c26-4e1a-ab5c-79ed21b52a38',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'plenty',
    '丰富, 充足, 众多, 大量',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: amazing
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a4427ec0-d5e0-4dc9-b651-d9de37ca55b2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'amazing',
    '惊人的; 了不起的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dodo
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8cc25611-7d2b-4e03-a1c2-79e51b414f59',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dodo',
    '渡渡鸟',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: full
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '728fde3d-e9fa-4686-998c-0212760799f4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'full',
    '满的; 满是………………的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: as happy as a clam
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '16407d77-0f45-4bb5-8fbb-acf78a911828',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'as happy as a clam',
    '非常高兴的, 相当满足的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: maybe
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '92f03744-692e-401d-8efd-5aca7d672203',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'maybe',
    '也许, 大概, 可能',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: as dead as a dodo
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7f2837ca-6c48-47c1-bdc8-778042b36df0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'as dead as a dodo',
    '彻底死亡',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: feed
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f20bf7ff-5eef-4c15-a4a6-ff3358f38229',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'feed',
    '喂养, 饲养, 给……食物',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: surprise
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '64979f7b-11db-4198-a4e3-5f741decc57f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'surprise',
    '意想不到的事',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: missing
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd28e507b-f572-46ee-95be-5e125579bc0f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'missing',
    '找不到的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: wolf
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0ff56c21-18fb-47f0-950a-1add15f2b20e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'wolf',
    '狼',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mirror
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '57c82690-6ee4-4f18-8b51-8cda5dbe4a85',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mirror',
    '镜子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hunt
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '44bbc353-3640-4e09-b852-a04934cbf2c6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hunt',
    '打猎; 猎杀',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: madly
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '27eb5f7f-0313-46b7-9954-cc646a097252',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'madly',
    '发狂地; 无法控制地',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: boring
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e6ea988b-009a-477f-9c8d-d0a64907fcd0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'boring',
    '无趣的, 无聊的, 乏味的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: friendly
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6ba827b4-87c6-475d-b357-624fe18d3eb5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'friendly',
    '友好的, 友善的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pigeon
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ef748612-3ef9-486e-9c55-1c06760a6f08',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pigeon',
    '鸽子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rescue
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '612ebbf6-21a6-4809-be07-0b728fd4bea4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rescue',
    '营救, 救援',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: arrive
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'cfcd69ed-6c03-4d62-aa9d-3d252bcb7065',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'arrive',
    '到达, 抵达',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: save
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e83a4690-a7d5-40b5-b4b1-5f21ee3c0f0f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'save',
    '救, 拯救, 挽救',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ocean
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '28cba9fa-69b8-479a-a170-1776a1c8332b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ocean',
    '海洋, 大海',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: research
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2440219e-d556-4414-9e9f-8eef92d69a7a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'research',
    '研究, 调查',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: several
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5b85de1c-a0bf-45f7-a92f-368cd8ac3fad',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'several',
    '几个, 数个, 一些',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: recognise
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '254382bf-e420-492e-8d53-d0785d102e22',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'recognise',
    '认出; 认识; 辨认出',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: scary
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b3bdd9f8-5e67-46e2-99d9-35c74b3cdbef',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'scary',
    '可怕的, 骇人的, 恐怖的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: die out
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6180c23f-19ca-460a-ac95-8b49aad74715',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'die out',
    '消失; 绝迹, 灭绝',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: beaver
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '380a0970-2673-4a10-a6e7-e1432fcb1d9b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'beaver',
    '河狸, 海狸',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: peaceful
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '72038447-72c5-48e5-b779-b1b7de7f9f40',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'peaceful',
    '和平的, 非暴力的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dead
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7d8e35fc-d446-49c5-808a-ef5faf7bedd2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dead',
    '死的, 去世的',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: kilometre
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '648f4096-4563-4aea-8d7c-3eaa3106ad20',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'kilometre',
    '千米, 公里',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: character
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '77d03249-fcdd-46ef-be32-1af0ec8679c3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'character',
    '(书、剧本、电影中的)人物, 角色',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: island
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '31a5888a-7113-432e-b31b-0c16af5f3309',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'island',
    '岛, 岛屿',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: forest
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '330167a1-330d-45e0-a670-a806dbdad899',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'forest',
    '森林, 林区',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: enough
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '00158a15-9176-4cbe-be1b-ff0c5f004109',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'enough',
    '足够',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: knock around
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fa56ecb3-a151-41d3-a3b6-a7f596a6719b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'knock around',
    '悠闲地度过',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: earthquake
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '04d0ca70-0aeb-4b0c-b142-8a58f80bbda4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'earthquake',
    '地震',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: itself
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2f44a471-d911-4a30-8d6d-e65c72109cac',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'itself',
    '自己, 自身',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: get lost
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f591b2e1-1f59-484e-963b-a86e94ee2875',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'get lost',
    '迷路',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: museum
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b604ca50-1e18-4ec0-ab44-ad36efce4671',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'museum',
    '博物馆, 博物院',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Tania
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'cf252da6-f9d8-4ac3-9c1e-b86984b0eb8f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Tania',
    '塔妮娅',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Dorothy
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6e9acec4-ef40-426b-8242-7721343cf4f4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Dorothy',
    '多萝西',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Emilia
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '351840b4-0dda-4965-89b4-06acdfe1ac46',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Emilia',
    '埃米莉亚',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Robert
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a9536a77-0935-499d-bb03-539a0b0fd510',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Robert',
    '罗伯特',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Confucius
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd94c0833-028e-498d-9181-b9a200e6d425',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Confucius',
    '孔子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Tony
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fb0d0f9e-c564-4bb3-999c-ce0bb9898368',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Tony',
    '托尼',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Tina
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '00211930-8d60-48d1-af1a-33a388f0a21e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Tina',
    '蒂娜',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mia
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6337bbfc-4c95-4af9-a010-e46b07fb7fb8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mia',
    '米娅',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mary
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7551743f-c9f5-4b50-8997-e9b0a6967f91',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mary',
    '玛丽',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Jack
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '95499843-58c2-436d-851b-44cd57cf2b5a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Jack',
    '杰克',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Josh
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2bdf1397-c100-48af-bf23-49fa82d7c966',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Josh',
    '乔希',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Jones
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '069efa76-9de0-47f7-9a33-6dbcf8a3c0f2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Jones',
    '琼斯',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Emma
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c521825b-d0d7-4564-aaca-0550b9f937d2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Emma',
    '埃玛',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Oliver
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'cccdd447-757e-48c7-988d-e8a240b5faef',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Oliver',
    '奥利弗',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Jim
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '05c9ae46-3eb4-481e-b09a-9130477ef893',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Jim',
    '吉姆',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Eric
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e0562e80-981e-4824-ba2f-f71007d78a26',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Eric',
    '埃里克',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Taylor
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a060392a-9e60-43b1-86c6-d235d5b7e411',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Taylor',
    '泰勒',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Nick
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd04e5518-ec64-439e-8647-74b87fe74c2f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Nick',
    '尼克',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Catherine
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '83d02348-d662-47e8-a0a1-ad76b18c5a1f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Catherine',
    '凯瑟琳',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: John
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '573608e1-1c67-4b6c-ab03-2df40f02f0bb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'John',
    '约翰',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mencius
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f2457d6e-0eed-4340-9a1b-7e00109f6329',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mencius',
    '孟子',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lunar month
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4bdb9d64-4740-4708-9beb-2afad6f0cee3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lunar month',
    '太阴月; 朔望月',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ethics and the rule of law
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '96ac4b2f-32f3-4dce-b5ad-7b20628284fd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ethics and the rule of law',
    '道德与法治',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Double Fifth Festival
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b1f2a38f-cf41-47aa-9bac-3d6152208957',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Double Fifth Festival',
    '重午节',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: students' union
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5cc17524-2dd8-4f6c-babd-564692000757',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'students' union',
    '学生会',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Dragon Boat Festival
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4fd1a8c4-455c-4f46-9ae8-c2adb764128d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Dragon Boat Festival',
    '端午节',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dragon boat race
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e730a515-b56e-4dba-9ed3-6e001a4510e1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dragon boat race',
    '龙舟比赛',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Beijing opera
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a765d1d8-5148-4cc9-8551-29b425432bc3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Beijing opera',
    '京剧',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Alice's Adventures in Wonderland
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0c7b1bd9-3a0b-46b1-b055-588c0fe3b32e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Alice's Adventures in Wonderland',
    '《爱丽丝漫游奇境记》',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Great Bear Rainforest
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1ba687f6-dfc9-4a5a-a6c8-aa96cf351f53',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Great Bear Rainforest',
    '大熊雨林',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: the Indian Ocean
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4e82fecd-4824-4398-bec4-9c91f92145a9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'the Indian Ocean',
    '印度洋',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Canada
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3620ce49-90ff-477a-89b8-212525e4abe2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Canada',
    '加拿大',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mexico
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0c306297-f5a3-4e95-9ae7-d177e8ad6896',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mexico',
    '墨西哥',
    'vocabulary',
    1,
    false,
    0,
    NOW(),
    NOW()
);
