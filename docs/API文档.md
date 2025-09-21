# API 接口文档

## 基础信息

- **Base URL**: `http://localhost:9002/api/v1`
- **认证方式**: JWT Bearer Token
- **数据格式**: JSON

## 认证接口

### 用户注册

```http
POST /auth/register
Content-Type: application/json

{
  "username": "string",
  "email": "string",
  "password": "string",
  "full_name": "string",
  "grade": "string",
  "class_name": "string",
  "role": "student|parent|teacher"
}
```

**响应**:
```json
{
  "id": "uuid",
  "username": "string",
  "email": "string",
  "full_name": "string",
  "grade": "string",
  "class_name": "string",
  "role": "string",
  "is_active": true,
  "created_at": "datetime"
}
```

### 用户登录

```http
POST /auth/login
Content-Type: application/x-www-form-urlencoded

username=string&password=string
```

**响应**:
```json
{
  "access_token": "string",
  "token_type": "bearer"
}
```

### 获取当前用户信息

```http
GET /auth/me
Authorization: Bearer <token>
```

**响应**:
```json
{
  "id": "uuid",
  "username": "string",
  "email": "string",
  "full_name": "string",
  "grade": "string",
  "class_name": "string",
  "role": "string",
  "avatar_url": "string",
  "is_active": true,
  "created_at": "datetime",
  "updated_at": "datetime"
}
```

## 学科接口

### 获取所有学科

```http
GET /subjects
```

**响应**:
```json
[
  {
    "id": "uuid",
    "name": "语文",
    "code": "chinese",
    "description": "初中语文学习",
    "color": "#FF6B6B",
    "icon": "book",
    "is_active": true,
    "created_at": "datetime"
  }
]
```

### 获取学科章节

```http
GET /subjects/{subject_id}/chapters?grade=初一&semester=上学期
```

**响应**:
```json
[
  {
    "id": "uuid",
    "subject_id": "uuid",
    "grade": "初一",
    "semester": "上学期",
    "chapter_number": 1,
    "title": "第一章 古诗词",
    "description": "古诗词学习",
    "order_index": 1,
    "created_at": "datetime"
  }
]
```

### 获取知识点

```http
GET /subjects/{subject_id}/knowledge-points?chapter_id=uuid
```

**响应**:
```json
[
  {
    "id": "uuid",
    "subject_id": "uuid",
    "chapter_id": "uuid",
    "title": "二次函数",
    "content": "二次函数的基本概念和性质",
    "difficulty_level": 3,
    "tags": ["函数", "数学"],
    "order_index": 1,
    "created_at": "datetime"
  }
]
```

## 学习计划接口

### 创建学习计划

```http
POST /study/plans
Authorization: Bearer <token>
Content-Type: application/json

{
  "subject_id": "uuid",
  "title": "数学复习计划",
  "description": "复习第1-3章内容",
  "plan_type": "weekly",
  "start_date": "2024-01-15",
  "end_date": "2024-01-21"
}
```

### 获取学习计划列表

```http
GET /study/plans?subject_id=uuid&plan_type=weekly
Authorization: Bearer <token>
```

### 更新学习计划

```http
PUT /study/plans/{plan_id}
Authorization: Bearer <token>
Content-Type: application/json

{
  "title": "更新后的计划标题",
  "is_completed": true
}
```

### 删除学习计划

```http
DELETE /study/plans/{plan_id}
Authorization: Bearer <token>
```

## 学习任务接口

### 创建学习任务

```http
POST /study/tasks
Authorization: Bearer <token>
Content-Type: application/json

{
  "plan_id": "uuid",
  "subject_id": "uuid",
  "task_type": "homework",
  "title": "完成数学作业第3章",
  "description": "完成第3章练习题1-20题",
  "content": "具体作业内容",
  "scheduled_date": "2024-01-15",
  "priority": 1,
  "estimated_duration": 60
}
```

### 获取学习任务列表

```http
GET /study/tasks?scheduled_date=2024-01-15&is_completed=false
Authorization: Bearer <token>
```

### 更新学习任务

```http
PUT /study/tasks/{task_id}
Authorization: Bearer <token>
Content-Type: application/json

{
  "is_completed": true,
  "completed_date": "2024-01-15T10:30:00Z",
  "actual_duration": 45
}
```

## 笔记接口

### 创建笔记

```http
POST /content/notes
Authorization: Bearer <token>
Content-Type: application/json

{
  "subject_id": "uuid",
  "chapter_id": "uuid",
  "knowledge_point_id": "uuid",
  "title": "数学公式总结",
  "content": "二次函数公式...",
  "note_type": "formula",
  "tags": ["公式", "二次函数"],
  "is_important": true
}
```

### 获取笔记列表

```http
GET /content/notes?subject_id=uuid&note_type=formula
Authorization: Bearer <token>
```

