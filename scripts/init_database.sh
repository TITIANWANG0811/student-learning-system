#!/bin/bash

# 初中生学习管理系统数据库初始化脚本

echo "🚀 初始化学习管理系统数据库..."

# 检查PostgreSQL是否运行
if ! pg_isready -q; then
    echo "❌ PostgreSQL未运行，请先启动PostgreSQL服务"
    echo "启动命令: sudo systemctl start postgresql"
    exit 1
fi

# 数据库配置
DB_NAME="student_learning_system"
DB_USER="student_learning_user"
DB_PASSWORD="secure_password_$(date +%s)"  # 生成随机密码

echo "📝 数据库配置信息："
echo "   数据库名: $DB_NAME"
echo "   用户名: $DB_USER"
echo "   密码: $DB_PASSWORD"
echo ""

# 创建数据库和用户
echo "🗄️ 创建数据库和用户..."
sudo -u postgres psql << EOF
-- 创建数据库
CREATE DATABASE $DB_NAME;

-- 创建用户
CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';

-- 授权
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;

-- 连接到数据库并设置权限
\c $DB_NAME;
GRANT ALL ON SCHEMA public TO $DB_USER;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $DB_USER;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO $DB_USER;

-- 设置默认权限
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO $DB_USER;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO $DB_USER;

\q
EOF

if [ $? -eq 0 ]; then
    echo "✅ 数据库和用户创建成功"
else
    echo "❌ 数据库创建失败"
    exit 1
fi

# 导入数据库结构
echo "📋 导入数据库结构..."
psql -h localhost -U $DB_USER -d $DB_NAME -f ../database/schema.sql

if [ $? -eq 0 ]; then
    echo "✅ 数据库结构导入成功"
else
    echo "❌ 数据库结构导入失败"
    exit 1
fi

# 创建配置文件
echo "⚙️ 创建配置文件..."
cat > ../backend/.env << EOF
# 数据库配置
DATABASE_URL=postgresql://$DB_USER:$DB_PASSWORD@localhost:5432/$DB_NAME
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

echo "✅ 配置文件创建成功: ../backend/.env"

# 创建上传目录
echo "📁 创建上传目录..."
mkdir -p ../uploads
chmod 755 ../uploads
echo "✅ 上传目录创建成功"

# 测试连接
echo "🔍 测试数据库连接..."
cd ../backend
python -c "
import psycopg2
from config import settings
try:
    conn = psycopg2.connect(settings.database_url)
    print('✅ 数据库连接测试成功')
    conn.close()
except Exception as e:
    print(f'❌ 数据库连接测试失败: {e}')
    exit(1)
"

echo ""
echo "🎉 数据库初始化完成！"
echo ""
echo "📋 配置信息："
echo "   数据库: $DB_NAME"
echo "   用户: $DB_USER"
echo "   密码: $DB_PASSWORD"
echo "   配置文件: backend/.env"
echo ""
echo "🚀 现在可以启动应用了："
echo "   cd backend && python main.py"
echo ""
echo "📖 更多信息请查看文档："
echo "   docs/数据库共享配置.md"
