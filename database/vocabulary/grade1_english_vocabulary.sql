
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


-- 单词: nervous (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '820d4e85-1751-4fd0-b648-a66ebe906c1e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'nervous',
    '类型: 单词
例句: 1. 单词: nervous
> - 音标: /ˈnɜːrvəs/
> - 词性: adj.（形容词）
> - 中文释义: 神经紧张的，焦虑不安的
2. 拆分记忆法: nerv（神经）+ ous（形容词后缀）→ 神经的 → 神经紧张的
>- 场景记忆法: 想象考试前或上台演讲前的紧张感觉
>- 谐音记忆法: "那窝丝" → 紧张得像有一窝丝线在心里乱搅
3. ### 相关主题
>  - 情绪表达
>  - 心理感受
>  - 日常交流
>
>- ### 笔记链接
>  - [[28. a bit]] (有点，稍微)
>  - [[26. yourself]] (你自己)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: nervous
- 音标: /ˈnɜːrvəs/
- 词性: adj.（形容词）
- 中文释义: 神经紧张的，焦虑不安的
- 拆分记忆法: nerv（神经）+ ous（形容词后缀）→ 神经的 → 神经紧张的
- 场景记忆法: 想象考试前或上台演讲前的紧张感觉
- 谐音记忆法: "那窝丝" → 紧张得像有一窝丝线在心里乱搅',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: start (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '464669a3-db1f-4499-adf0-06fcb7a1d9c0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'start',
    '类型: 单词
例句: 1. 单词: start
> - 音标: /stɑːrt/
> - 词性: v.（动词）
> - 中文释义: 开始
2. start 发音类似于 "斯塔特"，可以想象："斯塔特"一声，比赛开始了！
> - 也可以联想 "start with"（以...开始）这个常用短语来记忆
>
> 场景记忆法：
> - 想象每天早晨起床后开始新的一天的场景
> - 学校里上课铃声响起，老师说"Let''s start!"（让我们开始吧！）的场景
3. 近义词: begin, commence, initiate, launch
>- 反义词: end, finish, complete, stop
>- 派生词: 
>
> 相关短语:
> - start with（以...开始）
> - start doing sth.（开始做某事）
> - start to do sth.（开始做某事）
> - start over（重新开始）
> - start up（启动，开办）
相关词汇: - 单词: start
- 音标: /stɑːrt/
- 词性: v.（动词）
- 中文释义: 开始',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dining hall (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8198d0a2-716e-4bcb-aaea-9a407b2c6cc1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dining hall',
    '类型: 单词
音标: /ˈdaɪnɪŋ hɔːl/
词性: n.
中文释义: 食堂，餐厅
例句: 1. We have lunch in the dining hall at school.
>   我们在学校的食堂吃午饭。
>
> - The dining hall is open from 11:30 to 13:30.
>   食堂从11:30到13:30开放。
>
> - There are many delicious foods in our school''s dining hall.
>   我们学校食堂有很多美味的食物。
---
2. 拆分记忆法: dining(用餐) + hall(大厅) = 用餐的大厅 = 食堂
> - 情景记忆法: 想象同学们一起在学校食堂排队打饭的场景
---
> [!success] 相关词汇
>
> - cafeteria: n. 自助餐厅，食堂
> - restaurant: n. 餐馆，饭店
> - kitchen: n. 厨房
> - menu: n. 菜单
---
> [!check] 自我测试
> - 学生们在____里吃饭。(食堂)
> - "dining hall" 的中文意思是什么？(食堂)
---
> [!todo] 学习记录
> - ⏰ 学习时间: 
> - 📝 学习重点: 
> - ❓ 疑问点: 
---
> [!calendar] 复习计划
> - 🗓️ 第一次复习: 
> - 🗓️ 第二次复习: 
> - 🗓️ 第三次复习: 
---
3. 文化背景: 不同国家的学校食堂提供的食物和用餐方式可能有所不同
> - 常见搭配: 
>   - school dining hall: 学校食堂
>   - university dining hall: 大学食堂
> - 实用表达: 
>   - Let''s meet at the dining hall. 我们在食堂见面吧。
>   - The dining hall is very clean. 食堂很干净。
---
#mcl/list-card
相关词汇: - 拆分记忆法: dining(用餐) + hall(大厅) = 用餐的大厅 = 食堂
- 情景记忆法: 想象同学们一起在学校食堂排队打饭的场景
- cafeteria: n. 自助餐厅，食堂
- restaurant: n. 餐馆，饭店
- kitchen: n. 厨房
- menu: n. 菜单
- 文化背景: 不同国家的学校食堂提供的食物和用餐方式可能有所不同',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: yourself (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'be39b9d6-256d-444b-a094-d27bae46a17c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'yourself',
    '类型: 单词
例句: 1. 单词: yourself
> - 音标: /jɔːrˈself/
> - 词性: pron.（代词）
> - 中文释义: 你自己
> - 复数形式: yourselves
2. 拆分记忆法: your（你的） + self（自己）→ 你的自己 → 你自己
>- 场景记忆法: 想象对着镜子说"你好，你自己！"的场景
>- 对比记忆法: myself（我自己）→ yourself（你自己）→ himself/herself（他/她自己）
3. ### 相关主题
>  - 反身代词
>  - 日常对话
>  - 自我表达
>
>- ### 笔记链接
>  - [[21. each other]] (互相，彼此)
>  - [[24. fun]] (乐趣)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: yourself
- 音标: /jɔːrˈself/
- 词性: pron.（代词）
- 中文释义: 你自己
- 复数形式: yourselves
- 拆分记忆法: your（你的） + self（自己）→ 你的自己 → 你自己
- 场景记忆法: 想象对着镜子说"你好，你自己！"的场景
- 对比记忆法: myself（我自己）→ yourself（你自己）→ himself/herself（他/她自己）',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: join (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7c48ec8b-869e-4a96-a70c-0e44362d09de',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'join',
    '类型: 单词
例句: 1. 单词: join
> - 音标: /dʒɔɪn/
> - 词性: v.（动词）
> - 中文释义: 成为……的一员，加入
2. join 发音类似于 "join"，可以想象："加入"就是"join in"（加入进来）
> - 也可以联想 "join hands"（手拉手），表示大家一起加入
>
> 场景记忆法：
> - 想象加入俱乐部、社团、团队的场景
> - 想象和朋友一起参加活动的场景，这些都可以用join来描述
3. 近义词: enter, become a member of, participate in, take part in
>- 反义词: leave, quit, exit, withdraw
>- 派生词: 
>
> 相关短语:
> - join in（参加，加入）
> - join up（参军，入伍）
> - join hands（手拉手，合作）
> - join forces（联合，合作）
> - join the party（参加聚会）
相关词汇: - 单词: join
- 音标: /dʒɔɪn/
- 词性: v.（动词）
- 中文释义: 成为……的一员，加入',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: team (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '22b59727-f68e-4eda-b24b-1d7b6638c101',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'team',
    '类型: 单词
例句: 1. 单词: team
> - 音标: /tiːm/
> - 词性: n.（名词）
> - 中文释义: (游戏或体育比赛的)队
2. 拆分记忆法: 无明显词根拆分，可以通过发音直接记忆
>- 场景记忆法: 想象在运动场上或游戏中团队合作的场景
>- 谐音记忆法: "提姆" → 提姆是球队的一员
3. ### 相关主题
>  - 体育活动
>  - 团队合作
>  - 游戏比赛
>
>- ### 笔记链接
>  - [[30. join]] (加入)
>  - [[27. hobby]] (业余爱好)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: team
- 音标: /tiːm/
- 词性: n.（名词）
- 中文释义: (游戏或体育比赛的)队
- 拆分记忆法: 无明显词根拆分，可以通过发音直接记忆
- 场景记忆法: 想象在运动场上或游戏中团队合作的场景
- 谐音记忆法: "提姆" → 提姆是球队的一员',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: forget (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2803e830-7c59-4ad3-bbae-98b9af503040',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'forget',
    '类型: 单词
音标: /fəˈɡet/
词性: v.
中文释义: 忘记，遗忘
例句: 1. Don''t forget to do your homework.
>   别忘了做你的家庭作业。
>
> - I forgot his birthday yesterday.
>   我昨天忘记了他的生日。
>
> - She always forgets her umbrella when it rains.
>   下雨时她总是忘记带伞。
---
2. 拆分记忆法: for(向前) + get(得到) → 向前得到新东西，可能会忘记旧东西
> - 情景记忆法: 想象你着急出门，却忘记带钥匙的场景
---
> [!success] 相关词汇
>
> - forgettable: adj. 容易忘记的
> - unforgettable: adj. 难忘的
> - forget about: 忘记关于...的事
> - memory: n. 记忆
---
> [!check] 自我测试
> - 不要忘记带你的书。(Don''t forget to bring your book.)
> - "forget" 的中文意思是什么？(忘记，遗忘)
---
> [!todo] 学习记录
> - ⏰ 学习时间: 
> - 📝 学习重点: 
> - ❓ 疑问点: 
---
> [!calendar] 复习计划
> - 🗓️ 第一次复习: 
> - 🗓️ 第二次复习: 
> - 🗓️ 第三次复习: 
---
3. 用法说明: "forget" 后接动词时，可用 forget to do (忘记去做某事) 或 forget doing (忘记做过某事)
> - 常见搭配: 
>   - forget one''s name: 忘记某人的名字
>   - never forget: 永远不会忘记
> - 实用表达: 
>   - I''ll never forget this day. 我永远不会忘记这一天。
>   - Don''t forget to call me. 别忘了给我打电话。
---
#mcl/list-card
相关词汇: - 拆分记忆法: for(向前) + get(得到) → 向前得到新东西，可能会忘记旧东西
- 情景记忆法: 想象你着急出门，却忘记带钥匙的场景
- forgettable: adj. 容易忘记的
- unforgettable: adj. 难忘的
- forget about: 忘记关于...的事
- memory: n. 记忆
- 用法说明: "forget" 后接动词时，可用 forget to do (忘记去做某事) 或 forget doing (忘记做过某事)',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: grey (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'dab8af79-c7cd-4c8b-9395-b64a721743f2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'grey',
    '类型: 单词
例句: 1. 单词: grey
> - 音标: /greɪ/ （注：修正为标准发音）
> - 词性: adjective (adj.)
> - 中文释义: 灰色的；暗淡的；年老的
2. ### 相关主题
> 颜色、描述外观
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: grey
- 音标: /greɪ/ （注：修正为标准发音）
- 词性: adjective (adj.)
- 中文释义: 灰色的；暗淡的；年老的',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: T-shirt (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '85185b09-3409-41d4-8f2d-f0a452e8f13a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'T-shirt',
    '类型: 单词
例句: 1. 单词: T-shirt
> - 音标: /ˈtiːˌʃɜːrt/
> - 词性: noun (n.)
> - 中文释义: T恤衫，短袖运动衫
2. ### 相关主题
> 服装、休闲装、日常穿着
>- ### 笔记链接
> 

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！

cssClass: english-vocab-card
相关词汇: - 单词: T-shirt
- 音标: /ˈtiːˌʃɜːrt/
- 词性: noun (n.)
- 中文释义: T恤衫，短袖运动衫',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: each other (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5f1482d0-6f88-4520-808e-b07b303d1383',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'each other',
    '类型: 单词
例句: 1. 单词: each other
> - 音标: /iːtʃ ˈʌðə(r)/
> - 词性: 代词短语
> - 中文释义: 互相，彼此
2. each（每个） + other（其他）
> - 想象："每个其他人"，也就是互相、彼此的意思
>
> 场景记忆法：
> - 想象和朋友互相帮助、互相学习的场景
> - 家庭中家人互相关爱的场景，这些都可以用each other来描述
3. 近义词: one another
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - talk to each other（互相交谈）
> - look at each other（互相看着）
> - help each other（互相帮助）
> - care about each other（互相关心）
> - learn from each other（互相学习）
相关词汇: - 单词: each other
- 音标: /iːtʃ ˈʌðə(r)/
- 词性: 代词短语
- 中文释义: 互相，彼此',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: junior high (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9c04c25b-d0af-4c14-950d-138a0822de10',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'junior high',
    '类型: 单词
例句: 1. 短语: junior high
> - 中文释义: 初级中学
> - 使用场景: 教育领域，描述学校阶段
> - 难度等级: ⭐️⭐️⭐️⭐️⭐️ (1-5颗星)
2. ### 相关主题
>  教育阶段、学校类型、英语教育术语
>
>- ### 笔记链接
>
>- ### 场景应用
>  在谈论学校教育、学习阶段时使用
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写短语基本信息
>3. 分析短语结构，添加例句和语境
>4. 记录同义表达和常见误区
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合Dataview插件可以创建短语学习数据库，追踪学习进度！
相关词汇: - 短语: junior high
- 中文释义: 初级中学
- 使用场景: 教育领域，描述学校阶段
- 难度等级: ⭐️⭐️⭐️⭐️⭐️ (1-5颗星)',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: a bit (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '722e2eae-7e8f-45e5-915c-4d697512e8b6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'a bit',
    '类型: 单词
例句: 1. 单词: a bit
> - 音标: /ə bɪt/
> - 词性: 短语
> - 中文释义: 有点儿，稍微
2. 拆分记忆法: a（一个）+ bit（小部分）→ 一个小部分 → 有点儿
>- 场景记忆法: 想象在描述程度不太严重时使用这个短语的场景
>- 用法搭配记忆法: 常与形容词或副词连用，表示程度轻微
3. ### 相关主题
>  - 程度表达
>  - 日常口语
>  - 英语短语
>
>- ### 笔记链接
>  - [[26. yourself]] (你自己)
>  - [[27. hobby]] (业余爱好)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: a bit
- 音标: /ə bɪt/
- 词性: 短语
- 中文释义: 有点儿，稍微
- 拆分记忆法: a（一个）+ bit（小部分）→ 一个小部分 → 有点儿
- 场景记忆法: 想象在描述程度不太严重时使用这个短语的场景
- 用法搭配记忆法: 常与形容词或副词连用，表示程度轻微',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lab (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fe66ef4f-7ec1-44d2-907f-5c29ead944bd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lab',
    '类型: 单词
例句: 1. 单词: lab
> - 音标: /læb/
> - 词性: n.（名词）
> - 中文释义: 实验室
2. lab 发音类似于 "来波"，可以想象："来波实验吧！"，帮助记住实验室的意思
> - 完整形式是 laboratory（实验室），lab 是它的缩写，更简短容易记忆
>
> 场景记忆法：
> - 想象学校里的实验室场景：有各种实验器材、试管、显微镜等
> - 学校课程表上经常会有 "lab class"（实验课），可以联想这个短语来记忆
3. 近义词: research facility, testing facility
>- 反义词: 
>- 派生词: laboratory（完整形式）
>
> 相关短语:
> - science lab（科学实验室）
> - computer lab（计算机实验室）
> - chemistry lab（化学实验室）
> - physics lab（物理实验室）
> - biology lab（生物实验室）
相关词汇: - 单词: lab
- 音标: /læb/
- 词性: n.（名词）
- 中文释义: 实验室',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: uniform (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'bad2ed61-97af-44ee-a2aa-c55b907a91c4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'uniform',
    '类型: 单词
例句: 1. 单词: uniform
> - 音标: /ˈjuːnɪfɔːrm/
> - 词性: noun (n.)
> - 中文释义: 制服；校服；统一的服装
2. ### 相关主题
> 学校、职业、统一着装
>- ### 笔记链接
> 

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！

cssClass: english-vocab-card
相关词汇: - 单词: uniform
- 音标: /ˈjuːnɪfɔːrm/
- 词性: noun (n.)
- 中文释义: 制服；校服；统一的服装',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: explore (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '90e3568c-9693-474e-be53-3df13f3a2a60',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'explore',
    '类型: 单词
例句: 1. 单词: explore
> - 音标: /ɪkˈsplɔːr/
> - 词性: v.（动词）
> - 中文释义: 探索；探讨，探究
2. 拆分记忆法: ex-（向外） + plore（相关于"plow"犁）→ 向外犁地 → 开拓，探索
>- 场景记忆法: 想象一个探险家背着背包，拿着地图在森林中探索未知区域
>- 谐音记忆法: "一刻不牢" → 一刻也不放松，持续探索
3. ### 相关主题
>  - 科学探索
>  - 旅行与发现
>  - 学习方法
>
>- ### 笔记链接
>  - [[19. lab]] (实验室)
>  - [[20. start]] (开始)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: explore
- 音标: /ɪkˈsplɔːr/
- 词性: v.（动词）
- 中文释义: 探索；探讨，探究
- 拆分记忆法: ex-（向外） + plore（相关于"plow"犁）→ 向外犁地 → 开拓，探索
- 场景记忆法: 想象一个探险家背着背包，拿着地图在森林中探索未知区域
- 谐音记忆法: "一刻不牢" → 一刻也不放松，持续探索',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: biology (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'dfa7c628-2800-4304-a3e5-5e510f2da11c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'biology',
    '类型: 单词
例句: 1. 单词: biology
> - 音标: /baɪ''ɒlədʒi/
> - 词性: n. (名词)
> - 中文释义: 生物
2. 发音记忆法：biology可以拆分为"bio-logy"，其中"bio"表示"生命"，"logy"表示"学科"，所以biology就是"研究生命的学科"。
>- 拆分记忆法：bio（生命） + logy（学科）= 研究生命的学科 → 生物
>- 情景记忆法：在生物实验室里，老师经常会说"Welcome to biology lab"（欢迎来到生物实验室）。
3. ### 相关主题
>  学科名称、生命科学、自然科学、生物学分支
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: biology
- 音标: /baɪ''ɒlədʒi/
- 词性: n. (名词)
- 中文释义: 生物',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: of course (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f4bb6469-2bdb-4f42-a1f1-932d1c2415b3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'of course',
    '类型: 单词
例句: 1. 单词: of course
> - 音标: /əv kɔːrs/
> - 词性: 短语副词
> - 中文释义: 当然，自然，毫无疑问
2. of（的） + course（过程、路线）
> - 想象："这是当然的过程"，表示这是理所当然的，所以是"当然"的意思
>
> 场景记忆法：
> - 想象朋友问你能否帮忙，你毫不犹豫地回答"Of course!"的场景
> - 想象老师问你是否理解，你自信地回答"Of course!"的场景
> - 在口语中经常简化为"OC"，在聊天中经常使用
3. 近义词: certainly, naturally, definitely, absolutely, surely
>- 反义词: of course not, certainly not, definitely not
>- 派生词: 
>
> 相关短语:
> - of course not（当然不）
> - of course you can（你当然可以）
> - of course I will（我当然会）
> - of course there is（当然有）
> - of course we do（我们当然做）
相关词汇: - 单词: of course
- 音标: /əv kɔːrs/
- 词性: 短语副词
- 中文释义: 当然，自然，毫无疑问',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: red scarf (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b702124f-d3fd-4db8-a2ba-5add55db0bf4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'red scarf',
    '类型: 单词
例句: 1. 单词/短语: red scarf
> - 音标: /red skɑːf/（复数形式：red scarves 或 red scarfs）
> - 词性: 名词短语
> - 释义: 红领巾（中国少年先锋队队员佩戴的红色领巾）

> [!TIP] 详细内容
> 例句: 
> 1. The little boy wears a red scarf around his neck.（小男孩脖子上系着一条红领巾。）
> 2. All the Young Pioneers must wear red scarves to school.（所有少先队员上学必须佩戴红领巾。）
> 3. She is proud to wear the red scarf as a symbol of her membership in the Young Pioneers.（她为能佩戴红领巾作为少先队员的象征而感到自豪。）
> 4. The teacher taught the children how to tie a red scarf correctly.（老师教孩子们如何正确系红领巾。）
>
> 联想记忆: 
> - red（红色）+ scarf（围巾）→ 红色的围巾 → 红领巾
> - 可以联想中国少年先锋队的队旗和队礼，加深记忆
>
> 相关词汇: 
> - 同义表达与变体: Young Pioneer scarf
> - 结构分析: 由形容词red和名词scarf组成的名词短语

> [!QUESTION] 自我测试
> - [ ] 我能正确读出"red scarf"的发音吗？
> - [ ] 我知道"red scarf"是什么意思吗？
> - [ ] 我能造一个包含"red scarf"的句子吗？
> - [ ] 我知道"red scarf"的复数形式吗？

> [!PROGRESS] 学习进度
> - 首次学习: `$=dv.el(''span'', moment().format(''YYYY-MM-DD''))`
> - 最近复习: 
> - 掌握程度: ⭐⭐⭐☆☆ (3/5)
> - 备注: 注意"red scarf"是中国特色词汇，与少年先锋队相关

> [!CALENDAR] 复习计划
> - 第1次复习: 学习当天晚上
> - 第2次复习: 学习后第2天
> - 第3次复习: 学习后第7天
> - 第4次复习: 学习后第15天
> - 第5次复习: 学习后第30天

> [!INFO] 拓展内容
> 相关主题: 中国特色、少年先锋队、文化象征
> 笔记链接: 
> - [[中国少年先锋队]]
> - [[中国特色英语词汇]]

> [!CAUTION] 使用说明
> 1. 每天花5-10分钟复习这些单词卡片
> 2. 定期更新掌握程度和复习记录
> 3. 可以根据需要添加更多例句和相关知识
> 4. 尝试用学到的单词造句，提高实际运用能力

---
相关词汇: - 单词/短语: red scarf
- 音标: /red skɑːf/（复数形式：red scarves 或 red scarfs）
- 词性: 名词短语
- 释义: 红领巾（中国少年先锋队队员佩戴的红色领巾）
- 首次学习: `$=dv.el(''span'', moment().format(''YYYY-MM-DD''))`
- 掌握程度: ⭐⭐⭐☆☆ (3/5)
- 备注: 注意"red scarf"是中国特色词汇，与少年先锋队相关
- 第1次复习: 学习当天晚上
- 第2次复习: 学习后第2天
- 第3次复习: 学习后第7天
- 第4次复习: 学习后第15天
- 第5次复习: 学习后第30天',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: jacket (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1f585c40-b6c8-4840-a588-a852b8109f2c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'jacket',
    '类型: 单词
例句: 1. 单词: jacket
> - 音标: /ˈdʒækɪt/ （注：修正为标准发音）
> - 词性: noun (n.)
> - 中文释义: 夹克，短上衣
2. 近义词: coat（外套，大衣）、blazer（西装外套）
>- 反义词: 
>- 派生词: jacketed（有外皮的）、jacketless（没穿夹克的）
>
> 词组: life jacket（救生衣）、leather jacket（皮夹克）
3. ### 相关主题
> 衣物、日常穿着
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: jacket
- 音标: /ˈdʒækɪt/ （注：修正为标准发音）
- 词性: noun (n.)
- 中文释义: 夹克，短上衣',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: eraser (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '48f5deaa-8ee0-42f3-91c6-18529fd16781',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'eraser',
    '类型: 单词
例句: 1. 单词: eraser
> - 音标: /''rerza/
> - 词性: n. (名词)
> - 中文释义: 橡皮
2. 发音记忆法：eraser的发音类似于"一瑞泽"，可以想象用橡皮一擦（erase）字迹就消失了（zero）。
>- 拆分记忆法：erase（擦除） + -r（名词后缀）= 用来擦除的东西 → 橡皮
>- 情景记忆法：在英语课堂上，当你写错单词时，老师会说"Use your eraser!"（用你的橡皮！）
3. ### 相关主题
>  学习用品、文具、英语课堂词汇
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: eraser
- 音标: /''rerza/
- 词性: n. (名词)
- 中文释义: 橡皮',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fun (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '36e9d6a6-e924-4b87-bdc8-1a3b026af5c3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fun',
    '类型: 单词
例句: 1. 单词: fun
> - 音标: /fʌn/
> - 词性: n.（名词）
> - 中文释义: 乐趣
2. 拆分记忆法: fun（发音类似"方"）→ 想象一个方形的快乐盒子
>- 场景记忆法: 想象和朋友一起玩耍时开心的场景
>- 谐音记忆法: "翻" → 翻开新的一页，发现乐趣
3. ### 相关主题
>  - 休闲活动
>  - 情绪与感受
>  - 日常对话
>
>- ### 笔记链接
>  - [[16. teaching building]] (教学楼)
>  - [[17. dining hall]] (食堂)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: fun
- 音标: /fʌn/
- 词性: n.（名词）
- 中文释义: 乐趣
- 拆分记忆法: fun（发音类似"方"）→ 想象一个方形的快乐盒子
- 场景记忆法: 想象和朋友一起玩耍时开心的场景
- 谐音记忆法: "翻" → 翻开新的一页，发现乐趣',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: introduce (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'cbd61c21-b848-455d-b472-732e58d89c26',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'introduce',
    '类型: 单词
例句: 1. 单词: introduce
> - 音标: /ˌɪntrəˈdjuːs/
> - 词性: v.（动词）
> - 中文释义: 介绍
2. 拆分记忆法: intro-（向内） + duce（引导）→ 引导进入 → 介绍
>- 场景记忆法: 想象在派对上向新朋友介绍自己的场景
>- 谐音记忆法: "因出丢斯" → 因出现而丢弃陌生，开始认识
3. ### 相关主题
>  - 社交礼仪
>  - 语言学习
>  - 会议与演讲
>
>- ### 笔记链接
>  - [[21. each other]] (互相，彼此)
>  - [[22. everyone]] (每个人，人人)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: introduce
- 音标: /ˌɪntrəˈdjuːs/
- 词性: v.（动词）
- 中文释义: 介绍
- 拆分记忆法: intro-（向内） + duce（引导）→ 引导进入 → 介绍
- 场景记忆法: 想象在派对上向新朋友介绍自己的场景
- 谐音记忆法: "因出丢斯" → 因出现而丢弃陌生，开始认识',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: school uniform (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'db14fa6f-ec02-4f48-ab45-ee598503c751',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'school uniform',
    '类型: 单词
音标: /skuːl ˈjuːnɪfɔːm/
词性: n.
中文释义: 校服，学校制服
例句: 1. All students must wear their school uniform to school every day.
>   所有学生每天必须穿校服上学。
>
> - Our school uniform consists of a white shirt and blue trousers.
>   我们的校服包括白衬衫和蓝裤子。
>
> - The school has strict rules about wearing the school uniform properly.
>   学校对正确穿着校服有严格规定。
---
2. 拆分记忆法: school(学校) + uniform(制服) = 学校里穿的制服 = 校服
> - 场景记忆法: 想象学生们穿着统一的服装在校园里上课、做活动的场景
---
> [!success] 相关词汇
>
> - uniform: n. 制服，校服；adj. 统一的，一致的
> - school badge: 校徽
> - school bag: 书包
> - school rules: 校规
---
> [!check] 自我测试
> - 学生们在学校必须穿什么？(校服)
> - "school uniform" 的中文意思是什么？(校服)
---
> [!todo] 学习记录
> - ⏰ 学习时间: 
> - 📝 学习重点: 
> - ❓ 疑问点: 
---
> [!calendar] 复习计划
> - 🗓️ 第一次复习: 
> - 🗓️ 第二次复习: 
> - 🗓️ 第三次复习: 
---
3. 文化背景: 许多国家的学校要求学生穿校服，这有助于培养团队精神和减少攀比现象
> - 常见搭配: 
>   - wear school uniform: 穿校服
>   - school uniform policy: 校服政策
> - 实用表达: 
>   - My school uniform is comfortable. 我的校服很舒服。
>   - We need to buy a new school uniform for the new term. 新学期我们需要买新校服。
---
#mcl/list-card
相关词汇: - 拆分记忆法: school(学校) + uniform(制服) = 学校里穿的制服 = 校服
- 场景记忆法: 想象学生们穿着统一的服装在校园里上课、做活动的场景
- uniform: n. 制服，校服；adj. 统一的，一致的
- school badge: 校徽
- school bag: 书包
- school rules: 校规
- 文化背景: 许多国家的学校要求学生穿校服，这有助于培养团队精神和减少攀比现象',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: textbook (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0385b51f-5f17-40ec-9dcc-279506a07138',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'textbook',
    '类型: 单词
例句: 1. 单词: textbook
> - 音标: /tekstbuk/
> - 词性: 名词 (noun)
> - 中文释义: 教科书，教材，课本
2. ### 相关主题
> 学校用品、学习资源、教材
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: textbook
- 音标: /tekstbuk/
- 词性: 名词 (noun)
- 中文释义: 教科书，教材，课本',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: take part in (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '11b28175-b44b-4f62-bfcf-dc960c3ae007',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'take part in',
    '类型: 单词
例句: 1. 单词: take part in
> - 音标: /teɪk pɑːrt ɪn/
> - 词性: 短语
> - 中文释义: 参加，参与
2. 拆分记忆法: take（拿）+ part（部分）+ in（在...里）→ 拿一份在里面 → 参加
>- 场景记忆法: 想象在学校活动、比赛或社区活动中参与的场景
>- 用法搭配记忆法: 常与各种活动、比赛、项目等名词搭配使用
3. ### 相关主题
>  - 学校活动
>  - 社交参与
>  - 竞赛比赛
>
>- ### 笔记链接
>  - [[30. join]] (加入)
>  - [[31. team]] (队)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: take part in
- 音标: /teɪk pɑːrt ɪn/
- 词性: 短语
- 中文释义: 参加，参与
- 拆分记忆法: take（拿）+ part（部分）+ in（在...里）→ 拿一份在里面 → 参加
- 场景记忆法: 想象在学校活动、比赛或社区活动中参与的场景
- 用法搭配记忆法: 常与各种活动、比赛、项目等名词搭配使用',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: everyone (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2be066ed-fea3-4ff2-b2b1-f0346f60ec63',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'everyone',
    '类型: 单词
例句: 1. 单词: everyone
> - 音标: /''evriwʌn/
> - 词性: pron.（代词）
> - 中文释义: 每个人，人人
2. 拆分记忆法: every（每个） + one（一个）→ 每个一个人 → 每个人
>- 场景记忆法: 想象教室里有很多学生，老师说"Everyone, please sit down."（每个人，请坐下。）
>- 谐音记忆法: "爱无阮"（类似everyone的发音）→ 爱没有区别，每个人都值得被爱
3. ### 相关主题
>  - 不定代词
>  - 日常英语交流
>  - 学校生活场景
>
>- ### 笔记链接
>  - [[21. each other]] (互相，彼此)
>  - [[18. together]] (一起，共同)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: everyone
- 音标: /''evriwʌn/
- 词性: pron.（代词）
- 中文释义: 每个人，人人
- 拆分记忆法: every（每个） + one（一个）→ 每个一个人 → 每个人
- 场景记忆法: 想象教室里有很多学生，老师说"Everyone, please sit down."（每个人，请坐下。）
- 谐音记忆法: "爱无阮"（类似everyone的发音）→ 爱没有区别，每个人都值得被爱',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hobby (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '731e73ae-fff6-4105-9c5b-7dccb05ca5e8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hobby',
    '类型: 单词
例句: 1. 单词: hobby
> - 音标: /ˈhɒbi/
> - 词性: n.（名词）
> - 中文释义: 业余爱好，嗜好
2. 拆分记忆法: hobby（发音类似"号比"）→ 给自己的爱好打个记号比较一下
>- 场景记忆法: 想象一个人在业余时间做自己喜欢的事情的场景
>- 谐音记忆法: "好必" → 好的事情必然会成为爱好
3. ### 相关主题
>  - 兴趣爱好
>  - 休闲活动
>  - 个人兴趣
>
>- ### 笔记链接
>  - [[24. fun]] (乐趣)
>  - [[26. yourself]] (你自己)

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: hobby
- 音标: /ˈhɒbi/
- 词性: n.（名词）
- 中文释义: 业余爱好，嗜好
- 拆分记忆法: hobby（发音类似"号比"）→ 给自己的爱好打个记号比较一下
- 场景记忆法: 想象一个人在业余时间做自己喜欢的事情的场景
- 谐音记忆法: "好必" → 好的事情必然会成为爱好',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: together (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5675ede6-876d-4a61-84e0-e9acc74ce309',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'together',
    '类型: 单词
例句: 1. 单词: together
> - 音标: /təˈɡeðər/
> - 词性: adv.（副词）
> - 中文释义: 一起，共同，一齐，一块儿
2. to（到） + get（获得） + her（她）
> - 想象："到她那里去获得，大家一起去"，这样就能记住together表示"一起"的意思啦！
>
> 场景记忆法：
> - 想象和好朋友一起上学、一起玩耍、一起做作业的场景，这些场景都可以用together来描述
> - 每天早晨和家人一起吃早餐：We have breakfast together every morning.
3. 近义词: collectively, jointly, in unison, as one
>- 反义词: alone, separately, individually
>- 派生词: 
>
> 相关短语:
> - get together（聚会，相聚）
> - put together（组装，组合）
> - work together（一起工作）
> - play together（一起玩耍）
> - live together（一起生活）
相关词汇: - 单词: together
- 音标: /təˈɡeðər/
- 词性: adv.（副词）
- 中文释义: 一起，共同，一齐，一块儿',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ready (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7afe39c1-3d7a-43ca-88bb-2e92137d14fa',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ready',
    '类型: 单词
例句: 1. 单词: ready
> - 音标: /ˈredi/
> - 词性: 形容词 (adjective)
> - 中文释义: 准备好(做某事)的
2. ### 相关主题
> 日常用语、学校生活、准备活动
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: ready
- 音标: /ˈredi/
- 词性: 形容词 (adjective)
- 中文释义: 准备好(做某事)的',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: history (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b453de39-bd45-473b-8480-2a61475f80fb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'history',
    '类型: 单词
例句: 1. 单词: history
> - 音标: /''hɪstri/
> - 词性: n. (名词)
> - 中文释义: 历史
2. 发音记忆法：history的发音类似于"历史疼"，可以联想历史会让人感到心疼或震撼。
>- 拆分记忆法：his（他的） + story（故事）= 他的故事 → 历史是关于过去的故事
>- 情景记忆法：在历史课堂上，老师经常会说"Let''s turn to page 42 in your history book"（让我们翻到历史书的第42页）。
3. ### 相关主题
>  学科名称、过去事件、世界历史、中国历史
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: history
- 音标: /''hɪstri/
- 词性: n. (名词)
- 中文释义: 历史',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: geography (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c3837519-4f4b-418e-bb2c-b7245be47abc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'geography',
    '类型: 单词
例句: 1. 单词: geography
> - 音标: /d3i''vgrof/
> - 词性: n. (名词)
> - 中文释义: 地理
2. 发音记忆法：geography的发音可以拆分为"ge-o-gra-phy"，其中"geo"在希腊语中表示"地球"，"graphy"表示"描述"，所以geography就是"描述地球的学科"。
>- 拆分记忆法：geo（地球） + graphy（描述）= 描述地球的学科 → 地理
>- 情景记忆法：在地理课上，老师经常会说"Let''s open our geography textbooks"（让我们打开地理课本）。
3. ### 相关主题
>  学科名称、地球科学、自然地理、人文地理
>
>- ### 笔记链接
>

---

> [!help] 使用说明
>1. 将此模板应用于新笔记
>2. 填写单词基本信息
>3. 添加例句和联想记忆方法
>4. 记录相关词汇和学习进度
>5. 定期根据复习计划进行复习
>6. 完成测试后勾选对应的方框

> 提示: 结合 Dataview 插件可以创建单词学习数据库，追踪学习进度！
相关词汇: - 单词: geography
- 音标: /d3i''vgrof/
- 词性: n. (名词)
- 中文释义: 地理',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: teaching building (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '36141617-38a3-4ca4-9adc-cc78cbc30154',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'teaching building',
    '类型: 单词
音标: /ˈtiːtʃɪŋ ˈbɪldɪŋ/
词性: n.
中文释义: 教学楼，教学大楼
例句: 1. Our classroom is on the third floor of the teaching building.
>   我们的教室在教学楼的三楼。
>
> - The new teaching building has a large library and modern labs.
>   新教学楼有一个大图书馆和现代化的实验室。
>
> - Students are not allowed to run in the teaching building.
>   学生不允许在教学楼里奔跑。
---
2. 拆分记忆法: teaching(教学) + building(大楼) = 用于教学的大楼 = 教学楼
> - 情景记忆法: 想象学校里那栋有很多教室的大楼
---
> [!success] 相关词汇
>
> - classroom: n. 教室
> - school building: 校舍，学校建筑
> - library: n. 图书馆
> - laboratory/lab: n. 实验室
---
> [!check] 自我测试
> - 老师和学生在____里上课。(教学楼)
> - "teaching building" 的中文意思是什么？(教学楼)
---
> [!todo] 学习记录
> - ⏰ 学习时间: 
> - 📝 学习重点: 
> - ❓ 疑问点: 
---
> [!calendar] 复习计划
> - 🗓️ 第一次复习: 
> - 🗓️ 第二次复习: 
> - 🗓️ 第三次复习: 
---
3. 文化背景: 不同国家的教学楼设计可能有所不同，但都是学校中最重要的建筑之一
> - 常见搭配: 
>   - main teaching building: 主教学楼
>   - new teaching building: 新教学楼
> - 实用表达: 
>   - Let''s meet in front of the teaching building. 我们在教学楼前面见面吧。
>   - The teaching building is very tall. 教学楼很高。
---
#mcl/list-card
相关词汇: - 拆分记忆法: teaching(教学) + building(大楼) = 用于教学的大楼 = 教学楼
- 情景记忆法: 想象学校里那栋有很多教室的大楼
- classroom: n. 教室
- school building: 校舍，学校建筑
- library: n. 图书馆
- laboratory/lab: n. 实验室
- 文化背景: 不同国家的教学楼设计可能有所不同，但都是学校中最重要的建筑之一',
    'vocabulary',
    'word',
    '初一',
    'Starter',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: problem (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a852f981-30e0-4370-8be7-7b96a2aa697b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'problem',
    '类型: 单词
例句: 1. 单词: problem
> - 音标: /ˈprɒbləm/
> - 词性: n.（名词）
> - 中文释义: 问题，难题；困难
2. problem 发音类似于 "普洛布勒姆"，可以想象："普洛布勒姆"题
> - 也可以联想 "problem" 和 "program"（程序）的相似性，但意思不同
>
> 场景记忆法：
> - 想象遇到困难时寻求帮助的场景
> - 想象在课堂上解决数学问题的场景
3. 近义词: issue, difficulty, trouble, challenge
>- 反义词: solution, answer, success
>- 派生词: problematic（形容词）
>
> 相关短语:
> - solve a problem（解决问题）
> - have a problem with（在...方面有问题）
> - no problem（没问题）
> - problem solving（问题解决）
> - face a problem（面临问题）
相关词汇: - 单词: problem
- 音标: /ˈprɒbləm/
- 词性: n.（名词）
- 中文释义: 问题，难题；困难',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: advice (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2bf8234e-d8ab-4fb2-a93b-b9859b116731',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'advice',
    '类型: 单词
例句: 1. 单词: advice
> - 音标: /ədˈvaɪs/
> - 词性: n.（名词）
> - 中文释义: 意见，建议；忠告，劝告
2. ad（向） + vice（副的）
> - 想象："向副手"寻求"建议"
> - 也可以联想 "advice" 和 "advise"（建议，动词）的相似性
>
> 场景记忆法：
> - 想象向老师或朋友寻求建议的场景
> - 想象给出建议时的场景
3. 近义词: suggestion, recommendation, guidance, counsel
>- 反义词: 
>- 派生词: advise（动词），advisable（形容词）
>
> 相关短语:
> - give advice（给建议）
> - take advice（接受建议）
> - good advice（好建议）
> - useful advice（有用的建议）
> - piece of advice（一条建议）
相关词汇: - 单词: advice
- 音标: /ədˈvaɪs/
- 词性: n.（名词）
- 中文释义: 意见，建议；忠告，劝告',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: homework (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b1cf2f35-d2fe-4664-9ce5-c3683db4c08d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'homework',
    '类型: 单词
例句: 1. 单词: homework
> - 音标: /ˈhəʊmwɜːk/
> - 词性: n.（名词）
> - 中文释义: 家庭作业，功课
2. home（家） + work（工作）
> - 想象："在家做的工作"就是"家庭作业"
>
> 场景记忆法：
> - 想象在家里书桌前做作业的场景
> - 想象老师布置作业时的场景
3. 近义词: schoolwork, assignment, task
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - do homework（做家庭作业）
> - finish homework（完成家庭作业）
> - homework assignment（家庭作业任务）
> - math homework（数学作业）
> - English homework（英语作业）
相关词汇: - 单词: homework
- 音标: /ˈhəʊmwɜːk/
- 词性: n.（名词）
- 中文释义: 家庭作业，功课',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: really (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '09a97488-e5fe-4f66-8fb8-4aa07980ed0b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'really',
    '类型: 单词
例句: 1. 单词: really
> - 音标: /ˈrɪəli/
> - 词性: adv.（副词）
> - 中文释义: 确实地，的确
2. real（真实的） + ly（副词后缀）
> - 想象："real"的"副词形式"就是"really"
>
> 场景记忆法：
> - 想象强调某件事时的场景
> - 想象表示惊讶或怀疑时的场景
3. 近义词: truly, indeed, actually, genuinely
>- 反义词: 
>- 派生词: real（形容词）
>
> 相关短语:
> - really good（真的很好）
> - really bad（真的很糟糕）
> - really important（真的很重要）
> - not really（不完全是）
> - oh really（哦，真的吗）
相关词汇: - 单词: really
- 音标: /ˈrɪəli/
- 词性: adv.（副词）
- 中文释义: 确实地，的确',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mind (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7d98b3b0-17f6-4fd4-b839-424edb0b3055',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mind',
    '类型: 单词
例句: 1. 单词: mind
> - 音标: /maɪnd/
> - 词性: n.（名词）
> - 中文释义: 头脑；思想，思维
2. mind 发音类似于 "迈恩德"，可以想象："迈恩德"思考，用"头脑"
> - 也可以联想 "mind" 和 "mine"（我的）的相似性，头脑是"我的"
>
> 场景记忆法：
> - 想象思考问题时用手指敲脑袋的场景
> - 想象专心学习时全神贯注的场景
3. 近义词: brain, head, intellect, thinking
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - change one''s mind（改变主意）
> - keep in mind（记住）
> - make up one''s mind（下定决心）
> - out of one''s mind（疯了）
> - peace of mind（内心的平静）
相关词汇: - 单词: mind
- 音标: /maɪnd/
- 词性: n.（名词）
- 中文释义: 头脑；思想，思维',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: storm (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'bade4bd7-95d8-4baf-b9ce-9e8c89085280',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'storm',
    '类型: 单词
例句: 1. 单词: storm
> - 音标: /stɔːm/
> - 词性: n.（名词）
> - 中文释义: 暴风雨（雪）
2. storm 发音类似于 "思道姆"，可以想象："思道姆"暴风雨
> - 也可以联想 "storm" 和 "store"（商店）的相似性，但意思完全不同
>
> 场景记忆法：
> - 想象狂风暴雨、电闪雷鸣的场景
> - 想象人们躲避暴风雨的场景
3. 近义词: tempest, hurricane, typhoon, blizzard
>- 反义词: calm, peace, tranquility
>- 派生词: stormy（形容词）
>
> 相关短语:
> - thunderstorm（雷暴）
> - snowstorm（暴风雪）
> - sandstorm（沙尘暴）
> - storm warning（暴风雨警告）
> - weather the storm（度过难关）
相关词汇: - 单词: storm
- 音标: /stɔːm/
- 词性: n.（名词）
- 中文释义: 暴风雨（雪）',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: towards (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '67d3f01e-4de3-400a-b033-d1a73300c62b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'towards',
    '类型: 单词
例句: 1. 单词: towards
> - 音标: /təˈwɔːdz/
> - 词性: prep.（介词）
> - 中文释义: 向着，朝着（某个方向）
2. to（到） + wards（方向）
> - 想象："到...的方向"就是"朝着"
>
> 场景记忆法：
> - 想象指向某个方向的场景
> - 想象朝目标前进的场景
3. 近义词: toward, in the direction of, to, for
>- 反义词: away from, from
>- 派生词: 
>
> 相关短语:
> - move towards（朝...移动）
> - look towards（朝...看）
> - head towards（朝...前进）
> - walk towards（朝...走）
> - run towards（朝...跑）
相关词汇: - 单词: towards
- 音标: /təˈwɔːdz/
- 词性: prep.（介词）
- 中文释义: 向着，朝着（某个方向）',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pool (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '94d22640-aeef-41b0-8f25-0ec397574364',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pool',
    '类型: 单词
例句: 1. 单词: pool
> - 音标: /puːl/
> - 词性: n.（名词）
> - 中文释义: 水塘，水洼
2. pool 发音类似于 "普尔"，可以想象："普尔"水塘
> - 也可以联想 "pool" 和 "cool"（凉爽的）的相似性，水塘很凉爽
>
> 场景记忆法：
> - 想象在游泳池里游泳的场景
> - 想象雨后地上形成小水洼的场景
3. 近义词: pond, puddle, lake, basin
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - swimming pool（游泳池）
> - pool of water（水洼）
> - pool party（泳池派对）
> - pool table（台球桌）
> - car pool（拼车）
相关词汇: - 单词: pool
- 音标: /puːl/
- 词性: n.（名词）
- 中文释义: 水塘，水洼',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: wind (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7fe77c5d-9654-4d1b-afb7-c2ace6194934',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'wind',
    '类型: 单词
例句: 1. 单词: wind
> - 音标: /wɪnd/
> - 词性: n.（名词）
> - 中文释义: 风
2. wind 发音类似于 "温德"，可以想象："温德"风
> - 也可以联想 "wind" 和 "window"（窗户）的相似性，风从窗户进来
>
> 场景记忆法：
> - 想象风吹动头发和衣服的场景
> - 想象风筝在风中飞舞的场景
3. 近义词: breeze, gust, air current
>- 反义词: 
>- 派生词: windy（形容词），windy（多风的）
>
> 相关短语:
> - strong wind（强风）
> - gentle wind（微风）
> - wind direction（风向）
> - wind speed（风速）
> - against the wind（逆风）
相关词汇: - 单词: wind
- 音标: /wɪnd/
- 词性: n.（名词）
- 中文释义: 风',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: need (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '25c64974-9ec6-49ff-98ac-b0d0c521ee77',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'need',
    '类型: 单词
例句: 1. 单词: need
> - 音标: /niːd/
> - 词性: v.（动词）
> - 中文释义: 需要
2. need 发音类似于 "尼德"，可以想象："尼德"要
> - 也可以联想 "need" 和 "feed"（喂养）的相似性，都需要"e"音
>
> 场景记忆法：
> - 想象在商店里说"我需要..."的场景
> - 想象向别人求助时的场景
3. 近义词: require, want, demand, have to
>- 反义词: have, possess, own
>- 派生词: need（名词），needy（形容词）
>
> 相关短语:
> - need to do（需要做）
> - need help（需要帮助）
> - in need of（需要）
> - meet the need（满足需要）
> - urgent need（迫切需要）
相关词汇: - 单词: need
- 音标: /niːd/
- 词性: v.（动词）
- 中文释义: 需要',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mistake (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '01c53ce8-ad63-4f89-b538-59a25f3e0f0b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mistake',
    '类型: 单词
例句: 1. 单词: mistake
> - 音标: /mɪˈsteɪk/
> - 词性: n.（名词）
> - 中文释义: 错误
2. mis（错误） + take（拿，取）
> - 想象："错误地拿取"了东西，就是"犯错"
>
> 场景记忆法：
> - 想象考试时发现自己答错题目的场景
> - 想象老师用红笔圈出错误答案的场景
3. 近义词: error, fault, blunder, slip
>- 反义词: correct, right, success
>- 派生词: 
>
> 相关短语:
> - make a mistake（犯错误）
> - correct a mistake（纠正错误）
> - avoid mistakes（避免错误）
> - common mistake（常见错误）
> - spelling mistake（拼写错误）
相关词汇: - 单词: mistake
- 音标: /mɪˈsteɪk/
- 词性: n.（名词）
- 中文释义: 错误',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sail (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '80f8175d-a8ee-4ad4-b5e8-f2f47918b9b9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sail',
    '类型: 单词
例句: 1. 单词: sail
> - 音标: /seɪl/
> - 词性: v.（动词）
> - 中文释义: 驾驶（船只）
2. sail 发音类似于 "赛尔"，可以想象："赛尔"船
> - 也可以联想 "sail" 和 "sale"（销售）的相似性，但意思完全不同
>
> 场景记忆法：
> - 想象帆船在海上航行的场景
> - 想象水手驾驶船只的场景
3. 近义词: navigate, cruise, voyage, travel by sea
>- 反义词: 
>- 派生词: sailing（名词），sailor（名词）
>
> 相关短语:
> - sail away（航行离开）
> - sail through（顺利通过）
> - sail into（驶入）
> - sail around（环航）
> - set sail（启航）
相关词汇: - 单词: sail
- 音标: /seɪl/
- 词性: v.（动词）
- 中文释义: 驾驶（船只）',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sentence (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0fb741fb-0217-44a4-8086-db63e89907d5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sentence',
    '类型: 单词
例句: 1. 单词: sentence
> - 音标: /ˈsentəns/
> - 词性: n.（名词）
> - 中文释义: 句子
2. sent（发送） + ence（名词后缀）
> - 想象："发送"一个完整的"句子"给别人
>
> 场景记忆法：
> - 想象在课堂上造句的场景
> - 想象阅读文章时看到一个个句子的场景
3. 近义词: statement, phrase, clause
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - make a sentence（造句）
> - read a sentence（读句子）
> - write a sentence（写句子）
> - complete sentence（完整句子）
> - simple sentence（简单句）
相关词汇: - 单词: sentence
- 音标: /ˈsentəns/
- 词性: n.（名词）
- 中文释义: 句子',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: primary school (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '10e116d7-d2c8-4f09-aff5-5be6b72ab89e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'primary school',
    '类型: 单词
例句: 1. 单词: primary school
> - 音标: /ˈpraɪməri skuːl/
> - 词性: 名词短语
> - 中文释义: 小学
2. primary（初级的，主要的） + school（学校）
> - 想象："初级的学校"就是"小学"
>
> 场景记忆法：
> - 想象小学生们背着书包上学的场景
> - 想象小学教室里孩子们认真听课的场景
3. 近义词: elementary school, grade school
>- 反义词: high school, secondary school
>- 派生词: 
>
> 相关短语:
> - primary school student（小学生）
> - primary school teacher（小学老师）
> - primary school education（小学教育）
> - primary school curriculum（小学课程）
> - primary school graduation（小学毕业）
相关词汇: - 单词: primary school
- 音标: /ˈpraɪməri skuːl/
- 词性: 名词短语
- 中文释义: 小学',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: protect (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b81945e4-8b22-4d49-b4d5-6bc78e069f35',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'protect',
    '类型: 单词
例句: 1. 单词: protect
> - 音标: /prəˈtekt/
> - 词性: v.（动词）
> - 中文释义: 保护；防护
2. pro（向前，支持） + tect（覆盖，遮蔽）
> - 想象："向前覆盖"就是"保护"
>
> 场景记忆法：
> - 想象警察保护市民的场景
> - 想象父母保护孩子的场景
3. 近义词: guard, defend, shield, safeguard
>- 反义词: harm, damage, endanger
>- 派生词: protection（名词），protective（形容词）
>
> 相关短语:
> - protect from（保护免受）
> - protect against（防护）
> - protect the environment（保护环境）
> - protect one''s rights（保护权利）
> - protect wildlife（保护野生动物）
相关词汇: - 单词: protect
- 音标: /prəˈtekt/
- 词性: v.（动词）
- 中文释义: 保护；防护',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: life (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '55c5e77d-d535-4eb5-ac79-4d2562796d4e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'life',
    '类型: 单词
例句: 1. 单词: life
> - 音标: /laɪf/
> - 词性: n.（名词）
> - 中文释义: 生活
2. life 发音类似于 "来夫"，可以想象："来夫"享受"生活"
> - 也可以联想 "life" 和 "live"（生活，居住）的相似性
>
> 场景记忆法：
> - 想象每天早晨起床开始新的一天的场景
> - 想象和朋友一起享受美好时光的场景
3. 近义词: existence, living, being
>- 反义词: death
>- 派生词: live（动词），alive（形容词）
>
> 相关短语:
> - daily life（日常生活）
> - school life（学校生活）
> - family life（家庭生活）
> - real life（现实生活）
> - life style（生活方式）
相关词汇: - 单词: life
- 音标: /laɪf/
- 词性: n.（名词）
- 中文释义: 生活',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: task (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '29d99822-c691-459e-9583-161d0d4ea433',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'task',
    '类型: 单词
例句: 1. 单词: task
> - 音标: /tɑːsk/
> - 词性: n.（名词）
> - 中文释义: 工作，任务
2. task 发音类似于 "塔斯克"，可以想象："塔斯克"务
> - 也可以联想 "task" 和 "ask"（问）的相似性，任务需要"问"清楚
>
> 场景记忆法：
> - 想象在办公室接受工作任务的场景
> - 想象完成项目任务的场景
3. 近义词: job, work, assignment, duty, mission
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - complete a task（完成任务）
> - take on a task（承担任务）
> - difficult task（困难任务）
> - main task（主要任务）
> - task force（特别工作组）
相关词汇: - 单词: task
- 音标: /tɑːsk/
- 词性: n.（名词）
- 中文释义: 工作，任务',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: important (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd4d7cb27-8f4e-4f74-9fdc-b0271aff5c4d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'important',
    '类型: 单词
例句: 1. 单词: important
> - 音标: /ɪmˈpɔːtənt/
> - 词性: adj.（形容词）
> - 中文释义: 重要的，重大的
2. im（进入） + port（港口） + ant（蚂蚁）
> - 想象："进入港口的蚂蚁"很重要，因为它们是搬运工
>
> 场景记忆法：
> - 想象在重要会议上发言的场景
> - 想象强调某件事重要性时的场景
3. 近义词: significant, crucial, vital, essential, major
>- 反义词: unimportant, trivial, minor, insignificant
>- 派生词: importance（名词）
>
> 相关短语:
> - very important（非常重要）
> - most important（最重要的）
> - important decision（重要决定）
> - important person（重要人物）
> - of great importance（具有重大意义）
相关词汇: - 单词: important
- 音标: /ɪmˈpɔːtənt/
- 词性: adj.（形容词）
- 中文释义: 重要的，重大的',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: thought (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '44b00f9b-45bc-47be-87be-5ea6c8a08e97',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'thought',
    '类型: 单词
例句: 1. 单词: thought
> - 音标: /θɔːt/
> - 词性: n.（名词）
> - 中文释义: 意见，主意，观点
2. thought 是 think 的过去式和过去分词形式
> - 想象：think（思考）的结果就是 thought（想法）
>
> 场景记忆法：
> - 想象在会议上发表自己观点的场景
> - 想象和朋友讨论问题时的思考过程
3. 近义词: idea, opinion, view, notion, concept
>- 反义词: 
>- 派生词: think（动词原形）
>
> 相关短语:
> - deep thought（深思）
> - second thought（重新考虑）
> - food for thought（值得思考的事）
> - lost in thought（陷入沉思）
> - thought process（思维过程）
相关词汇: - 单词: thought
- 音标: /θɔːt/
- 词性: n.（名词）
- 中文释义: 意见，主意，观点',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: journey (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '50d12814-d024-4124-871d-817f9aa4eab2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'journey',
    '类型: 单词
例句: 1. 单词: journey
> - 音标: /ˈdʒɜːni/
> - 词性: n.（名词）
> - 中文释义: 旅行，旅程；历程，过程
2. journey 发音类似于 "杰尼"，可以想象："杰尼"旅行
> - 也可以联想 "journey" 和 "journal"（日记）的相似性，旅行需要写日记
>
> 场景记忆法：
> - 想象背着背包去旅行的场景
> - 想象在火车或飞机上旅行的场景
3. 近义词: trip, travel, voyage, expedition, tour
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - long journey（长途旅行）
> - safe journey（平安旅行）
> - journey home（回家之旅）
> - life journey（人生旅程）
> - journey of discovery（发现之旅）
相关词汇: - 单词: journey
- 音标: /ˈdʒɜːni/
- 词性: n.（名词）
- 中文释义: 旅行，旅程；历程，过程',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: without (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '156af83b-361a-46f1-892e-2e4ce7819e80',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'without',
    '类型: 单词
例句: 1. 单词: without
> - 音标: /wɪðˈaʊt/
> - 词性: prep.（介词）
> - 中文释义: 缺乏，没有
2. with（和，与） + out（外面，出去）
> - 想象："和...一起出去"的反面，就是"没有...一起"
>
> 场景记忆法：
> - 想象忘记带东西出门的场景：without keys（没有钥匙）
> - 想象独自一人的场景：without friends（没有朋友）
3. 近义词: lacking, missing, absent
>- 反义词: with, having, including
>- 派生词: 
>
> 相关短语:
> - without doubt（毫无疑问）
> - without fail（必定，一定）
> - without delay（立即，马上）
> - without exception（毫无例外）
> - without question（毫无疑问）
相关词汇: - 单词: without
- 音标: /wɪðˈaʊt/
- 词性: prep.（介词）
- 中文释义: 缺乏，没有',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: project (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e4d73447-77bb-4015-ad5f-116f786c5c01',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'project',
    '类型: 单词
例句: 1. 单词: project
> - 音标: /ˈprɒdʒekt/
> - 词性: n.（名词）
> - 中文释义: （学校的）课题，研究项目
2. pro（向前） + ject（投掷）
> - 想象："向前投掷"就是"项目"，因为项目需要推进
>
> 场景记忆法：
> - 想象在课堂上展示项目的场景
> - 想象小组合作完成项目的场景
3. 近义词: assignment, undertaking, venture, scheme
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - work on a project（做项目）
> - complete a project（完成项目）
> - group project（小组项目）
> - research project（研究项目）
> - project deadline（项目截止日期）
相关词汇: - 单词: project
- 音标: /ˈprɒdʒekt/
- 词性: n.（名词）
- 中文释义: （学校的）课题，研究项目',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: something (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9e29fdaa-b3a1-4e8f-ba0e-6c925beabb80',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'something',
    '类型: 单词
例句: 1. 单词: something
> - 音标: /ˈsʌmθɪŋ/
> - 词性: pron.（代词）
> - 中文释义: 某物，某事；某些东西
2. some（一些） + thing（东西）
> - 想象："一些东西"就是"某物"
>
> 场景记忆法：
> - 想象在商店里说"我要买点东西"的场景
> - 想象发现异常情况时说"有什么不对劲"的场景
3. 近义词: anything, everything, nothing
>- 反义词: nothing
>- 派生词: 
>
> 相关短语:
> - something else（别的东西）
> - something wrong（有问题）
> - something new（新东西）
> - something important（重要的事情）
> - something special（特别的东西）
相关词汇: - 单词: something
- 音标: /ˈsʌmθɪŋ/
- 词性: pron.（代词）
- 中文释义: 某物，某事；某些东西',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: plan (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '911632e9-2112-4d6d-aa3f-22dcce486b29',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'plan',
    '类型: 单词
例句: 1. 单词: plan
> - 音标: /plæn/
> - 词性: v.（动词）
> - 中文释义: 计划
2. plan 发音类似于 "普兰"，可以想象："普兰"划
> - 也可以联想 "plan" 和 "pan"（平底锅）的相似性，但意思完全不同
>
> 场景记忆法：
> - 想象制定学习计划或旅行计划的场景
> - 想象在日历上安排活动的场景
3. 近义词: arrange, organize, prepare, schedule
>- 反义词: 
>- 派生词: plan（名词），planning（名词）
>
> 相关短语:
> - plan to do（计划做）
> - make a plan（制定计划）
> - plan ahead（提前计划）
> - according to plan（按计划）
> - change the plan（改变计划）
相关词汇: - 单词: plan
- 音标: /plæn/
- 词性: v.（动词）
- 中文释义: 计划',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: point out (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7442c387-32a8-4418-90b0-9d30dde9f757',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'point out',
    '类型: 单词
例句: 1. 单词: point out
> - 音标: /pɔɪnt aʊt/
> - 词性: 动词短语
> - 中文释义: 指出，指明
2. point（指向） + out（出来）
> - 想象：用手指"指向"某个地方，让大家都"看到"
>
> 场景记忆法：
> - 想象老师用手指着黑板上的内容
> - 想象导游指着景点介绍的场景
3. 近义词: indicate, show, highlight, mention
>- 反义词: ignore, overlook, miss
>- 派生词: 
>
> 相关短语:
> - point out the problem（指出问题）
> - point out the mistake（指出错误）
> - point out the way（指路）
> - point out the fact（指出事实）
> - point out the difference（指出区别）
相关词汇: - 单词: point out
- 音标: /pɔɪnt aʊt/
- 词性: 动词短语
- 中文释义: 指出，指明',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: polite (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f8a8cf58-00a4-47b6-82c3-fea3adc0d7ec',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'polite',
    '类型: 单词
例句: 1. 单词: polite
> - 音标: /pəˈlaɪt/
> - 词性: adj.（形容词）
> - 中文释义: 有礼貌的，客气的
2. polite 发音类似于 "破来特"，可以想象："破来特"别的人，要"有礼貌"
> - 也可以联想 "polite" 和 "police"（警察）的相似性，警察通常很有礼貌
>
> 场景记忆法：
> - 想象在餐厅里礼貌地和服务员说话的场景
> - 想象在公共场合礼貌地排队等候的场景
3. 近义词: courteous, respectful, well-mannered, civil
>- 反义词: rude, impolite, discourteous, ill-mannered
>- 派生词: 
>
> 相关短语:
> - polite behavior（礼貌行为）
> - polite request（礼貌请求）
> - polite conversation（礼貌对话）
> - polite society（上流社会）
> - polite refusal（礼貌拒绝）
相关词汇: - 单词: polite
- 音标: /pəˈlaɪt/
- 词性: adj.（形容词）
- 中文释义: 有礼貌的，客气的',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: meaning (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd9426229-9889-496b-86b7-30831ce6f2a1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'meaning',
    '类型: 单词
例句: 1. 单词: meaning
> - 音标: /ˈmiːnɪŋ/
> - 词性: n.（名词）
> - 中文释义: 意义，意思，含义
2. mean（意思是） + ing（名词后缀）
> - 想象："mean"的"名词形式"就是"meaning"
>
> 场景记忆法：
> - 想象查字典时寻找单词意思的场景
> - 想象老师解释课文含义的场景
3. 近义词: sense, significance, definition, interpretation
>- 反义词: 
>- 派生词: mean（动词），meaningful（形容词）
>
> 相关短语:
> - the meaning of（...的意思）
> - deep meaning（深刻含义）
> - hidden meaning（隐藏的含义）
> - lose meaning（失去意义）
> - full of meaning（意味深长）
相关词汇: - 单词: meaning
- 音标: /ˈmiːnɪŋ/
- 词性: n.（名词）
- 中文释义: 意义，意思，含义',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hers (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '58271654-2bd1-4f58-8f1e-8705c73ac26d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hers',
    '类型: 单词
例句: 1. 单词: hers
> - 音标: /hɜːz/
> - 词性: pron.（代词）
> - 中文释义: 她的
2. her（她的） + s（表示所有格）
> - 想象："her"的"所有格"形式就是"hers"
>
> 场景记忆法：
> - 想象指着某样东西说"这是她的"的场景
> - 想象在失物招领处认领物品的场景
3. 近义词: her own, belonging to her
>- 反义词: his, mine, yours, theirs
>- 派生词: her（形容词性物主代词）
>
> 相关短语:
> - of hers（她的）
> - a friend of hers（她的一个朋友）
> - that book of hers（她的那本书）
> - this idea of hers（她的这个想法）
相关词汇: - 单词: hers
- 音标: /hɜːz/
- 词性: pron.（代词）
- 中文释义: 她的',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hope (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '64f6b2c0-a86e-49f3-8ae3-3129bc58370e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hope',
    '类型: 单词
例句: 1. 单词: hope
> - 音标: /həʊp/
> - 词性: v.（动词）
> - 中文释义: 希望，期望，指望
2. hope 发音类似于 "厚普"，可以想象："厚普"望
> - 也可以联想 "hope" 和 "rope"（绳子）的相似性，希望就像抓住救命稻草
>
> 场景记忆法：
> - 想象许愿时的场景
> - 想象对未来充满期待的场景
3. 近义词: wish, expect, desire, want
>- 反义词: despair, give up, lose hope
>- 派生词: hopeful（形容词），hopeless（形容词）
>
> 相关短语:
> - hope for（希望得到）
> - hope to do（希望做）
> - lose hope（失去希望）
> - give up hope（放弃希望）
> - in the hope of（怀着...的希望）
相关词汇: - 单词: hope
- 音标: /həʊp/
- 词性: v.（动词）
- 中文释义: 希望，期望，指望',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dry (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3fd7da3b-b51b-4252-8ad0-b527d5e84aaa',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dry',
    '类型: 单词
例句: 1. 单词: dry
> - 音标: /draɪ/
> - 词性: adj.（形容词）
> - 中文释义: 干的，干燥的
2. dry 发音类似于 "拽"，可以想象："拽"干的东西
> - 也可以联想 "dry" 和 "cry"（哭）的相似性，但意思完全不同
>
> 场景记忆法：
> - 想象在阳光下晾晒衣服的场景
> - 想象用毛巾擦干水分的场景
3. 近义词: arid, parched, dehydrated, moistureless
>- 反义词: wet, moist, damp, humid
>- 派生词: dry（动词），dryness（名词）
>
> 相关短语:
> - dry up（干涸）
> - dry out（变干）
> - dry cleaning（干洗）
> - dry weather（干燥天气）
> - dry humor（冷幽默）
相关词汇: - 单词: dry
- 音标: /draɪ/
- 词性: adj.（形容词）
- 中文释义: 干的，干燥的',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: remember (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'be41bae1-78ac-4ec1-ba3e-552c28611f0f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'remember',
    '类型: 单词
例句: 1. 单词: remember
> - 音标: /rɪˈmembə/
> - 词性: v.（动词）
> - 中文释义: 记住，记得
2. re（重新） + member（成员）
> - 想象："重新成为成员"就是"记住"
> - 也可以联想 "remember" 和 "December"（十二月）的相似性
>
> 场景记忆法：
> - 想象努力回忆某件事的场景
> - 想象提醒别人记住某事的场景
3. 近义词: recall, recollect, memorize, keep in mind
>- 反义词: forget, ignore, overlook
>- 派生词: memory（名词），memorable（形容词）
>
> 相关短语:
> - remember to do（记住做）
> - remember doing（记得做过）
> - remember me to（代我向...问好）
> - if I remember correctly（如果我没记错）
> - remember by heart（用心记住）
相关词汇: - 单词: remember
- 音标: /rɪˈmembə/
- 词性: v.（动词）
- 中文释义: 记住，记得',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fact (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9c5774b1-23a4-449f-82a7-117b39fe4c80',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fact',
    '类型: 单词
例句: 1. 单词: fact
> - 音标: /fækt/
> - 词性: n.（名词）
> - 中文释义: 事实；真相
2. fact 发音类似于 "法克特"，可以想象："法克特"实
> - 也可以联想 "fact" 和 "act"（行动）的相似性，事实需要行动来证明
>
> 场景记忆法：
> - 想象在法庭上陈述事实的场景
> - 想象科学家用实验证明事实的场景
3. 近义词: truth, reality, actuality, certainty
>- 反义词: fiction, lie, falsehood, myth
>- 派生词: factual（形容词）
>
> 相关短语:
> - in fact（事实上）
> - as a matter of fact（事实上）
> - the fact is（事实是）
> - face the facts（面对事实）
> - hard facts（铁的事实）
相关词汇: - 单词: fact
- 音标: /fækt/
- 词性: n.（名词）
- 中文释义: 事实；真相',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: in fact (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '72760e4a-cede-429b-aa77-698797a73277',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'in fact',
    '类型: 单词
例句: 1. 单词: in fact
> - 音标: /ɪn fækt/
> - 词性: 副词短语
> - 中文释义: 事实上
2. in（在...中） + fact（事实）
> - 想象："在事实中"就是"事实上"
>
> 场景记忆法：
> - 想象纠正别人错误观点时的场景
> - 想象强调真实情况的场景
3. 近义词: actually, really, indeed, as a matter of fact
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - as a matter of fact（事实上）
> - the fact is（事实是）
> - in point of fact（实际上）
> - the truth is（真相是）
相关词汇: - 单词: in fact
- 音标: /ɪn fækt/
- 词性: 副词短语
- 中文释义: 事实上',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: wide (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f947ab30-08b2-41f2-9db8-0cba598f1fa4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'wide',
    '类型: 单词
例句: 1. 单词: wide
> - 音标: /waɪd/
> - 词性: adj.（形容词）
> - 中文释义: 宽的，宽阔的
2. wide 发音类似于 "外德"，可以想象："外德"很"宽"
> - 也可以联想 "wide" 和 "side"（边）的相似性，宽就是两边距离大
>
> 场景记忆法：
> - 想象张开双臂表示"宽"的场景
> - 想象宽阔的马路或广场的场景
3. 近义词: broad, spacious, extensive, large
>- 反义词: narrow, thin, small
>- 派生词: width（名词），widen（动词）
>
> 相关短语:
> - wide open（大开的）
> - wide range（广泛的范围）
> - wide awake（完全清醒的）
> - wide apart（相距很远）
> - wide smile（灿烂的笑容）
相关词汇: - 单词: wide
- 音标: /waɪd/
- 词性: adj.（形容词）
- 中文释义: 宽的，宽阔的',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: through (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9d9403a8-ef7e-4bd6-aa47-c35649a31c2a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'through',
    '类型: 单词
例句: 1. 单词: through
> - 音标: /θruː/
> - 词性: prep.（介词）
> - 中文释义: 从一端至另一端，穿过，通过
2. through 发音类似于 "思鲁"，可以想象："思鲁"过
> - 也可以联想 "through" 和 "thorough"（彻底的）的相似性
>
> 场景记忆法：
> - 想象穿过门洞或隧道的场景
> - 想象透过玻璃看外面的场景
3. 近义词: across, past, via, by way of
>- 反义词: around, around
>- 派生词: 
>
> 相关短语:
> - go through（经历，通过）
> - look through（浏览，检查）
> - get through（通过，完成）
> - through and through（完全地）
> - all through（自始至终）
相关词汇: - 单词: through
- 音标: /θruː/
- 词性: prep.（介词）
- 中文释义: 从一端至另一端，穿过，通过',
    'vocabulary',
    'word',
    '初一',
    'Unit 1',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: nod (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a4b1bb44-e0c1-4b54-8a25-9e1c0ecfc83c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'nod',
    '类型: 单词
例句: 1. 单词: nod
> - 音标: /nɒd/
> - 词性: v.（动词）
> - 中文释义: 点头
2. nod 发音类似"诺德"，可以联想"诺德点头"
> - 想象点头的动作：上下移动头部
>
> 场景记忆法：
> - 想象老师问问题时学生点头回答的场景
> - 联想在会议上表示同意时点头的场景
3. 近义词: bow, incline, bob
>- 反义词: shake head, refuse
>- 派生词: nodding（现在分词）, nodded（过去式/过去分词）
>
> 相关短语:
> - nod one''s head（点头）
> - nod in agreement（点头同意）
> - nod off（打瞌睡）
> - nod to someone（向某人点头）
> - give a nod（点头示意）
相关词汇: - 单词: nod
- 音标: /nɒd/
- 词性: v.（动词）
- 中文释义: 点头',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ending (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '13471cf0-e387-42d6-b91b-66e06387d550',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ending',
    '类型: 单词
例句: 1. 单词: ending
> - 音标: /ˈendɪŋ/
> - 词性: n.（名词）
> - 中文释义: (故事、电影、活动等的)结局，结尾
2. end（结束）+ -ing（名词后缀）= ending（结尾）
> - 想象故事或电影的最后部分
>
> 场景记忆法：
> - 想象看完电影后讨论结局的场景
> - 联想读书时翻到最后一页的感觉
3. 近义词: conclusion, finale, close, finish
>- 反义词: beginning, start, opening
>- 派生词: end（v. 结束）
>
> 相关短语:
> - happy ending（快乐结局）
> - sad ending（悲伤结局）
> - surprise ending（意外结局）
> - perfect ending（完美结局）
> - story ending（故事结尾）
相关词汇: - 单词: ending
- 音标: /ˈendɪŋ/
- 词性: n.（名词）
- 中文释义: (故事、电影、活动等的)结局，结尾',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rush (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5453fe02-7301-48c0-95ba-68df0e757779',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rush',
    '类型: 单词
例句: 1. 单词: rush
> - 音标: /rʌʃ/
> - 词性: v.（动词）
> - 中文释义: 冲，奔
2. rush 发音类似"拉什"，可以联想"拉着急冲冲地跑"
> - 想象着急忙忙跑步的场景
>
> 场景记忆法：
> - 想象快要迟到了，急忙跑向学校的场景
> - 联想消防员听到警报后急忙冲出去的场景
3. 近义词: hurry, dash, sprint, run quickly
>- 反义词: walk slowly, stroll, amble
>- 派生词: rushing（现在分词）, rushed（过去式/过去分词）
>
> 相关短语:
> - rush to do something（急忙做某事）
> - rush into（冲进）
> - rush out（冲出）
> - in a rush（匆忙地）
> - rush hour（交通高峰期）
相关词汇: - 单词: rush
- 音标: /rʌʃ/
- 词性: v.（动词）
- 中文释义: 冲，奔',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: tap (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9b4cf098-2849-4b03-a7ec-f0a89ec03b62',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'tap',
    '类型: 单词
例句: 1. 单词: tap
> - 音标: /tæp/
> - 词性: v.（动词）
> - 中文释义: (用手指)轻拍，轻叩，轻敲
2. tap 发音类似"塔普"，可以联想"塔普轻敲"
> - 想象用手指轻敲桌面的声音
>
> 场景记忆法：
> - 想象敲门时的轻敲动作
> - 联想音乐课上用手指轻敲节拍的场景
3. 近义词: knock, pat, rap, touch lightly
>- 反义词: hit hard, pound, strike
>- 派生词: tapping（现在分词）, tapped（过去式/过去分词）
>
> 相关短语:
> - tap on（轻敲）
> - tap someone on the shoulder（轻拍某人的肩膀）
> - tap the table（轻敲桌子）
> - tap dance（踢踏舞）
> - tap water（自来水）
相关词汇: - 单词: tap
- 音标: /tæp/
- 词性: v.（动词）
- 中文释义: (用手指)轻拍，轻叩，轻敲',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: heart (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0bb68fbf-09fb-42d5-a900-c78f1623237c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'heart',
    '类型: 单词
例句: 1. 单词: heart
> - 音标: /hɑːt/
> - 词性: n.（名词）
> - 中文释义: 心(脏)
2. heart 发音类似"哈特"，可以联想"哈特心脏"
> - 想象心脏跳动的节奏
>
> 场景记忆法：
> - 想象医生用听诊器听心跳的场景
> - 联想表达情感时用手放在胸口的动作
3. 近义词: cardiac, core, center
>- 反义词: 
>- 派生词: hearted（adj. 有...心的）, heartless（adj. 无情的）
>
> 相关短语:
> - heart attack（心脏病发作）
> - heart disease（心脏病）
> - break someone''s heart（伤某人的心）
> - from the heart（发自内心）
> - heart of gold（金子般的心）
相关词汇: - 单词: heart
- 音标: /hɑːt/
- 词性: n.（名词）
- 中文释义: 心(脏)',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: decide (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '85b0d711-3209-44e0-857a-b3dc7954f23d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'decide',
    '类型: 单词
例句: 1. 单词: decide
> - 音标: /dɪˈsaɪd/
> - 词性: v.（动词）
> - 中文释义: 决定
2. de（向下）+ cide（切）= 切下去，做出决定
> - 想象在十字路口做选择的场景
>
> 场景记忆法：
> - 想象在餐厅看菜单时决定点什么菜
> - 联想在商店里决定买什么衣服的场景
3. 近义词: choose, determine, make up one''s mind, resolve
>- 反义词: hesitate, waver, be undecided
>- 派生词: decision（n. 决定）, decisive（adj. 果断的）
>
> 相关短语:
> - decide to do（决定做某事）
> - decide on（决定选择）
> - decide between（在...之间做决定）
> - make a decision（做决定）
> - decide for oneself（自己决定）
相关词汇: - 单词: decide
- 音标: /dɪˈsaɪd/
- 词性: v.（动词）
- 中文释义: 决定',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: festival (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2fe0baf5-9d3f-40da-9eb9-de142644ce31',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'festival',
    '类型: 单词
例句: 1. 单词: festival
> - 音标: /ˈfestəvəl/
> - 词性: n.（名词）
> - 中文释义: (电影、戏剧、音乐等的)节，节庆，汇演
2. fest（节日）+ ival（名词后缀）= festival（节日）
> - 想象各种庆祝活动和节日的场景
>
> 场景记忆法：
> - 想象音乐节上人们欢庆的场景
> - 联想春节时家人团聚的节日氛围
3. 近义词: celebration, holiday, event, gala
>- 反义词: 
>- 派生词: festive（adj. 节日的）, festivity（n. 庆祝活动）
>
> 相关短语:
> - music festival（音乐节）
> - film festival（电影节）
> - Spring Festival（春节）
> - art festival（艺术节）
> - cultural festival（文化节）
相关词汇: - 单词: festival
- 音标: /ˈfestəvəl/
- 词性: n.（名词）
- 中文释义: (电影、戏剧、音乐等的)节，节庆，汇演',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: different (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9ebc3d6a-9b78-4151-8821-507e7f315de6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'different',
    '类型: 单词
例句: 1. 单词: different
> - 音标: /ˈdɪfərənt/
> - 词性: adj.（形容词）
> - 中文释义: 不同的，不一样的
2. different 来自 differ（不同）+ -ent（形容词后缀）
> - 想象两个人站在一起，他们看起来不一样
>
> 场景记忆法：
> - 想象比较两个不同颜色的苹果
> - 联想学校里有不同性格的同学
3. 近义词: various, diverse, distinct, unlike
>- 反义词: same, identical, similar
>- 派生词: difference（n. 不同）, differently（adv. 不同地）
>
> 相关短语:
> - different from（与...不同）
> - different kinds of（不同种类的）
> - something different（一些不同的东西）
> - be different（是不同的）
> - look different（看起来不同）
相关词汇: - 单词: different
- 音标: /ˈdɪfərənt/
- 词性: adj.（形容词）
- 中文释义: 不同的，不一样的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shelf (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1ba902bc-bcaa-4bc3-82ee-96fd8747a29a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shelf',
    '类型: 单词
例句: 1. 单词: shelf
> - 音标: /ʃelf/
> - 词性: n.（名词）
> - 中文释义: 搁板，架子
2. shelf 发音类似"谢尔夫"，可以联想"谢尔夫架子"
> - 想象书架上整齐摆放的书籍
>
> 场景记忆法：
> - 想象图书馆里的一排排书架
> - 联想家里书柜上的搁板
3. 近义词: rack, ledge, bookcase
>- 反义词: 
>- 派生词: shelves（复数形式）
>
> 相关短语:
> - on the shelf（在架子上）
> - top shelf（顶层架子）
> - bottom shelf（底层架子）
> - book shelf（书架）
> - kitchen shelf（厨房架子）
相关词汇: - 单词: shelf
- 音标: /ʃelf/
- 词性: n.（名词）
- 中文释义: 搁板，架子',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: paper-cutting (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '045a98cc-726b-4661-babc-7ca14ff918b6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'paper-cutting',
    '类型: 单词
例句: 1. 单词: paper-cutting
> - 音标: /ˈpeɪpə ˈkʌtɪŋ/
> - 词性: n.（名词）
> - 中文释义: 剪纸
2. paper（纸）+ cutting（切割）= 剪纸
> - 想象用剪刀在纸上剪出各种图案
>
> 场景记忆法：
> - 想象春节时窗户上贴的红色剪纸
> - 联想中国传统艺术展览中的剪纸作品
3. 近义词: paper art, cut-out art
>- 反义词: 
>- 派生词: paper-cutter（n. 剪纸艺术家）
>
> 相关短语:
> - Chinese paper-cutting（中国剪纸）
> - paper-cutting art（剪纸艺术）
> - paper-cutting design（剪纸图案）
> - paper-cutting decoration（剪纸装饰）
> - learn paper-cutting（学习剪纸）
相关词汇: - 单词: paper-cutting
- 音标: /ˈpeɪpə ˈkʌtɪŋ/
- 词性: n.（名词）
- 中文释义: 剪纸',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rock music (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '30003acc-87c9-433b-ad80-4e186bcf9233',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rock music',
    '类型: 单词
例句: 1. 单词: rock music
> - 音标: /rɒk ˈmjuːzɪk/
> - 词性: n.（名词短语）
> - 中文释义: 摇滚乐
2. rock（摇滚）+ music（音乐）= 摇滚音乐
> - 想象摇滚乐手在舞台上激烈演奏的场景
>
> 场景记忆法：
> - 想象音乐节上人们随着摇滚乐摇摆的场景
> - 联想电吉他、鼓声等摇滚乐的特征元素
3. 近义词: rock and roll, rock ''n'' roll
>- 反义词: classical music, folk music
>- 派生词: rocker（n. 摇滚乐手）, rocky（adj. 摇滚的）
>
> 相关短语:
> - rock band（摇滚乐队）
> - rock concert（摇滚音乐会）
> - rock star（摇滚明星）
> - heavy metal（重金属音乐）
相关词汇: - 单词: rock music
- 音标: /rɒk ˈmjuːzɪk/
- 词性: n.（名词短语）
- 中文释义: 摇滚乐',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hit (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '34950feb-96e0-43a2-8464-2d885cbc5813',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hit',
    '类型: 单词
例句: 1. 单词: hit
> - 音标: /hɪt/
> - 词性: v.（动词）
> - 中文释义: 使(某人)突然意识到
2. 想象被什么东西"击中"后突然明白的感觉
> - 联想灯泡亮起的瞬间，表示突然明白
>
> 用法记忆法：
> - hit 在这个意思中通常用 "it hits someone that..." 的句型
> - 想象被"击中"后恍然大悟的场景
3. 近义词: strike, occur to, dawn on, come to realize
>- 反义词: 
>- 派生词: hitting（现在分词）
>
> 相关短语:
> - hit someone（使某人突然意识到）
> - it hits me that...（我突然意识到...）
> - hit home（击中要害，让人明白）
> - hit the nail on the head（一针见血）
相关词汇: - 单词: hit
- 音标: /hɪt/
- 词性: v.（动词）
- 中文释义: 使(某人)突然意识到',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: high (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ae30c2f0-8747-41b0-8df7-1679a649a01f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'high',
    '类型: 单词
例句: 1. 单词: high
> - 音标: /haɪ/
> - 词性: adj.（形容词）
> - 中文释义: 高的
2. high 发音类似"海"，可以联想"海平面很高"
> - 想象向上看高楼的场景
>
> 场景记忆法：
> - 想象站在高楼大厦下面向上看
> - 联想爬山时看到的高山
3. 近义词: tall, elevated, lofty, towering
>- 反义词: low, short, deep
>- 派生词: height（n. 高度）, highly（adv. 高度地）
>
> 相关短语:
> - high school（高中）
> - high mountain（高山）
> - high building（高楼）
> - high temperature（高温）
> - jump high（跳得高）
相关词汇: - 单词: high
- 音标: /haɪ/
- 词性: adj.（形容词）
- 中文释义: 高的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: classmate (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2d881eb3-0030-4912-b1ca-0bcb34fe5b60',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'classmate',
    '类型: 单词
例句: 1. 单词: classmate
> - 音标: /ˈklɑːsmeɪt/
> - 词性: n.（名词）
> - 中文释义: 同班同学
2. class（班级）+ mate（伙伴）= classmate（同班同学）
> - 想象在同一个班级里学习的伙伴
>
> 场景记忆法：
> - 想象教室里坐在一起学习的同学们
> - 联想课间休息时和同学一起玩耍的场景
3. 近义词: schoolmate, fellow student, peer
>- 反义词: teacher, stranger
>- 派生词: classmates（复数形式）
>
> 相关短语:
> - old classmate（老同学）
> - new classmate（新同学）
> - classmate from school（学校同班同学）
> - help a classmate（帮助同班同学）
> - study with classmates（和同班同学一起学习）
相关词汇: - 单词: classmate
- 音标: /ˈklɑːsmeɪt/
- 词性: n.（名词）
- 中文释义: 同班同学',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: club (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'bc33869e-3fb4-442b-ac01-e34f36d9e5ca',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'club',
    '类型: 单词
例句: 1. 单词: club
> - 音标: /klʌb/
> - 词性: n.（名词）
> - 中文释义: 俱乐部
2. club 发音类似"克拉布"，可以联想"克拉布俱乐部"
> - 想象一群人聚集在一起做共同感兴趣的事情
>
> 场景记忆法：
> - 想象学校里的各种俱乐部：音乐俱乐部、艺术俱乐部等
> - 联想俱乐部成员一起活动的场景
3. 近义词: organization, society, group, association
>- 反义词: individual, solo
>- 派生词: clubber（n. 俱乐部成员）
>
> 相关短语:
> - join a club（加入俱乐部）
> - book club（读书俱乐部）
> - sports club（体育俱乐部）
> - chess club（国际象棋俱乐部）
> - club member（俱乐部成员）
相关词汇: - 单词: club
- 音标: /klʌb/
- 词性: n.（名词）
- 中文释义: 俱乐部',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: everybody (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ff33bb08-5aae-4e94-90ba-e701b38d0410',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'everybody',
    '类型: 单词
例句: 1. 单词: everybody
> - 音标: /ˈevrɪbɒdi/
> - 词性: pron.（代词）
> - 中文释义: 每个人，人人
2. every（每个）+ body（身体）= 每个身体 = 每个人
> - 想象一个房间里有很多人，每个人都在场
>
> 场景记忆法：
> - 想象老师对全班同学说"Everybody, please sit down."
> - 联想聚会上主人对客人说"Everybody, welcome!"
3. 近义词: everyone, all people, each person
>- 反义词: nobody, no one
>- 派生词: everybody''s（所有人的，名词所有格）
>
> 相关短语:
> - everybody else（其他所有人）
> - everybody knows（每个人都知道）
> - everybody''s business（大家的事）
> - for everybody（为每个人）
> - everybody together（大家一起）
相关词汇: - 单词: everybody
- 音标: /ˈevrɪbɒdi/
- 词性: pron.（代词）
- 中文释义: 每个人，人人',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: enjoy (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '476cdd78-5c90-4907-ac10-7632df700374',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'enjoy',
    '类型: 单词
例句: 1. 单词: enjoy
> - 音标: /ɪnˈdʒɔɪ/
> - 词性: v.（动词）
> - 中文释义: 喜欢；享受
2. enjoy 发音类似"因乔伊"，可以联想"因为乔伊而享受"
> - 想象做自己喜欢的事情时感到快乐
>
> 场景记忆法：
> - 想象在公园里享受阳光和新鲜空气
> - 联想和朋友一起享受美好时光的场景
3. 近义词: like, love, appreciate, relish
>- 反义词: dislike, hate, detest
>- 派生词: enjoyment（n. 享受）, enjoyable（adj. 令人愉快的）
>
> 相关短语:
> - enjoy doing（喜欢做某事）
> - enjoy oneself（玩得开心）
> - enjoy the moment（享受当下）
> - enjoy life（享受生活）
> - enjoy the show（欣赏演出）
相关词汇: - 单词: enjoy
- 音标: /ɪnˈdʒɔɪ/
- 词性: v.（动词）
- 中文释义: 喜欢；享受',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: magic (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fca1681a-b40a-4a34-89bd-93e23741ecf3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'magic',
    '类型: 单词
例句: 1. 单词: magic
> - 音标: /ˈmædʒɪk/
> - 词性: adj.（形容词）
> - 中文释义: 有魔力的，神奇的
2. magic 发音类似"马吉克"，可以联想"马吉克魔法"
> - 想象魔术师变魔术的场景
>
> 场景记忆法：
> - 想象迪士尼电影中的魔法场景
> - 联想魔术师表演时的神奇效果
3. 近义词: magical, enchanting, miraculous, wonderful
>- 反义词: ordinary, normal, common, real
>- 派生词: magical（adj. 魔法的）, magician（n. 魔术师）
>
> 相关短语:
> - magic show（魔术表演）
> - magic trick（魔术把戏）
> - magic wand（魔法棒）
> - magic moment（神奇时刻）
> - magic touch（神奇魔力）
相关词汇: - 单词: magic
- 音标: /ˈmædʒɪk/
- 词性: adj.（形容词）
- 中文释义: 有魔力的，神奇的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: traditional (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '52155793-4bfa-4a81-a764-6f3efd290a16',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'traditional',
    '类型: 单词
例句: 1. 单词: traditional
> - 音标: /trəˈdɪʃənəl/
> - 词性: adj.（形容词）
> - 中文释义: 传统的；习俗的；惯例的
2. tradition（传统）+ -al（形容词后缀）= 传统的
> - 想象代代相传的古老习俗和传统
>
> 场景记忆法：
> - 想象春节时家人团聚的传统习俗
> - 联想古代建筑和传统艺术
3. 近义词: conventional, customary, classic, ancient
>- 反义词: modern, contemporary, new, innovative
>- 派生词: tradition（n. 传统）, traditionally（adv. 传统上）
>
> 相关短语:
> - traditional culture（传统文化）
> - traditional food（传统食物）
> - traditional music（传统音乐）
> - traditional costume（传统服装）
> - traditional festival（传统节日）
相关词汇: - 单词: traditional
- 音标: /trəˈdɪʃənəl/
- 词性: adj.（形容词）
- 中文释义: 传统的；习俗的；惯例的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: smile (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a8cfc15c-fc93-4db3-9cd6-a86d648e7293',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'smile',
    '类型: 单词
例句: 1. 单词: smile
> - 音标: /smaɪl/
> - 词性: n.（名词）/ v.（动词）
> - 中文释义: 笑容；微笑
2. smile 发音类似"斯迈尔"，可以联想"斯迈尔微笑"
> - 想象嘴角上扬形成微笑的动作
>
> 场景记忆法：
> - 想象朋友见面时互相微笑的场景
> - 联想拍照时说"cheese"时露出的微笑
3. 近义词: grin, beam, laugh
>- 反义词: frown, scowl, grimace
>- 派生词: smiling（现在分词）, smiled（过去式/过去分词）
>
> 相关短语:
> - smile at someone（对某人微笑）
> - big smile（灿烂的笑容）
> - warm smile（温暖的微笑）
> - smile broadly（开怀大笑）
> - force a smile（强颜欢笑）
相关词汇: - 单词: smile
- 音标: /smaɪl/
- 词性: n.（名词）/ v.（动词）
- 中文释义: 笑容；微笑',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lonely (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd384eae7-51e4-410a-adfa-10890c3844e9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lonely',
    '类型: 单词
例句: 1. 单词: lonely
> - 音标: /ˈləʊnli/
> - 词性: adj.（形容词）
> - 中文释义: 孤单的，寂寞的
2. lonely 发音类似"洛恩利"，可以联想"洛恩利孤单"
> - 想象一个人独自在房间里的场景
>
> 场景记忆法：
> - 想象夜晚独自一人在家的感觉
> - 联想新环境中没有朋友的孤独感
3. 近义词: alone, isolated, solitary, lonesome
>- 反义词: accompanied, together, social, surrounded
>- 派生词: loneliness（n. 孤单，寂寞）
>
> 相关短语:
> - feel lonely（感到孤单）
> - lonely person（孤单的人）
> - lonely place（孤单的地方）
> - lonely heart（寂寞的心）
> - never lonely（从不孤单）
相关词汇: - 单词: lonely
- 音标: /ˈləʊnli/
- 词性: adj.（形容词）
- 中文释义: 孤单的，寂寞的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: practice (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e7e07f5d-0b2a-400f-be9a-b6b4110593aa',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'practice',
    '类型: 单词
例句: 1. 单词: practice
> - 音标: /ˈpræktɪs/
> - 词性: n.（名词）
> - 中文释义: 练习
2. practice 发音类似"普拉提斯"，可以联想"普拉提练习"
> - 想象反复练习某个技能的场景
>
> 场景记忆法：
> - 想象学生在教室里练习写字的场景
> - 联想运动员在训练场上练习的场景
3. 近义词: exercise, training, rehearsal, drill
>- 反义词: theory, knowledge without practice
>- 派生词: practice（v. 练习）, practical（adj. 实用的）
>
> 相关短语:
> - practice doing（练习做某事）
> - in practice（在实践中）
> - put into practice（付诸实践）
> - practice session（练习课）
> - practice makes perfect（熟能生巧）
相关词汇: - 单词: practice
- 音标: /ˈpræktɪs/
- 词性: n.（名词）
- 中文释义: 练习',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: adventure (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '03a1723b-9415-4458-9236-2a4b2fd11529',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'adventure',
    '类型: 单词
例句: 1. 单词: adventure
> - 音标: /ədˈventʃə/
> - 词性: n.（名词）
> - 中文释义: 历险；奇遇
2. ad（向）+ venture（冒险）= adventure（冒险）
> - 想象勇敢的探险家在未知领域冒险
>
> 场景记忆法：
> - 想象在丛林中探险的场景
> - 联想电影中的冒险故事情节
3. 近义词: expedition, journey, quest, exploration
>- 反义词: safety, security, routine
>- 派生词: adventurous（adj. 冒险的）, adventurer（n. 冒险家）
>
> 相关短语:
> - go on an adventure（去冒险）
> - adventure story（冒险故事）
> - great adventure（伟大的冒险）
> - adventure travel（冒险旅行）
> - sense of adventure（冒险精神）
相关词汇: - 单词: adventure
- 音标: /ədˈventʃə/
- 词性: n.（名词）
- 中文释义: 历险；奇遇',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: midnight (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '29ceb806-ec55-430e-9ff9-62e06da30990',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'midnight',
    '类型: 单词
例句: 1. 单词: midnight
> - 音标: /ˈmɪdnaɪt/
> - 词性: n.（名词）
> - 中文释义: 午夜
2. mid（中间）+ night（夜晚）= midnight（午夜）
> - 想象夜晚的中间时刻
>
> 场景记忆法：
> - 想象深夜时分，万籁俱寂的场景
> - 联想童话故事中灰姑娘在午夜离开舞会
3. 近义词: 12 o''clock at night, witching hour
>- 反义词: noon, midday
>- 派生词: midnightly（adv. 在午夜）
>
> 相关短语:
> - at midnight（在午夜）
> - before midnight（午夜前）
> - after midnight（午夜后）
> - midnight snack（午夜小吃）
> - midnight blue（午夜蓝）
相关词汇: - 单词: midnight
- 音标: /ˈmɪdnaɪt/
- 词性: n.（名词）
- 中文释义: 午夜',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: leave (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ab5b3818-a329-4951-a715-6e6a707563fd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'leave',
    '类型: 单词
例句: 1. 单词: leave
> - 音标: /liːv/
> - 词性: v.（动词）
> - 中文释义: 离开
2. leave 发音类似"利夫"，可以联想"利夫离开"
> - 想象挥手告别的动作
>
> 场景记忆法：
> - 想象放学后离开学校的场景
> - 联想和朋友告别时的"再见"
3. 近义词: go away, depart, exit, go
>- 反义词: arrive, come, stay, remain
>- 派生词: leaving（现在分词）, left（过去式/过去分词）
>
> 相关短语:
> - leave home（离开家）
> - leave school（离开学校）
> - leave behind（留下，遗忘）
> - leave alone（不管，不理）
> - take leave（请假，告别）
相关词汇: - 单词: leave
- 音标: /liːv/
- 词性: v.（动词）
- 中文释义: 离开',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ground (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '02565a24-69f1-429b-9a5d-e197d428d123',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ground',
    '类型: 单词
例句: 1. 单词: ground
> - 音标: /graʊnd/
> - 词性: n.（名词）
> - 中文释义: 地，地面
2. ground 发音类似"格朗德"，可以联想"格朗德地面"
> - 想象脚踩在地面上的感觉
>
> 场景记忆法：
> - 想象在公园里坐在草地上
> - 联想足球场上运动员奔跑的地面
3. 近义词: earth, floor, surface, soil
>- 反义词: sky, air, ceiling
>- 派生词: grounded（adj. 接地的）
>
> 相关短语:
> - on the ground（在地上）
> - ground level（地面水平）
> - hit the ground（着地）
> - ground floor（一楼）
> - solid ground（坚实的地面）
相关词汇: - 单词: ground
- 音标: /graʊnd/
- 词性: n.（名词）
- 中文释义: 地，地面',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: stage (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c4f40e1c-912e-47f3-be45-8f72cce21d6c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'stage',
    '类型: 单词
例句: 1. 单词: stage
> - 音标: /steɪdʒ/
> - 词性: n.（名词）
> - 中文释义: 舞台
2. stage 发音类似"斯泰吉"，可以联想"斯泰吉舞台"
> - 想象演员在舞台上表演的场景
>
> 场景记忆法：
> - 想象学校礼堂里的舞台
> - 联想剧院里的大舞台和聚光灯
3. 近义词: platform, podium, theater floor
>- 反义词: audience area, backstage
>- 派生词: staging（n. 舞台布置）, staged（adj. 舞台的）
>
> 相关短语:
> - on stage（在舞台上）
> - go on stage（上台表演）
> - stage fright（怯场）
> - stage lighting（舞台灯光）
> - main stage（主舞台）
相关词汇: - 单词: stage
- 音标: /steɪdʒ/
- 词性: n.（名词）
- 中文释义: 舞台',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: band (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f4679d4f-e456-4398-93dd-c932d160d037',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'band',
    '类型: 单词
例句: 1. 单词: band
> - 音标: /bænd/
> - 词性: n.（名词）
> - 中文释义: 乐队，乐团
2. band 发音类似"班德"，可以联想"班级的乐队"
> - 想象乐队成员一起演奏音乐的场景
>
> 场景记忆法：
> - 想象音乐会上乐队在舞台上表演的场景
> - 联想学校乐队在操场上排练的场景
3. 近义词: group, ensemble, orchestra
>- 反义词: soloist（独奏者）
>- 派生词: bandleader（n. 乐队指挥）, bandstand（n. 音乐台）
>
> 相关短语:
> - rock band（摇滚乐队）
> - school band（学校乐队）
> - marching band（军乐队）
> - jazz band（爵士乐队）
> - band member（乐队成员）
相关词汇: - 单词: band
- 音标: /bænd/
- 词性: n.（名词）
- 中文释义: 乐队，乐团',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: suddenly (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b57d9450-aa46-4700-98ed-ba2d9b0ccc2d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'suddenly',
    '类型: 单词
例句: 1. 单词: suddenly
> - 音标: /ˈsʌdnli/
> - 词性: adv.（副词）
> - 中文释义: 突然，突如其来地
2. sudden（突然的）+ -ly（副词后缀）= suddenly（突然地）
> - 想象一个意外事件突然发生的场景
>
> 场景记忆法：
> - 想象正在走路时突然下雨的场景
> - 联想电影中突然出现的惊险情节
3. 近义词: unexpectedly, abruptly, all of a sudden
>- 反义词: gradually, slowly, step by step
>- 派生词: sudden（adj. 突然的）, suddenness（n. 突然性）
>
> 相关短语:
> - all of a sudden（突然）
> - suddenly realize（突然意识到）
> - suddenly stop（突然停止）
> - suddenly appear（突然出现）
> - suddenly remember（突然想起）
相关词汇: - 单词: suddenly
- 音标: /ˈsʌdnli/
- 词性: adv.（副词）
- 中文释义: 突然，突如其来地',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: electric (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5a4a4d23-0aeb-4acd-b1fb-e665498b18b2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'electric',
    '类型: 单词
例句: 1. 单词: electric
> - 音标: /ɪˈlektrɪk/
> - 词性: adj.（形容词）
> - 中文释义: 用电的；电动的
2. electric 来自 electricity（电）+ -ic（形容词后缀）
> - 想象电器设备需要插电才能工作的场景
>
> 场景记忆法：
> - 想象家里的各种电器：电灯、电视、电冰箱等
> - 联想电吉他需要插电才能发出声音
3. 近义词: electrical, electronic
>- 反义词: manual, mechanical
>- 派生词: electricity（n. 电）, electrical（adj. 电的）, electronic（adj. 电子的）
>
> 相关短语:
> - electric guitar（电吉他）
> - electric car（电动汽车）
> - electric light（电灯）
> - electric fan（电风扇）
> - electric shock（电击）
相关词汇: - 单词: electric
- 音标: /ɪˈlektrɪk/
- 词性: adj.（形容词）
- 中文释义: 用电的；电动的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: volleyball (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f61e1a90-17df-49d2-abe0-17e5794c02db',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'volleyball',
    '类型: 单词
例句: 1. 单词: volleyball
> - 音标: /ˈvɒlibɔːl/
> - 词性: n.（名词）
> - 中文释义: 排球(运动)
2. volley（齐射）+ ball（球）= 排球
> - 想象排球在空中飞来飞去的场景
>
> 场景记忆法：
> - 想象沙滩上人们打排球的场景
> - 联想奥运会上的排球比赛
3. 近义词: 
>- 反义词: 
>- 派生词: volleyballer（n. 排球运动员）
>
> 相关短语:
> - play volleyball（打排球）
> - volleyball court（排球场）
> - volleyball team（排球队）
> - beach volleyball（沙滩排球）
> - volleyball game（排球比赛）
相关词汇: - 单词: volleyball
- 音标: /ˈvɒlibɔːl/
- 词性: n.（名词）
- 中文释义: 排球(运动)',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: joy (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '90acf509-5503-4cf5-9ae4-b2d41ff8386f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'joy',
    '类型: 单词
例句: 1. 单词: joy
> - 音标: /dʒɔɪ/
> - 词性: n.（名词）
> - 中文释义: 欢欣，愉快，喜悦
2. joy 发音类似"乔伊"，可以联想"乔伊快乐"
> - 想象开心时脸上露出的笑容
>
> 场景记忆法：
> - 想象生日派对上的欢乐气氛
> - 联想收到礼物时的喜悦心情
3. 近义词: happiness, delight, pleasure, cheer
>- 反义词: sadness, sorrow, grief, misery
>- 派生词: joyful（adj. 快乐的）, joyfully（adv. 快乐地）
>
> 相关短语:
> - jump for joy（高兴地跳起来）
> - bring joy（带来欢乐）
> - full of joy（充满喜悦）
> - share joy（分享喜悦）
> - tears of joy（喜悦的眼泪）
相关词汇: - 单词: joy
- 音标: /dʒɔɪ/
- 词性: n.（名词）
- 中文释义: 欢欣，愉快，喜悦',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: nature (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5d6fedb8-4972-4633-ad5f-c13ce603a83c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'nature',
    '类型: 单词
例句: 1. 单词: nature
> - 音标: /ˈneɪtʃə/
> - 词性: n.（名词）
> - 中文释义: 大自然，自然界
2. nature 发音类似"内切尔"，可以联想"内切尔自然"
> - 想象森林、山川、河流等自然景观
>
> 场景记忆法：
> - 想象在森林里呼吸新鲜空气
> - 联想国家公园里的自然风光
3. 近义词: environment, wilderness, natural world
>- 反义词: artificial, man-made
>- 派生词: natural（adj. 自然的）, naturally（adv. 自然地）
>
> 相关短语:
> - in nature（在大自然中）
> - nature reserve（自然保护区）
> - nature study（自然研究）
> - nature walk（自然漫步）
> - protect nature（保护大自然）
相关词汇: - 单词: nature
- 音标: /ˈneɪtʃə/
- 词性: n.（名词）
- 中文释义: 大自然，自然界',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: page (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a5103d16-3c68-46a6-9fce-0ce8af2026db',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'page',
    '类型: 单词
例句: 1. 单词: page
> - 音标: /peɪdʒ/
> - 词性: n.（名词）
> - 中文释义: (书、报纸、文件等的)页，面
2. page 发音类似"佩奇"，可以联想"佩奇页面"
> - 想象翻书时的页面
>
> 场景记忆法：
> - 想象在图书馆里翻书查找信息
> - 联想老师让学生翻到指定页面的场景
3. 近义词: sheet, leaf
>- 反义词: 
>- 派生词: pages（复数形式）
>
> 相关短语:
> - turn the page（翻页）
> - next page（下一页）
> - previous page（上一页）
> - blank page（空白页）
> - page number（页码）
相关词汇: - 单词: page
- 音标: /peɪdʒ/
- 词性: n.（名词）
- 中文释义: (书、报纸、文件等的)页，面',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: guitar (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '478b5f67-4534-44de-a90d-401f24521116',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'guitar',
    '类型: 单词
例句: 1. 单词: guitar
> - 音标: /ɡɪˈtɑː/
> - 词性: n.（名词）
> - 中文释义: 吉他
2. guitar 发音类似"吉他"，直接音译记忆
> - 想象吉他手弹奏吉他的动作和声音
>
> 场景记忆法：
> - 想象音乐课上老师教学生弹吉他的场景
> - 联想吉他手在舞台上表演的场景
3. 近义词: string instrument（弦乐器）
>- 反义词: 
>- 派生词: guitarist（n. 吉他手）
>
> 相关短语:
> - electric guitar（电吉他）
> - acoustic guitar（原声吉他）
> - classical guitar（古典吉他）
> - play the guitar（弹吉他）
> - guitar lesson（吉他课）
相关词汇: - 单词: guitar
- 音标: /ɡɪˈtɑː/
- 词性: n.（名词）
- 中文释义: 吉他',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: weak (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '56c8e5de-242d-4fde-b130-61747916c0e2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'weak',
    '类型: 单词
例句: 1. 单词: weak
> - 音标: /wiːk/
> - 词性: adj.（形容词）
> - 中文释义: 虚弱的，不强壮的
2. weak 发音类似"威克"，可以联想"威克虚弱"
> - 想象一个虚弱的人需要帮助的场景
>
> 场景记忆法：
> - 想象生病时身体虚弱的感觉
> - 联想老人走路时需要搀扶的场景
3. 近义词: feeble, frail, fragile, powerless
>- 反义词: strong, powerful, robust, healthy
>- 派生词: weakness（n. 虚弱）, weaken（v. 使虚弱）
>
> 相关短语:
> - feel weak（感到虚弱）
> - weak point（弱点）
> - weak heart（心脏虚弱）
> - weak voice（微弱的声音）
> - grow weak（变得虚弱）
相关词汇: - 单词: weak
- 音标: /wiːk/
- 词性: adj.（形容词）
- 中文释义: 虚弱的，不强壮的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: instrument (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ca493a9d-9990-407c-ad0a-090f6a02a0ba',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'instrument',
    '类型: 单词
例句: 1. 单词: instrument
> - 音标: /ˈɪnstrəmənt/
> - 词性: n.（名词）
> - 中文释义: 乐器
2. instru（指导）+ ment（名词后缀）= 用来指导的工具 = 乐器
> - 想象用乐器演奏音乐来指导情感
>
> 场景记忆法：
> - 想象音乐教室里摆放着各种乐器的场景
> - 联想管弦乐队演奏时各种乐器的配合
3. 近义词: musical instrument, tool, device
>- 反义词: 
>- 派生词: instrumental（adj. 乐器的）, instrumentalist（n. 乐器演奏者）
>
> 相关短语:
> - musical instrument（乐器）
> - string instrument（弦乐器）
> - wind instrument（管乐器）
> - percussion instrument（打击乐器）
> - play an instrument（演奏乐器）
相关词汇: - 单词: instrument
- 音标: /ˈɪnstrəmənt/
- 词性: n.（名词）
- 中文释义: 乐器',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shake (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '14290d1e-0380-4b79-83ee-818ce8d01e68',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shake',
    '类型: 单词
例句: 1. 单词: shake
> - 音标: /ʃeɪk/
> - 词性: v.（动词）
> - 中文释义: 摇动
2. shake 发音类似"谢克"，可以联想"谢克摇动"
> - 想象摇动瓶子的动作
>
> 场景记忆法：
> - 想象握手时的摇动动作
> - 联想地震时建筑物的摇动
3. 近义词: tremble, vibrate, rock, sway
>- 反义词: stay still, remain motionless
>- 派生词: shaking（现在分词）, shook（过去式）, shaken（过去分词）
>
> 相关短语:
> - shake hands（握手）
> - shake one''s head（摇头）
> - shake off（摆脱，甩掉）
> - shake up（摇匀，震动）
> - shake with fear（因恐惧而颤抖）
相关词汇: - 单词: shake
- 音标: /ʃeɪk/
- 词性: v.（动词）
- 中文释义: 摇动',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: almost (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'afcf6efb-f318-480d-9149-bc9e74f1b7ff',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'almost',
    '类型: 单词
例句: 1. 单词: almost
> - 音标: /ˈɔːlməʊst/
> - 词性: adv.（副词）
> - 中文释义: 几乎，差不多
2. almost 发音类似"奥莫斯特"，可以联想"奥莫斯特差不多"
> - 想象接近目标但还没达到的状态
>
> 场景记忆法：
> - 想象考试时几乎答完所有题目的状态
> - 联想跑步时几乎到达终点的感觉
3. 近义词: nearly, about, approximately, just about
>- 反义词: exactly, precisely, completely
>- 派生词: 
>
> 相关短语:
> - almost always（几乎总是）
> - almost never（几乎从不）
> - almost there（快到了）
> - almost ready（差不多准备好了）
> - almost finished（几乎完成了）
相关词汇: - 单词: almost
- 音标: /ˈɔːlməʊst/
- 词性: adv.（副词）
- 中文释义: 几乎，差不多',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hold (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ae745f9f-ce25-42c5-b97e-1405269842bc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hold',
    '类型: 单词
例句: 1. 单词: hold
> - 音标: /həʊld/
> - 词性: v.（动词）
> - 中文释义: 握住，抓住；抱住
2. hold 发音类似"霍尔德"，可以联想"霍尔德住"
> - 想象用手抓住或握住某物的动作
>
> 场景记忆法：
> - 想象妈妈抱着婴儿的场景
> - 联想朋友之间握手或拥抱的场景
3. 近义词: grasp, grip, carry, embrace
>- 反义词: drop, release, let go
>- 派生词: holding（现在分词）, held（过去式/过去分词）
>
> 相关短语:
> - hold hands（握手）
> - hold on（坚持，等一下）
> - hold up（举起，支撑）
> - hold back（阻止，抑制）
> - hold tight（紧紧抓住）
相关词汇: - 单词: hold
- 音标: /həʊld/
- 词性: v.（动词）
- 中文释义: 握住，抓住；抱住',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: appear (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '946a1034-f21c-4f12-9a9d-9bf8d9808378',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'appear',
    '类型: 单词
例句: 1. 单词: appear
> - 音标: /əˈpɪə/
> - 词性: v.（动词）
> - 中文释义: (尤指突然)出现，呈现
2. appear 发音类似"阿皮尔"，可以联想"阿皮尔出现"
> - 想象某物突然出现在视野中
>
> 场景记忆法：
> - 想象魔术师变出东西的场景
> - 联想太阳从地平线升起的场景
3. 近义词: show up, emerge, come into view, materialize
>- 反义词: disappear, vanish, hide
>- 派生词: appearance（n. 出现，外貌）, apparent（adj. 明显的）
>
> 相关短语:
> - appear suddenly（突然出现）
> - appear to be（看起来是）
> - appear from nowhere（从无处出现）
> - appear on stage（出现在舞台上）
> - make appear（使出现）
相关词汇: - 单词: appear
- 音标: /əˈpɪə/
- 词性: v.（动词）
- 中文释义: (尤指突然)出现，呈现',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: skate (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5ae096f2-5447-47cd-b6fb-a7eb81ea9d5a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'skate',
    '类型: 单词
例句: 1. 单词: skate
> - 音标: /skeɪt/
> - 词性: v.（动词）
> - 中文释义: 滑冰，溜冰
2. skate 发音类似"斯凯特"，可以联想"斯凯特滑冰"
> - 想象在冰面上滑行的动作
>
> 场景记忆法：
> - 想象溜冰场上人们滑冰的场景
> - 联想冬季奥运会上的花样滑冰比赛
3. 近义词: glide, slide, roller skate
>- 反义词: walk, run
>- 派生词: skating（现在分词）, skater（n. 滑冰者）
>
> 相关短语:
> - ice skate（滑冰）
> - roller skate（轮滑）
> - go skating（去滑冰）
> - figure skating（花样滑冰）
> - speed skating（速滑）
相关词汇: - 单词: skate
- 音标: /skeɪt/
- 词性: v.（动词）
- 中文释义: 滑冰，溜冰',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sound (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '740faa15-7148-4d09-a858-33edfc3c86d3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sound',
    '类型: 单词
例句: 1. 单词: sound
> - 音标: /saʊnd/
> - 词性: n.（名词）
> - 中文释义: 声音
2. sound 发音类似"桑德"，可以联想"声音很响"
> - 想象各种声音：鸟叫声、音乐声、说话声等
>
> 场景记忆法：
> - 想象在森林里听到各种自然声音的场景
> - 联想音乐会上听到美妙音乐的场景
3. 近义词: noise, voice, audio
>- 反义词: silence（寂静）
>- 派生词: soundless（adj. 无声的）, soundly（adv. 彻底地）
>
> 相关短语:
> - sound system（音响系统）
> - sound effect（音效）
> - sound wave（声波）
> - make a sound（发出声音）
> - sound like（听起来像）
相关词汇: - 单词: sound
- 音标: /saʊnd/
- 词性: n.（名词）
- 中文释义: 声音',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: notebook (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd1642afa-46fc-465c-84d7-0b468483d3d6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'notebook',
    '类型: 单词
例句: 1. 单词: notebook
> - 音标: /ˈnəʊtbʊk/
> - 词性: n.（名词）
> - 中文释义: 笔记本
2. note（笔记）+ book（书）= notebook（笔记本）
> - 想象用来写笔记的书本
>
> 场景记忆法：
> - 想象课堂上学生在笔记本上记笔记
> - 联想文具店里摆放的各种笔记本
3. 近义词: journal, diary, exercise book
>- 反义词: 
>- 派生词: notebooks（复数形式）
>
> 相关短语:
> - open notebook（打开笔记本）
> - write in notebook（在笔记本上写）
> - school notebook（学校笔记本）
> - notebook paper（笔记本纸）
> - keep notebook（保存笔记本）
相关词汇: - 单词: notebook
- 音标: /ˈnəʊtbʊk/
- 词性: n.（名词）
- 中文释义: 笔记本',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: awake (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '17774960-10bf-4d92-87d0-8c2c476c32e2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'awake',
    '类型: 单词
例句: 1. 单词: awake
> - 音标: /əˈweɪk/
> - 词性: adj.（形容词）
> - 中文释义: 醒着的
2. awake 发音类似"阿威克"，可以联想"阿威克醒着"
> - 想象睁开眼睛醒来的状态
>
> 场景记忆法：
> - 想象早晨醒来时的状态
> - 联想夜晚失眠时保持清醒的状态
3. 近义词: conscious, alert, wakeful
>- 反义词: asleep, sleeping, unconscious
>- 派生词: awaken（v. 唤醒）, wake（v. 醒来）
>
> 相关短语:
> - stay awake（保持清醒）
> - wide awake（完全清醒）
> - keep awake（保持醒着）
> - awake early（醒得早）
> - half awake（半醒半睡）
相关词汇: - 单词: awake
- 音标: /əˈweɪk/
- 词性: adj.（形容词）
- 中文释义: 醒着的',
    'vocabulary',
    'word',
    '初一',
    'Unit 2',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: son (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f83b53f3-2803-4bc4-8ddb-a8b5d73d0fb8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'son',
    '类型: 单词
例句: 1. 单词: son
> - 音标: /sʌn/
> - 词性: n.（名词）
> - 中文释义: 儿子
2. son 发音类似"桑"，可以联想"桑儿子"
> - 想象父亲和儿子的温馨画面
>
> 场景记忆法：
> - 想象家庭中父亲和儿子的关系
> - 联想"太阳"sun和"儿子"son的发音相似
3. 近义词: boy, child
>- 反义词: daughter, father, mother
>- 派生词: sons（复数形式）
>
> 相关短语:
> - only son（独生子）
> - eldest son（长子）
> - youngest son（小儿子）
> - son and daughter（儿子和女儿）
> - proud son（骄傲的儿子）
相关词汇: - 单词: son
- 音标: /sʌn/
- 词性: n.（名词）
- 中文释义: 儿子',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: queen (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ba67b87d-cb41-4697-9f3e-8be3ad77fa6f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'queen',
    '类型: 单词
例句: 1. 单词: queen
> - 音标: /kwiːn/
> - 词性: n.（名词）
> - 中文释义: 女王
2. queen 发音类似"昆"，可以联想"昆女王"
> - 想象戴着王冠的女王形象
>
> 场景记忆法：
> - 想象童话故事中的女王形象
> - 联想英国女王伊丽莎白二世的形象
3. 近义词: monarch, ruler, sovereign
>- 反义词: king, prince
>- 派生词: queenly（adj. 女王般的）
>
> 相关短语:
> - queen bee（蜂王）
> - beauty queen（选美皇后）
> - queen of hearts（红桃皇后）
> - queen size（大号床）
> - drama queen（戏剧女王，爱夸张的人）
相关词汇: - 单词: queen
- 音标: /kwiːn/
- 词性: n.（名词）
- 中文释义: 女王',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: change (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0494d253-bac8-4c79-87f1-dcd936ac63a0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'change',
    '类型: 单词
例句: 1. 单词: change
> - 音标: /tʃeɪndʒ/
> - 词性: v.（动词）
> - 中文释义: 换(衣服)
2. change 发音类似"钱吉"，可以联想"钱吉换衣服"
> - 想象换衣服的动作
>
> 场景记忆法：
> - 想象出门前换衣服的场景
> - 联想试衣间里换衣服的画面
3. 近义词: replace, switch, alter, modify
>- 反义词: keep, maintain, stay
>- 派生词: changing（现在分词）, changed（过去式/过去分词）
>
> 相关短语:
> - change clothes（换衣服）
> - change one''s mind（改变主意）
> - change the subject（改变话题）
> - change for the better（变好）
> - change hands（易手）
相关词汇: - 单词: change
- 音标: /tʃeɪndʒ/
- 词性: v.（动词）
- 中文释义: 换(衣服)',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: growth (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2502878c-ac33-486f-a13c-9dcd928f7775',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'growth',
    '类型: 单词
例句: 1. 单词: growth
> - 音标: /ɡrəʊθ/
> - 词性: n.（名词）
> - 中文释义: (性格、智力或情感的)发展，成长
2. growth 发音类似"格罗斯"，可以联想"格罗斯成长"
> - 想象植物生长的过程
>
> 场景记忆法：
> - 想象小树苗长成大树的成长过程
> - 联想孩子从婴儿到成人的成长历程
3. 近义词: development, progress, expansion, increase
>- 反义词: decline, decrease, shrinkage
>- 派生词: grow（v. 成长）, growing（adj. 成长的）
>
> 相关短语:
> - economic growth（经济增长）
> - personal growth（个人成长）
> - growth rate（增长率）
> - growth spurt（快速成长）
> - growth mindset（成长型思维）
相关词汇: - 单词: growth
- 音标: /ɡrəʊθ/
- 词性: n.（名词）
- 中文释义: (性格、智力或情感的)发展，成长',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: memory (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '63ca37a3-3883-4062-9ef5-2e1f2591f270',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'memory',
    '类型: 单词
例句: 1. 单词: memory
> - 音标: /ˈmeməri/
> - 词性: n.（名词）
> - 中文释义: 记忆，回忆
2. memory 发音类似"梅莫瑞"，可以联想"梅莫瑞记忆"
> - 想象大脑中存储记忆的地方
>
> 场景记忆法：
> - 想象回忆往事时的场景
> - 联想电脑的内存存储功能
3. 近义词: recollection, remembrance, recall
>- 反义词: forgetfulness, amnesia
>- 派生词: memorize（v. 记忆）, memorable（adj. 难忘的）
>
> 相关短语:
> - good memory（好记性）
> - bad memory（记性差）
> - lose memory（失去记忆）
> - in memory of（为了纪念）
> - memory lane（回忆之路）
相关词汇: - 单词: memory
- 音标: /ˈmeməri/
- 词性: n.（名词）
- 中文释义: 记忆，回忆',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: trailer (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1e4c24b8-9f33-4d91-a6e9-88766a277037',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'trailer',
    '类型: 单词
例句: 1. 单词: trailer
> - 音标: /ˈtreɪlə/
> - 词性: n.（名词）
> - 中文释义: 拖车，挂车
2. trailer 发音类似"特雷勒"，可以联想"特雷勒拖车"
> - 想象卡车后面拖着的挂车
>
> 场景记忆法：
> - 想象高速公路上卡车拖着挂车的场景
> - 联想房车拖车的旅行生活
3. 近义词: wagon, cart, van
>- 反义词: 
>- 派生词: trail（v. 拖拽）
>
> 相关短语:
> - truck trailer（卡车挂车）
> - mobile home trailer（移动房屋拖车）
> - movie trailer（电影预告片）
> - trailer park（拖车公园）
> - pull a trailer（拖挂车）
相关词汇: - 单词: trailer
- 音标: /ˈtreɪlə/
- 词性: n.（名词）
- 中文释义: 拖车，挂车',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: care (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2f76ecee-2302-46ac-8744-54607e484ba1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'care',
    '类型: 单词
例句: 1. 单词: care
> - 音标: /keə/
> - 词性: n.（名词）
> - 中文释义: 关心
2. care 发音类似"凯尔"，可以联想"凯尔关心"
> - 想象关心他人的温暖感觉
>
> 场景记忆法：
> - 想象父母关心孩子的温馨场景
> - 联想朋友之间相互关心的画面
3. 近义词: concern, attention, worry, love
>- 反义词: neglect, indifference, ignore
>- 派生词: careful（adj. 小心的）, caring（adj. 关心的）
>
> 相关短语:
> - take care of（照顾）
> - care about（关心，在乎）
> - care for（照顾，喜欢）
> - with care（小心地）
> - health care（医疗保健）
相关词汇: - 单词: care
- 音标: /keə/
- 词性: n.（名词）
- 中文释义: 关心',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: road (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0aa68b7e-08a0-4db1-8794-9eab1c9c907b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'road',
    '类型: 单词
例句: 1. 单词: road
> - 音标: /rəʊd/
> - 词性: n.（名词）
> - 中文释义: 路，道路，公路
2. road 发音类似"罗德"，可以联想"罗德道路"
> - 想象车辆行驶在道路上的场景
>
> 场景记忆法：
> - 想象城市里纵横交错的街道
> - 联想高速公路上的车流
3. 近义词: street, path, highway, way
>- 反义词: 
>- 派生词: roadside（n. 路边）
>
> 相关短语:
> - main road（主干道）
> - country road（乡村道路）
> - cross the road（过马路）
> - road construction（道路建设）
> - on the road（在路上）
相关词汇: - 单词: road
- 音标: /rəʊd/
- 词性: n.（名词）
- 中文释义: 路，道路，公路',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: race (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e166f28b-1dee-46b8-b81e-fc840cac839d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'race',
    '类型: 单词
例句: 1. 单词: race
> - 音标: /reɪs/
> - 词性: v.（动词）
> - 中文释义: 比赛
2. race 发音类似"雷斯"，可以联想"雷斯比赛"
> - 想象赛跑比赛的场景
>
> 场景记忆法：
> - 想象田径场上的跑步比赛
> - 联想F1赛车比赛的激烈场面
3. 近义词: compete, run, contest, dash
>- 反义词: walk, stroll
>- 派生词: racing（现在分词）, raced（过去式/过去分词）
>
> 相关短语:
> - race against（与...比赛）
> - race to（争相...）
> - horse race（赛马）
> - car race（赛车）
> - race track（跑道）
相关词汇: - 单词: race
- 音标: /reɪs/
- 词性: v.（动词）
- 中文释义: 比赛',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: serious (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '816d3dfb-048c-4824-8e75-19d7400280bc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'serious',
    '类型: 单词
例句: 1. 单词: serious
> - 音标: /ˈsɪəriəs/
> - 词性: adj.（形容词）
> - 中文释义: 严重的
2. serious 发音类似"西瑞尔斯"，可以联想"西瑞尔斯严重"
> - 想象严肃认真的表情
>
> 场景记忆法：
> - 想象医生诊断严重病情时的严肃表情
> - 联想老师批评学生时的严肃态度
3. 近义词: severe, grave, critical, important
>- 反义词: minor, trivial, light, funny
>- 派生词: seriously（adv. 严重地）, seriousness（n. 严重性）
>
> 相关短语:
> - serious problem（严重问题）
> - serious illness（严重疾病）
> - serious accident（严重事故）
> - serious injury（严重伤害）
> - take seriously（认真对待）
相关词汇: - 单词: serious
- 音标: /ˈsɪəriəs/
- 词性: adj.（形容词）
- 中文释义: 严重的',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pick up (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ebe1c88b-47a0-4a93-b8e6-8e05563f1f53',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pick up',
    '类型: 单词
例句: 1. 单词: pick up
> - 音标: /pɪk ʌp/
> - 词性: v.（动词短语）
> - 中文释义: 搭载，接载
2. pick（挑选，拾起）+ up（向上）= pick up（接载）
> - 想象开车去接人的动作
>
> 场景记忆法：
> - 想象家长开车到学校接孩子的场景
> - 联想出租车司机接载乘客的画面
3. 近义词: collect, fetch, gather, lift
>- 反义词: drop off, leave
>- 派生词: pickup（n. 接载，皮卡车）
>
> 相关短语:
> - pick up someone（接某人）
> - pick up the phone（接电话）
> - pick up speed（加速）
> - pick up a habit（养成习惯）
> - pick up the pieces（收拾残局）
相关词汇: - 单词: pick up
- 音标: /pɪk ʌp/
- 词性: v.（动词短语）
- 中文释义: 搭载，接载',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: handsome (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f07b7998-22db-4438-a7ea-6e691470c2a3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'handsome',
    '类型: 单词
例句: 1. 单词: handsome
> - 音标: /ˈhænsəm/
> - 词性: adj.（形容词）
> - 中文释义: (男子)英俊的，漂亮的
2. handsome 发音类似"汉瑟姆"，可以联想"汉瑟姆英俊"
> - 想象一个英俊男子的形象
>
> 场景记忆法：
> - 想象电影中英俊男主角的形象
> - 联想童话故事中英俊王子的形象
3. 近义词: good-looking, attractive, beautiful, good
>- 反义词: ugly, unattractive
>- 派生词: handsomely（adv. 英俊地）
>
> 相关短语:
> - handsome man（英俊的男人）
> - handsome face（英俊的面孔）
> - handsome prince（英俊的王子）
> - look handsome（看起来很帅）
> - handsome reward（丰厚的报酬）
相关词汇: - 单词: handsome
- 音标: /ˈhænsəm/
- 词性: adj.（形容词）
- 中文释义: (男子)英俊的，漂亮的',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: power (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '71711db9-5f05-4851-be02-b1790b235c22',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'power',
    '类型: 单词
例句: 1. 单词: power
> - 音标: /ˈpaʊə/
> - 词性: v.（动词）
> - 中文释义: 给(车辆或机器)提供动力
2. power 发音类似"帕沃"，可以联想"帕沃动力"
> - 想象发动机提供动力的场景
>
> 场景记忆法：
> - 想象汽车发动机运转提供动力的画面
> - 联想太阳能板为设备供电的场景
3. 近义词: drive, energize, fuel, run
>- 反义词: stop, shut down
>- 派生词: powered（过去式/过去分词）, powering（现在分词）
>
> 相关短语:
> - power up（启动，供电）
> - power down（关闭，断电）
> - solar powered（太阳能供电的）
> - battery powered（电池供电的）
> - power source（动力源）
相关词汇: - 单词: power
- 音标: /ˈpaʊə/
- 词性: v.（动词）
- 中文释义: 给(车辆或机器)提供动力',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: kiss (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0a4a2dfb-4aa7-4e7c-99c2-152fd99cf221',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'kiss',
    '类型: 单词
例句: 1. 单词: kiss
> - 音标: /kɪs/
> - 词性: n.（名词）
> - 中文释义: 吻
2. kiss 发音类似"基斯"，可以联想"基斯吻"
> - 想象亲吻的甜蜜动作
>
> 场景记忆法：
> - 想象父母亲吻孩子的温馨场景
> - 联想恋人之间的浪漫亲吻
3. 近义词: peck, smooch, buss
>- 反义词: 
>- 派生词: kissing（现在分词）, kissed（过去式/过去分词）
>
> 相关短语:
> - goodnight kiss（晚安吻）
> - kiss goodbye（吻别）
> - first kiss（初吻）
> - kiss on the cheek（脸颊上的吻）
> - blow a kiss（飞吻）
相关词汇: - 单词: kiss
- 音标: /kɪs/
- 词性: n.（名词）
- 中文释义: 吻',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hug (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd5a9f823-cd96-48c3-934c-ea49be427de9',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hug',
    '类型: 单词
例句: 1. 单词: hug
> - 音标: /hʌɡ/
> - 词性: n.（名词）
> - 中文释义: 拥抱
2. hug 发音类似"哈格"，可以联想"哈格拥抱"
> - 想象两个人拥抱的温暖动作
>
> 场景记忆法：
> - 想象久别重逢时的拥抱场景
> - 联想安慰朋友时的拥抱
3. 近义词: embrace, cuddle, squeeze
>- 反义词: push away, reject
>- 派生词: hugging（现在分词）, hugged（过去式/过去分词）
>
> 相关短语:
> - give a hug（给一个拥抱）
> - warm hug（温暖的拥抱）
> - big hug（大大的拥抱）
> - hug tightly（紧紧拥抱）
> - group hug（集体拥抱）
相关词汇: - 单词: hug
- 音标: /hʌɡ/
- 词性: n.（名词）
- 中文释义: 拥抱',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: result (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '10ec4faa-6fbd-4f55-8eed-354c3bfb40ee',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'result',
    '类型: 单词
例句: 1. 单词: result
> - 音标: /rɪˈzʌlt/
> - 词性: n.（名词）
> - 中文释义: 结果，后果
2. result 发音类似"瑞萨尔特"，可以联想"瑞萨尔特结果"
> - 想象等待结果揭晓的时刻
>
> 场景记忆法：
> - 想象考试成绩公布时的场景
> - 联想比赛结束后公布结果的画面
3. 近义词: outcome, consequence, effect, conclusion
>- 反义词: cause, reason
>- 派生词: resulting（adj. 结果的）
>
> 相关短语:
> - as a result（结果）
> - final result（最终结果）
> - exam result（考试结果）
> - positive result（积极结果）
> - negative result（消极结果）
相关词汇: - 单词: result
- 音标: /rɪˈzʌlt/
- 词性: n.（名词）
- 中文释义: 结果，后果',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: silent (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '86149d1a-6c9c-4ca5-9874-ea221a6ec7a4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'silent',
    '类型: 单词
例句: 1. 单词: silent
> - 音标: /ˈsaɪlənt/
> - 词性: adj.（形容词）
> - 中文释义: 不作声的
2. silent 发音类似"赛伦特"，可以联想"赛伦特安静"
> - 想象图书馆里安静无声的场景
>
> 场景记忆法：
> - 想象夜晚时分，万籁俱寂的安静环境
> - 联想考试时教室里安静的氛围
3. 近义词: quiet, still, noiseless, soundless
>- 反义词: noisy, loud, talkative
>- 派生词: silence（n. 安静）, silently（adv. 安静地）
>
> 相关短语:
> - silent reading（默读）
> - silent night（寂静的夜晚）
> - remain silent（保持沉默）
> - silent movie（默片）
> - silent treatment（冷处理）
相关词汇: - 单词: silent
- 音标: /ˈsaɪlənt/
- 词性: adj.（形容词）
- 中文释义: 不作声的',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: strict (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1455126b-e5da-41e3-a4d3-1a7001ca61d1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'strict',
    '类型: 单词
例句: 1. 单词: strict
> - 音标: /strɪkt/
> - 词性: adj.（形容词）
> - 中文释义: 严格的，严厉的
2. strict 发音类似"斯特里克特"，可以联想"斯特里克特严格"
> - 想象老师严肃的表情
>
> 场景记忆法：
> - 想象学校老师严格要求学生的场景
> - 联想军队中严格的纪律
3. 近义词: severe, harsh, rigid, firm
>- 反义词: lenient, gentle, easy, flexible
>- 派生词: strictly（adv. 严格地）, strictness（n. 严格）
>
> 相关短语:
> - strict teacher（严格的老师）
> - strict rules（严格的规则）
> - strict discipline（严格的纪律）
> - be strict with（对...严格）
> - strict control（严格控制）
相关词汇: - 单词: strict
- 音标: /strɪkt/
- 词性: adj.（形容词）
- 中文释义: 严格的，严厉的',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mountain (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2b078ee7-331d-484f-a573-8421059ab80f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mountain',
    '类型: 单词
例句: 1. 单词: mountain
> - 音标: /ˈmaʊntɪn/
> - 词性: n.（名词）
> - 中文释义: 高山，山岳
2. mountain 发音类似"芒廷"，可以联想"芒廷高山"
> - 想象高耸入云的山峰
>
> 场景记忆法：
> - 想象登山时看到的高山景色
> - 联想喜马拉雅山脉的壮观景象
3. 近义词: hill, peak, summit, mount
>- 反义词: valley, plain
>- 派生词: mountainous（adj. 多山的）
>
> 相关短语:
> - mountain climbing（登山）
> - mountain top（山顶）
> - mountain range（山脉）
> - mountain view（山景）
> - high mountain（高山）
相关词汇: - 单词: mountain
- 音标: /ˈmaʊntɪn/
- 词性: n.（名词）
- 中文释义: 高山，山岳',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: across (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '95a38f99-7206-4b4c-bec0-568121f0d671',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'across',
    '类型: 单词
例句: 1. 单词: across
> - 音标: /əˈkrɒs/
> - 词性: prep.（介词）
> - 中文释义: 从一边到另一边；穿过
2. across 发音类似"阿克罗斯"，可以联想"阿克罗斯穿过"
> - 想象从一边到另一边的动作
>
> 场景记忆法：
> - 想象过马路时从一边走到另一边
> - 联想桥横跨河流的景象
3. 近义词: through, over, beyond
>- 反义词: along, beside
>- 派生词: 
>
> 相关短语:
> - across from（在...对面）
> - across the street（在街对面）
> - across the country（全国）
> - across the world（全世界）
> - come across（偶然遇到）
相关词汇: - 单词: across
- 音标: /əˈkrɒs/
- 词性: prep.（介词）
- 中文释义: 从一边到另一边；穿过',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: along (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '646dbaff-c198-4e40-986c-93ad00e2ae22',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'along',
    '类型: 单词
例句: 1. 单词: along
> - 音标: /əˈlɒŋ/
> - 词性: prep.（介词）
> - 中文释义: 顺着，沿着
2. along 发音类似"阿朗"，可以联想"阿朗沿着"
> - 想象沿着某条路线行走的动作
>
> 场景记忆法：
> - 想象在河边沿着河岸散步的场景
> - 联想开车沿着公路行驶的画面
3. 近义词: beside, by, next to, following
>- 反义词: across, through
>- 派生词: alongside（prep. 在...旁边）
>
> 相关短语:
> - along with（和...一起）
> - come along（一起来）
> - get along（相处，进展）
> - all along（一直，始终）
> - go along（进行，进展）
相关词汇: - 单词: along
- 音标: /əˈlɒŋ/
- 词性: prep.（介词）
- 中文释义: 顺着，沿着',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pull (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b1373101-b84f-40b5-bfcf-44f7cf5e3257',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pull',
    '类型: 单词
例句: 1. 单词: pull
> - 音标: /pʊl/
> - 词性: v.（动词）
> - 中文释义: 拉；扯；拖
2. pull 发音类似"普尔"，可以联想"普尔拉"
> - 想象拉东西的动作
>
> 场景记忆法：
> - 想象拔河比赛中拉绳子的动作
> - 联想开门时拉门把手的动作
3. 近义词: drag, tug, draw, haul
>- 反义词: push, shove
>- 派生词: pulling（现在分词）, pulled（过去式/过去分词）
>
> 相关短语:
> - pull open（拉开）
> - pull out（拉出，拔出）
> - pull up（拉起，停车）
> - pull down（拉下，拆除）
> - pull through（度过难关）
相关词汇: - 单词: pull
- 音标: /pʊl/
- 词性: v.（动词）
- 中文释义: 拉；扯；拖',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hide (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2888a493-9f5c-4cf1-9c14-7eb2ef7347c8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hide',
    '类型: 单词
例句: 1. 单词: hide
> - 音标: /haɪd/
> - 词性: v.（动词）
> - 中文释义: 把……藏起来，隐藏
2. hide 发音类似"海德"，可以联想"海德隐藏"
> - 想象躲猫猫游戏中的隐藏
>
> 场景记忆法：
> - 想象玩捉迷藏时躲藏的场景
> - 联想把东西藏在秘密地方的动作
3. 近义词: conceal, cover, bury, disguise
>- 反义词: show, reveal, expose, display
>- 派生词: hiding（现在分词）, hidden（过去分词）
>
> 相关短语:
> - hide and seek（捉迷藏）
> - hide from（躲避）
> - hide away（躲起来）
> - hide the truth（隐藏真相）
> - hide one''s feelings（隐藏感情）
相关词汇: - 单词: hide
- 音标: /haɪd/
- 词性: v.（动词）
- 中文释义: 把……藏起来，隐藏',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: follow (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '37d28c1f-fc72-4b80-b1ad-6fd5ceca3b9f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'follow',
    '类型: 单词
例句: 1. 单词: follow
> - 音标: /ˈfɒləʊ/
> - 词性: v.（动词）
> - 中文释义: 跟着，跟随
2. follow 发音类似"法洛"，可以联想"法洛跟随"
> - 想象一个人跟在另一个人后面的动作
>
> 场景记忆法：
> - 想象导游带领游客游览的场景
> - 联想小鸭子跟着母鸭子的画面
3. 近义词: trail, pursue, obey, go after
>- 反义词: lead, precede, ignore
>- 派生词: following（adj. 接下来的）, follower（n. 跟随者）
>
> 相关短语:
> - follow someone（跟随某人）
> - follow the rules（遵守规则）
> - follow one''s dream（追求梦想）
> - follow instructions（按照指示）
> - follow up（跟进，继续）
相关词汇: - 单词: follow
- 音标: /ˈfɒləʊ/
- 词性: v.（动词）
- 中文释义: 跟着，跟随',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: carry (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f7ce5dad-2b30-4727-adfa-a22ff9e27825',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'carry',
    '类型: 单词
例句: 1. 单词: carry
> - 音标: /ˈkæri/
> - 词性: v.（动词）
> - 中文释义: 把(某物或某人)带至(新的地点或位置)
2. carry 发音类似"凯瑞"，可以联想"凯瑞搬运"
> - 想象搬运东西的动作
>
> 场景记忆法：
> - 想象搬家公司搬运家具的场景
> - 联想学生背着书包上学的画面
3. 近义词: transport, move, take, bring
>- 反义词: drop, leave
>- 派生词: carrying（现在分词）, carried（过去式/过去分词）
>
> 相关短语:
> - carry on（继续）
> - carry out（执行，实施）
> - carry away（带走，冲走）
> - carry through（完成，坚持到底）
> - carry the day（获胜）
相关词汇: - 单词: carry
- 音标: /ˈkæri/
- 词性: v.（动词）
- 中文释义: 把(某物或某人)带至(新的地点或位置)',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: matter (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '51d1a9af-e9b0-41bd-9fa0-af7bdb8eb3f6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'matter',
    '类型: 单词
例句: 1. 单词: matter
> - 音标: /ˈmætə/
> - 词性: v.（动词）
> - 中文释义: (尤指对某人自己或对发生之事)重要，要紧，有关系
2. matter 发音类似"马特"，可以联想"马特重要"
> - 想象重要的事情需要关注
>
> 场景记忆法：
> - 想象讨论重要事情时的场景
> - 联想"没关系"和"很重要"的对比
3. 近义词: count, be important, be significant
>- 反义词: be unimportant, be insignificant
>- 派生词: mattering（现在分词）, mattered（过去式/过去分词）
>
> 相关短语:
> - it doesn''t matter（没关系）
> - what matters（重要的是）
> - matter to someone（对某人重要）
> - as a matter of fact（事实上）
> - no matter what（无论如何）
相关词汇: - 单词: matter
- 音标: /ˈmætə/
- 词性: v.（动词）
- 中文释义: (尤指对某人自己或对发生之事)重要，要紧，有关系',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: seldom (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9c291cd2-906b-43ad-b27b-66f0d92a4761',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'seldom',
    '类型: 单词
例句: 1. 单词: seldom
> - 音标: /ˈseldəm/
> - 词性: adv.（副词）
> - 中文释义: 很少，罕见，不常
2. seldom 发音类似"塞尔德姆"，可以联想"塞尔德姆很少"
> - 想象很少发生的事情
>
> 场景记忆法：
> - 想象很少去的地方或很少做的事情
> - 联想"很少"的频率概念
3. 近义词: rarely, hardly ever, infrequently
>- 反义词: often, frequently, always
>- 派生词: 
>
> 相关短语:
> - seldom do（很少做）
> - seldom see（很少看到）
> - seldom happen（很少发生）
> - seldom used（很少使用）
> - seldom visit（很少访问）
相关词汇: - 单词: seldom
- 音标: /ˈseldəm/
- 词性: adv.（副词）
- 中文释义: 很少，罕见，不常',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: refuse (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ad6a1b7d-243c-405a-bdbb-1c0fd3ca178c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'refuse',
    '类型: 单词
例句: 1. 单词: refuse
> - 音标: /rɪˈfjuːz/
> - 词性: v.（动词）
> - 中文释义: 拒绝，回绝
2. refuse 发音类似"瑞夫兹"，可以联想"瑞夫兹拒绝"
> - 想象摇头拒绝的动作
>
> 场景记忆法：
> - 想象拒绝别人请求时的场景
> - 联想面试中被拒绝的画面
3. 近义词: reject, decline, turn down, deny
>- 反义词: accept, agree, approve
>- 派生词: refusal（n. 拒绝）, refusing（现在分词）
>
> 相关短语:
> - refuse to do（拒绝做）
> - refuse an offer（拒绝提议）
> - refuse help（拒绝帮助）
> - refuse permission（拒绝许可）
> - flatly refuse（断然拒绝）
相关词汇: - 单词: refuse
- 音标: /rɪˈfjuːz/
- 词性: v.（动词）
- 中文释义: 拒绝，回绝',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: position (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '623aa02d-3900-401f-abcf-f8a8c6f49a08',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'position',
    '类型: 单词
例句: 1. 单词: position
> - 音标: /pəˈzɪʃən/
> - 词性: n.（名词）
> - 中文释义: 职位，职务
2. position 发音类似"珀兹申"，可以联想"珀兹申职位"
> - 想象办公室里的工作职位
>
> 场景记忆法：
> - 想象求职时看到的工作职位
> - 联想公司组织架构中的不同职位
3. 近义词: job, post, role, rank
>- 反义词: 
>- 派生词: positional（adj. 位置的）
>
> 相关短语:
> - job position（工作职位）
> - senior position（高级职位）
> - apply for position（申请职位）
> - position available（职位空缺）
> - position description（职位描述）
相关词汇: - 单词: position
- 音标: /pəˈzɪʃən/
- 词性: n.（名词）
- 中文释义: 职位，职务',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: touching (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5fdae10f-535d-467d-aa94-b23e520b01b2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'touching',
    '类型: 单词
例句: 1. 单词: touching
> - 音标: /ˈtʌtʃɪŋ/
> - 词性: adj.（形容词）
> - 中文释义: 感人的，动人的
2. touch（触摸，感动）+ -ing（形容词后缀）= touching（感人的）
> - 想象被感动到内心深处的感觉
>
> 场景记忆法：
> - 想象看感人电影时流泪的场景
> - 联想听到感人故事时内心的触动
3. 近义词: moving, emotional, heartwarming, touching
>- 反义词: cold, unemotional, indifferent
>- 派生词: touch（v. 触摸，感动）, touched（adj. 被感动的）
>
> 相关短语:
> - touching story（感人的故事）
> - touching moment（感人的时刻）
> - touching speech（感人的演讲）
> - touching ending（感人的结局）
> - deeply touching（深深感人的）
相关词汇: - 单词: touching
- 音标: /ˈtʌtʃɪŋ/
- 词性: adj.（形容词）
- 中文释义: 感人的，动人的',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: serve (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e6a14c81-f1a1-4377-9d90-a704623ec481',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'serve',
    '类型: 单词
例句: 1. 单词: serve
> - 音标: /sɜːv/
> - 词性: v.（动词）
> - 中文释义: 为……工作；供职
2. serve 发音类似"瑟夫"，可以联想"瑟夫服务"
> - 想象服务员为客人服务的场景
>
> 场景记忆法：
> - 想象餐厅里服务员端菜的场景
> - 联想军人保家卫国的服务精神
3. 近义词: work for, help, assist, provide
>- 反义词: 
>- 派生词: service（n. 服务）, server（n. 服务员）
>
> 相关短语:
> - serve someone（为某人服务）
> - serve the country（为国家服务）
> - serve as（担任，充当）
> - serve food（提供食物）
> - serve a purpose（起到作用）
相关词汇: - 单词: serve
- 音标: /sɜːv/
- 词性: v.（动词）
- 中文释义: 为……工作；供职',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: marry (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '23d256a9-9539-463e-ae97-60f879866237',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'marry',
    '类型: 单词
例句: 1. 单词: marry
> - 音标: /ˈmæri/
> - 词性: v.（动词）
> - 中文释义: 结婚；娶；嫁
2. marry 发音类似"玛丽"，可以联想"玛丽结婚"
> - 想象婚礼上的新娘新郎
>
> 场景记忆法：
> - 想象教堂里举行婚礼的浪漫场景
> - 联想新娘穿着婚纱的美丽画面
3. 近义词: wed, get married, tie the knot
>- 反义词: divorce, separate
>- 派生词: marriage（n. 婚姻）, married（adj. 已婚的）
>
> 相关短语:
> - get married（结婚）
> - marry someone（与某人结婚）
> - marry young（早婚）
> - marry for love（为爱结婚）
> - marry into（嫁入）
相关词汇: - 单词: marry
- 音标: /ˈmæri/
- 词性: v.（动词）
- 中文释义: 结婚；娶；嫁',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: area (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a9956980-1724-4afc-99f0-ccc92f6642d6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'area',
    '类型: 单词
例句: 1. 单词: area
> - 音标: /ˈeəriə/
> - 词性: n.（名词）
> - 中文释义: (国家，市镇等的)地区，区域
2. area 发音类似"艾瑞亚"，可以联想"艾瑞亚区域"
> - 想象地图上划分的不同区域
>
> 场景记忆法：
> - 想象城市地图上不同的功能区域
> - 联想学校、住宅、商业等不同区域
3. 近义词: region, zone, district, place
>- 反义词: 
>- 派生词: areas（复数形式）
>
> 相关短语:
> - residential area（住宅区）
> - shopping area（购物区）
> - business area（商业区）
> - rural area（农村地区）
> - urban area（城市地区）
相关词汇: - 单词: area
- 音标: /ˈeəriə/
- 词性: n.（名词）
- 中文释义: (国家，市镇等的)地区，区域',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: absent (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9106d2a2-53c3-4704-a69d-51fd405a240c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'absent',
    '类型: 单词
例句: 1. 单词: absent
> - 音标: /ˈæbsənt/
> - 词性: adj.（形容词）
> - 中文释义: 不在的，缺席的
2. absent 发音类似"阿布森特"，可以联想"阿布森特缺席"
> - 想象教室里空着的座位
>
> 场景记忆法：
> - 想象老师点名时发现有人缺席
> - 联想请假条上写着"因故缺席"
3. 近义词: missing, not present, away
>- 反义词: present, here, attending
>- 派生词: absence（n. 缺席）, absently（adv. 心不在焉地）
>
> 相关短语:
> - absent from（缺席，不在）
> - absent student（缺席的学生）
> - absent without leave（无故缺席）
> - be absent（缺席）
> - absent-minded（心不在焉的）
相关词汇: - 单词: absent
- 音标: /ˈæbsənt/
- 词性: adj.（形容词）
- 中文释义: 不在的，缺席的',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: stay (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '567f003f-ac86-4622-978b-cb2919aab7bb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'stay',
    '类型: 单词
例句: 1. 单词: stay
> - 音标: /steɪ/
> - 词性: v.（动词）
> - 中文释义: 停留，逗留，留下
2. stay 发音类似"斯泰"，可以联想"斯泰停留"
> - 想象在一个地方停留不动的动作
>
> 场景记忆法：
> - 想象在酒店住宿停留的场景
> - 联想在家里待着不出去的画面
3. 近义词: remain, continue, keep, live
>- 反义词: leave, go, depart, move
>- 派生词: staying（现在分词）, stayed（过去式/过去分词）
>
> 相关短语:
> - stay at（住在）
> - stay home（待在家里）
> - stay calm（保持冷静）
> - stay healthy（保持健康）
> - stay in touch（保持联系）
相关词汇: - 单词: stay
- 音标: /steɪ/
- 词性: v.（动词）
- 中文释义: 停留，逗留，留下',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: bright (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9802848b-39e7-4c1c-9181-dd918de5051b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'bright',
    '类型: 单词
例句: 1. 单词: bright
> - 音标: /braɪt/
> - 词性: adj.（形容词）
> - 中文释义: 欢快的；充满生气的
2. bright 发音类似"布赖特"，可以联想"布赖特明亮"
> - 想象明亮的光线
>
> 场景记忆法：
> - 想象阳光明媚的早晨
> - 联想聪明学生眼中闪烁的光芒
3. 近义词: brilliant, shining, smart, cheerful
>- 反义词: dark, dim, dull, sad
>- 派生词: brightly（adv. 明亮地）, brightness（n. 亮度）
>
> 相关短语:
> - bright smile（灿烂的笑容）
> - bright future（光明的未来）
> - bright idea（好主意）
> - bright colors（鲜艳的颜色）
> - bright and early（一大早）
相关词汇: - 单词: bright
- 音标: /braɪt/
- 词性: adj.（形容词）
- 中文释义: 欢快的；充满生气的',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: tear (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4bdd34b5-2f9d-409e-b942-b5561d9beae4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'tear',
    '类型: 单词
例句: 1. 单词: tear
> - 音标: /tɪə/
> - 词性: n.（名词）
> - 中文释义: 眼泪，泪水
2. tear 发音类似"提尔"，可以联想"提尔眼泪"
> - 想象眼泪从眼中流出的样子
>
> 场景记忆法：
> - 想象看感人电影时流眼泪的场景
> - 联想伤心时眼泪止不住的样子
3. 近义词: teardrop, weeping
>- 反义词: smile, laughter
>- 派生词: tearful（adj. 含泪的）, tearfully（adv. 含泪地）
>
> 相关短语:
> - tears of joy（喜悦的眼泪）
> - tears of sadness（悲伤的眼泪）
> - wipe tears（擦眼泪）
> - burst into tears（突然哭起来）
> - crocodile tears（鳄鱼的眼泪，假哭）
相关词汇: - 单词: tear
- 音标: /tɪə/
- 词性: n.（名词）
- 中文释义: 眼泪，泪水',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: actress (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4e2bf6b2-59e8-489e-a17f-82fb0d673df1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'actress',
    '类型: 单词
例句: 1. 单词: actress
> - 音标: /ˈæktrɪs/
> - 词性: n.（名词）
> - 中文释义: 女演员
2. act（表演）+ -ress（女性后缀）= actress（女演员）
> - 想象女性在舞台上表演的场景
>
> 场景记忆法：
> - 想象电影中女演员的精彩表演
> - 联想戏剧舞台上女演员的演出
3. 近义词: performer, player, star
>- 反义词: actor（男演员）
>- 派生词: act（v. 表演）, acting（n. 表演）
>
> 相关短语:
> - famous actress（著名女演员）
> - talented actress（有天赋的女演员）
> - young actress（年轻女演员）
> - stage actress（舞台女演员）
> - movie actress（电影女演员）
相关词汇: - 单词: actress
- 音标: /ˈæktrɪs/
- 词性: n.（名词）
- 中文释义: 女演员',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: postman (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8ed5ede5-bcc7-4cf8-9ce9-955b0f33d7cd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'postman',
    '类型: 单词
例句: 1. 单词: postman
> - 音标: /ˈpəʊstmən/
> - 词性: n.（名词）
> - 中文释义: 邮递员，邮差
2. post（邮件）+ man（人）= postman（邮递员）
> - 想象送邮件的人
>
> 场景记忆法：
> - 想象邮递员骑着自行车送信的场景
> - 联想邮递员穿着制服背着邮包的形象
3. 近义词: mailman, postal worker, courier
>- 反义词: 
>- 派生词: postmen（复数形式）
>
> 相关短语:
> - friendly postman（友好的邮递员）
> - postman''s bag（邮递员的包）
> - postman''s uniform（邮递员制服）
> - postman''s route（邮递员路线）
> - postman''s bicycle（邮递员自行车）
相关词汇: - 单词: postman
- 音标: /ˈpəʊstmən/
- 词性: n.（名词）
- 中文释义: 邮递员，邮差',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: disease (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '18e252a9-e9dc-4229-b992-5c44aabf7dd6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'disease',
    '类型: 单词
例句: 1. 单词: disease
> - 音标: /dɪˈziːz/
> - 词性: n.（名词）
> - 中文释义: 疾病，病
2. disease 发音类似"迪兹兹"，可以联想"迪兹兹疾病"
> - 想象医院里治疗疾病的场景
>
> 场景记忆法：
> - 想象医生在诊断和治疗疾病
> - 联想医院里各种疾病的治疗
3. 近义词: illness, sickness, disorder, condition
>- 反义词: health, wellness
>- 派生词: diseased（adj. 患病的）
>
> 相关短语:
> - heart disease（心脏病）
> - infectious disease（传染病）
> - rare disease（罕见疾病）
> - prevent disease（预防疾病）
> - cure disease（治愈疾病）
相关词汇: - 单词: disease
- 音标: /dɪˈziːz/
- 词性: n.（名词）
- 中文释义: 疾病，病',
    'vocabulary',
    'word',
    '初一',
    'Unit 3',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: throw away (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '23ad5c85-8d1a-42f4-9deb-67f1404c7b9d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'throw away',
    '类型: 单词
例句: 1. 单词: throw away
> - 音标: /θrəʊ əˈweɪ/
> - 词性: 短语动词
> - 中文释义: 扔掉，丢弃
2. throw（扔）+ away（离开）= throw away（扔掉）
> - 想象把东西扔到垃圾桶的动作
>
> 场景记忆法：
> - 想象清理房间时扔掉不需要的东西
> - 联想垃圾分类时丢弃废物的场景
3. 近义词: discard, dispose of, get rid of
>- 反义词: keep, save, preserve
>- 派生词: 
>
> 相关短语:
> - throw away garbage（扔垃圾）
> - throw away old things（扔掉旧东西）
> - throw away waste（扔掉废物）
> - throw away opportunity（浪费机会）
> - throw away money（浪费钱）
相关词汇: - 单词: throw away
- 音标: /θrəʊ əˈweɪ/
- 词性: 短语动词
- 中文释义: 扔掉，丢弃',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: regret (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1d89cf58-aa6f-4877-8f8f-73881923a93d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'regret',
    '类型: 单词
例句: 1. 单词: regret
> - 音标: /rɪ''gret/
> - 词性: v.（动词）
> - 中文释义: 后悔(做了某事)；对…感到遗憾
2. regret 发音类似"瑞格瑞特"，可以联想"瑞格瑞特后悔"
> - 想象做错事后懊悔的表情
>
> 场景记忆法：
> - 想象错过重要机会后的懊悔心情
> - 联想说错话后想要收回的感觉
3. 近义词: be sorry, feel bad, repent
>- 反义词: be glad, be happy, celebrate
>- 派生词: regretful（adj. 后悔的）
>
> 相关短语:
> - regret doing（后悔做了...）
> - regret not doing（后悔没做...）
> - regret to say（遗憾地说）
> - deep regret（深深的遗憾）
> - no regrets（不后悔）
相关词汇: - 单词: regret
- 音标: /rɪ''gret/
- 词性: v.（动词）
- 中文释义: 后悔(做了某事)；对…感到遗憾',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: laugh (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '09549b48-de56-4c12-9da5-66ab05277960',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'laugh',
    '类型: 单词
例句: 1. 单词: laugh
> - 音标: /lɑ:f/
> - 词性: v.（动词）
> - 中文释义: 发出笑声，(大)笑
2. laugh 发音类似"拉夫"，可以联想"拉夫笑"
> - 想象开心大笑的声音
>
> 场景记忆法：
> - 想象朋友讲笑话时大家开怀大笑的场景
> - 联想孩子们玩耍时快乐的笑声
3. 近义词: giggle, chuckle, smile, roar
>- 反义词: cry, sob, frown
>- 派生词: laughing（现在分词）, laughed（过去式/过去分词）
>
> 相关短语:
> - laugh at（嘲笑，因...而笑）
> - laugh out loud（大声笑）
> - can''t help laughing（忍不住笑）
> - make someone laugh（逗某人笑）
> - laugh off（一笑而过）
相关词汇: - 单词: laugh
- 音标: /lɑ:f/
- 词性: v.（动词）
- 中文释义: 发出笑声，(大)笑',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dish (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '17122cc6-ed6a-4e75-907e-070515c9588c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dish',
    '类型: 单词
例句: 1. 单词: dish
> - 音标: /dɪʃ/
> - 词性: n.（名词）
> - 中文释义: (烹制好的)菜肴，一道菜
2. dish 发音类似"迪什"，可以联想"迪什菜肴"
> - 想象餐桌上摆放的美味菜肴
>
> 场景记忆法：
> - 想象餐厅里服务员端菜的场景
> - 联想家庭聚餐时桌上的各种菜肴
3. 近义词: food, meal, course, plate
>- 反义词: 
>- 派生词: dishes（复数形式）
>
> 相关短语:
> - main dish（主菜）
> - side dish（配菜）
> - favorite dish（最喜欢的菜）
> - wash dishes（洗碗）
> - dish out（分发）
相关词汇: - 单词: dish
- 音标: /dɪʃ/
- 词性: n.（名词）
- 中文释义: (烹制好的)菜肴，一道菜',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: balloon (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c785c6a1-1a0c-4776-aac8-5b0bf60a55e8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'balloon',
    '类型: 单词
例句: 1. 单词: balloon
> - 音标: /bə''lu:n/
> - 词性: n.（名词）
> - 中文释义: 气球
2. balloon 发音类似"巴伦"，可以联想"巴伦气球"
> - 想象彩色气球飘在空中的样子
>
> 场景记忆法：
> - 想象生日聚会上五颜六色的气球
> - 联想孩子们拿着气球玩耍的快乐场景
3. 近义词: 
>- 反义词: 
>- 派生词: balloons（复数形式）
>
> 相关短语:
> - hot air balloon（热气球）
> - balloon party（气球聚会）
> - blow up a balloon（吹气球）
> - pop a balloon（戳破气球）
> - balloon animal（气球动物）
相关词汇: - 单词: balloon
- 音标: /bə''lu:n/
- 词性: n.（名词）
- 中文释义: 气球',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: firework (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd400b849-2569-4250-aa5d-3c1ad0e0b2d0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'firework',
    '类型: 单词
例句: 1. 单词: firework
> - 音标: /''faɪəwɜ:k/
> - 词性: n.（名词）
> - 中文释义: 烟火，烟花
2. firework 发音类似"法尔沃克"，可以联想"法尔沃克烟花"
> - 想象夜空中绽放的美丽烟花
>
> 场景记忆法：
> - 想象节日庆典时烟花绽放的壮观场面
> - 联想孩子们观看烟花时的兴奋表情
3. 近义词: 
>- 反义词: 
>- 派生词: fireworks（复数形式）
>
> 相关短语:
> - firework display（烟花表演）
> - watch fireworks（观看烟花）
> - firework show（烟花秀）
> - beautiful fireworks（美丽的烟花）
> - firework festival（烟花节）
相关词汇: - 单词: firework
- 音标: /''faɪəwɜ:k/
- 词性: n.（名词）
- 中文释义: 烟火，烟花',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: knife (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3bcaf7ed-c7f3-466b-b717-723771555187',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'knife',
    '类型: 单词
例句: 1. 单词: knife
> - 音标: /naɪf/
> - 词性: n.（名词）
> - 中文释义: 刀
2. knife 发音类似"奈夫"，可以联想"奈夫刀"
> - 想象厨房里切菜的刀
>
> 场景记忆法：
> - 想象厨房里切菜做饭的场景
> - 联想餐厅里用餐具切食物的画面
3. 近义词: blade, cutter
>- 反义词: 
>- 派生词: knives（复数形式）
>
> 相关短语:
> - kitchen knife（菜刀）
> - butter knife（黄油刀）
> - sharp knife（锋利的刀）
> - cut with a knife（用刀切）
> - knife and fork（刀叉）
相关词汇: - 单词: knife
- 音标: /naɪf/
- 词性: n.（名词）
- 中文释义: 刀',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: meal (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3427f68c-cd2d-49aa-9e3e-e6f46ef0521e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'meal',
    '类型: 单词
例句: 1. 单词: meal
> - 音标: /mi:l/
> - 词性: n.（名词）
> - 中文释义: 一餐；饭
2. meal 发音类似"米尔"，可以联想"米尔餐"
> - 想象一家人围坐吃饭的场景
>
> 场景记忆法：
> - 想象餐厅里用餐的温馨画面
> - 联想家庭聚餐时的欢乐氛围
3. 近义词: food, dinner, lunch, breakfast
>- 反义词: 
>- 派生词: meals（复数形式）
>
> 相关短语:
> - have a meal（吃饭）
> - cook a meal（做饭）
> - special meal（特别的饭）
> - family meal（家庭聚餐）
> - meal time（用餐时间）
相关词汇: - 单词: meal
- 音标: /mi:l/
- 词性: n.（名词）
- 中文释义: 一餐；饭',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: celebrate (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '54255d72-241b-436e-9616-9a86b18322d8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'celebrate',
    '类型: 单词
例句: 1. 单词: celebrate
> - 音标: /''seləbreit/
> - 词性: v.（动词）
> - 中文释义: 庆祝
2. celebrate 发音类似"塞勒布雷特"，可以联想"塞勒布雷特庆祝"
> - 想象庆祝活动的欢乐氛围
>
> 场景记忆法：
> - 想象生日聚会时吹蜡烛的场景
> - 联想节日庆典时人们欢聚的画面
3. 近义词: commemorate, observe, mark
>- 反义词: mourn, grieve
>- 派生词: celebration（n. 庆祝活动）
>
> 相关短语:
> - celebrate birthday（庆祝生日）
> - celebrate victory（庆祝胜利）
> - celebrate festival（庆祝节日）
> - celebrate success（庆祝成功）
> - celebrate together（一起庆祝）
相关词汇: - 单词: celebrate
- 音标: /''seləbreit/
- 词性: v.（动词）
- 中文释义: 庆祝',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Christmas (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'dbe00116-6052-4938-99b5-5d5410f3b0e4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Christmas',
    '类型: 单词
例句: 1. 单词: Christmas
> - 音标: /''krisməs/
> - 词性: n.（名词）
> - 中文释义: 圣诞节
2. Christmas 发音类似"克里斯马斯"，可以联想"克里斯马斯圣诞节"
> - 想象圣诞节的欢乐氛围
>
> 场景记忆法：
> - 想象圣诞树下堆满礼物的场景
> - 联想圣诞老人送礼物的画面
3. 近义词: 
>- 反义词: 
>- 派生词: Christmassy（adj. 圣诞节的）
>
> 相关短语:
> - Merry Christmas（圣诞快乐）
> - Christmas tree（圣诞树）
> - Christmas present（圣诞礼物）
> - Christmas Eve（圣诞夜）
> - Christmas Day（圣诞节当天）
相关词汇: - 单词: Christmas
- 音标: /''krisməs/
- 词性: n.（名词）
- 中文释义: 圣诞节',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: reunion (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2d0a201f-2e7f-4b01-bae4-ec8a8c47d13a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'reunion',
    '类型: 单词
例句: 1. 单词: reunion
> - 音标: /ri:''ju:njən/
> - 词性: n.（名词）
> - 中文释义: 团圆，团聚
2. reunion 发音类似"瑞尤尼恩"，可以联想"瑞尤尼恩团聚"
> - 想象家人朋友重新聚在一起的温馨场景
>
> 场景记忆法：
> - 想象春节时全家人团圆的场景
> - 联想同学聚会时大家重聚的画面
3. 近义词: gathering, meeting, get-together, assembly
>- 反义词: separation, parting
>- 派生词: reunite（v. 重新团聚）
>
> 相关短语:
> - family reunion（家庭聚会）
> - class reunion（同学聚会）
> - school reunion（学校聚会）
> - reunion dinner（团圆饭）
> - reunion party（聚会）
相关词汇: - 单词: reunion
- 音标: /ri:''ju:njən/
- 词性: n.（名词）
- 中文释义: 团圆，团聚',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: joke (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '90a243a1-46ad-440b-8aa0-1a2f8671eaf6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'joke',
    '类型: 单词
例句: 1. 单词: joke
> - 音标: /dʒəʊk/
> - 词性: v.（动词）
> - 中文释义: 说笑话；开玩笑
2. joke 发音类似"乔克"，可以联想"乔克玩笑"
> - 想象朋友之间开玩笑的轻松氛围
>
> 场景记忆法：
> - 想象朋友聚会时讲笑话的场景
> - 联想喜剧演员在舞台上表演的画面
3. 近义词: tease, kid, make fun of
>- 反义词: be serious
>- 派生词: joking（现在分词）, joked（过去式/过去分词）
>
> 相关短语:
> - tell a joke（讲笑话）
> - make a joke（开玩笑）
> - joke about（拿...开玩笑）
> - just joking（只是开玩笑）
> - practical joke（恶作剧）
相关词汇: - 单词: joke
- 音标: /dʒəʊk/
- 词性: v.（动词）
- 中文释义: 说笑话；开玩笑',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: round (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '21a9787c-7cb2-4a16-bfd2-eae2d22f87c0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'round',
    '类型: 单词
例句: 1. 单词: round
> - 音标: /raʊnd/
> - 词性: adj.（形容词）
> - 中文释义: 圆形的，环形的
2. round 发音类似"朗德"，可以联想"朗德圆形"
> - 想象完美的圆形物体
>
> 场景记忆法：
> - 想象圆形的月亮、太阳等天体
> - 联想圆桌会议的场景
3. 近义词: circular, spherical, curved
>- 反义词: square, rectangular, angular
>- 派生词: roundness（n. 圆形）
>
> 相关短语:
> - round table（圆桌）
> - round face（圆脸）
> - round trip（往返旅行）
> - round the clock（全天候）
> - go round（绕行）
相关词汇: - 单词: round
- 音标: /raʊnd/
- 词性: adj.（形容词）
- 中文释义: 圆形的，环形的',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pork (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f8212cb7-7d84-487c-b2ff-fbd1317e9846',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pork',
    '类型: 单词
例句: 1. 单词: pork
> - 音标: /pɔ:k/
> - 词性: n.（名词）
> - 中文释义: 猪肉
2. pork 发音类似"波克"，可以联想"波克猪肉"
> - 想象超市里摆放的猪肉
>
> 场景记忆法：
> - 想象菜市场里卖猪肉的摊位
> - 联想家庭聚餐时桌上的猪肉菜肴
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - pork chop（猪排）
> - pork belly（五花肉）
> - roast pork（烤猪肉）
> - pork sausage（猪肉香肠）
> - pork dumpling（猪肉饺子）
相关词汇: - 单词: pork
- 音标: /pɔ:k/
- 词性: n.（名词）
- 中文释义: 猪肉',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: cucumber (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0858dcfc-49c5-48aa-adeb-1a7fc0ff8b55',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'cucumber',
    '类型: 单词
例句: 1. 单词: cucumber
> - 音标: /''kju:kambə/
> - 词性: n.（名词）
> - 中文释义: 黄瓜
2. cucumber 发音类似"库卡姆伯"，可以联想"库卡姆伯黄瓜"
> - 想象绿色的长条黄瓜
>
> 场景记忆法：
> - 想象菜市场里摆放的黄瓜
> - 联想做沙拉时切黄瓜的场景
3. 近义词: 
>- 反义词: 
>- 派生词: cucumbers（复数形式）
>
> 相关短语:
> - fresh cucumber（新鲜黄瓜）
> - cucumber salad（黄瓜沙拉）
> - cucumber juice（黄瓜汁）
> - pickled cucumber（腌黄瓜）
> - cucumber sandwich（黄瓜三明治）
相关词汇: - 单词: cucumber
- 音标: /''kju:kambə/
- 词性: n.（名词）
- 中文释义: 黄瓜',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: break (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '379ce3fa-9ee0-413f-a4a4-0b8a52270d0b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'break',
    '类型: 单词
例句: 1. 单词: break
> - 音标: /breɪk/
> - 词性: n.（名词）
> - 中文释义: 中断，暂停
2. break 发音类似"布雷克"，可以联想"布雷克休息"
> - 想象工作或学习中的休息时间
>
> 场景记忆法：
> - 想象课间休息时同学们放松的场景
> - 联想工作中午休时的画面
3. 近义词: pause, rest, interval, recess
>- 反义词: continue, resume
>- 派生词: breakable（adj. 易碎的）
>
> 相关短语:
> - take a break（休息一下）
> - coffee break（咖啡休息时间）
> - lunch break（午休时间）
> - break time（休息时间）
> - have a break（休息）
相关词汇: - 单词: break
- 音标: /breɪk/
- 词性: n.（名词）
- 中文释义: 中断，暂停',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: waste (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f665cf91-3b8f-499f-a2ce-f19376bbc28e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'waste',
    '类型: 单词
例句: 1. 单词: waste
> - 音标: /weist/
> - 词性: n.（名词）
> - 中文释义: 废料，废弃物
2. waste 发音类似"韦斯特"，可以联想"韦斯特废料"
> - 想象垃圾堆或废料场
>
> 场景记忆法：
> - 想象垃圾分类回收的场景
> - 联想环保意识的重要性
3. 近义词: garbage, rubbish, trash, refuse
>- 反义词: resource, treasure
>- 派生词: wasteful（adj. 浪费的）
>
> 相关短语:
> - waste materials（废料）
> - waste disposal（废物处理）
> - waste management（废物管理）
> - waste time（浪费时间）
> - go to waste（被浪费）
相关词汇: - 单词: waste
- 音标: /weist/
- 词性: n.（名词）
- 中文释义: 废料，废弃物',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: decision (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '958c0261-adee-4332-af64-8c4ec24e9c3b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'decision',
    '类型: 单词
例句: 1. 单词: decision
> - 音标: /dɪ''sɪʒən/
> - 词性: n.（名词）
> - 中文释义: 决定，抉择
2. decision 发音类似"迪西申"，可以联想"迪西申决定"
> - 想象在重要时刻做出选择的场景
>
> 场景记忆法：
> - 想象在十字路口选择方向的画面
> - 联想开会时大家讨论决定的场景
3. 近义词: choice, determination, resolution, verdict
>- 反义词: indecision, hesitation
>- 派生词: decide（v. 决定）
>
> 相关短语:
> - make a decision（做决定）
> - final decision（最终决定）
> - difficult decision（困难的决定）
> - wise decision（明智的决定）
> - decision making（决策）
相关词汇: - 单词: decision
- 音标: /dɪ''sɪʒən/
- 词性: n.（名词）
- 中文释义: 决定，抉择',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: miss (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '80ccaaca-ec3b-447c-b179-ec4514bfdf29',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'miss',
    '类型: 单词
例句: 1. 单词: miss
> - 音标: /mɪs/
> - 词性: v.（动词）
> - 中文释义: 错过
2. miss 发音类似"米斯"，可以联想"米斯错过"
> - 想象错过重要事情的遗憾感觉
>
> 场景记忆法：
> - 想象赶不上公交车时的焦急心情
> - 联想错过重要机会时的懊悔
3. 近义词: lose, skip, fail to catch
>- 反义词: catch, get, seize
>- 派生词: missing（现在分词）, missed（过去式/过去分词）
>
> 相关短语:
> - miss the bus（错过公交车）
> - miss the chance（错过机会）
> - miss the point（没抓住要点）
> - miss out on（错过...）
> - miss the mark（没达到目标）
相关词汇: - 单词: miss
- 音标: /mɪs/
- 词性: v.（动词）
- 中文释义: 错过',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: thirsty (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'af1a8cdf-f312-43d0-8b23-843e8fed74dc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'thirsty',
    '类型: 单词
例句: 1. 单词: thirsty
> - 音标: /''θɜ:sti/
> - 词性: adj.（形容词）
> - 中文释义: 渴的，口渴的
2. thirsty 发音类似"瑟斯蒂"，可以联想"瑟斯蒂口渴"
> - 想象口渴时想喝水的迫切感觉
>
> 场景记忆法：
> - 想象运动后大汗淋漓、口渴难耐的场景
> - 联想沙漠中寻找水源的画面
3. 近义词: parched, dehydrated
>- 反义词: hydrated, quenched
>- 派生词: thirst（n. 口渴）
>
> 相关短语:
> - feel thirsty（感到口渴）
> - very thirsty（很渴）
> - thirsty for（渴望...）
> - quench thirst（解渴）
> - dying of thirst（渴得要死）
相关词汇: - 单词: thirsty
- 音标: /''θɜ:sti/
- 词性: adj.（形容词）
- 中文释义: 渴的，口渴的',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: against the law (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '79c85c6b-b0fd-4e2e-85fa-5bd835d56d27',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'against the law',
    '类型: 单词
例句: 1. 单词: against the law
> - 音标: /əˈɡenst ðə lɔː/
> - 词性: 短语
> - 中文释义: 违法
2. against（反对）+ the law（法律）= against the law（违法）
> - 想象违反法律规定的行为
>
> 场景记忆法：
> - 想象警察逮捕违法者的场景
> - 联想法庭上审判违法行为的画面
3. 近义词: illegal, unlawful, criminal
>- 反义词: legal, lawful, legitimate
>- 派生词: 
>
> 相关短语:
> - break the law（违法）
> - against the rules（违反规则）
> - illegal activity（非法活动）
> - law enforcement（执法）
> - legal system（法律体系）
相关词汇: - 单词: against the law
- 音标: /əˈɡenst ðə lɔː/
- 词性: 短语
- 中文释义: 违法',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: usually (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '352fcb33-b032-4314-ab0a-82795b8fe539',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'usually',
    '类型: 单词
例句: 1. 单词: usually
> - 音标: /''ju:zuəli/
> - 词性: adv.（副词）
> - 中文释义: 通常地；惯常地
2. usually 发音类似"尤祖阿里"，可以联想"尤祖阿里通常"
> - 想象日常生活中的规律性行为
>
> 场景记忆法：
> - 想象每天重复的日常活动
> - 联想"通常"与"偶尔"的对比
3. 近义词: normally, generally, typically, commonly
>- 反义词: rarely, seldom, occasionally
>- 派生词: usual（adj. 通常的）
>
> 相关短语:
> - usually do（通常做）
> - as usual（像往常一样）
> - more than usually（比通常更）
> - usually happens（通常发生）
> - usually the case（通常的情况）
相关词汇: - 单词: usually
- 音标: /''ju:zuəli/
- 词性: adv.（副词）
- 中文释义: 通常地；惯常地',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lantern (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8874bcf1-9f3a-4663-8acb-3daf0954a666',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lantern',
    '类型: 单词
例句: 1. 单词: lantern
> - 音标: /''læntən/
> - 词性: n.（名词）
> - 中文释义: 灯笼；提灯
2. lantern 发音类似"兰特恩"，可以联想"兰特恩灯笼"
> - 想象传统灯笼发出的温暖光芒
>
> 场景记忆法：
> - 想象中秋节时挂满灯笼的街道
> - 联想古代人提着灯笼走夜路的场景
3. 近义词: lamp, light, torch
>- 反义词: 
>- 派生词: lanterns（复数形式）
>
> 相关短语:
> - Chinese lantern（中国灯笼）
> - paper lantern（纸灯笼）
> - electric lantern（电灯笼）
> - lantern festival（灯笼节）
> - carry a lantern（提灯笼）
相关词汇: - 单词: lantern
- 音标: /''læntən/
- 词性: n.（名词）
- 中文释义: 灯笼；提灯',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: piece (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b1f370cb-c636-4c6c-bb6d-f711e79d7a34',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'piece',
    '类型: 单词
例句: 1. 单词: piece
> - 音标: /pi:s/
> - 词性: n.（名词）
> - 中文释义: 块；片；段；截
2. piece 发音类似"皮斯"，可以联想"皮斯块"
> - 想象切蛋糕时分成块状
>
> 场景记忆法：
> - 想象切水果时分成小块的场景
> - 联想拼图游戏中的各个片段
3. 近义词: part, bit, fragment, section
>- 反义词: whole, complete
>- 派生词: pieces（复数形式）
>
> 相关短语:
> - a piece of（一块，一片）
> - break into pieces（碎成片）
> - piece by piece（一块一块地）
> - master piece（杰作）
> - piece together（拼凑）
相关词汇: - 单词: piece
- 音标: /pi:s/
- 词性: n.（名词）
- 中文释义: 块；片；段；截',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: situation (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '25854856-dd81-4fda-bfe1-05195b4de08f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'situation',
    '类型: 单词
例句: 1. 单词: situation
> - 音标: /sɪtʃu''eɪʃən/
> - 词性: n.（名词）
> - 中文释义: 形势，情况，状况，局面
2. situation 发音类似"西图埃申"，可以联想"西图埃申情况"
> - 想象分析当前形势的场景
>
> 场景记忆法：
> - 想象开会讨论当前情况的场景
> - 联想新闻报道中分析形势的画面
3. 近义词: condition, circumstance, state, case
>- 反义词: 
>- 派生词: situational（adj. 情况的）
>
> 相关短语:
> - current situation（当前情况）
> - difficult situation（困难情况）
> - emergency situation（紧急情况）
> - improve the situation（改善情况）
> - assess the situation（评估情况）
相关词汇: - 单词: situation
- 音标: /sɪtʃu''eɪʃən/
- 词性: n.（名词）
- 中文释义: 形势，情况，状况，局面',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: plastic (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7a5b2988-98ce-4839-9ade-626710b53323',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'plastic',
    '类型: 单词
例句: 1. 单词: plastic
> - 音标: /''plæstık/
> - 词性: adj.（形容词）
> - 中文释义: 塑料制的
2. plastic 发音类似"普拉斯蒂克"，可以联想"普拉斯蒂克塑料"
> - 想象各种塑料制品
>
> 场景记忆法：
> - 想象超市里各种塑料包装的商品
> - 联想环保袋替代塑料袋的场景
3. 近义词: synthetic, artificial
>- 反义词: natural, organic
>- 派生词: plastics（n. 塑料制品）
>
> 相关短语:
> - plastic bag（塑料袋）
> - plastic bottle（塑料瓶）
> - plastic waste（塑料垃圾）
> - plastic container（塑料容器）
> - plastic pollution（塑料污染）
相关词汇: - 单词: plastic
- 音标: /''plæstık/
- 词性: adj.（形容词）
- 中文释义: 塑料制的',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fill (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'aaf844b6-793b-4362-81a8-893cb723ae3e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fill',
    '类型: 单词
例句: 1. 单词: fill
> - 音标: /fɪl/
> - 词性: v.（动词）
> - 中文释义: 弥漫，充满
2. fill 发音类似"菲尔"，可以联想"菲尔充满"
> - 想象容器被装满的过程
>
> 场景记忆法：
> - 想象往杯子里倒水直到装满
> - 联想房间里充满阳光或香味的场景
3. 近义词: load, pack, stuff, occupy
>- 反义词: empty, drain, clear
>- 派生词: filled（过去式/过去分词）, filling（现在分词）
>
> 相关短语:
> - fill with（用...装满）
> - fill up（填满）
> - fill in（填写）
> - fill out（填表）
> - fill the gap（填补空白）
相关词汇: - 单词: fill
- 音标: /fɪl/
- 词性: v.（动词）
- 中文释义: 弥漫，充满',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shine (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1383576f-6082-47f4-9978-c006706d4cc1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shine',
    '类型: 单词
例句: 1. 单词: shine
> - 音标: /ʃaɪn/
> - 词性: v.（动词）
> - 中文释义: 发光，发亮
2. shine 发音类似"夏因"，可以联想"夏因发光"
> - 想象阳光、星光等发光的光源
>
> 场景记忆法：
> - 想象阳光透过窗户洒进房间的场景
> - 联想夜晚天空中闪烁的星星
3. 近义词: glow, gleam, sparkle, glitter
>- 反义词: dim, darken
>- 派生词: shining（现在分词）, shone（过去式/过去分词）
>
> 相关短语:
> - shine brightly（明亮地发光）
> - shine with（因...而发光）
> - shine on（照耀在...上）
> - make something shine（使某物发光）
> - shine through（透过...发光）
相关词汇: - 单词: shine
- 音标: /ʃaɪn/
- 词性: v.（动词）
- 中文释义: 发光，发亮',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: university (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b9c6887d-6010-4a91-a2ef-891e78364c93',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'university',
    '类型: 单词
例句: 1. 单词: university
> - 音标: /ju:nə''vɜ:səti/
> - 词性: n.（名词）
> - 中文释义: 大学
2. university 发音类似"尤尼沃西蒂"，可以联想"尤尼沃西蒂大学"
> - 想象大学校园里的学习生活
>
> 场景记忆法：
> - 想象大学校园里学生上课的场景
> - 联想大学图书馆、实验室等设施
3. 近义词: college, school, institution
>- 反义词: 
>- 派生词: university student（大学生）
>
> 相关短语:
> - university student（大学生）
> - university campus（大学校园）
> - university degree（大学学位）
> - university professor（大学教授）
> - go to university（上大学）
相关词汇: - 单词: university
- 音标: /ju:nə''vɜ:səti/
- 词性: n.（名词）
- 中文释义: 大学',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: duty (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fcfdde39-0f24-4788-a46d-d0aa52ee7a90',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'duty',
    '类型: 单词
例句: 1. 单词: duty
> - 音标: /''dju:ti/
> - 词性: n.（名词）
> - 中文释义: 职责，义务
2. duty 发音类似"杜蒂"，可以联想"杜蒂职责"
> - 想象认真履行职责的场景
>
> 场景记忆法：
> - 想象警察、医生等职业人员履行职责的画面
> - 联想公民应尽的义务和责任
3. 近义词: responsibility, obligation, task, job
>- 反义词: right, privilege
>- 派生词: dutiful（adj. 尽职的）
>
> 相关短语:
> - perform duty（履行职责）
> - sense of duty（责任感）
> - duty to do（做...的义务）
> - on duty（值班）
> - off duty（下班）
相关词汇: - 单词: duty
- 音标: /''dju:ti/
- 词性: n.（名词）
- 中文释义: 职责，义务',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shocked (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9a6b7fd5-a342-428b-9351-1f945763b4cb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shocked',
    '类型: 单词
例句: 1. 单词: shocked
> - 音标: /ʃɒkt/
> - 词性: adj.（形容词）
> - 中文释义: 吃惊的，震惊的
2. shocked 发音类似"肖克特"，可以联想"肖克特震惊"
> - 想象听到惊人消息时的表情
>
> 场景记忆法：
> - 想象听到意外消息时瞪大眼睛的表情
> - 联想看到令人震惊事件时的反应
3. 近义词: surprised, amazed, astonished, stunned
>- 反义词: calm, composed, unruffled
>- 派生词: shock（n. 震惊）, shocking（adj. 令人震惊的）
>
> 相关短语:
> - be shocked by（被...震惊）
> - shocked expression（震惊的表情）
> - shocking news（令人震惊的消息）
> - shock and awe（震慑）
> - in shock（处于震惊状态）
相关词汇: - 单词: shocked
- 音标: /ʃɒkt/
- 词性: adj.（形容词）
- 中文释义: 吃惊的，震惊的',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: smell (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '43222491-ee37-43a7-9171-a618b25df61a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'smell',
    '类型: 单词
例句: 1. 单词: smell
> - 音标: /smel/
> - 词性: n.（名词）
> - 中文释义: 气味
2. smell 发音类似"斯梅尔"，可以联想"斯梅尔气味"
> - 想象闻到各种气味时的感觉
>
> 场景记忆法：
> - 想象闻到花香、咖啡香等好闻的气味
> - 联想闻到烧焦味等不好闻的气味
3. 近义词: odor, scent, fragrance, aroma
>- 反义词: 
>- 派生词: smelly（adj. 有臭味的）
>
> 相关短语:
> - smell of（...的气味）
> - strange smell（奇怪的气味）
> - pleasant smell（好闻的气味）
> - bad smell（难闻的气味）
> - smell good（闻起来很好）
相关词汇: - 单词: smell
- 音标: /smel/
- 词性: n.（名词）
- 中文释义: 气味',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dumpling (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'bc99efee-8540-4b3c-8353-695b687b00f5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dumpling',
    '类型: 单词
例句: 1. 单词: dumpling
> - 音标: /''damply/
> - 词性: n.（名词）
> - 中文释义: 水饺
2. dumpling 发音类似"当普林"，可以联想"当普林饺子"
> - 想象包饺子的传统场景
>
> 场景记忆法：
> - 想象一家人围坐包饺子的温馨画面
> - 联想春节时吃饺子的传统习俗
3. 近义词: 
>- 反义词: 
>- 派生词: dumplings（复数形式）
>
> 相关短语:
> - make dumplings（包饺子）
> - eat dumplings（吃饺子）
> - delicious dumplings（美味的饺子）
> - dumpling soup（饺子汤）
> - steamed dumplings（蒸饺）
相关词汇: - 单词: dumpling
- 音标: /''damply/
- 词性: n.（名词）
- 中文释义: 水饺',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: emergency (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '91230885-7ed8-4b11-8b90-9ade8dcdb482',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'emergency',
    '类型: 单词
例句: 1. 单词: emergency
> - 音标: /ɪ''mɜ:dzənsi/
> - 词性: n.（名词）
> - 中文释义: 紧急情况，不测事件
2. emergency 发音类似"伊默金西"，可以联想"伊默金西紧急"
> - 想象紧急情况下的紧张氛围
>
> 场景记忆法：
> - 想象医院急诊室里的忙碌场景
> - 联想消防车、救护车等紧急救援车辆
3. 近义词: crisis, urgency, danger, accident
>- 反义词: normal, routine, calm
>- 派生词: emergent（adj. 紧急的）
>
> 相关短语:
> - emergency room（急诊室）
> - emergency call（紧急电话）
> - emergency situation（紧急情况）
> - in case of emergency（紧急情况下）
> - emergency services（紧急服务）
相关词汇: - 单词: emergency
- 音标: /ɪ''mɜ:dzənsi/
- 词性: n.（名词）
- 中文释义: 紧急情况，不测事件',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pollution (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e958f197-c303-4990-a617-a5f5db59d348',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pollution',
    '类型: 单词
例句: 1. 单词: pollution
> - 音标: /pə''lu:ʃən/
> - 词性: n.（名词）
> - 中文释义: 污染
2. pollution 发音类似"波卢申"，可以联想"波卢申污染"
> - 想象被污染的空气和水
>
> 场景记忆法：
> - 想象工厂排放废气的场景
> - 联想环保组织呼吁减少污染的画面
3. 近义词: contamination, impurity
>- 反义词: purity, cleanliness
>- 派生词: pollute（v. 污染）
>
> 相关短语:
> - air pollution（空气污染）
> - water pollution（水污染）
> - noise pollution（噪音污染）
> - reduce pollution（减少污染）
> - pollution control（污染控制）
相关词汇: - 单词: pollution
- 音标: /pə''lu:ʃən/
- 词性: n.（名词）
- 中文释义: 污染',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: unusual (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0b575f50-ad9a-45e5-b2ef-cb2aaddd6a2f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'unusual',
    '类型: 单词
例句: 1. 单词: unusual
> - 音标: /ʌn''ju:zuəl/
> - 词性: adj.（形容词）
> - 中文释义: 不平常的
2. un-（不）+ usual（平常的）= unusual（不平常的）
> - 想象与平常情况不同的场景
>
> 场景记忆法：
> - 想象看到奇怪或不寻常事物时的惊讶表情
> - 联想"不寻常"与"平常"的对比
3. 近义词: strange, odd, uncommon, rare
>- 反义词: usual, common, normal, ordinary
>- 派生词: unusually（adv. 不寻常地）
>
> 相关短语:
> - unusual situation（不寻常的情况）
> - unusual name（不寻常的名字）
> - unusual weather（不寻常的天气）
> - unusual choice（不寻常的选择）
> - unusually quiet（异常安静）
相关词汇: - 单词: unusual
- 音标: /ʌn''ju:zuəl/
- 词性: adj.（形容词）
- 中文释义: 不平常的',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hang (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '58932c42-2324-4b07-912a-76c5a590539a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hang',
    '类型: 单词
例句: 1. 单词: hang
> - 音标: /hæŋ/
> - 词性: v.（动词）
> - 中文释义: 悬挂
2. hang 发音类似"汉"，可以联想"汉悬挂"
> - 想象悬挂东西的动作
>
> 场景记忆法：
> - 想象晾衣服时挂衣服的动作
> - 联想墙上挂画的场景
3. 近义词: suspend, dangle, attach
>- 反义词: take down, remove
>- 派生词: hanging（现在分词）, hung（过去式/过去分词）
>
> 相关短语:
> - hang up（挂断电话）
> - hang on（坚持，等待）
> - hang out（闲逛）
> - hang around（徘徊）
> - hang in there（坚持下去）
相关词汇: - 单词: hang
- 音标: /hæŋ/
- 词性: v.（动词）
- 中文释义: 悬挂',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: shape (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3c224097-aba4-443f-b012-105aea860374',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'shape',
    '类型: 单词
例句: 1. 单词: shape
> - 音标: /ʃeɪp/
> - 词性: n.（名词）
> - 中文释义: 形，形状，外形
2. shape 发音类似"谢普"，可以联想"谢普形状"
> - 想象各种几何形状
>
> 场景记忆法：
> - 想象数学课上学习各种形状
> - 联想艺术课上画不同形状的画面
3. 近义词: form, figure, outline, contour
>- 反义词: 
>- 派生词: shaped（adj. 有...形状的）
>
> 相关短语:
> - in the shape of（以...的形状）
> - different shapes（不同的形状）
> - square shape（方形）
> - round shape（圆形）
> - take shape（成形）
相关词汇: - 单词: shape
- 音标: /ʃeɪp/
- 词性: n.（名词）
- 中文释义: 形，形状，外形',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: realise (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3c44a1d2-d3e1-422d-b930-893ac132f801',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'realise',
    '类型: 单词
例句: 1. 单词: realise
> - 音标: /''rıəlaız/
> - 词性: v.（动词）
> - 中文释义: 知道；明白；认识到
2. realise 发音类似"瑞尔莱兹"，可以联想"瑞尔莱兹认识"
> - 想象突然明白某事的顿悟时刻
>
> 场景记忆法：
> - 想象突然意识到重要事情时的表情
> - 联想"恍然大悟"的感觉
3. 近义词: understand, recognize, become aware, notice
>- 反义词: ignore, overlook, miss
>- 派生词: realisation（n. 认识，实现）
>
> 相关短语:
> - realise that（意识到...）
> - realise the importance（认识到重要性）
> - realise one''s mistake（意识到错误）
> - come to realise（逐渐认识到）
> - fully realise（完全认识到）
相关词汇: - 单词: realise
- 音标: /''rıəlaız/
- 词性: v.（动词）
- 中文释义: 知道；明白；认识到',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: challenge (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2c8d78e9-3d23-479f-8329-c35a147a4fae',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'challenge',
    '类型: 单词
例句: 1. 单词: challenge
> - 音标: /''tʃæləndʒ/
> - 词性: n.（名词）
> - 中文释义: 挑战，具有挑战性的事物
2. challenge 发音类似"查伦奇"，可以联想"查伦奇挑战"
> - 想象攀登高峰等具有挑战性的活动
>
> 场景记忆法：
> - 想象运动员接受挑战时的决心
> - 联想学习中克服困难的过程
3. 近义词: difficulty, obstacle, test, trial
>- 反义词: ease, simplicity
>- 派生词: challenging（adj. 具有挑战性的）
>
> 相关短语:
> - face a challenge（面临挑战）
> - accept a challenge（接受挑战）
> - meet the challenge（迎接挑战）
> - challenge someone（挑战某人）
> - rise to the challenge（迎接挑战）
相关词汇: - 单词: challenge
- 音标: /''tʃæləndʒ/
- 词性: n.（名词）
- 中文释义: 挑战，具有挑战性的事物',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: treat (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8babc884-17c4-44e9-8db4-b45d6f659f56',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'treat',
    '类型: 单词
例句: 1. 单词: treat
> - 音标: /tri:t/
> - 词性: v.（动词）
> - 中文释义: 请客，款待，招待
2. treat 发音类似"特里特"，可以联想"特里特招待"
> - 想象请客吃饭的温馨场景
>
> 场景记忆法：
> - 想象朋友之间互相请客的场景
> - 联想餐厅里招待客人的画面
3. 近义词: entertain, host, invite, pay for
>- 反义词: 
>- 派生词: treatment（n. 治疗，对待）
>
> 相关短语:
> - treat someone to（请某人...）
> - treat well（好好招待）
> - treat with respect（尊重地对待）
> - special treat（特殊招待）
> - treat yourself（犒劳自己）
相关词汇: - 单词: treat
- 音标: /tri:t/
- 词性: v.（动词）
- 中文释义: 请客，款待，招待',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: patient (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fd34544a-2b3c-488b-add1-fb6117878eed',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'patient',
    '类型: 单词
例句: 1. 单词: patient
> - 音标: /''peɪʃənt/
> - 词性: n.（名词）
> - 中文释义: 病人，患者
2. patient 发音类似"佩申特"，可以联想"佩申特病人"
> - 想象医院里躺在病床上的病人
>
> 场景记忆法：
> - 想象医生和护士照顾病人的场景
> - 联想医院病房里的画面
3. 近义词: sick person, sufferer, invalid
>- 反义词: doctor, nurse, healthy person
>- 派生词: patience（n. 耐心）
>
> 相关短语:
> - hospital patient（医院病人）
> - patient care（病人护理）
> - patient record（病历）
> - patient room（病房）
> - patient treatment（病人治疗）
相关词汇: - 单词: patient
- 音标: /''peɪʃənt/
- 词性: n.（名词）
- 中文释义: 病人，患者',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: medical (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1ee721d6-0e3f-4c72-be70-638581009f1a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'medical',
    '类型: 单词
例句: 1. 单词: medical
> - 音标: /''medɪkəl/
> - 词性: adj.（形容词）
> - 中文释义: 医学的；医疗的
2. medical 发音类似"梅迪卡尔"，可以联想"梅迪卡尔医疗"
> - 想象医院里的医疗设备和医护人员
>
> 场景记忆法：
> - 想象医院里医生和护士工作的场景
> - 联想医疗设备和药品的画面
3. 近义词: clinical, therapeutic, health-related
>- 反义词: non-medical, unmedical
>- 派生词: medicine（n. 医学，药物）
>
> 相关短语:
> - medical center（医疗中心）
> - medical treatment（医疗治疗）
> - medical insurance（医疗保险）
> - medical equipment（医疗设备）
> - medical science（医学）
相关词汇: - 单词: medical
- 音标: /''medɪkəl/
- 词性: adj.（形容词）
- 中文释义: 医学的；医疗的',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: support (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0ec66c6c-5f99-4632-ac5a-a1e7e0e3f1e3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'support',
    '类型: 单词
例句: 1. 单词: support
> - 音标: /sə''pɔ:t/
> - 词性: n.（名词）
> - 中文释义: 支持
2. support 发音类似"萨波特"，可以联想"萨波特支持"
> - 想象朋友之间互相支持的温馨场景
>
> 场景记忆法：
> - 想象团队合作时互相支持的画面
> - 联想困难时期得到帮助的场景
3. 近义词: help, assistance, backing, aid
>- 反义词: opposition, resistance, hindrance
>- 派生词: supportive（adj. 支持的）
>
> 相关短语:
> - give support（给予支持）
> - need support（需要支持）
> - emotional support（情感支持）
> - financial support（经济支持）
> - moral support（精神支持）
相关词汇: - 单词: support
- 音标: /sə''pɔ:t/
- 词性: n.（名词）
- 中文释义: 支持',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: whole (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '46ae0ca6-7866-4f2a-8275-c284a39f2d61',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'whole',
    '类型: 单词
例句: 1. 单词: whole
> - 音标: /həul/
> - 词性: adj.（形容词）
> - 中文释义: 整个的，全部的
2. whole 发音类似"霍尔"，可以联想"霍尔整个"
> - 想象一个完整的圆形
>
> 场景记忆法：
> - 想象吃完整块蛋糕的场景
> - 联想"全部"与"部分"的对比
3. 近义词: complete, entire, total, all
>- 反义词: partial, incomplete, half
>- 派生词: wholly（adv. 完全地）
>
> 相关短语:
> - the whole day（一整天）
> - the whole world（全世界）
> - the whole story（整个故事）
> - whole family（全家）
> - as a whole（整体上）
相关词汇: - 单词: whole
- 音标: /həul/
- 词性: adj.（形容词）
- 中文释义: 整个的，全部的',
    'vocabulary',
    'word',
    '初一',
    'Unit 4',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rise (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '74d23b45-b3a7-457f-be2b-5ab6248410e1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rise',
    '类型: 单词
例句: 1. 单词: rise
> - 音标: /raɪz/
> - 词性: v.（动词）
> - 中文释义: 升高，上升
2. rise 发音类似"瑞兹"，可以联想"瑞兹上升"
> - 想象太阳升起或气球上升的画面
>
> 场景记忆法：
> - 想象太阳从地平线升起的壮观景象
> - 联想价格图表中上升的曲线
3. 近义词: ascend, climb, go up, increase
>- 反义词: fall, descend, drop, decrease
>- 派生词: rising（现在分词）, rose（过去式）, risen（过去分词）
>
> 相关短语:
> - rise up（上升，起义）
> - rise early（早起）
> - rise to the occasion（应对挑战）
> - give rise to（引起，导致）
> - rise and fall（起伏）
相关词汇: - 单词: rise
- 音标: /raɪz/
- 词性: v.（动词）
- 中文释义: 升高，上升',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: seed (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8fe50ee2-5fee-4910-8a1e-e6f206c7a597',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'seed',
    '类型: 单词
例句: 1. 单词: seed
> - 音标: /si:d/
> - 词性: n.（名词）
> - 中文释义: 种子，籽
2. seed 发音类似"西德"，可以联想"西德种子"
> - 想象小小的种子
>
> 场景记忆法：
> - 想象农民播种的场景
> - 联想种子发芽生长的过程
3. 近义词: grain, kernel, pit
>- 反义词: fruit, flower
>- 派生词: seeds（复数形式）
>
> 相关短语:
> - plant seeds（播种）
> - flower seeds（花种子）
> - seed packet（种子包）
> - from seed（从种子开始）
> - seed money（启动资金）
相关词汇: - 单词: seed
- 音标: /si:d/
- 词性: n.（名词）
- 中文释义: 种子，籽',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: soon (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8b680e50-8517-4260-8b54-43ba783809fb',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'soon',
    '类型: 单词
例句: 1. 单词: soon
> - 音标: /su:n/
> - 词性: adv.（副词）
> - 中文释义: 不久，即刻，很快
2. soon 发音类似"苏恩"，可以联想"苏恩很快"
> - 想象时间过得很快的感觉
>
> 场景记忆法：
> - 想象等待时"很快"就会到来的期待
> - 联想"不久"与"很久"的对比
3. 近义词: quickly, shortly, before long, in a while
>- 反义词: later, eventually, after a while
>- 派生词: 
>
> 相关短语:
> - very soon（很快）
> - as soon as（一...就...）
> - sooner or later（迟早）
> - soon after（不久之后）
> - see you soon（很快见）
相关词汇: - 单词: soon
- 音标: /su:n/
- 词性: adv.（副词）
- 中文释义: 不久，即刻，很快',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: yard (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'de3bd74c-057c-4d9e-866d-037539f92d42',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'yard',
    '类型: 单词
例句: 1. 单词: yard
> - 音标: /jɑ:d/
> - 词性: n.（名词）
> - 中文释义: 庭院
2. yard 发音类似"雅德"，可以联想"雅德庭院"
> - 想象家庭住宅的户外空间
>
> 场景记忆法：
> - 想象孩子们在院子里玩耍的场景
> - 联想"庭院"与"室内"的对比
3. 近义词: garden, courtyard, lawn
>- 反义词: house, building
>- 派生词: yards（复数形式）
>
> 相关短语:
> - front yard（前院）
> - back yard（后院）
> - yard work（庭院工作）
> - yard sale（庭院拍卖）
> - play in the yard（在院子里玩）
相关词汇: - 单词: yard
- 音标: /jɑ:d/
- 词性: n.（名词）
- 中文释义: 庭院',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rainforest (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ce90ab98-dbe7-4b09-a640-fc981d763e96',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rainforest',
    '类型: 单词
例句: 1. 单词: rainforest
> - 音标: /''reɪnfɒrɪst/
> - 词性: n.（名词）
> - 中文释义: (热带)雨林
2. rainforest 发音类似"瑞恩福瑞斯特"，可以联想"瑞恩福瑞斯特雨林"
> - 想象热带雨林的茂密景象
>
> 场景记忆法：
> - 想象亚马逊雨林的壮观景象
> - 联想雨林中各种动植物的生态
3. 近义词: jungle, tropical forest
>- 反义词: desert, grassland
>- 派生词: rainforests（复数形式）
>
> 相关短语:
> - tropical rainforest（热带雨林）
> - Amazon rainforest（亚马逊雨林）
> - rainforest animals（雨林动物）
> - rainforest protection（雨林保护）
> - rainforest destruction（雨林破坏）
相关词汇: - 单词: rainforest
- 音标: /''reɪnfɒrɪst/
- 词性: n.（名词）
- 中文释义: (热带)雨林',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: biscuit (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a8268d99-652c-44e1-b671-4c6f9bed4018',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'biscuit',
    '类型: 单词
例句: 1. 单词: biscuit
> - 音标: /''bɪskɪt/
> - 词性: n.（名词）
> - 中文释义: 饼干
2. biscuit 发音类似"比斯基特"，可以联想"比斯基特饼干"
> - 想象香脆可口的饼干
>
> 场景记忆法：
> - 想象下午茶时吃饼干的场景
> - 联想"饼干"与"蛋糕"的区别
3. 近义词: cookie, cracker
>- 反义词: 
>- 派生词: biscuits（复数形式）
>
> 相关短语:
> - chocolate biscuit（巧克力饼干）
> - fresh biscuit（新鲜饼干）
> - biscuit tin（饼干罐）
> - homemade biscuit（自制饼干）
> - sweet biscuit（甜饼干）
相关词汇: - 单词: biscuit
- 音标: /''bɪskɪt/
- 词性: n.（名词）
- 中文释义: 饼干',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: part (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ab811aa3-abf7-4330-9833-651dad7295aa',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'part',
    '类型: 单词
例句: 1. 单词: part
> - 音标: /pɑ:t/
> - 词性: n.（名词）
> - 中文释义: 部分
2. part 发音类似"帕特"，可以联想"帕特部分"
> - 想象整体被分成几个部分
>
> 场景记忆法：
> - 想象拼图游戏中的各个部分
> - 联想"部分"与"整体"的关系
3. 近义词: section, piece, portion, component
>- 反义词: whole, entire, complete
>- 派生词: partial（adj. 部分的）
>
> 相关短语:
> - part of（...的一部分）
> - take part in（参加）
> - play a part（扮演角色）
> - spare part（备用零件）
> - for the most part（大部分）
相关词汇: - 单词: part
- 音标: /pɑ:t/
- 词性: n.（名词）
- 中文释义: 部分',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: chat (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '04e4d791-c52d-47ac-b442-38a480fbc102',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'chat',
    '类型: 单词
例句: 1. 单词: chat
> - 音标: /tʃæt/
> - 词性: v.（动词）
> - 中文释义: 闲聊，闲谈，聊天
2. chat 发音类似"恰特"，可以联想"恰特聊天"
> - 想象轻松愉快的对话场景
>
> 场景记忆法：
> - 想象朋友间轻松聊天的场景
> - 联想"聊天"与"正式谈话"的区别
3. 近义词: talk, converse, discuss, gossip
>- 反义词: listen, be quiet
>- 派生词: chatting（现在分词）, chatted（过去式/过去分词）
>
> 相关短语:
> - chat with（和...聊天）
> - have a chat（聊聊天）
> - chat about（聊关于...）
> - online chat（在线聊天）
> - chat room（聊天室）
相关词汇: - 单词: chat
- 音标: /tʃæt/
- 词性: v.（动词）
- 中文释义: 闲聊，闲谈，聊天',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: within (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1258b0b2-d2f2-4063-9aa1-a051e987d044',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'within',
    '类型: 单词
例句: 1. 单词: within
> - 音标: /wɪð''ɪn/
> - 词性: prep.（介词）
> - 中文释义: 在(建筑或地区)里
2. within 发音类似"威辛"，可以联想"威辛内部"
> - 想象在某个空间或时间范围内的概念
>
> 场景记忆法：
> - 想象在建筑物内部或某个区域内的场景
> - 联想"在...之内"与"在...之外"的对比
3. 近义词: inside, in, during, during the time of
>- 反义词: outside, beyond, without
>- 派生词: 
>
> 相关短语:
> - within reach（在可及范围内）
> - within limits（在限制内）
> - within reason（在合理范围内）
> - within sight（在视线内）
> - within walking distance（在步行距离内）
相关词汇: - 单词: within
- 音标: /wɪð''ɪn/
- 词性: prep.（介词）
- 中文释义: 在(建筑或地区)里',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mix (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6462fd95-ea29-4515-8017-3c334b6c8a87',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mix',
    '类型: 单词
例句: 1. 单词: mix
> - 音标: /mɪks/
> - 词性: v.（动词）
> - 中文释义: (使)混合
2. mix 发音类似"米克斯"，可以联想"米克斯混合"
> - 想象搅拌混合的动作
>
> 场景记忆法：
> - 想象厨师在厨房里混合食材的场景
> - 联想调色时混合不同颜色的画面
3. 近义词: blend, combine, merge, stir
>- 反义词: separate, divide, unmix
>- 派生词: mixing（现在分词）, mixed（过去式/过去分词）
>
> 相关短语:
> - mix together（混合在一起）
> - mix up（混淆，搞混）
> - mix well（混合均匀）
> - mix and match（混搭）
> - mix it up（改变现状）
相关词汇: - 单词: mix
- 音标: /mɪks/
- 词性: v.（动词）
- 中文释义: (使)混合',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: stem (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a1ac2ca8-b4d6-4eb7-868f-5aaa3518ded8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'stem',
    '类型: 单词
例句: 1. 单词: stem
> - 音标: /stem/
> - 词性: n.（名词）
> - 中文释义: (植物的)茎，梗，柄
2. stem 发音类似"斯特姆"，可以联想"斯特姆茎"
> - 想象植物的茎干部分
>
> 场景记忆法：
> - 想象花朵下面的茎干
> - 联想植物茎干输送养分的功能
3. 近义词: stalk, trunk, branch
>- 反义词: root, leaf
>- 派生词: stems（复数形式）
>
> 相关短语:
> - flower stem（花茎）
> - plant stem（植物茎）
> - stem cell（干细胞）
> - from stem to stern（从头到尾）
> - stem the tide（阻止潮流）
相关词汇: - 单词: stem
- 音标: /stem/
- 词性: n.（名词）
- 中文释义: (植物的)茎，梗，柄',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: news (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ed111096-3daa-4425-a7f6-110b282c3483',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'news',
    '类型: 单词
例句: 1. 单词: news
> - 音标: /nju:z/
> - 词性: n.（名词）
> - 中文释义: 消息
2. news 发音类似"纽兹"，可以联想"纽兹消息"
> - 想象报纸或电视上的新闻
>
> 场景记忆法：
> - 想象看新闻节目的场景
> - 联想"好消息"与"坏消息"的对比
3. 近义词: information, report, story
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - good news（好消息）
> - bad news（坏消息）
> - latest news（最新消息）
> - news report（新闻报道）
> - breaking news（突发新闻）
相关词汇: - 单词: news
- 音标: /nju:z/
- 词性: n.（名词）
- 中文释义: 消息',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: natural (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '88feecae-da23-4f95-9b6f-ca701a9b14ec',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'natural',
    '类型: 单词
例句: 1. 单词: natural
> - 音标: /''nætʃərəl/
> - 词性: adj.（形容词）
> - 中文释义: 自然的，天然的
2. natural 发音类似"纳图拉尔"，可以联想"纳图拉尔自然"
> - 想象大自然中的各种自然现象
>
> 场景记忆法：
> - 想象森林、山川等自然景观
> - 联想"天然"与"人工"的对比
3. 近义词: organic, pure, genuine, authentic
>- 反义词: artificial, synthetic, man-made
>- 派生词: naturally（adv. 自然地）
>
> 相关短语:
> - natural beauty（天然美）
> - natural environment（自然环境）
> - natural resources（自然资源）
> - natural process（自然过程）
> - natural selection（自然选择）
相关词汇: - 单词: natural
- 音标: /''nætʃərəl/
- 词性: adj.（形容词）
- 中文释义: 自然的，天然的',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: breathe (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '839a18c3-2f18-4771-b758-b38206030974',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'breathe',
    '类型: 单词
例句: 1. 单词: breathe
> - 音标: /bri:ð/
> - 词性: v.（动词）
> - 中文释义: 呼吸
2. breathe 发音类似"布里兹"，可以联想"布里兹呼吸"
> - 想象深呼吸时的动作
>
> 场景记忆法：
> - 想象做瑜伽时深呼吸的场景
> - 联想运动后大口呼吸的画面
3. 近义词: inhale, exhale, respire
>- 反义词: suffocate, choke
>- 派生词: breathing（现在分词）, breathed（过去式/过去分词）
>
> 相关短语:
> - breathe in（吸气）
> - breathe out（呼气）
> - breathe deeply（深呼吸）
> - breathe fresh air（呼吸新鲜空气）
> - breathe life into（给...注入活力）
相关词汇: - 单词: breathe
- 音标: /bri:ð/
- 词性: v.（动词）
- 中文释义: 呼吸',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: quarter (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fce0e710-8e3f-4cc8-a366-8eb3359b2c3e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'quarter',
    '类型: 单词
例句: 1. 单词: quarter
> - 音标: /''kwɔ:tə/
> - 词性: n.（名词）
> - 中文释义: 一刻钟，十五分钟
2. quarter 发音类似"夸特"，可以联想"夸特一刻钟"
> - 想象时钟上15分钟的位置
>
> 场景记忆法：
> - 想象看时钟时"一刻钟"的概念
> - 联想"四分之一"与"一刻钟"的关系
3. 近义词: 15 minutes, fourth
>- 反义词: 
>- 派生词: quarterly（adj. 季度的）
>
> 相关短语:
> - a quarter past（...点一刻）
> - a quarter to（差一刻到...点）
> - quarter of an hour（一刻钟）
> - every quarter（每刻钟）
> - three quarters（三刻钟）
相关词汇: - 单词: quarter
- 音标: /''kwɔ:tə/
- 词性: n.（名词）
- 中文释义: 一刻钟，十五分钟',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rest (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '631ab733-3d70-428d-9505-cf2d60c491f7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rest',
    '类型: 单词
例句: 1. 单词: rest
> - 音标: /rest/
> - 词性: n.（名词）
> - 中文释义: 休息(时间)
2. rest 发音类似"瑞斯特"，可以联想"瑞斯特休息"
> - 想象放松休息的状态
>
> 场景记忆法：
> - 想象工作后躺在沙发上休息的场景
> - 联想"休息"与"工作"的对比
3. 近义词: break, relaxation, pause, sleep
>- 反义词: work, activity, movement
>- 派生词: restful（adj. 宁静的）
>
> 相关短语:
> - take a rest（休息一下）
> - have a rest（休息）
> - rest of（其余的）
> - at rest（在休息）
> - rest day（休息日）
相关词汇: - 单词: rest
- 音标: /rest/
- 词性: n.（名词）
- 中文释义: 休息(时间)',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: product (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8ff3f003-af00-47d4-8694-6e315132ea74',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'product',
    '类型: 单词
例句: 1. 单词: product
> - 音标: /''prɒdʌkt/
> - 词性: n.（名词）
> - 中文释义: (自然过程或化学反应的)生成物
2. product 发音类似"普罗达克特"，可以联想"普罗达克特产品"
> - 想象工厂生产出来的各种产品
>
> 场景记忆法：
> - 想象商店里摆放的各种商品
> - 联想化学实验中产生的生成物
3. 近义词: result, outcome, goods, merchandise
>- 反义词: raw material, ingredient
>- 派生词: production（n. 生产）
>
> 相关短语:
> - new product（新产品）
> - product quality（产品质量）
> - final product（最终产品）
> - product development（产品开发）
> - by-product（副产品）
相关词汇: - 单词: product
- 音标: /''prɒdʌkt/
- 词性: n.（名词）
- 中文释义: (自然过程或化学反应的)生成物',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: coffee (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9e4581c3-f18a-4454-a269-f05bd0aa5496',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'coffee',
    '类型: 单词
例句: 1. 单词: coffee
> - 音标: /''kɒfi/
> - 词性: n.（名词）
> - 中文释义: 咖啡
2. coffee 发音类似"科菲"，可以联想"科菲咖啡"
> - 想象咖啡的香味和颜色
>
> 场景记忆法：
> - 想象咖啡店里喝咖啡的场景
> - 联想咖啡的提神作用
3. 近义词: 
>- 反义词: tea, water
>- 派生词: 
>
> 相关短语:
> - black coffee（黑咖啡）
> - white coffee（白咖啡）
> - coffee shop（咖啡店）
> - coffee bean（咖啡豆）
> - instant coffee（速溶咖啡）
相关词汇: - 单词: coffee
- 音标: /''kɒfi/
- 词性: n.（名词）
- 中文释义: 咖啡',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: though (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1d703194-dc92-42df-adca-65f0c79cf6c4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'though',
    '类型: 单词
例句: 1. 单词: though
> - 音标: /ðəʊ/
> - 词性: adv.（副词）
> - 中文释义: 可是，不过，然而
2. though 发音类似"邹"，可以联想"邹不过"
> - 想象表示转折的语气
>
> 场景记忆法：
> - 想象说话时表示"不过"、"然而"的表情
> - 联想"虽然...但是..."的句型
3. 近义词: however, but, nevertheless, yet
>- 反义词: and, also, moreover
>- 派生词: 
>
> 相关短语:
> - even though（即使）
> - as though（好像）
> - though it may be（虽然可能是）
> - though not（虽然不是）
> - though I say so myself（虽然我自己这么说）
相关词汇: - 单词: though
- 音标: /ðəʊ/
- 词性: adv.（副词）
- 中文释义: 可是，不过，然而',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: secret (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e7027557-3889-48f4-8dda-b0a9c4c97a94',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'secret',
    '类型: 单词
例句: 1. 单词: secret
> - 音标: /''si:krit/
> - 词性: n.（名词）
> - 中文释义: 秘密
2. secret 发音类似"西克里特"，可以联想"西克里特秘密"
> - 想象悄悄话或神秘的事情
>
> 场景记忆法：
> - 想象两个人悄悄说秘密的场景
> - 联想"秘密"与"公开"的对比
3. 近义词: mystery, confidential, private
>- 反义词: public, open, known
>- 派生词: secretive（adj. 保密的）
>
> 相关短语:
> - keep secret（保守秘密）
> - tell a secret（说出秘密）
> - secret meeting（秘密会议）
> - secret agent（秘密特工）
> - in secret（秘密地）
相关词汇: - 单词: secret
- 音标: /''si:krit/
- 词性: n.（名词）
- 中文释义: 秘密',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: weekend (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '45758dc4-0a5b-4c8c-a808-16a5d0405be7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'weekend',
    '类型: 单词
例句: 1. 单词: weekend
> - 音标: /wi:k''end/
> - 词性: n.（名词）
> - 中文释义: 周末
2. weekend 发音类似"威肯德"，可以联想"威肯德周末"
> - 想象周末休息放松的场景
>
> 场景记忆法：
> - 想象周末不用上班的轻松感觉
> - 联想"周末"与"工作日"的对比
3. 近义词: 
>- 反义词: weekday, workday
>- 派生词: 
>
> 相关短语:
> - this weekend（这个周末）
> - next weekend（下个周末）
> - last weekend（上个周末）
> - weekend trip（周末旅行）
> - weekend plans（周末计划）
相关词汇: - 单词: weekend
- 音标: /wi:k''end/
- 词性: n.（名词）
- 中文释义: 周末',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: corn silk (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b0a098d8-755f-4445-9503-7d2aa54b6c1c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'corn silk',
    '类型: 单词
例句: 1. 单词: corn silk
> - 音标: /kɔ:n sɪlk/
> - 词性: n.（名词）
> - 中文释义: 玉米须
2. corn silk 发音类似"科恩西尔克"，可以联想"科恩西尔克玉米须"
> - 想象玉米棒上的细丝
>
> 场景记忆法：
> - 想象剥玉米时看到的细丝
> - 联想玉米须的药用价值
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - corn silk tea（玉米须茶）
> - dried corn silk（干玉米须）
> - fresh corn silk（新鲜玉米须）
> - corn silk extract（玉米须提取物）
> - corn silk benefits（玉米须功效）
相关词汇: - 单词: corn silk
- 音标: /kɔ:n sɪlk/
- 词性: n.（名词）
- 中文释义: 玉米须',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: produce (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '68762b99-d845-4510-b576-a45a9ce21dda',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'produce',
    '类型: 单词
例句: 1. 单词: produce
> - 音标: /prə''dju:s/
> - 词性: v.（动词）
> - 中文释义: (自然地)生产，产生，出产
2. produce 发音类似"普罗杜斯"，可以联想"普罗杜斯生产"
> - 想象工厂生产产品的场景
>
> 场景记忆法：
> - 想象工厂流水线生产产品的画面
> - 联想农场生产农作物的场景
3. 近义词: make, create, manufacture, generate
>- 反义词: consume, destroy, waste
>- 派生词: production（n. 生产）
>
> 相关短语:
> - produce goods（生产商品）
> - produce results（产生结果）
> - produce energy（产生能源）
> - mass produce（批量生产）
> - locally produced（本地生产的）
相关词汇: - 单词: produce
- 音标: /prə''dju:s/
- 词性: v.（动词）
- 中文释义: (自然地)生产，产生，出产',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: popular (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2b00f400-d7ae-4096-afbd-d7b911ddb2b7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'popular',
    '类型: 单词
例句: 1. 单词: popular
> - 音标: /''pɒpjələ/
> - 词性: adj.（形容词）
> - 中文释义: 受大众喜爱的，受欢迎的
2. popular 发音类似"波普尤拉"，可以联想"波普尤拉受欢迎"
> - 想象很多人喜欢某样东西的场景
>
> 场景记忆法：
> - 想象明星受到粉丝欢迎的场面
> - 联想"受欢迎"与"不受欢迎"的对比
3. 近义词: well-liked, famous, trendy, fashionable
>- 反义词: unpopular, disliked, unfashionable
>- 派生词: popularity（n. 受欢迎）
>
> 相关短语:
> - popular music（流行音乐）
> - popular culture（流行文化）
> - popular opinion（大众意见）
> - become popular（变得受欢迎）
> - popular with（受...欢迎）
相关词汇: - 单词: popular
- 音标: /''pɒpjələ/
- 词性: adj.（形容词）
- 中文释义: 受大众喜爱的，受欢迎的',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: collect (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e62585bd-5ac0-4776-9aef-d49680b43157',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'collect',
    '类型: 单词
例句: 1. 单词: collect
> - 音标: /kə''lekt/
> - 词性: v.（动词）
> - 中文释义: 收集，采集；使集中
2. collect 发音类似"科莱克特"，可以联想"科莱克特收集"
> - 想象收集各种物品的动作
>
> 场景记忆法：
> - 想象收集邮票、硬币等收藏品的场景
> - 联想收集资料、信息的过程
3. 近义词: gather, accumulate, assemble, compile
>- 反义词: scatter, disperse, distribute
>- 派生词: collection（n. 收集品）
>
> 相关短语:
> - collect stamps（收集邮票）
> - collect information（收集信息）
> - collect money（筹钱）
> - collect thoughts（整理思路）
> - collect data（收集数据）
相关词汇: - 单词: collect
- 音标: /kə''lekt/
- 词性: v.（动词）
- 中文释义: 收集，采集；使集中',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: each (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '720a0881-4f9b-4585-aefc-2e341c171169',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'each',
    '类型: 单词
例句: 1. 单词: each
> - 音标: /i:tʃ/
> - 词性: det.（限定词）
> - 中文释义: (两个或两个以上物或人中的)每个，各
2. each 发音类似"伊奇"，可以联想"伊奇每个"
> - 想象指向每一个个体的手势
>
> 场景记忆法：
> - 想象老师给每个学生发东西的场景
> - 联想"每个"与"全部"的区别
3. 近义词: every, all, individual
>- 反义词: none, neither
>- 派生词: 
>
> 相关短语:
> - each other（互相）
> - each one（每一个）
> - each time（每次）
> - each day（每天）
> - each student（每个学生）
相关词汇: - 单词: each
- 音标: /i:tʃ/
- 词性: det.（限定词）
- 中文释义: (两个或两个以上物或人中的)每个，各',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: prefer (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e07c7765-0cc5-44d6-9fb7-5eb87c137290',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'prefer',
    '类型: 单词
例句: 1. 单词: prefer
> - 音标: /prɪ''fɜ:/
> - 词性: v.（动词）
> - 中文释义: 更喜欢
2. prefer 发音类似"普里弗"，可以联想"普里弗更喜欢"
> - 想象选择时偏向某一方的动作
>
> 场景记忆法：
> - 想象在两种选择中做出偏好的场景
> - 联想"更喜欢"与"不喜欢"的对比
3. 近义词: like better, favor, choose
>- 反义词: dislike, hate, reject
>- 派生词: preference（n. 偏好）
>
> 相关短语:
> - prefer to（更喜欢）
> - prefer doing（更喜欢做）
> - prefer A to B（更喜欢A而不是B）
> - would prefer（宁愿）
> - personal preference（个人偏好）
相关词汇: - 单词: prefer
- 音标: /prɪ''fɜ:/
- 词性: v.（动词）
- 中文释义: 更喜欢',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: send (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '52fdf029-7b70-4333-a353-639644665397',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'send',
    '类型: 单词
例句: 1. 单词: send
> - 音标: /send/
> - 词性: v.（动词）
> - 中文释义: 送出，发出
2. send 发音类似"森德"，可以联想"森德发送"
> - 想象发送邮件或消息的动作
>
> 场景记忆法：
> - 想象发送邮件时的点击动作
> - 联想寄包裹时填写地址的场景
3. 近义词: dispatch, transmit, deliver, mail
>- 反义词: receive, get, obtain
>- 派生词: sending（现在分词）, sent（过去式/过去分词）
>
> 相关短语:
> - send email（发邮件）
> - send message（发消息）
> - send letter（寄信）
> - send package（寄包裹）
> - send for（派人去请）
相关词汇: - 单词: send
- 音标: /send/
- 词性: v.（动词）
- 中文释义: 送出，发出',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: workshop (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '44eed743-111c-473a-9b3e-2b743f1c78a4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'workshop',
    '类型: 单词
例句: 1. 单词: workshop
> - 音标: /''wɜ:kʃɒp/
> - 词性: n.（名词）
> - 中文释义: 车间，工场
2. workshop 发音类似"沃克肖普"，可以联想"沃克肖普车间"
> - 想象工厂里工人忙碌工作的场景
>
> 场景记忆法：
> - 想象工厂车间里机器运转的画面
> - 联想手工艺人在工场里制作物品的场景
3. 近义词: factory, plant, mill, studio
>- 反义词: office, home
>- 派生词: workshops（复数形式）
>
> 相关短语:
> - car workshop（汽车车间）
> - pottery workshop（陶器工场）
> - workshop floor（车间地面）
> - workshop equipment（车间设备）
> - workshop training（车间培训）
相关词汇: - 单词: workshop
- 音标: /''wɜ:kʃɒp/
- 词性: n.（名词）
- 中文释义: 车间，工场',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dark (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c477bb7f-e2c4-4c35-838d-8a4f1305439b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dark',
    '类型: 单词
例句: 1. 单词: dark
> - 音标: /dɑ:k/
> - 词性: adj.（形容词）
> - 中文释义: 昏暗的；黑暗的
2. dark 发音类似"达克"，可以联想"达克黑暗"
> - 想象没有光线的黑暗环境
>
> 场景记忆法：
> - 想象夜晚没有灯光的房间
> - 联想"黑暗"与"明亮"的对比
3. 近义词: dim, shadowy, black, gloomy
>- 反义词: bright, light, sunny, clear
>- 派生词: darkness（n. 黑暗）
>
> 相关短语:
> - dark room（暗室）
> - dark night（黑夜）
> - dark hair（深色头发）
> - dark sky（黑暗的天空）
> - in the dark（在黑暗中）
相关词汇: - 单词: dark
- 音标: /dɑ:k/
- 词性: adj.（形容词）
- 中文释义: 昏暗的；黑暗的',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: culture (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9b3efe9f-bbf5-4b1f-9df9-c3c53a0b23c0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'culture',
    '类型: 单词
例句: 1. 单词: culture
> - 音标: /''kʌltʃə/
> - 词性: n.（名词）
> - 中文释义: 文化
2. culture 发音类似"卡尔彻"，可以联想"卡尔彻文化"
> - 想象各种文化传统和习俗
>
> 场景记忆法：
> - 想象不同国家的文化庆典
> - 联想博物馆里展示的文化遗产
3. 近义词: tradition, heritage, civilization
>- 反义词: 
>- 派生词: cultural（adj. 文化的）
>
> 相关短语:
> - Chinese culture（中国文化）
> - local culture（当地文化）
> - cultural heritage（文化遗产）
> - pop culture（流行文化）
> - cultural exchange（文化交流）
相关词汇: - 单词: culture
- 音标: /''kʌltʃə/
- 词性: n.（名词）
- 中文释义: 文化',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: health (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7db5192e-e1b0-472c-b6f9-471d550e5efd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'health',
    '类型: 单词
例句: 1. 单词: health
> - 音标: /helθ/
> - 词性: n.（名词）
> - 中文释义: 健康(状况)
2. health 发音类似"赫尔思"，可以联想"赫尔思健康"
> - 想象健康强壮的身体
>
> 场景记忆法：
> - 想象医生检查身体的场景
> - 联想健康生活方式的画面
3. 近义词: wellness, fitness, condition
>- 反义词: illness, disease, sickness
>- 派生词: healthy（adj. 健康的）
>
> 相关短语:
> - good health（健康）
> - health care（医疗保健）
> - public health（公共卫生）
> - health insurance（健康保险）
> - health check（健康检查）
相关词汇: - 单词: health
- 音标: /helθ/
- 词性: n.（名词）
- 中文释义: 健康(状况)',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: grow (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f03d0a5c-16db-4d16-83db-fb451f822539',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'grow',
    '类型: 单词
例句: 1. 单词: grow
> - 音标: /grəʊ/
> - 词性: v.（动词）
> - 中文释义: 生长
2. grow 发音类似"格柔"，可以联想"格柔生长"
> - 想象植物或孩子成长的过程
>
> 场景记忆法：
> - 想象植物从种子长成大树的过程
> - 联想孩子从小长到大的变化
3. 近义词: develop, increase, expand, mature
>- 反义词: shrink, decrease, wither
>- 派生词: growing（现在分词）, grew（过去式）, grown（过去分词）
>
> 相关短语:
> - grow up（长大）
> - grow old（变老）
> - grow strong（变强壮）
> - grow flowers（种花）
> - grow into（长成）
相关词汇: - 单词: grow
- 音标: /grəʊ/
- 词性: v.（动词）
- 中文释义: 生长',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: human (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2a688db8-a1d1-4029-92dc-281dad3636bf',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'human',
    '类型: 单词
例句: 1. 单词: human
> - 音标: /''hju:mən/
> - 词性: n.（名词）
> - 中文释义: 人类；人
2. human 发音类似"休曼"，可以联想"休曼人类"
> - 想象人类的各种特征和能力
>
> 场景记忆法：
> - 想象不同肤色、不同文化的人们
> - 联想人类文明发展的历史
3. 近义词: person, people, mankind, humanity
>- 反义词: animal, machine
>- 派生词: humanly（adv. 人类地）
>
> 相关短语:
> - human being（人类）
> - human rights（人权）
> - human nature（人性）
> - human body（人体）
> - human society（人类社会）
相关词汇: - 单词: human
- 音标: /''hju:mən/
- 词性: n.（名词）
- 中文释义: 人类；人',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: relax (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1470692b-3fad-497d-8f75-da94e30f172a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'relax',
    '类型: 单词
例句: 1. 单词: relax
> - 音标: /rɪ''læks/
> - 词性: v.（动词）
> - 中文释义: 放松，休息
2. relax 发音类似"里拉克斯"，可以联想"里拉克斯放松"
> - 想象身体和精神都放松的状态
>
> 场景记忆法：
> - 想象躺在沙发上放松的场景
> - 联想"放松"与"紧张"的对比
3. 近义词: rest, unwind, calm down, chill out
>- 反义词: tense up, stress, worry
>- 派生词: relaxing（现在分词）, relaxed（过去式/过去分词）
>
> 相关短语:
> - relax after work（工作后放松）
> - relax on vacation（度假时放松）
> - relax your mind（放松心情）
> - relax and enjoy（放松享受）
> - feel relaxed（感到放松）
相关词汇: - 单词: relax
- 音标: /rɪ''læks/
- 词性: v.（动词）
- 中文释义: 放松，休息',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: oxygen (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'c64a3f3d-5817-4230-b287-572955ab6dc0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'oxygen',
    '类型: 单词
例句: 1. 单词: oxygen
> - 音标: /''ɒksɪdʒən/
> - 词性: n.（名词）
> - 中文释义: 氧
2. oxygen 发音类似"奥克西金"，可以联想"奥克西金氧气"
> - 想象呼吸时吸入的氧气
>
> 场景记忆法：
> - 想象医院里病人使用氧气面罩的场景
> - 联想植物通过光合作用产生氧气的过程
3. 近义词: O2, air
>- 反义词: carbon dioxide, CO2
>- 派生词: 
>
> 相关短语:
> - oxygen mask（氧气面罩）
> - oxygen tank（氧气罐）
> - oxygen level（氧气含量）
> - pure oxygen（纯氧）
> - oxygen supply（氧气供应）
相关词汇: - 单词: oxygen
- 音标: /''ɒksɪdʒən/
- 词性: n.（名词）
- 中文释义: 氧',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: bamboo (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '35a25458-ba14-49fb-81e1-b6dfc9b26b8a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'bamboo',
    '类型: 单词
例句: 1. 单词: bamboo
> - 音标: /bæm''bu:/
> - 词性: n.（名词）
> - 中文释义: 竹，竹子
2. bamboo 发音类似"班布"，可以联想"班布竹子"
> - 想象高高的竹子
>
> 场景记忆法：
> - 想象竹林里熊猫吃竹子的场景
> - 联想竹子做的各种用品
3. 近义词: 
>- 反义词: 
>- 派生词: bamboos（复数形式）
>
> 相关短语:
> - bamboo forest（竹林）
> - bamboo shoots（竹笋）
> - bamboo furniture（竹制家具）
> - bamboo house（竹屋）
> - bamboo leaves（竹叶）
相关词汇: - 单词: bamboo
- 音标: /bæm''bu:/
- 词性: n.（名词）
- 中文释义: 竹，竹子',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: connect (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd113fad9-36dd-4794-be24-5e028b202f39',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'connect',
    '类型: 单词
例句: 1. 单词: connect
> - 音标: /kə''nekt/
> - 词性: v.（动词）
> - 中文释义: 沟通；连接
2. connect 发音类似"科内克特"，可以联想"科内克特连接"
> - 想象两个物体或人之间的联系
>
> 场景记忆法：
> - 想象用线连接两个点的动作
> - 联想"连接"与"断开"的对比
3. 近义词: link, join, attach, communicate
>- 反义词: disconnect, separate, detach
>- 派生词: connection（n. 连接）
>
> 相关短语:
> - connect with（与...连接/沟通）
> - connect to（连接到）
> - connect the dots（连接点）
> - internet connection（网络连接）
> - connect people（连接人们）
相关词汇: - 单词: connect
- 音标: /kə''nekt/
- 词性: v.（动词）
- 中文释义: 沟通；连接',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: sugar (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '67303bcf-ec45-4112-b85d-f5a7d3a34a4f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'sugar',
    '类型: 单词
例句: 1. 单词: sugar
> - 音标: /''ʃʊgə/
> - 词性: n.（名词）
> - 中文释义: 糖
2. sugar 发音类似"舒格"，可以联想"舒格糖"
> - 想象白色颗粒状的糖
>
> 场景记忆法：
> - 想象往咖啡或茶里加糖的场景
> - 联想甜食中糖的甜味
3. 近义词: sweetener, sweet
>- 反义词: salt, bitter
>- 派生词: sugary（adj. 含糖的）
>
> 相关短语:
> - white sugar（白糖）
> - brown sugar（红糖）
> - sugar cube（方糖）
> - sugar-free（无糖的）
> - blood sugar（血糖）
相关词汇: - 单词: sugar
- 音标: /''ʃʊgə/
- 词性: n.（名词）
- 中文释义: 糖',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: leaf (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3b2f4646-3637-4e15-b4c8-2ccea3b0ee64',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'leaf',
    '类型: 单词
例句: 1. 单词: leaf
> - 音标: /li:f/
> - 词性: n.（名词）
> - 中文释义: 叶，叶子
2. leaf 发音类似"利夫"，可以联想"利夫叶子"
> - 想象绿色叶子的形状
>
> 场景记忆法：
> - 想象秋天时树叶飘落的场景
> - 联想春天时嫩绿新叶的画面
3. 近义词: foliage, greenery
>- 反义词: 
>- 派生词: leaves（复数形式）, leafy（adj. 多叶的）
>
> 相关短语:
> - autumn leaf（秋叶）
> - green leaf（绿叶）
> - fallen leaf（落叶）
> - leaf fall（落叶）
> - turn over a new leaf（翻开新的一页）
相关词汇: - 单词: leaf
- 音标: /li:f/
- 词性: n.（名词）
- 中文释义: 叶，叶子',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rose (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1e672204-537e-40fb-9358-cf9ff549da1b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rose',
    '类型: 单词
例句: 1. 单词: rose
> - 音标: /rəʊz/
> - 词性: n.（名词）
> - 中文释义: 玫瑰；蔷薇
2. rose 发音类似"柔兹"，可以联想"柔兹玫瑰"
> - 想象美丽的玫瑰花
>
> 场景记忆法：
> - 想象花园里盛开的玫瑰花
> - 联想情人节送玫瑰的浪漫场景
3. 近义词: flower, bloom
>- 反义词: 
>- 派生词: roses（复数形式）
>
> 相关短语:
> - red rose（红玫瑰）
> - white rose（白玫瑰）
> - rose garden（玫瑰花园）
> - rose petals（玫瑰花瓣）
> - bed of roses（安逸的生活）
相关词汇: - 单词: rose
- 音标: /rəʊz/
- 词性: n.（名词）
- 中文释义: 玫瑰；蔷薇',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: husband (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2ea777c3-b6f3-4de5-aa64-513fea9f0736',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'husband',
    '类型: 单词
例句: 1. 单词: husband
> - 音标: /''hʌzbənd/
> - 词性: n.（名词）
> - 中文释义: 丈夫
2. husband 发音类似"哈兹本德"，可以联想"哈兹本德丈夫"
> - 想象夫妻关系中的男性角色
>
> 场景记忆法：
> - 想象夫妻一起生活的温馨场景
> - 联想"丈夫"与"妻子"的对应关系
3. 近义词: spouse, partner
>- 反义词: wife
>- 派生词: 
>
> 相关短语:
> - my husband（我的丈夫）
> - her husband（她的丈夫）
> - husband and wife（夫妻）
> - future husband（未来丈夫）
> - ex-husband（前夫）
相关词汇: - 单词: husband
- 音标: /''hʌzbənd/
- 词性: n.（名词）
- 中文释义: 丈夫',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: root (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e790df3d-2225-4192-9991-3b480f857a29',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'root',
    '类型: 单词
例句: 1. 单词: root
> - 音标: /ru:t/
> - 词性: n.（名词）
> - 中文释义: 根
2. root 发音类似"鲁特"，可以联想"鲁特根"
> - 想象植物地下的根系
>
> 场景记忆法：
> - 想象植物地下的根系网络
> - 联想"根本"、"根源"等抽象概念
3. 近义词: base, foundation, origin, source
>- 反义词: branch, leaf, top
>- 派生词: rooted（adj. 有根的）
>
> 相关短语:
> - root cause（根本原因）
> - deep root（深根）
> - take root（生根）
> - root of the problem（问题的根源）
> - square root（平方根）
相关词汇: - 单词: root
- 音标: /ru:t/
- 词性: n.（名词）
- 中文释义: 根',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: key (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1be8f60d-9d1d-4d87-a6fb-baeee5e8858d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'key',
    '类型: 单词
例句: 1. 单词: key
> - 音标: /ki:/
> - 词性: adj.（形容词）
> - 中文释义: 至关重要的；必不可少的
2. key 发音类似"基"，可以联想"基关键"
> - 想象钥匙开锁的重要性
>
> 场景记忆法：
> - 想象钥匙开锁的关键作用
> - 联想"关键"与"次要"的对比
3. 近义词: important, crucial, essential, vital
>- 反义词: unimportant, minor, secondary
>- 派生词: 
>
> 相关短语:
> - key point（关键点）
> - key role（关键角色）
> - key factor（关键因素）
> - key issue（关键问题）
> - key to success（成功的关键）
相关词汇: - 单词: key
- 音标: /ki:/
- 词性: adj.（形容词）
- 中文释义: 至关重要的；必不可少的',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: adult (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2442f760-7335-4267-b84f-cf8d74ab44cd',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'adult',
    '类型: 单词
例句: 1. 单词: adult
> - 音标: /''ædʌlt/
> - 词性: n.（名词）
> - 中文释义: 成人，成年人
2. adult 发音类似"阿达尔特"，可以联想"阿达尔特成人"
> - 想象成熟稳重的成年人形象
>
> 场景记忆法：
> - 想象成年人工作、生活的场景
> - 联想"成人"与"儿童"的对比
3. 近义词: grown-up, mature person
>- 反义词: child, kid, minor
>- 派生词: adulthood（n. 成年期）
>
> 相关短语:
> - young adult（年轻成人）
> - adult education（成人教育）
> - adult life（成人生活）
> - adult responsibility（成人责任）
> - adult movie（成人电影）
相关词汇: - 单词: adult
- 音标: /''ædʌlt/
- 词性: n.（名词）
- 中文释义: 成人，成年人',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: cotton (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '54e53133-ec63-484e-b5ab-129e937429c7',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'cotton',
    '类型: 单词
例句: 1. 单词: cotton
> - 音标: /''kɒtn/
> - 词性: n.（名词）
> - 中文释义: 棉花
2. cotton 发音类似"科顿"，可以联想"科顿棉花"
> - 想象白色的棉花球
>
> 场景记忆法：
> - 想象棉花田里白花花的棉花
> - 联想棉质衣服的柔软感觉
3. 近义词: 
>- 反义词: 
>- 派生词: cottony（adj. 棉质的）
>
> 相关短语:
> - cotton field（棉花田）
> - cotton clothes（棉质衣服）
> - cotton fabric（棉织物）
> - cotton harvest（棉花收成）
> - cotton candy（棉花糖）
相关词汇: - 单词: cotton
- 音标: /''kɒtn/
- 词性: n.（名词）
- 中文释义: 棉花',
    'vocabulary',
    'word',
    '初一',
    'Unit 5',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: droppings (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '90851bb4-7ee0-4365-92b0-8eb6d2886f99',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'droppings',
    '类型: 单词
例句: 1. 单词: droppings
> - 音标: /''drɒpɪŋz/
> - 词性: n.（名词）
> - 中文释义: (兽或鸟的)粪
2. droppings 发音类似"德罗平兹"，可以联想"德罗平兹粪便"
> - 想象动物排泄物的样子
>
> 场景记忆法：
> - 想象公园里需要清理的动物粪便
> - 联想"粪便"与"清洁"的关系
3. 近义词: excrement, waste, dung, manure
>- 反义词: 
>- 派生词: dropping（单数形式）
>
> 相关短语:
> - bird droppings（鸟粪）
> - animal droppings（动物粪便）
> - pigeon droppings（鸽子粪）
> - clean up droppings（清理粪便）
> - droppings on the ground（地上的粪便）
相关词汇: - 单词: droppings
- 音标: /''drɒpɪŋz/
- 词性: n.（名词）
- 中文释义: (兽或鸟的)粪',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: themselves (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '78592d13-56d6-4f9f-8272-bb8b3e2e21d8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'themselves',
    '类型: 单词
例句: 1. 单词: themselves
> - 音标: /ðəm''selvz/
> - 词性: pron.（代词）
> - 中文释义: 它们自己; 他们自己; 她们自己
2. themselves 发音类似"德姆塞尔夫兹"，可以联想"德姆塞尔夫兹他们自己"
> - 想象指向自己的动作
>
> 场景记忆法：
> - 想象孩子们自己完成任务的场景
> - 联想"自己"与"他人"的对比
3. 近义词: 
>- 反义词: others, someone else
>- 派生词: 
>
> 相关短语:
> - by themselves（他们自己）
> - for themselves（为他们自己）
> - of themselves（他们自己的）
> - help themselves（自己拿）
> - enjoy themselves（玩得开心）
相关词汇: - 单词: themselves
- 音标: /ðəm''selvz/
- 词性: pron.（代词）
- 中文释义: 它们自己; 他们自己; 她们自己',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hero (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fa58201f-1599-4ee9-ace3-a170e29fb8e1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hero',
    '类型: 单词
例句: 1. 单词: hero
> - 音标: /''hɪərəʊ/
> - 词性: n.（名词）
> - 中文释义: 英雄
2. hero 发音类似"希罗"，可以联想"希罗英雄"
> - 想象英雄拯救世界的场景
>
> 场景记忆法：
> - 想象超级英雄在天空中飞行的场景
> - 联想英雄的勇敢和正义
3. 近义词: champion, savior, warrior
>- 反义词: villain, coward
>- 派生词: heroes（复数形式）
>
> 相关短语:
> - war hero（战争英雄）
> - national hero（民族英雄）
> - hero of the day（当天的英雄）
> - unsung hero（无名英雄）
> - hero worship（英雄崇拜）
相关词汇: - 单词: hero
- 音标: /''hɪərəʊ/
- 词性: n.（名词）
- 中文释义: 英雄',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: engineer (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f29ff202-4ae8-4bb4-a031-8f398f75eccf',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'engineer',
    '类型: 单词
例句: 1. 单词: engineer
> - 音标: /ˌendʒɪ''nɪə/
> - 词性: n.（名词）
> - 中文释义: 工程师; 设计师
2. engineer 发音类似"恩金尼尔"，可以联想"恩金尼尔工程师"
> - 想象工程师在工地上工作的场景
>
> 场景记忆法：
> - 想象工程师在电脑前设计图纸的场景
> - 联想工程师的专业技能
3. 近义词: designer, technician, builder
>- 反义词: 
>- 派生词: engineering（n. 工程学）
>
> 相关短语:
> - software engineer（软件工程师）
> - civil engineer（土木工程师）
> - mechanical engineer（机械工程师）
> - electrical engineer（电气工程师）
> - chief engineer（总工程师）
相关词汇: - 单词: engineer
- 音标: /ˌendʒɪ''nɪə/
- 词性: n.（名词）
- 中文释义: 工程师; 设计师',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: fantastic (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '01292ca3-2734-42d9-bc75-c33d45543a8c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'fantastic',
    '类型: 单词
例句: 1. 单词: fantastic
> - 音标: /fæn''tæstɪk/
> - 词性: adj.（形容词）
> - 中文释义: 极好的, 吸引人的, 有趣的
2. fantastic 发音类似"范塔斯蒂克"，可以联想"范塔斯蒂克极好的"
> - 想象看到令人惊叹事物时的表情
>
> 场景记忆法：
> - 想象看到壮观景色时的惊叹表情
> - 联想"极好的"与"糟糕的"的对比
3. 近义词: amazing, wonderful, excellent, incredible
>- 反义词: terrible, awful, horrible
>- 派生词: fantastically（adv. 极好地）
>
> 相关短语:
> - fantastic view（令人惊叹的景色）
> - fantastic performance（精彩的表演）
> - fantastic idea（绝妙的想法）
> - absolutely fantastic（绝对棒极了）
> - look fantastic（看起来棒极了）
相关词汇: - 单词: fantastic
- 音标: /fæn''tæstɪk/
- 词性: adj.（形容词）
- 中文释义: 极好的, 吸引人的, 有趣的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: speed (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '02334ee3-ec3d-441f-ad67-1c919abcf748',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'speed',
    '类型: 单词
例句: 1. 单词: speed
> - 音标: /spi:d/
> - 词性: n.（名词）
> - 中文释义: 速度, 速率
2. speed 发音类似"斯皮德"，可以联想"斯皮德速度"
> - 想象快速移动的物体
>
> 场景记忆法：
> - 想象赛车高速行驶的场景
> - 联想"速度"与"慢速"的对比
3. 近义词: velocity, rate, pace
>- 反义词: slowness, delay
>- 派生词: speedy（adj. 快速的）
>
> 相关短语:
> - high speed（高速）
> - speed limit（限速）
> - at full speed（全速）
> - speed up（加速）
> - speed of light（光速）
相关词汇: - 单词: speed
- 音标: /spi:d/
- 词性: n.（名词）
- 中文释义: 速度, 速率',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: plenty (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0636f30c-f35f-4642-9c37-01d9eb70c563',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'plenty',
    '类型: 单词
例句: 1. 单词: plenty
> - 音标: /''plenti/
> - 词性: pron.（代词）
> - 中文释义: 丰富, 充足, 众多, 大量
2. plenty 发音类似"普伦蒂"，可以联想"普伦蒂充足"
> - 想象丰富的资源或充足的时间
>
> 场景记忆法：
> - 想象有充足食物时的满足感
> - 联想"充足"与"不足"的对比
3. 近义词: enough, sufficient, abundant, lots
>- 反义词: insufficient, lacking, scarce
>- 派生词: 
>
> 相关短语:
> - plenty of（大量的）
> - in plenty（充足地）
> - plenty to do（有很多事要做）
> - plenty more（还有很多）
> - time to spare（充足的时间）
相关词汇: - 单词: plenty
- 音标: /''plenti/
- 词性: pron.（代词）
- 中文释义: 丰富, 充足, 众多, 大量',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: amazing (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5007da14-3509-4669-87d2-ace8104ac1c3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'amazing',
    '类型: 单词
例句: 1. 单词: amazing
> - 音标: /ə''meɪzɪŋ/
> - 词性: adj.（形容词）
> - 中文释义: 惊人的; 了不起的
2. amazing 发音类似"阿梅兹英"，可以联想"阿梅兹英惊人"
> - 想象看到令人惊叹事物时的表情
>
> 场景记忆法：
> - 想象看到壮观景色时的惊叹表情
> - 联想"惊人"与"普通"的对比
3. 近义词: incredible, astonishing, wonderful, fantastic
>- 反义词: ordinary, boring, unimpressive
>- 派生词: amaze（v. 使惊讶）
>
> 相关短语:
> - amazing view（令人惊叹的景色）
> - amazing talent（惊人的天赋）
> - amazing performance（令人惊叹的表演）
> - amazing technology（令人惊叹的技术）
> - absolutely amazing（绝对令人惊叹）
相关词汇: - 单词: amazing
- 音标: /ə''meɪzɪŋ/
- 词性: adj.（形容词）
- 中文释义: 惊人的; 了不起的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dodo (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b2a3ddf4-ae8b-43f3-ac75-b81b2061145c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dodo',
    '类型: 单词
例句: 1. 单词: dodo
> - 音标: /''dəʊdəʊ/
> - 词性: n.（名词）
> - 中文释义: 渡渡鸟
2. dodo 发音类似"多多"，可以联想"多多渡渡鸟"
> - 想象笨拙可爱的渡渡鸟形象
>
> 场景记忆法：
> - 想象渡渡鸟在岛上生活的场景
> - 联想渡渡鸟灭绝的历史
3. 近义词: 
>- 反义词: 
>- 派生词: dodos（复数形式）
>
> 相关短语:
> - extinct dodo（已灭绝的渡渡鸟）
> - dodo bird（渡渡鸟）
> - dodo fossil（渡渡鸟化石）
> - as dead as a dodo（彻底死亡）
> - dodo island（渡渡鸟岛）
相关词汇: - 单词: dodo
- 音标: /''dəʊdəʊ/
- 词性: n.（名词）
- 中文释义: 渡渡鸟',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: full (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0d0902af-ae53-44c8-97d4-a32d2ec64c8d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'full',
    '类型: 单词
例句: 1. 单词: full
> - 音标: /fʊl/
> - 词性: adj.（形容词）
> - 中文释义: 满的; 满是………………的
2. full 发音类似"富尔"，可以联想"富尔满的"
> - 想象装满东西的容器
>
> 场景记忆法：
> - 想象装满水的杯子或装满人的房间
> - 联想"满的"与"空的"的对比
3. 近义词: filled, packed, complete, whole
>- 反义词: empty, vacant, incomplete
>- 派生词: fully（adv. 完全地）
>
> 相关短语:
> - full of（充满）
> - full time（全职）
> - full moon（满月）
> - full speed（全速）
> - full stop（句号）
相关词汇: - 单词: full
- 音标: /fʊl/
- 词性: adj.（形容词）
- 中文释义: 满的; 满是………………的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: as happy as a clam (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '15b65fab-6159-4168-ab25-fbd5f74c2ae6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'as happy as a clam',
    '类型: 单词
例句: 1. 单词: as happy as a clam
> - 音标: /æz ''hæpi æz ə klæm/
> - 词性: idiom（习语）
> - 中文释义: 非常高兴的, 相当满足的
2. as happy as a clam 发音类似"阿斯哈皮阿斯阿克拉姆"，可以联想"阿斯哈皮阿斯阿克拉姆非常高兴"
> - 想象蛤蜊在沙滩上满足的样子
>
> 场景记忆法：
> - 想象在沙滩上找到蛤蜊时的满足感
> - 联想"非常高兴"与"不高兴"的对比
3. 近义词: very happy, extremely pleased, overjoyed, delighted
>- 反义词: sad, unhappy, miserable
>- 派生词: 
>
> 相关短语:
> - as happy as a clam（非常高兴）
> - happy as a clam（像蛤蜊一样高兴）
> - as happy as can be（非常高兴）
> - extremely happy（极其高兴）
> - overjoyed（欣喜若狂）
相关词汇: - 单词: as happy as a clam
- 音标: /æz ''hæpi æz ə klæm/
- 词性: idiom（习语）
- 中文释义: 非常高兴的, 相当满足的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: maybe (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2f6dcd5c-60cd-45fb-9358-f3e5b8ca9a17',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'maybe',
    '类型: 单词
例句: 1. 单词: maybe
> - 音标: /''meɪbi/
> - 词性: adv.（副词）
> - 中文释义: 也许, 大概, 可能
2. maybe 发音类似"梅比"，可以联想"梅比也许"
> - 想象不确定时的犹豫表情
>
> 场景记忆法：
> - 想象回答不确定问题时的场景
> - 联想"也许"与"肯定"的对比
3. 近义词: perhaps, possibly, probably, might
>- 反义词: definitely, certainly, surely
>- 派生词: 
>
> 相关短语:
> - maybe not（也许不）
> - maybe so（也许是这样）
> - maybe later（也许稍后）
> - maybe tomorrow（也许明天）
> - maybe next time（也许下次）
相关词汇: - 单词: maybe
- 音标: /''meɪbi/
- 词性: adv.（副词）
- 中文释义: 也许, 大概, 可能',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: as dead as a dodo (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd211cc15-279b-47a6-83ed-4966b0d508b2',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'as dead as a dodo',
    '类型: 单词
例句: 1. 单词: as dead as a dodo
> - 音标: /æz ded æz ə ''dəʊdəʊ/
> - 词性: idiom（习语）
> - 中文释义: 彻底死亡
2. as dead as a dodo 发音类似"阿斯德德阿斯阿多多"，可以联想"阿斯德德阿斯阿多多彻底死亡"
> - 想象渡渡鸟灭绝的彻底性
>
> 场景记忆法：
> - 想象完全过时或彻底消失的事物
> - 联想"彻底死亡"与"仍然存在"的对比
3. 近义词: completely dead, totally extinct, completely obsolete
>- 反义词: alive and well, thriving, current
>- 派生词: 
>
> 相关短语:
> - as dead as a dodo（彻底死亡）
> - dead as a dodo（像渡渡鸟一样死）
> - dodo dead（渡渡鸟死了）
> - completely dead（完全死了）
> - totally extinct（完全灭绝）
相关词汇: - 单词: as dead as a dodo
- 音标: /æz ded æz ə ''dəʊdəʊ/
- 词性: idiom（习语）
- 中文释义: 彻底死亡',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: feed (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ead1022b-2a80-488d-a646-4f8bfd742f44',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'feed',
    '类型: 单词
例句: 1. 单词: feed
> - 音标: /fi:d/
> - 词性: v.（动词）
> - 中文释义: 喂养, 饲养, 给……食物
2. feed 发音类似"菲德"，可以联想"菲德喂养"
> - 想象给动物喂食的动作
>
> 场景记忆法：
> - 想象农场主给动物喂食的场景
> - 联想"喂养"与"饥饿"的关系
3. 近义词: nourish, provide food, give food
>- 反义词: starve, deprive
>- 派生词: feeding（现在分词）, fed（过去式/过去分词）
>
> 相关短语:
> - feed the animals（喂动物）
> - feed the baby（喂婴儿）
> - feed on（以...为食）
> - feed back（反馈）
> - well-fed（喂养良好的）
相关词汇: - 单词: feed
- 音标: /fi:d/
- 词性: v.（动词）
- 中文释义: 喂养, 饲养, 给……食物',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: surprise (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd43a8bd1-7a93-4cf9-b8cd-2a5f079538a3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'surprise',
    '类型: 单词
例句: 1. 单词: surprise
> - 音标: /sə''praɪz/
> - 词性: n.（名词）
> - 中文释义: 意想不到的事
2. surprise 发音类似"瑟普瑞兹"，可以联想"瑟普瑞兹惊喜"
> - 想象收到惊喜时的表情
>
> 场景记忆法：
> - 想象生日派对的惊喜场景
> - 联想"惊喜"与"失望"的对比
3. 近义词: shock, amazement, astonishment
>- 反义词: expectation, anticipation
>- 派生词: surprising（adj. 令人惊讶的）
>
> 相关短语:
> - surprise party（惊喜派对）
> - surprise attack（突然袭击）
> - surprise visit（突然拜访）
> - take by surprise（使惊讶）
> - pleasant surprise（愉快的惊喜）
相关词汇: - 单词: surprise
- 音标: /sə''praɪz/
- 词性: n.（名词）
- 中文释义: 意想不到的事',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: missing (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b78a8dbe-4b15-46de-91ee-a10e29696bc6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'missing',
    '类型: 单词
例句: 1. 单词: missing
> - 音标: /''mɪsɪŋ/
> - 词性: adj.（形容词）
> - 中文释义: 找不到的
2. missing 发音类似"米辛"，可以联想"米辛找不到"
> - 想象寻找丢失物品时的焦急表情
>
> 场景记忆法：
> - 想象寻找丢失钥匙时的场景
> - 联想"找不到"与"找到"的对比
3. 近义词: lost, absent, gone, disappeared
>- 反义词: found, present, here
>- 派生词: miss（v. 错过）
>
> 相关短语:
> - missing person（失踪人员）
> - missing child（失踪儿童）
> - missing piece（缺失的部分）
> - missing link（缺失的环节）
> - go missing（失踪）
相关词汇: - 单词: missing
- 音标: /''mɪsɪŋ/
- 词性: adj.（形容词）
- 中文释义: 找不到的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: wolf (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '45670e7b-7b4b-4680-8981-0b26bc6ddadc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'wolf',
    '类型: 单词
例句: 1. 单词: wolf
> - 音标: /wʊlf/
> - 词性: n.（名词）
> - 中文释义: 狼
2. wolf 发音类似"沃尔夫"，可以联想"沃尔夫狼"
> - 想象狼嚎叫的声音
>
> 场景记忆法：
> - 想象狼群在森林中嚎叫的场景
> - 联想狼的野性和群体性
3. 近义词: 
>- 反义词: 
>- 派生词: wolves（复数形式）
>
> 相关短语:
> - lone wolf（独狼）
> - wolf pack（狼群）
> - cry wolf（喊狼来了）
> - wolf in sheep''s clothing（披着羊皮的狼）
> - hungry as a wolf（饿得像狼一样）
相关词汇: - 单词: wolf
- 音标: /wʊlf/
- 词性: n.（名词）
- 中文释义: 狼',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: mirror (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a546c9cc-9c30-467b-bcb1-abc030ffbb42',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'mirror',
    '类型: 单词
例句: 1. 单词: mirror
> - 音标: /''mɪrə/
> - 词性: n.（名词）
> - 中文释义: 镜子
2. mirror 发音类似"米勒"，可以联想"米勒镜子"
> - 想象照镜子时的反射效果
>
> 场景记忆法：
> - 想象每天早上照镜子梳妆的场景
> - 联想"镜子"与"反射"的关系
3. 近义词: looking glass, reflector
>- 反义词: 
>- 派生词: mirrors（复数形式）
>
> 相关短语:
> - bathroom mirror（浴室镜子）
> - hand mirror（手镜）
> - mirror image（镜像）
> - look in the mirror（照镜子）
> - broken mirror（破镜子）
相关词汇: - 单词: mirror
- 音标: /''mɪrə/
- 词性: n.（名词）
- 中文释义: 镜子',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: hunt (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '85064f11-c73d-410d-b2cb-8d5476bcf8af',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'hunt',
    '类型: 单词
例句: 1. 单词: hunt
> - 音标: /hʌnt/
> - 词性: v.（动词）
> - 中文释义: 打猎; 猎杀
2. hunt 发音类似"亨特"，可以联想"亨特打猎"
> - 想象猎人追踪猎物的场景
>
> 场景记忆法：
> - 想象动物在森林中捕猎的场景
> - 联想"打猎"与"被猎"的关系
3. 近义词: chase, pursue, track, search
>- 反义词: hide, escape, flee
>- 派生词: hunting（现在分词）, hunted（过去式/过去分词）
>
> 相关短语:
> - hunt for（寻找）
> - hunt down（追捕）
> - treasure hunt（寻宝）
> - job hunt（找工作）
> - hunt for clues（寻找线索）
相关词汇: - 单词: hunt
- 音标: /hʌnt/
- 词性: v.（动词）
- 中文释义: 打猎; 猎杀',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: madly (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8a355046-0fa6-46c5-9830-d504c3db0d9d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'madly',
    '类型: 单词
例句: 1. 单词: madly
> - 音标: /''mædli/
> - 词性: adv.（副词）
> - 中文释义: 发狂地; 无法控制地
2. madly 发音类似"马德利"，可以联想"马德利发狂"
> - 想象疯狂失控的状态
>
> 场景记忆法：
> - 想象某人发狂地奔跑或大笑的场景
> - 联想"发狂地"与"平静地"的对比
3. 近义词: wildly, frantically, crazily, hysterically
>- 反义词: calmly, quietly, peacefully
>- 派生词: mad（adj. 疯狂的）
>
> 相关短语:
> - run madly（疯狂地跑）
> - laugh madly（疯狂地笑）
> - work madly（疯狂地工作）
> - love madly（疯狂地爱）
> - dance madly（疯狂地跳舞）
相关词汇: - 单词: madly
- 音标: /''mædli/
- 词性: adv.（副词）
- 中文释义: 发狂地; 无法控制地',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: boring (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f2bfa182-b226-4746-a7b4-b5ecec38c723',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'boring',
    '类型: 单词
例句: 1. 单词: boring
> - 音标: /''bɔ:rɪŋ/
> - 词性: adj.（形容词）
> - 中文释义: 无趣的, 无聊的, 乏味的
2. boring 发音类似"波瑞英"，可以联想"波瑞英无聊"
> - 想象无聊时打哈欠的样子
>
> 场景记忆法：
> - 想象听无聊讲座时昏昏欲睡的场景
> - 联想"无聊"与"有趣"的对比
3. 近义词: dull, tedious, uninteresting, monotonous
>- 反义词: interesting, exciting, fascinating, engaging
>- 派生词: bore（v. 使厌烦）
>
> 相关短语:
> - boring job（无聊的工作）
> - boring movie（无聊的电影）
> - boring lecture（乏味的讲座）
> - boring book（无聊的书）
> - find something boring（觉得某事无聊）
相关词汇: - 单词: boring
- 音标: /''bɔ:rɪŋ/
- 词性: adj.（形容词）
- 中文释义: 无趣的, 无聊的, 乏味的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: friendly (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7f42edaf-fba2-4cd4-b056-ae775864fc30',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'friendly',
    '类型: 单词
例句: 1. 单词: friendly
> - 音标: /''frendli/
> - 词性: adj.（形容词）
> - 中文释义: 友好的, 友善的
2. friendly 发音类似"弗兰德利"，可以联想"弗兰德利友好"
> - 想象友好微笑的表情
>
> 场景记忆法：
> - 想象朋友之间友好交谈的场景
> - 联想"友好"与"敌对"的对比
3. 近义词: kind, warm, welcoming, amiable
>- 反义词: unfriendly, hostile, cold
>- 派生词: friendliness（n. 友好）
>
> 相关短语:
> - friendly smile（友好的微笑）
> - friendly atmosphere（友好的氛围）
> - friendly competition（友好的竞争）
> - user-friendly（用户友好的）
> - friendly fire（友军误伤）
相关词汇: - 单词: friendly
- 音标: /''frendli/
- 词性: adj.（形容词）
- 中文释义: 友好的, 友善的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: pigeon (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8c419762-f71e-4c50-b1e3-ee3da6dd0ef5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'pigeon',
    '类型: 单词
例句: 1. 单词: pigeon
> - 音标: /''pɪdʒɪn/
> - 词性: n.（名词）
> - 中文释义: 鸽子
2. pigeon 发音类似"皮金"，可以联想"皮金鸽子"
> - 想象鸽子咕咕叫的声音
>
> 场景记忆法：
> - 想象公园里人们喂鸽子的场景
> - 联想鸽子作为和平象征的形象
3. 近义词: dove, bird
>- 反义词: 
>- 派生词: pigeons（复数形式）
>
> 相关短语:
> - carrier pigeon（信鸽）
> - homing pigeon（归巢鸽）
> - pigeon hole（鸽子洞）
> - feed pigeons（喂鸽子）
> - pigeon droppings（鸽子粪）
相关词汇: - 单词: pigeon
- 音标: /''pɪdʒɪn/
- 词性: n.（名词）
- 中文释义: 鸽子',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: rescue (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2d4617bd-2dd7-4578-bf6f-599a4b6943fa',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'rescue',
    '类型: 单词
例句: 1. 单词: rescue
> - 音标: /''reskju:/
> - 词性: n.（名词）
> - 中文释义: 营救, 救援
2. rescue 发音类似"瑞斯库"，可以联想"瑞斯库救援"
> - 想象救援人员救人的场景
>
> 场景记忆法：
> - 想象消防员从火灾中救人的场景
> - 联想"救援"与"危险"的关系
3. 近义词: save, help, aid, assistance
>- 反义词: abandon, endanger
>- 派生词: rescuer（n. 救援者）
>
> 相关短语:
> - rescue team（救援队）
> - rescue operation（救援行动）
> - rescue mission（救援任务）
> - emergency rescue（紧急救援）
> - rescue helicopter（救援直升机）
相关词汇: - 单词: rescue
- 音标: /''reskju:/
- 词性: n.（名词）
- 中文释义: 营救, 救援',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: arrive (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1a642c78-af7d-48bc-aac5-9d822c0e1b6a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'arrive',
    '类型: 单词
例句: 1. 单词: arrive
> - 音标: /ə''raɪv/
> - 词性: v.（动词）
> - 中文释义: 到达, 抵达
2. arrive 发音类似"阿赖夫"，可以联想"阿赖夫到达"
> - 想象到达目的地的场景
>
> 场景记忆法：
> - 想象到达机场或车站的场景
> - 联想"到达"与"出发"的对比
3. 近义词: reach, get to, come to
>- 反义词: leave, depart, go away
>- 派生词: arrival（n. 到达）
>
> 相关短语:
> - arrive at（到达某地）
> - arrive on time（准时到达）
> - arrive late（迟到）
> - arrive safely（安全到达）
> - arrive home（到家）
相关词汇: - 单词: arrive
- 音标: /ə''raɪv/
- 词性: v.（动词）
- 中文释义: 到达, 抵达',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: save (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1fd97cd7-b877-4a94-b1d9-f759d56659f3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'save',
    '类型: 单词
例句: 1. 单词: save
> - 音标: /seɪv/
> - 词性: v.（动词）
> - 中文释义: 救, 拯救, 挽救
2. save 发音类似"塞夫"，可以联想"塞夫拯救"
> - 想象拯救生命时的英雄行为
>
> 场景记忆法：
> - 想象消防员从火灾中救人的场景
> - 联想"拯救"与"危险"的关系
3. 近义词: rescue, help, protect, preserve
>- 反义词: endanger, harm, destroy
>- 派生词: saving（现在分词）, saved（过去式/过去分词）
>
> 相关短语:
> - save someone''s life（救某人的命）
> - save money（省钱）
> - save time（节省时间）
> - save the day（拯救局面）
> - save face（保全面子）
相关词汇: - 单词: save
- 音标: /seɪv/
- 词性: v.（动词）
- 中文释义: 救, 拯救, 挽救',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ocean (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8a172ef4-a5e1-49b3-817b-3be8894bf9b5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ocean',
    '类型: 单词
例句: 1. 单词: ocean
> - 音标: /''əʊʃən/
> - 词性: n.（名词）
> - 中文释义: 海洋, 大海
2. ocean 发音类似"欧申"，可以联想"欧申海洋"
> - 想象广阔无边的海洋
>
> 场景记忆法：
> - 想象站在海边看海浪的场景
> - 联想"海洋"与"陆地"的对比
3. 近义词: sea, deep blue, waters
>- 反义词: land, continent
>- 派生词: oceans（复数形式）
>
> 相关短语:
> - deep ocean（深海）
> - ocean waves（海浪）
> - ocean floor（海底）
> - across the ocean（跨越大洋）
> - ocean current（洋流）
相关词汇: - 单词: ocean
- 音标: /''əʊʃən/
- 词性: n.（名词）
- 中文释义: 海洋, 大海',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: research (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4c6012d7-f16a-48b0-b9a9-9062b59c204c',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'research',
    '类型: 单词
例句: 1. 单词: research
> - 音标: /rɪ''sɜ:tʃ/
> - 词性: n.（名词）
> - 中文释义: 研究, 调查
2. research 发音类似"里瑟奇"，可以联想"里瑟奇研究"
> - 想象科学家在实验室里做研究
>
> 场景记忆法：
> - 想象科学家在实验室里进行研究的场景
> - 联想"研究"与"发现"的关系
3. 近义词: study, investigation, inquiry, analysis
>- 反义词: 
>- 派生词: researcher（n. 研究者）
>
> 相关短语:
> - scientific research（科学研究）
> - research paper（研究论文）
> - research project（研究项目）
> - research findings（研究结果）
> - conduct research（进行研究）
相关词汇: - 单词: research
- 音标: /rɪ''sɜ:tʃ/
- 词性: n.（名词）
- 中文释义: 研究, 调查',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: several (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '30ef855d-44bb-4d4d-aa8a-680ff567fc1b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'several',
    '类型: 单词
例句: 1. 单词: several
> - 音标: /''sevərəl/
> - 词性: det.（限定词）
> - 中文释义: 几个, 数个, 一些
2. several 发音类似"塞弗拉尔"，可以联想"塞弗拉尔几个"
> - 想象数几个物品的动作
>
> 场景记忆法：
> - 想象数几个苹果或几本书的场景
> - 联想"几个"与"很多"或"一个"的对比
3. 近义词: some, a few, a number of
>- 反义词: many, all, none
>- 派生词: 
>
> 相关短语:
> - several times（几次）
> - several people（几个人）
> - several days（几天）
> - several books（几本书）
> - several years（几年）
相关词汇: - 单词: several
- 音标: /''sevərəl/
- 词性: det.（限定词）
- 中文释义: 几个, 数个, 一些',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: recognise (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7c0c7040-637f-4cfd-b942-192e8c7124b6',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'recognise',
    '类型: 单词
例句: 1. 单词: recognise
> - 音标: /''rekəgnaɪz/
> - 词性: v.（动词）
> - 中文释义: 认出; 认识; 辨认出
2. recognise 发音类似"瑞科格纳兹"，可以联想"瑞科格纳兹认出"
> - 想象认出某人时的表情
>
> 场景记忆法：
> - 想象在人群中认出朋友的场景
> - 联想"认出"与"陌生"的对比
3. 近义词: identify, know, acknowledge, realize
>- 反义词: ignore, overlook, miss
>- 派生词: recognition（n. 认识）
>
> 相关短语:
> - recognise someone（认出某人）
> - recognise the problem（认识到问题）
> - recognise the importance（认识到重要性）
> - recognise the need（认识到需要）
> - fail to recognise（未能认出）
相关词汇: - 单词: recognise
- 音标: /''rekəgnaɪz/
- 词性: v.（动词）
- 中文释义: 认出; 认识; 辨认出',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: scary (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6b212ebf-d03f-4663-b3ac-ccec844bac29',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'scary',
    '类型: 单词
例句: 1. 单词: scary
> - 音标: /''skeəri/
> - 词性: adj.（形容词）
> - 中文释义: 可怕的, 骇人的, 恐怖的
2. scary 发音类似"斯凯瑞"，可以联想"斯凯瑞可怕"
> - 想象害怕时颤抖的样子
>
> 场景记忆法：
> - 想象看恐怖电影时的紧张感觉
> - 联想"可怕"与"安全"的对比
3. 近义词: frightening, terrifying, horrifying, creepy
>- 反义词: safe, comforting, reassuring
>- 派生词: scare（v. 使害怕）
>
> 相关短语:
> - scary movie（恐怖电影）
> - scary story（恐怖故事）
> - scary dream（可怕的梦）
> - scary noise（可怕的声音）
> - look scary（看起来可怕）
相关词汇: - 单词: scary
- 音标: /''skeəri/
- 词性: adj.（形容词）
- 中文释义: 可怕的, 骇人的, 恐怖的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: die out (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '176702e7-15da-4482-a09a-b738da4544d0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'die out',
    '类型: 单词
例句: 1. 单词: die out
> - 音标: /daɪ aʊt/
> - 词性: v.（动词短语）
> - 中文释义: 消失; 绝迹, 灭绝
2. die out 发音类似"戴奥特"，可以联想"戴奥特灭绝"
> - 想象物种逐渐消失的过程
>
> 场景记忆法：
> - 想象恐龙灭绝的历史场景
> - 联想"灭绝"与"生存"的对比
3. 近义词: become extinct, disappear, vanish, fade away
>- 反义词: survive, thrive, flourish
>- 派生词: 
>
> 相关短语:
> - die out completely（完全灭绝）
> - die out slowly（慢慢消失）
> - die out of existence（灭绝）
> - species die out（物种灭绝）
> - tradition die out（传统消失）
相关词汇: - 单词: die out
- 音标: /daɪ aʊt/
- 词性: v.（动词短语）
- 中文释义: 消失; 绝迹, 灭绝',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: beaver (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'cfc2083b-5224-4d1d-8e74-fd60490dcef8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'beaver',
    '类型: 单词
例句: 1. 单词: beaver
> - 音标: /''bi:və/
> - 词性: n.（名词）
> - 中文释义: 河狸, 海狸
2. beaver 发音类似"比弗"，可以联想"比弗河狸"
> - 想象河狸建水坝的场景
>
> 场景记忆法：
> - 想象河狸在水边建水坝的场景
> - 联想河狸的勤劳形象
3. 近义词: 
>- 反义词: 
>- 派生词: beavers（复数形式）
>
> 相关短语:
> - busy as a beaver（像河狸一样忙碌）
> - beaver dam（河狸水坝）
> - beaver tail（河狸尾巴）
> - beaver lodge（河狸巢穴）
> - young beaver（小河狸）
相关词汇: - 单词: beaver
- 音标: /''bi:və/
- 词性: n.（名词）
- 中文释义: 河狸, 海狸',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: peaceful (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2da0b0a7-4e4f-46c9-b4a4-6045cc22b071',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'peaceful',
    '类型: 单词
例句: 1. 单词: peaceful
> - 音标: /''pi:sfəl/
> - 词性: adj.（形容词）
> - 中文释义: 和平的, 非暴力的
2. peaceful 发音类似"皮斯富尔"，可以联想"皮斯富尔和平"
> - 想象和平鸽或平静的湖面
>
> 场景记忆法：
> - 想象安静祥和的自然环境
> - 联想"和平"与"战争"的对比
3. 近义词: calm, quiet, serene, tranquil
>- 反义词: violent, chaotic, turbulent
>- 派生词: peace（n. 和平）
>
> 相关短语:
> - peaceful country（和平的国家）
> - peaceful protest（和平抗议）
> - peaceful solution（和平解决方案）
> - peaceful coexistence（和平共处）
> - peaceful sleep（安详的睡眠）
相关词汇: - 单词: peaceful
- 音标: /''pi:sfəl/
- 词性: adj.（形容词）
- 中文释义: 和平的, 非暴力的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dead (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '5cd2d3c9-34f2-4e0d-88db-605bc387eec1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dead',
    '类型: 单词
例句: 1. 单词: dead
> - 音标: /ded/
> - 词性: adj.（形容词）
> - 中文释义: 死的, 去世的
2. dead 发音类似"德德"，可以联想"德德死的"
> - 想象没有生命的状态
>
> 场景记忆法：
> - 想象枯萎的植物或死去的动物
> - 联想"死的"与"活的"的对比
3. 近义词: deceased, lifeless, expired
>- 反义词: alive, living, live
>- 派生词: death（n. 死亡）
>
> 相关短语:
> - dead body（尸体）
> - dead battery（没电的电池）
> - dead tired（累死了）
> - dead silence（死寂）
> - drop dead（突然死亡）
相关词汇: - 单词: dead
- 音标: /ded/
- 词性: adj.（形容词）
- 中文释义: 死的, 去世的',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: kilometre (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7b30c2d9-0e30-4abe-b561-ecf3932a4f63',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'kilometre',
    '类型: 单词
例句: 1. 单词: kilometre
> - 音标: /''kɪləmi:tə/
> - 词性: n.（名词）
> - 中文释义: 千米, 公里
2. kilometre 发音类似"基洛米特"，可以联想"基洛米特公里"
> - 想象测量距离的标尺
>
> 场景记忆法：
> - 想象跑步时计算公里数的场景
> - 联想"公里"与"米"的关系
3. 近义词: km, kilometer
>- 反义词: 
>- 派生词: kilometres（复数形式）
>
> 相关短语:
> - per kilometre（每公里）
> - square kilometre（平方公里）
> - kilometre per hour（每小时公里）
> - several kilometres（几公里）
> - long kilometres（长公里）
相关词汇: - 单词: kilometre
- 音标: /''kɪləmi:tə/
- 词性: n.（名词）
- 中文释义: 千米, 公里',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: character (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'a25f5e19-f3f6-4916-830c-17b04f631118',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'character',
    '类型: 单词
例句: 1. 单词: character
> - 音标: /''kærəktə/
> - 词性: n.（名词）
> - 中文释义: (书、剧本、电影中的)人物, 角色
2. character 发音类似"卡拉克特"，可以联想"卡拉克特角色"
> - 想象电影或书中的各种角色
>
> 场景记忆法：
> - 想象电影中不同角色的表演
> - 联想"角色"与"演员"的关系
3. 近义词: role, person, figure, personality
>- 反义词: 
>- 派生词: characters（复数形式）
>
> 相关短语:
> - main character（主角）
> - character development（角色发展）
> - character actor（性格演员）
> - in character（符合角色）
> - out of character（不符合角色）
相关词汇: - 单词: character
- 音标: /''kærəktə/
- 词性: n.（名词）
- 中文释义: (书、剧本、电影中的)人物, 角色',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: island (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '472c957b-548b-4c3f-a73b-6e41ae3c57a8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'island',
    '类型: 单词
例句: 1. 单词: island
> - 音标: /''aɪlənd/
> - 词性: n.（名词）
> - 中文释义: 岛, 岛屿
2. island 发音类似"艾兰"，可以联想"艾兰岛屿"
> - 想象被海水包围的陆地
>
> 场景记忆法：
> - 想象乘船前往美丽岛屿的场景
> - 联想"岛屿"与"大陆"的对比
3. 近义词: isle, atoll, islet
>- 反义词: mainland, continent
>- 派生词: islands（复数形式）
>
> 相关短语:
> - tropical island（热带岛屿）
> - desert island（荒岛）
> - island nation（岛国）
> - on the island（在岛上）
> - island hopping（跳岛游）
相关词汇: - 单词: island
- 音标: /''aɪlənd/
- 词性: n.（名词）
- 中文释义: 岛, 岛屿',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: forest (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f428cb96-c93a-4d2a-9574-bdab6fcd23da',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'forest',
    '类型: 单词
例句: 1. 单词: forest
> - 音标: /''fɒrɪst/
> - 词性: n.（名词）
> - 中文释义: 森林, 林区
2. forest 发音类似"福瑞斯特"，可以联想"福瑞斯特森林"
> - 想象茂密的森林景象
>
> 场景记忆法：
> - 想象在森林中徒步旅行的场景
> - 联想"森林"与"城市"的对比
3. 近义词: woodland, woods, jungle
>- 反义词: desert, city
>- 派生词: forests（复数形式）
>
> 相关短语:
> - dense forest（茂密的森林）
> - forest fire（森林火灾）
> - forest animals（森林动物）
> - forest path（森林小径）
> - tropical forest（热带森林）
相关词汇: - 单词: forest
- 音标: /''fɒrɪst/
- 词性: n.（名词）
- 中文释义: 森林, 林区',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: enough (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '60fa7913-c110-4550-aaae-d04823f6b979',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'enough',
    '类型: 单词
例句: 1. 单词: enough
> - 音标: /ɪ''nʌf/
> - 词性: pron.（代词）
> - 中文释义: 足够
2. enough 发音类似"伊纳夫"，可以联想"伊纳夫足够"
> - 想象满足需求时的满足感
>
> 场景记忆法：
> - 想象有足够食物时的满足场景
> - 联想"足够"与"不足"的对比
3. 近义词: sufficient, adequate, plenty
>- 反义词: insufficient, inadequate, not enough
>- 派生词: 
>
> 相关短语:
> - enough money（足够的钱）
> - enough time（足够的时间）
> - enough food（足够的食物）
> - old enough（年龄足够）
> - big enough（足够大）
相关词汇: - 单词: enough
- 音标: /ɪ''nʌf/
- 词性: pron.（代词）
- 中文释义: 足够',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: knock around (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '14322e99-1bf6-4d3b-85ea-a331d9d54b8e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'knock around',
    '类型: 单词
例句: 1. 单词: knock around
> - 音标: /nɒk ə''raʊnd/
> - 词性: v.（动词短语）
> - 中文释义: 悠闲地度过
2. knock around 发音类似"诺克阿朗德"，可以联想"诺克阿朗德悠闲"
> - 想象悠闲漫步的动作
>
> 场景记忆法：
> - 想象在某个地方悠闲地闲逛的场景
> - 联想"悠闲度过"与"匆忙赶路"的对比
3. 近义词: wander, stroll, roam, hang around
>- 反义词: rush, hurry, dash
>- 派生词: 
>
> 相关短语:
> - knock around town（在城里闲逛）
> - knock around the park（在公园里悠闲地度过）
> - knock around with friends（和朋友一起悠闲地度过）
> - knock around the countryside（在乡村悠闲地度过）
> - knock around aimlessly（漫无目的地闲逛）
相关词汇: - 单词: knock around
- 音标: /nɒk ə''raʊnd/
- 词性: v.（动词短语）
- 中文释义: 悠闲地度过',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: earthquake (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '633f2eaf-c5bc-4786-a716-84ed1238b4c4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'earthquake',
    '类型: 单词
例句: 1. 单词: earthquake
> - 音标: /''ɜ:θkweɪk/
> - 词性: n.（名词）
> - 中文释义: 地震
2. earthquake 发音类似"厄斯克韦克"，可以联想"厄斯克韦克地震"
> - 想象地面震动的情景
>
> 场景记忆法：
> - 想象地震时房屋摇晃的场景
> - 联想"地震"与"安全"的对比
3. 近义词: tremor, quake, seismic activity
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - strong earthquake（强震）
> - earthquake damage（地震损失）
> - earthquake zone（地震带）
> - earthquake warning（地震预警）
> - survive an earthquake（在地震中幸存）
相关词汇: - 单词: earthquake
- 音标: /''ɜ:θkweɪk/
- 词性: n.（名词）
- 中文释义: 地震',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: itself (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2c786ef4-7b5e-4088-8eaa-79b12e0cbb51',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'itself',
    '类型: 单词
例句: 1. 单词: itself
> - 音标: /ɪt''self/
> - 词性: pron.（代词）
> - 中文释义: 自己, 自身
2. itself 发音类似"伊特塞尔夫"，可以联想"伊特塞尔夫自己"
> - 想象物体自己动作的场景
>
> 场景记忆法：
> - 想象自动门自己开关的场景
> - 联想"自己"与"被动"的对比
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - by itself（自己）
> - of itself（它自己的）
> - in itself（本身）
> - for itself（为自己）
> - all by itself（完全靠自己）
相关词汇: - 单词: itself
- 音标: /ɪt''self/
- 词性: pron.（代词）
- 中文释义: 自己, 自身',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: get lost (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'eb9e30d4-76c8-40bf-ae5e-4236dffce519',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'get lost',
    '类型: 单词
例句: 1. 单词: get lost
> - 音标: /get lɒst/
> - 词性: v.（动词短语）
> - 中文释义: 迷路
2. get lost 发音类似"盖特洛斯特"，可以联想"盖特洛斯特迷路"
> - 想象找不到方向时的困惑表情
>
> 场景记忆法：
> - 想象在陌生地方找不到路的场景
> - 联想"迷路"与"找到路"的对比
3. 近义词: lose one''s way, be lost, wander off
>- 反义词: find the way, navigate
>- 派生词: 
>
> 相关短语:
> - get lost in（在...中迷路）
> - get lost easily（容易迷路）
> - get lost on purpose（故意迷路）
> - get lost in thought（陷入沉思）
> - get lost in translation（在翻译中迷失）
相关词汇: - 单词: get lost
- 音标: /get lɒst/
- 词性: v.（动词短语）
- 中文释义: 迷路',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: museum (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'eedc8bbc-a61b-430c-9d21-635be290551f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'museum',
    '类型: 单词
例句: 1. 单词: museum
> - 音标: /mju:''zi:əm/
> - 词性: n.（名词）
> - 中文释义: 博物馆, 博物院
2. museum 发音类似"缪齐姆"，可以联想"缪齐姆博物馆"
> - 想象博物馆里展示的各种展品
>
> 场景记忆法：
> - 想象在博物馆里参观展览的场景
> - 联想"博物馆"与"学习"的关系
3. 近义词: gallery, exhibition hall
>- 反义词: 
>- 派生词: museums（复数形式）
>
> 相关短语:
> - art museum（艺术博物馆）
> - science museum（科学博物馆）
> - natural history museum（自然历史博物馆）
> - museum visit（博物馆参观）
> - museum guide（博物馆导游）
相关词汇: - 单词: museum
- 音标: /mju:''zi:əm/
- 词性: n.（名词）
- 中文释义: 博物馆, 博物院',
    'vocabulary',
    'word',
    '初一',
    'Unit 6',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Tania (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '965b6af2-d198-41d5-abb7-2fba00d11855',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Tania',
    '类型: 单词
例句: 1. 单词: Tania
> - 音标: /''tænɪə/
> - 词性: n.（专有名词）
> - 中文释义: 塔妮娅
2. Tania 发音类似"塔妮娅"，可以联想"塔妮娅塔妮娅"
> - 想象一个叫塔妮娅的女孩
>
> 场景记忆法：
> - 想象一个叫塔妮娅的舞者
> - 联想"塔妮娅"这个优雅的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Tania''s birthday（塔妮娅的生日）
> - call Tania（给塔妮娅打电话）
> - Tania''s dance（塔妮娅的舞蹈）
> - Tania''s performance（塔妮娅的表演）
> - Tania''s studio（塔妮娅的工作室）
相关词汇: - 单词: Tania
- 音标: /''tænɪə/
- 词性: n.（专有名词）
- 中文释义: 塔妮娅',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Dorothy (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e26c062e-365f-4c10-9060-1f1105cb7a3d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Dorothy',
    '类型: 单词
例句: 1. 单词: Dorothy
> - 音标: /''dɒrəθi/
> - 词性: n.（专有名词）
> - 中文释义: 多萝西
2. Dorothy 发音类似"多萝西"，可以联想"多萝西多萝西"
> - 想象一个叫多萝西的女孩
>
> 场景记忆法：
> - 想象《绿野仙踪》中的多萝西
> - 联想"多萝西"这个童话中的经典名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Dorothy from Oz（来自奥兹国的多萝西）
> - Dorothy''s birthday（多萝西的生日）
> - call Dorothy（给多萝西打电话）
> - Dorothy''s journey（多萝西的旅程）
> - Dorothy''s ruby slippers（多萝西的红宝石拖鞋）
相关词汇: - 单词: Dorothy
- 音标: /''dɒrəθi/
- 词性: n.（专有名词）
- 中文释义: 多萝西',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Emilia (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'b2c3d406-3e7d-4e65-a7d5-62807d45270b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Emilia',
    '类型: 单词
例句: 1. 单词: Emilia
> - 音标: /ə''mi:lɪə/
> - 词性: n.（专有名词）
> - 中文释义: 埃米莉亚
2. Emilia 发音类似"埃米莉亚"，可以联想"埃米莉亚埃米莉亚"
> - 想象一个叫埃米莉亚的女孩
>
> 场景记忆法：
> - 想象一个叫埃米莉亚的音乐家
> - 联想"埃米莉亚"这个高雅的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Emilia''s birthday（埃米莉亚的生日）
> - call Emilia（给埃米莉亚打电话）
> - Emilia''s piano（埃米莉亚的钢琴）
> - Emilia''s music（埃米莉亚的音乐）
> - Emilia''s concert（埃米莉亚的音乐会）
相关词汇: - 单词: Emilia
- 音标: /ə''mi:lɪə/
- 词性: n.（专有名词）
- 中文释义: 埃米莉亚',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Robert (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '608248d0-c5de-4ad5-bea7-90c523f306ea',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Robert',
    '类型: 单词
例句: 1. 单词: Robert
> - 音标: /''rɒbət/
> - 词性: n.（专有名词）
> - 中文释义: 罗伯特
2. Robert 发音类似"罗伯特"，可以联想"罗伯特罗伯特"
> - 想象一个叫罗伯特的男孩
>
> 场景记忆法：
> - 想象一个叫罗伯特的棋手
> - 联想"罗伯特"这个稳重的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Robert''s birthday（罗伯特的生日）
> - call Robert（给罗伯特打电话）
> - Robert''s chess set（罗伯特的象棋）
> - Robert''s strategy（罗伯特的策略）
> - Robert''s club（罗伯特的俱乐部）
相关词汇: - 单词: Robert
- 音标: /''rɒbət/
- 词性: n.（专有名词）
- 中文释义: 罗伯特',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Confucius (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3070c1e6-2e54-46c9-9d49-06625493b15e',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Confucius',
    '类型: 单词
例句: 1. 单词: Confucius
> - 音标: /kən''fju:ʃəs/
> - 词性: n.（专有名词）
> - 中文释义: 孔子
2. Confucius 发音类似"康菲尤舍斯"，可以联想"康菲尤舍斯孔子"
> - 想象古代圣人的形象
>
> 场景记忆法：
> - 想象孔子在杏坛讲学的场景
> - 联想孔子的儒家思想和教育理念
3. 近义词: 
>- 反义词: 
>- 派生词: Confucian（adj. 儒家的）
>
> 相关短语:
> - Confucius Institute（孔子学院）
> - Confucian philosophy（儒家哲学）
> - teachings of Confucius（孔子的教诲）
> - Confucius Temple（孔庙）
> - Confucian ethics（儒家伦理）
相关词汇: - 单词: Confucius
- 音标: /kən''fju:ʃəs/
- 词性: n.（专有名词）
- 中文释义: 孔子',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Tony (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '8df428a8-2419-4719-90f0-e79206c5f086',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Tony',
    '类型: 单词
例句: 1. 单词: Tony
> - 音标: /''təʊni/
> - 词性: n.（专有名词）
> - 中文释义: 托尼
2. Tony 发音类似"托尼"，可以联想"托尼托尼"
> - 想象一个叫托尼的男孩
>
> 场景记忆法：
> - 想象一个叫托尼的厨师
> - 联想"托尼"这个亲切的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Tony''s birthday（托尼的生日）
> - call Tony（给托尼打电话）
> - Tony''s kitchen（托尼的厨房）
> - Tony''s recipes（托尼的食谱）
> - Tony''s restaurant（托尼的餐厅）
相关词汇: - 单词: Tony
- 音标: /''təʊni/
- 词性: n.（专有名词）
- 中文释义: 托尼',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Tina (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9e73a6d6-d7e2-4006-9b5e-867be89556ec',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Tina',
    '类型: 单词
例句: 1. 单词: Tina
> - 音标: /''ti:nə/
> - 词性: n.（专有名词）
> - 中文释义: 蒂娜
2. Tina 发音类似"蒂娜"，可以联想"蒂娜蒂娜"
> - 想象一个叫蒂娜的女孩
>
> 场景记忆法：
> - 想象一个叫蒂娜的歌手
> - 联想"蒂娜"这个活泼的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Tina''s birthday（蒂娜的生日）
> - call Tina（给蒂娜打电话）
> - Tina''s songs（蒂娜的歌）
> - Tina''s microphone（蒂娜的麦克风）
> - Tina''s band（蒂娜的乐队）
相关词汇: - 单词: Tina
- 音标: /''ti:nə/
- 词性: n.（专有名词）
- 中文释义: 蒂娜',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mia (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ace189a7-ef81-4cfe-9d01-0f683756c3ae',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mia',
    '类型: 单词
例句: 1. 单词: Mia
> - 音标: /''mi:ə/
> - 词性: n.（专有名词）
> - 中文释义: 米娅
2. Mia 发音类似"米娅"，可以联想"米娅米娅"
> - 想象一个叫米娅的女孩
>
> 场景记忆法：
> - 想象一个叫米娅的可爱女孩
> - 联想"米娅"这个优雅的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Mia Farrow（米娅·法罗）
> - Princess Mia（米娅公主）
> - Mia''s birthday（米娅的生日）
> - call Mia（给米娅打电话）
> - Mia''s house（米娅的家）
相关词汇: - 单词: Mia
- 音标: /''mi:ə/
- 词性: n.（专有名词）
- 中文释义: 米娅',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mary (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '6ce18a7a-266a-4d28-88de-5d38d7f76d5d',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mary',
    '类型: 单词
例句: 1. 单词: Mary
> - 音标: /''meəri/
> - 词性: n.（专有名词）
> - 中文释义: 玛丽
2. Mary 发音类似"玛丽"，可以联想"玛丽玛丽"
> - 想象一个叫玛丽的女孩
>
> 场景记忆法：
> - 想象一个叫玛丽的文学爱好者
> - 联想"玛丽"这个传统的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Mary Poppins（玛丽·波平斯）
> - Mary''s birthday（玛丽的生日）
> - call Mary（给玛丽打电话）
> - Mary''s books（玛丽的书）
> - Mary''s garden（玛丽的花园）
相关词汇: - 单词: Mary
- 音标: /''meəri/
- 词性: n.（专有名词）
- 中文释义: 玛丽',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Jack (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e74fc96f-7e42-4aa8-b4fb-a5bbe9932891',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Jack',
    '类型: 单词
例句: 1. 单词: Jack
> - 音标: /dʒæk/
> - 词性: n.（专有名词）
> - 中文释义: 杰克
2. Jack 发音类似"杰克"，可以联想"杰克杰克"
> - 想象一个叫杰克的男孩
>
> 场景记忆法：
> - 想象童话故事中杰克和豆茎的故事
> - 联想"杰克"这个常见的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Jack of all trades（多才多艺的人）
> - Jack and Jill（杰克和吉尔）
> - Jack Frost（霜冻）
> - Jack in the box（玩偶盒）
> - Jack the Ripper（开膛手杰克）
相关词汇: - 单词: Jack
- 音标: /dʒæk/
- 词性: n.（专有名词）
- 中文释义: 杰克',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Josh (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0ec02844-b072-4aa5-8d00-3b54f4f53253',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Josh',
    '类型: 单词
例句: 1. 单词: Josh
> - 音标: /dʒɒʃ/
> - 词性: n.（专有名词）
> - 中文释义: 乔希
2. Josh 发音类似"乔希"，可以联想"乔希乔希"
> - 想象一个叫乔希的男孩
>
> 场景记忆法：
> - 想象一个叫乔希的游戏爱好者
> - 联想"乔希"这个现代的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Josh''s birthday（乔希的生日）
> - call Josh（给乔希打电话）
> - Josh''s games（乔希的游戏）
> - Josh''s console（乔希的游戏机）
> - Josh''s team（乔希的团队）
相关词汇: - 单词: Josh
- 音标: /dʒɒʃ/
- 词性: n.（专有名词）
- 中文释义: 乔希',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Jones (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ce18ab2a-44b9-44dd-ac38-9c73705c204b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Jones',
    '类型: 单词
例句: 1. 单词: Jones
> - 音标: /dʒəʊnz/
> - 词性: n.（专有名词）
> - 中文释义: 琼斯
2. Jones 发音类似"琼斯"，可以联想"琼斯琼斯"
> - 想象一个叫琼斯的人
>
> 场景记忆法：
> - 想象一个叫琼斯的园丁
> - 联想"琼斯"这个常见的英文姓氏
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Jones''s birthday（琼斯的生日）
> - call Jones（给琼斯打电话）
> - Jones''s garden（琼斯的花园）
> - Jones''s plants（琼斯的植物）
> - Jones''s tools（琼斯的工具）
相关词汇: - 单词: Jones
- 音标: /dʒəʊnz/
- 词性: n.（专有名词）
- 中文释义: 琼斯',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Emma (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'd08ae01a-72ef-41dd-8334-7ba4dbd97b58',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Emma',
    '类型: 单词
例句: 1. 单词: Emma
> - 音标: /''emə/
> - 词性: n.（专有名词）
> - 中文释义: 埃玛
2. Emma 发音类似"埃玛"，可以联想"埃玛埃玛"
> - 想象一个叫埃玛的女孩
>
> 场景记忆法：
> - 想象一个叫埃玛的聪明女孩
> - 联想"埃玛"这个经典的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Emma Watson（埃玛·沃森）
> - Emma Stone（埃玛·斯通）
> - Emma''s birthday（埃玛的生日）
> - call Emma（给埃玛打电话）
> - Emma''s school（埃玛的学校）
相关词汇: - 单词: Emma
- 音标: /''emə/
- 词性: n.（专有名词）
- 中文释义: 埃玛',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Oliver (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'ec240bf9-12e7-49f9-b584-8ff59f781f83',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Oliver',
    '类型: 单词
例句: 1. 单词: Oliver
> - 音标: /''ɒlɪvə/
> - 词性: n.（专有名词）
> - 中文释义: 奥利弗
2. Oliver 发音类似"奥利弗"，可以联想"奥利弗奥利弗"
> - 想象一个叫奥利弗的男孩
>
> 场景记忆法：
> - 想象一个叫奥利弗的勇敢男孩
> - 联想"奥利弗"这个传统的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Oliver Twist（奥利弗·特威斯特）
> - Oliver Cromwell（奥利弗·克伦威尔）
> - Oliver''s birthday（奥利弗的生日）
> - call Oliver（给奥利弗打电话）
> - Oliver''s family（奥利弗的家庭）
相关词汇: - 单词: Oliver
- 音标: /''ɒlɪvə/
- 词性: n.（专有名词）
- 中文释义: 奥利弗',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Jim (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '25b24c6a-ad9c-42ad-b05f-aacf0856ceb0',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Jim',
    '类型: 单词
例句: 1. 单词: Jim
> - 音标: /dʒɪm/
> - 词性: n.（专有名词）
> - 中文释义: 吉姆
2. Jim 发音类似"吉姆"，可以联想"吉姆吉姆"
> - 想象一个叫吉姆的男孩
>
> 场景记忆法：
> - 想象一个叫吉姆的运动员
> - 联想"吉姆"这个简洁的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Jim''s birthday（吉姆的生日）
> - call Jim（给吉姆打电话）
> - Jim''s team（吉姆的球队）
> - Jim''s gym（吉姆的健身房）
> - Jim''s coach（吉姆的教练）
相关词汇: - 单词: Jim
- 音标: /dʒɪm/
- 词性: n.（专有名词）
- 中文释义: 吉姆',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Eric (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '4639d8f5-5093-4cd8-a3e0-ad59cc203b14',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Eric',
    '类型: 单词
例句: 1. 单词: Eric
> - 音标: /''erɪk/
> - 词性: n.（专有名词）
> - 中文释义: 埃里克
2. Eric 发音类似"埃里克"，可以联想"埃里克埃里克"
> - 想象一个叫埃里克的男孩
>
> 场景记忆法：
> - 想象一个叫埃里克的音乐爱好者
> - 联想"埃里克"这个流行的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Eric Clapton（埃里克·克莱普顿）
> - Eric''s birthday（埃里克的生日）
> - call Eric（给埃里克打电话）
> - Eric''s guitar（埃里克的吉他）
> - Eric''s band（埃里克的乐队）
相关词汇: - 单词: Eric
- 音标: /''erɪk/
- 词性: n.（专有名词）
- 中文释义: 埃里克',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Taylor (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '44a8136e-9f75-48c9-bffa-7ed9ba77eed5',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Taylor',
    '类型: 单词
例句: 1. 单词: Taylor
> - 音标: /''teɪlə/
> - 词性: n.（专有名词）
> - 中文释义: 泰勒
2. Taylor 发音类似"泰勒"，可以联想"泰勒泰勒"
> - 想象一个叫泰勒的人
>
> 场景记忆法：
> - 想象一个叫泰勒的作家
> - 联想"泰勒"这个现代的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Taylor''s birthday（泰勒的生日）
> - call Taylor（给泰勒打电话）
> - Taylor''s stories（泰勒的故事）
> - Taylor''s notebook（泰勒的笔记本）
> - Taylor''s workshop（泰勒的工作坊）
相关词汇: - 单词: Taylor
- 音标: /''teɪlə/
- 词性: n.（专有名词）
- 中文释义: 泰勒',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Nick (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'abe16adb-0a6b-4c20-aeaa-fa6ec7f9d2ca',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Nick',
    '类型: 单词
例句: 1. 单词: Nick
> - 音标: /nɪk/
> - 词性: n.（专有名词）
> - 中文释义: 尼克
2. Nick 发音类似"尼克"，可以联想"尼克尼克"
> - 想象一个叫尼克的男孩
>
> 场景记忆法：
> - 想象一个叫尼克的网球运动员
> - 联想"尼克"这个简洁的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Nick''s birthday（尼克的生日）
> - call Nick（给尼克打电话）
> - Nick''s racket（尼克的球拍）
> - Nick''s court（尼克的球场）
> - Nick''s coach（尼克的教练）
相关词汇: - 单词: Nick
- 音标: /nɪk/
- 词性: n.（专有名词）
- 中文释义: 尼克',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Catherine (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1f484b02-6347-4fa9-b304-fe47c6a45c13',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Catherine',
    '类型: 单词
例句: 1. 单词: Catherine
> - 音标: /''kæθərɪn/
> - 词性: n.（专有名词）
> - 中文释义: 凯瑟琳
2. Catherine 发音类似"凯瑟琳"，可以联想"凯瑟琳凯瑟琳"
> - 想象一个叫凯瑟琳的女孩
>
> 场景记忆法：
> - 想象一个叫凯瑟琳的艺术家
> - 联想"凯瑟琳"这个高雅的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Catherine the Great（凯瑟琳大帝）
> - Catherine''s birthday（凯瑟琳的生日）
> - call Catherine（给凯瑟琳打电话）
> - Catherine''s paintings（凯瑟琳的画作）
> - Catherine''s studio（凯瑟琳的工作室）
相关词汇: - 单词: Catherine
- 音标: /''kæθərɪn/
- 词性: n.（专有名词）
- 中文释义: 凯瑟琳',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: John (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '3429db5e-2f7d-475f-87b4-90278d075605',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'John',
    '类型: 单词
例句: 1. 单词: John
> - 音标: /dʒɒn/
> - 词性: n.（专有名词）
> - 中文释义: 约翰
2. John 发音类似"约翰"，可以联想"约翰约翰"
> - 想象一个叫约翰的男孩
>
> 场景记忆法：
> - 想象一个叫约翰的学者
> - 联想"约翰"这个经典的英文名字
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - John''s birthday（约翰的生日）
> - call John（给约翰打电话）
> - John''s books（约翰的书）
> - John''s library（约翰的图书馆）
> - John''s study（约翰的书房）
相关词汇: - 单词: John
- 音标: /dʒɒn/
- 词性: n.（专有名词）
- 中文释义: 约翰',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mencius (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'fbb86e13-53c4-4eff-a17e-b5d5862e012b',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mencius',
    '类型: 单词
例句: 1. 单词: Mencius
> - 音标: /''menʃəs/
> - 词性: n.（专有名词）
> - 中文释义: 孟子
2. Mencius 发音类似"门舍斯"，可以联想"门舍斯孟子"
> - 想象古代哲学家的形象
>
> 场景记忆法：
> - 想象孟子在讲学的场景
> - 联想孟子的性善论思想
3. 近义词: 
>- 反义词: 
>- 派生词: Mencian（adj. 孟子的）
>
> 相关短语:
> - Mencius philosophy（孟子哲学）
> - teachings of Mencius（孟子的教诲）
> - Mencius on human nature（孟子论人性）
> - Mencius and Confucius（孟子和孔子）
> - Mencian ethics（孟子伦理学）
相关词汇: - 单词: Mencius
- 音标: /''menʃəs/
- 词性: n.（专有名词）
- 中文释义: 孟子',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: lunar month (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '7a0396f9-c61a-4dbd-bfa3-ca3e95c9a8fe',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'lunar month',
    '类型: 单词
例句: 1. 单词: lunar month
> - 音标: /''lu:nə mʌnθ/
> - 词性: n.（名词短语）
> - 中文释义: 太阴月; 朔望月
2. lunar month 发音类似"卢纳曼斯"，可以联想"卢纳曼斯太阴月"
> - 想象月亮和月份的形象
>
> 场景记忆法：
> - 想象月亮的变化周期
> - 联想"太阴月"与"农历"的关系
3. 近义词: synodic month, moon month
>- 反义词: solar month
>- 派生词: lunar（adj. 月亮的）
>
> 相关短语:
> - lunar month cycle（太阴月周期）
> - lunar month calendar（太阴月历法）
> - lunar month phases（太阴月阶段）
> - lunar month calculation（太阴月计算）
> - lunar month tradition（太阴月传统）
相关词汇: - 单词: lunar month
- 音标: /''lu:nə mʌnθ/
- 词性: n.（名词短语）
- 中文释义: 太阴月; 朔望月',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: ethics and the rule of law (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '068093a2-2e84-48b9-8fd7-570d695c38b3',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'ethics and the rule of law',
    '类型: 单词
例句: 1. 单词: ethics and the rule of law
> - 音标: /''eθɪks ænd ðə ru:l ʌv lɔ:/
> - 词性: n.（名词短语）
> - 中文释义: 道德与法治
2. ethics and the rule of law 发音类似"埃西克斯安德德鲁尔奥夫洛"，可以联想"埃西克斯安德德鲁尔奥夫洛道德与法治"
> - 想象法律和道德的天平
>
> 场景记忆法：
> - 想象法庭和道德教育的场景
> - 联想"道德与法治"与"社会秩序"的关系
3. 近义词: morality and law, ethics and legal system
>- 反义词: 
>- 派生词: ethical（adj. 道德的）
>
> 相关短语:
> - study ethics and the rule of law（学习道德与法治）
> - ethics and the rule of law education（道德与法治教育）
> - ethics and the rule of law system（道德与法治体系）
> - ethics and the rule of law principles（道德与法治原则）
> - ethics and the rule of law practice（道德与法治实践）
相关词汇: - 单词: ethics and the rule of law
- 音标: /''eθɪks ænd ðə ru:l ʌv lɔ:/
- 词性: n.（名词短语）
- 中文释义: 道德与法治',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Double Fifth Festival (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '2dd5f8ca-a5f5-4077-98c8-f07eda938832',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Double Fifth Festival',
    '类型: 单词
例句: 1. 单词: Double Fifth Festival
> - 音标: /''dʌbəl fɪfθ ''festɪvəl/
> - 词性: n.（名词短语）
> - 中文释义: 重午节
2. Double Fifth Festival 发音类似"达布尔菲夫斯费斯蒂瓦尔"，可以联想"达布尔菲夫斯费斯蒂瓦尔重午节"
> - 想象两个"五"字和节日的形象
>
> 场景记忆法：
> - 想象农历五月初五的节日场景
> - 联想"重午节"与"端午节"的关系
3. 近义词: Dragon Boat Festival, Duanwu Festival
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - celebrate Double Fifth Festival（庆祝重午节）
> - Double Fifth Festival traditions（重午节传统）
> - Double Fifth Festival customs（重午节习俗）
> - Double Fifth Festival date（重午节日期）
> - Double Fifth Festival meaning（重午节意义）
相关词汇: - 单词: Double Fifth Festival
- 音标: /''dʌbəl fɪfθ ''festɪvəl/
- 词性: n.（名词短语）
- 中文释义: 重午节',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: students' union (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '49ac5486-5cb4-4422-b6b5-2637a879fbb4',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'students'' union',
    '类型: 单词
例句: 1. 单词: students'' union
> - 音标: /''stju:dənts ''ju:njən/
> - 词性: n.（名词短语）
> - 中文释义: 学生会
2. students'' union 发音类似"斯图登茨尤尼恩"，可以联想"斯图登茨尤尼恩学生会"
> - 想象学生聚集在一起的场景
>
> 场景记忆法：
> - 想象学生会办公室和学生活动的场景
> - 联想"学生会"与"学生服务"的关系
3. 近义词: student council, student government
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - join the students'' union（加入学生会）
> - students'' union president（学生会主席）
> - students'' union office（学生会办公室）
> - students'' union activities（学生会活动）
> - students'' union meeting（学生会会议）
相关词汇: - 单词: students'' union
- 音标: /''stju:dənts ''ju:njən/
- 词性: n.（名词短语）
- 中文释义: 学生会',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Dragon Boat Festival (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '529f7258-2c22-4c01-b6fd-427c2ed4911a',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Dragon Boat Festival',
    '类型: 单词
例句: 1. 单词: Dragon Boat Festival
> - 音标: /''drægən bəʊt ''festɪvəl/
> - 词性: n.（名词短语）
> - 中文释义: 端午节
2. Dragon Boat Festival 发音类似"德拉贡波特费斯蒂瓦尔"，可以联想"德拉贡波特费斯蒂瓦尔端午节"
> - 想象龙舟和粽子的形象
>
> 场景记忆法：
> - 想象端午节龙舟比赛的场景
> - 联想"端午节"与"中国传统文化"的关系
3. 近义词: Duanwu Festival, Double Fifth Festival
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - celebrate Dragon Boat Festival（庆祝端午节）
> - Dragon Boat Festival traditions（端午节传统）
> - Dragon Boat Festival food（端午节食物）
> - Dragon Boat Festival activities（端午节活动）
> - Dragon Boat Festival history（端午节历史）
相关词汇: - 单词: Dragon Boat Festival
- 音标: /''drægən bəʊt ''festɪvəl/
- 词性: n.（名词短语）
- 中文释义: 端午节',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: dragon boat race (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'dd8ed17b-d047-4d40-8e09-ed8e2a0151fc',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'dragon boat race',
    '类型: 单词
例句: 1. 单词: dragon boat race
> - 音标: /''drægən bəʊt reɪs/
> - 词性: n.（名词短语）
> - 中文释义: 龙舟比赛
2. dragon boat race 发音类似"德拉贡波特雷斯"，可以联想"德拉贡波特雷斯龙舟比赛"
> - 想象龙舟和比赛的场景
>
> 场景记忆法：
> - 想象端午节龙舟比赛的激烈场面
> - 联想"龙舟比赛"与"端午节传统"的关系
3. 近义词: dragon boat competition, dragon boat contest
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - participate in dragon boat race（参加龙舟比赛）
> - dragon boat race team（龙舟比赛队伍）
> - dragon boat race festival（龙舟比赛节）
> - dragon boat race tradition（龙舟比赛传统）
> - dragon boat race winner（龙舟比赛获胜者）
相关词汇: - 单词: dragon boat race
- 音标: /''drægən bəʊt reɪs/
- 词性: n.（名词短语）
- 中文释义: 龙舟比赛',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Beijing opera (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'e234e02e-658c-41f2-9d3f-51fc7a113f3f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Beijing opera',
    '类型: 单词
例句: 1. 单词: Beijing opera
> - 音标: /''beɪdʒɪŋ ''ɒpərə/
> - 词性: n.（名词短语）
> - 中文释义: 京剧
2. Beijing opera 发音类似"北京奥佩拉"，可以联想"北京奥佩拉京剧"
> - 想象京剧演员的华丽服装和脸谱
>
> 场景记忆法：
> - 想象京剧舞台上的表演场景
> - 联想"京剧"与"中国传统艺术"的关系
3. 近义词: Peking opera, Chinese opera
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - watch Beijing opera（观看京剧）
> - Beijing opera performance（京剧表演）
> - Beijing opera actor（京剧演员）
> - Beijing opera costume（京剧服装）
> - Beijing opera makeup（京剧化妆）
相关词汇: - 单词: Beijing opera
- 音标: /''beɪdʒɪŋ ''ɒpərə/
- 词性: n.（名词短语）
- 中文释义: 京剧',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Alice's Adventures in Wonderland (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    'f0c15671-18ae-4b38-8743-249d9394d848',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Alice''s Adventures in Wonderland',
    '类型: 单词
例句: 1. 单词: Alice''s Adventures in Wonderland
> - 音标: /''ælɪsɪz əd''ventʃəz ɪn ''wʌndəlænd/
> - 词性: n.（专有名词）
> - 中文释义: 《爱丽丝漫游奇境记》
2. Alice''s Adventures in Wonderland 发音类似"爱丽丝兹阿德文彻斯因旺德兰"，可以联想"爱丽丝兹阿德文彻斯因旺德兰爱丽丝漫游奇境记"
> - 想象爱丽丝和奇幻世界的形象
>
> 场景记忆法：
> - 想象爱丽丝掉进兔子洞的奇幻冒险
> - 联想"爱丽丝漫游奇境记"与"经典童话"的关系
3. 近义词: Alice in Wonderland
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - read Alice''s Adventures in Wonderland（读《爱丽丝漫游奇境记》）
> - Alice''s Adventures in Wonderland story（《爱丽丝漫游奇境记》故事）
> - Alice''s Adventures in Wonderland characters（《爱丽丝漫游奇境记》角色）
> - Alice''s Adventures in Wonderland movie（《爱丽丝漫游奇境记》电影）
> - Alice''s Adventures in Wonderland author（《爱丽丝漫游奇境记》作者）
相关词汇: - 单词: Alice''s Adventures in Wonderland
- 音标: /''ælɪsɪz əd''ventʃəz ɪn ''wʌndəlænd/
- 词性: n.（专有名词）
- 中文释义: 《爱丽丝漫游奇境记》',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Great Bear Rainforest (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '81c55efd-e5b9-4c96-8357-32e74bc4f2c8',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Great Bear Rainforest',
    '类型: 单词
例句: 1. 单词: Great Bear Rainforest
> - 音标: /greɪt beə ''reɪnfɒrɪst/
> - 词性: n.（专有名词）
> - 中文释义: 大熊雨林
2. Great Bear Rainforest 发音类似"格雷特贝尔雷恩福瑞斯特"，可以联想"格雷特贝尔雷恩福瑞斯特大熊雨林"
> - 想象巨大的雨林和熊的形象
>
> 场景记忆法：
> - 想象加拿大西海岸的原始雨林
> - 联想"大熊雨林"与"野生动物保护"的关系
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Great Bear Rainforest protection（大熊雨林保护）
> - visit the Great Bear Rainforest（参观大熊雨林）
> - Great Bear Rainforest animals（大熊雨林动物）
> - Great Bear Rainforest ecosystem（大熊雨林生态系统）
> - Great Bear Rainforest conservation（大熊雨林保护）
相关词汇: - 单词: Great Bear Rainforest
- 音标: /greɪt beə ''reɪnfɒrɪst/
- 词性: n.（专有名词）
- 中文释义: 大熊雨林',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: the Indian Ocean (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '0d8e94f2-1c7b-44e1-9329-30facef3374f',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'the Indian Ocean',
    '类型: 单词
例句: 1. 单词: the Indian Ocean
> - 音标: /ði ''ɪndɪən ''əʊʃən/
> - 词性: n.（专有名词）
> - 中文释义: 印度洋
2. the Indian Ocean 发音类似"德印迪安欧申"，可以联想"德印迪安欧申印度洋"
> - 想象广阔的海洋和印度的形象
>
> 场景记忆法：
> - 想象印度洋的广阔海域和周边国家
> - 联想"印度洋"与"亚洲和非洲"的关系
3. 近义词: 
>- 反义词: 
>- 派生词: 
>
> 相关短语:
> - Indian Ocean countries（印度洋国家）
> - Indian Ocean islands（印度洋岛屿）
> - Indian Ocean trade（印度洋贸易）
> - Indian Ocean currents（印度洋洋流）
> - Indian Ocean region（印度洋地区）
相关词汇: - 单词: the Indian Ocean
- 音标: /ði ''ɪndɪən ''əʊʃən/
- 词性: n.（专有名词）
- 中文释义: 印度洋',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Canada (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '9706248f-589f-49c0-b04e-c6be0c265144',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Canada',
    '类型: 单词
例句: 1. 单词: Canada
> - 音标: /''kænədə/
> - 词性: n.（专有名词）
> - 中文释义: 加拿大
2. Canada 发音类似"卡纳达"，可以联想"卡纳达加拿大"
> - 想象枫叶和冰球的形象
>
> 场景记忆法：
> - 想象加拿大的枫叶、冰球和友好的人民
> - 联想"加拿大"与"枫叶之国"的关系
3. 近义词: 
>- 反义词: 
>- 派生词: Canadian（adj. 加拿大的）
>
> 相关短语:
> - Canadian flag（加拿大国旗）
> - Canadian people（加拿大人民）
> - Canadian culture（加拿大文化）
> - Canadian weather（加拿大天气）
> - Canadian food（加拿大食物）
相关词汇: - 单词: Canada
- 音标: /''kænədə/
- 词性: n.（专有名词）
- 中文释义: 加拿大',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);


-- 单词: Mexico (word)
INSERT INTO recitations (
    id, student_id, subject_id, chapter_id, title, content, 
    recitation_type, vocabulary_type, grade_level, unit_name, difficulty_level, is_memorized, practice_count, 
    created_at, updated_at
) VALUES (
    '1d6575b5-aac0-4f44-839a-f54acfa285b1',
    '00000000-0000-0000-0000-000000000000', -- 默认学生ID，实际使用时需要替换
    '550e8400-e29b-41d4-a716-446655440002', -- 初一英语学科ID
    NULL,
    'Mexico',
    '类型: 单词
例句: 1. 单词: Mexico
> - 音标: /''meksɪkəʊ/
> - 词性: n.（专有名词）
> - 中文释义: 墨西哥
2. Mexico 发音类似"梅克西科"，可以联想"梅克西科墨西哥"
> - 想象墨西哥的仙人掌和彩色建筑
>
> 场景记忆法：
> - 想象墨西哥的仙人掌、彩色建筑和传统音乐
> - 联想"墨西哥"与"拉丁文化"的关系
3. 近义词: 
>- 反义词: 
>- 派生词: Mexican（adj. 墨西哥的）
>
> 相关短语:
> - Mexican food（墨西哥食物）
> - Mexican culture（墨西哥文化）
> - Mexican people（墨西哥人民）
> - Mexican flag（墨西哥国旗）
> - Mexican music（墨西哥音乐）
相关词汇: - 单词: Mexico
- 音标: /''meksɪkəʊ/
- 词性: n.（专有名词）
- 中文释义: 墨西哥',
    'vocabulary',
    'word',
    '初一',
    'Unknown',
    1,
    false,
    0,
    NOW(),
    NOW()
);
