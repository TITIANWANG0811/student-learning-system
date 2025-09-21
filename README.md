# 初中生学习管理系统

一个专为初中生设计的学习管理系统，帮助孩子完成日常学习复习以及最终考试，帮助家长辅助孩子管理学习。

## 🎯 项目特色

- **多学科支持**：语文、数学、英语、道法、历史
- **全面学习管理**：教材、笔记、作业、默写、背诵、课外教辅
- **智能进度跟踪**：学习计划、任务管理、进度统计
- **家长监督功能**：学习报告、进度监控、学习建议
- **现代化界面**：响应式设计，支持多设备访问

## 🏗️ 技术架构

### 后端技术栈
- **Python 3.8+** - 编程语言
- **FastAPI** - 高性能异步Web框架
- **SQLAlchemy** - ORM数据库操作
- **PostgreSQL** - 主数据库
- **Redis** - 缓存和会话管理
- **JWT** - 身份认证
- **Alembic** - 数据库迁移

### 前端技术栈
- **React 18** - 用户界面库
- **TypeScript** - 类型安全的JavaScript
- **Ant Design** - UI组件库
- **React Router** - 路由管理
- **Axios** - HTTP客户端

## 📁 项目结构

```
StudentLearningSystem/
├── backend/                 # 后端代码
│   ├── app/
│   │   ├── api/            # API路由
│   │   ├── core/           # 核心配置
│   │   ├── models/         # 数据模型
│   │   ├── schemas/        # Pydantic模式
│   │   └── services/       # 业务逻辑
│   ├── requirements.txt    # Python依赖
│   ├── config.py          # 配置文件
│   └── main.py            # 应用入口
├── frontend/               # 前端代码
│   ├── src/
│   │   ├── components/     # React组件
│   │   ├── pages/         # 页面组件
│   │   ├── contexts/      # React上下文
│   │   └── services/      # API服务
│   └── package.json       # Node.js依赖
├── database/              # 数据库相关
│   └── schema.sql         # 数据库表结构
├── docs/                  # 项目文档
└── start.sh              # 启动脚本
```

## 🚀 快速开始

### 环境要求

- Python 3.8+
- Node.js 16+
- PostgreSQL 12+（可与现有项目共享）
- Redis 6+（可与现有项目共享）

### 1. 克隆项目

```bash
git clone <repository-url>
cd StudentLearningSystem
```

### 2. 数据库设置

#### 方案一：使用独立数据库（推荐）
```bash
# 运行数据库初始化脚本
cd scripts
./init_database.sh
```

#### 方案二：使用共享数据库
```bash
# 如果已有PostgreSQL服务，创建独立数据库
createdb student_learning_system

# 导入数据库结构
psql -d student_learning_system -f database/schema.sql

# 配置环境变量
cp backend/.env.example backend/.env
# 编辑 backend/.env 文件，设置数据库连接信息
```

#### 方案三：完全共享数据库
```bash
# 使用现有数据库，通过表名前缀隔离
# 需要修改所有模型文件，添加表名前缀
# 详细说明请查看 docs/数据库共享配置.md
```

### 3. 后端设置

```bash
cd backend

# 创建虚拟环境
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt

# 配置环境变量
cp .env.example .env
# 编辑 .env 文件，设置数据库连接信息

# 启动后端服务
python main.py
```

### 4. 前端设置

```bash
cd frontend

# 安装依赖
npm install

# 启动开发服务器
npm start
```

### 5. 启动应用

#### 方式一：使用管理脚本（推荐）
```bash
# 启动管理工具
./manage.sh

# 或直接启动所有服务
./start-all.sh
```

#### 方式二：分别启动服务
```bash
# 启动后端服务
./start-backend.sh

# 启动前端服务（新终端窗口）
./start-frontend.sh
```

### 6. 访问应用

- 前端应用：http://localhost:9003
- 后端API：http://localhost:9002
- API文档：http://localhost:9002/docs

## 📚 功能模块

### 1. 用户管理
- 用户注册/登录
- 角色管理（学生、家长、教师）
- 个人信息管理

