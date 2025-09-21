# 快速开始指南

## 🚀 一键启动

### 1. 克隆项目
```bash
git clone <repository-url>
cd StudentLearningSystem
```

### 2. 初始化数据库
```bash
./scripts/init_database.sh
```

### 3. 启动所有服务
```bash
./start-all.sh
```

### 4. 访问应用
- 前端：http://localhost:9003
- 后端API：http://localhost:9002
- API文档：http://localhost:9002/docs

## 🛠️ 管理命令

### 常用命令
```bash
# 启动管理工具
./manage.sh

# 查看服务状态
./status.sh

# 查看日志
./logs.sh

# 停止所有服务
./stop-all.sh

# 重启所有服务
./restart-all.sh
```

### 单独启动服务
```bash
# 只启动后端
./start-backend.sh

# 只启动前端
./start-frontend.sh
```

## 🔧 故障排除

### 服务无法启动
1. 检查端口是否被占用：`./status.sh`
2. 查看错误日志：`./logs.sh`
3. 重启服务：`./restart-all.sh`

### 数据库连接失败
1. 检查PostgreSQL是否运行：`sudo systemctl status postgresql`
2. 重新初始化数据库：`./scripts/init_database.sh`

### Redis连接失败
1. 检查Redis是否运行：`sudo systemctl status redis`
2. 启动Redis：`sudo systemctl start redis`

## 📝 日志文件

- 后端日志：`logs/backend.log`
- 前端日志：`logs/frontend.log`
- 查看实时日志：`./logs.sh`

## ⚙️ 配置文件

- 后端配置：`backend/.env`
- 前端配置：`frontend/.env.local`

## 🆘 获取帮助

运行管理工具获取更多帮助：
```bash
./manage.sh
```

选择选项11查看详细帮助信息。