### 更新笔记

```http
PUT /content/notes/{note_id}
Authorization: Bearer <token>
Content-Type: application/json

{
  "title": "更新后的标题",
  "content": "更新后的内容",
  "is_important": false
}
```

### 删除笔记

```http
DELETE /content/notes/{note_id}
Authorization: Bearer <token>
```

## 作业接口

### 创建作业

```http
POST /content/assignments
Authorization: Bearer <token>
Content-Type: application/json

{
  "subject_id": "uuid",
  "title": "数学作业第3章",
  "description": "完成第3章练习题",
  "content": "具体作业内容",
  "due_date": "2024-01-20"
}
```

### 获取作业列表

```http
GET /content/assignments?subject_id=uuid&is_submitted=false
Authorization: Bearer <token>
```

### 提交作业

```http
PUT /content/assignments/{assignment_id}/submit
Authorization: Bearer <token>
Content-Type: application/json

{
  "submitted_date": "2024-01-18T15:30:00Z"
}
```

## 练习接口

### 获取练习题

```http
GET /content/practice-questions?subject_id=uuid&difficulty_level=3
Authorization: Bearer <token>
```

### 提交练习答案

```http
POST /content/practice-records
Authorization: Bearer <token>
Content-Type: application/json

{
  "question_id": "uuid",
  "student_answer": "答案内容",
  "time_spent": 120
}
```

### 获取错题本

```http
GET /content/wrong-questions?subject_id=uuid
Authorization: Bearer <token>
```

## 考试接口

### 创建考试

```http
POST /exams
Authorization: Bearer <token>
Content-Type: application/json

{
  "subject_id": "uuid",
  "exam_type": "midterm",
  "title": "数学期中考试",
  "description": "第1-5章内容",
  "exam_date": "2024-01-25",
  "duration": 120,
  "total_score": 100
}
```

### 获取考试列表

```http
GET /exams?subject_id=uuid&exam_type=midterm
Authorization: Bearer <token>
```

### 更新考试成绩

```http
PUT /exams/{exam_id}
Authorization: Bearer <token>
Content-Type: application/json

{
  "achieved_score": 85,
  "is_completed": true
}
```

## 学习进度接口

### 获取学习进度

```http
GET /study/progress?subject_id=uuid&date_range=2024-01-01,2024-01-31
Authorization: Bearer <token>
```

### 更新学习进度

```http
PUT /study/progress
Authorization: Bearer <token>
Content-Type: application/json

{
  "subject_id": "uuid",
  "knowledge_point_id": "uuid",
  "progress_percentage": 80,
  "study_time": 30,
  "mastery_level": 4
}
```

## 学习统计接口

### 获取学习统计

```http
GET /study/statistics?date_range=2024-01-01,2024-01-31
Authorization: Bearer <token>
```

**响应**:
```json
{
  "total_study_time": 1200,
  "total_tasks_completed": 45,
  "average_accuracy": 85,
  "subject_breakdown": [
    {
      "subject": "数学",
      "study_time": 300,
      "tasks_completed": 12,
      "accuracy": 88
    }
  ],
  "weekly_progress": [
    {
      "week": "2024-W01",
      "study_time": 300,
      "tasks_completed": 12,
      "accuracy": 88
    }
  ]
}
```

## 提醒接口

### 创建学习提醒

```http
POST /reminders
Authorization: Bearer <token>
Content-Type: application/json

{
  "title": "数学作业提醒",
  "content": "记得完成数学作业第3章",
  "reminder_type": "homework",
  "scheduled_time": "2024-01-15T18:00:00Z",
  "is_recurring": true,
  "recurrence_pattern": "daily"
}
```

### 获取提醒列表

```http
GET /reminders?reminder_type=homework
Authorization: Bearer <token>
```

## 错误响应

所有接口在出错时都会返回以下格式的错误响应：

```json
{
  "detail": "错误描述信息"
}
```

### 常见HTTP状态码

- `200` - 成功
- `201` - 创建成功
- `400` - 请求参数错误
- `401` - 未授权
- `403` - 禁止访问
- `404` - 资源不存在
- `422` - 数据验证错误
- `500` - 服务器内部错误

## 分页参数

对于列表接口，支持以下分页参数：

- `page` - 页码（从1开始）
- `size` - 每页数量（默认10）
- `sort` - 排序字段
- `order` - 排序方向（asc/desc）

**示例**:
```http
GET /study/tasks?page=1&size=20&sort=created_at&order=desc
```

## 过滤参数

支持以下通用过滤参数：

- `created_at` - 创建时间范围
- `updated_at` - 更新时间范围
- `is_active` - 是否激活
- `is_completed` - 是否完成

**示例**:
```http
GET /study/tasks?created_at=2024-01-01,2024-01-31&is_completed=false
```