### 2. 学科管理
- 支持5个学科：语文、数学、英语、道法、历史
- 教材章节管理
- 知识点管理

### 3. 学习计划
- 制定学习计划（每日/每周/每月/考试准备）
- 学习任务管理
- 进度跟踪

### 4. 内容管理
- 笔记管理（支持多种类型）
- 作业管理
- 练习题管理
- 错题本

### 5. 考试管理
- 考试安排
- 成绩记录
- 考试统计

### 6. 学习统计
- 学习进度可视化
- 学习时间统计
- 准确率分析
- 学习报告

## 🛠️ 管理脚本

### 主要脚本

| 脚本 | 功能 | 说明 |
|------|------|------|
| `./manage.sh` | 主管理工具 | 交互式管理界面 |
| `./start-all.sh` | 启动所有服务 | 一键启动前后端 |
| `./stop-all.sh` | 停止所有服务 | 一键停止所有服务 |
| `./restart-all.sh` | 重启所有服务 | 重启前后端服务 |
| `./status.sh` | 查看服务状态 | 检查服务运行状态 |
| `./logs.sh` | 查看日志 | 实时查看服务日志 |
| `./update.sh` | 更新系统 | 更新依赖和配置 |

### 单独服务脚本

| 脚本 | 功能 | 说明 |
|------|------|------|
| `./start-backend.sh` | 启动后端 | 只启动后端服务 |
| `./start-frontend.sh` | 启动前端 | 只启动前端服务 |

### 数据库脚本

| 脚本 | 功能 | 说明 |
|------|------|------|
| `./scripts/init_database.sh` | 初始化数据库 | 创建数据库和用户 |

## 🔧 配置说明

### 自动配置

系统会自动创建配置文件，无需手动配置：

- 后端配置：`backend/.env`
- 前端配置：`frontend/.env.local`

### 手动配置

如需手动配置，可编辑以下文件：

```bash
# 后端配置
nano backend/.env

# 前端配置
nano frontend/.env.local
```

## 📊 数据库设计

### 主要数据表

- **users** - 用户表
- **subjects** - 学科表
- **textbook_chapters** - 教材章节表
- **knowledge_points** - 知识点表
- **study_plans** - 学习计划表
- **study_tasks** - 学习任务表
- **notes** - 笔记表
- **assignments** - 作业表
- **practice_questions** - 练习题表
- **exams** - 考试表
- **learning_progress** - 学习进度表

## 🎨 界面预览

### 主要页面
- **仪表盘** - 学习概览和统计
- **学习计划** - 制定和管理学习计划
- **学习任务** - 任务列表和完成情况
- **笔记管理** - 创建和整理学习笔记
- **作业管理** - 作业跟踪和提交
- **练习测试** - 在线练习和测试
- **考试管理** - 考试安排和成绩
- **学习进度** - 进度统计和可视化
- **个人设置** - 用户信息和系统设置

## 🔒 安全特性

- JWT身份认证
- 密码加密存储
- 角色权限控制
- 数据验证和过滤
- CORS跨域保护

## 📈 性能优化

- Redis缓存
- 数据库索引优化
- 前端代码分割
- 图片懒加载
- API响应压缩

## 🧪 测试

### 后端测试

```bash
cd backend
python -m pytest tests/
```

### 前端测试

```bash
cd frontend
npm test
```

## 📝 开发指南

### 添加新功能

1. 后端：在 `app/api/` 下添加新的路由文件
2. 前端：在 `src/pages/` 下添加新的页面组件
3. 数据库：在 `database/schema.sql` 中添加新的表结构

### 代码规范

- 后端：遵循PEP 8 Python代码规范
- 前端：使用ESLint和Prettier
- 提交信息：使用约定式提交规范

## 🤝 贡献指南

1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## 📞 联系方式

如有问题或建议，请通过以下方式联系：

- 项目Issues：https://github.com/your-repo/issues
- 邮箱：your-email@example.com

## 🙏 致谢

感谢所有为这个项目做出贡献的开发者和用户！

---

**让学习更高效，让成长更快乐！** 🎓✨
