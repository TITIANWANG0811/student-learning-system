#!/bin/bash

# 初中生学习管理系统 - 后端服务启动脚本

echo "🚀 启动学习管理系统后端服务..."

# 检查是否在正确的目录
if [ ! -f "backend/main.py" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 进入后端目录
cd backend

# 检查虚拟环境
if [ ! -d "venv" ]; then
    echo "📦 创建虚拟环境..."
    python3 -m venv venv
fi

# 激活虚拟环境
echo "🔧 激活虚拟环境..."
source venv/bin/activate

# 安装依赖
echo "📚 安装/更新依赖包..."
pip install -r requirements.txt

# 检查环境变量文件
if [ ! -f ".env" ]; then
    echo "⚙️ 创建环境配置文件..."
    cat > .env << EOF
# 数据库配置
DATABASE_URL=postgresql://student_learning_user:secure_password@localhost:5432/student_learning_system
REDIS_URL=redis://localhost:6379/1

# JWT配置
SECRET_KEY=student_learning_secret_key_$(date +%s)
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

# 应用配置
APP_NAME=初中生学习管理系统
APP_VERSION=1.0.0
DEBUG=True
HOST=0.0.0.0
PORT=9002

# 文件上传配置
UPLOAD_DIR=uploads
MAX_FILE_SIZE=10485760

# CORS配置
ALLOWED_ORIGINS=["http://localhost:9003", "http://127.0.0.1:9003"]
EOF
    echo "✅ 环境配置文件已创建: backend/.env"
    echo "⚠️  请根据需要修改数据库连接信息"
fi

# 检查数据库连接
echo "🗄️ 检查数据库连接..."
python -c "
import psycopg2
from config import settings
try:
    conn = psycopg2.connect(settings.database_url)
    print('✅ 数据库连接成功')
    conn.close()
except Exception as e:
    print(f'❌ 数据库连接失败: {e}')
    print('请确保PostgreSQL已启动并配置正确的数据库连接信息')
    print('如果使用共享数据库，请确保已创建 student_learning_system 数据库')
    print('可以运行: ./scripts/init_database.sh 来初始化数据库')
    exit(1)
"

# 检查Redis连接
echo "🔴 检查Redis连接..."
python -c "
import redis
from config import settings
try:
    r = redis.from_url(settings.redis_url)
    r.ping()
    print('✅ Redis连接成功')
except Exception as e:
    print(f'❌ Redis连接失败: {e}')
    print('请确保Redis已启动')
    exit(1)
"

# 创建上传目录
mkdir -p uploads
chmod 755 uploads

# 启动后端服务
echo "🎯 启动后端服务..."
echo "   服务地址: http://localhost:9002"
echo "   API文档: http://localhost:9002/docs"
echo "   按 Ctrl+C 停止服务"
echo ""

python main.py
