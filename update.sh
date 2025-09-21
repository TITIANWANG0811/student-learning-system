#!/bin/bash

# 初中生学习管理系统 - 更新脚本

echo "🔄 更新学习管理系统..."

# 检查是否在正确的目录
if [ ! -f "backend/main.py" ] || [ ! -f "frontend/package.json" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 停止所有服务
echo "🛑 停止所有服务..."
./stop-all.sh

# 更新后端依赖
echo "📚 更新后端依赖..."
cd backend
if [ -d "venv" ]; then
    source venv/bin/activate
    pip install -r requirements.txt --upgrade
    echo "✅ 后端依赖更新完成"
else
    echo "⚠️  虚拟环境不存在，请先运行 ./start-backend.sh"
fi
cd ..

# 更新前端依赖
echo "📚 更新前端依赖..."
cd frontend
npm install
npm update
echo "✅ 前端依赖更新完成"
cd ..

# 检查配置文件
echo "⚙️ 检查配置文件..."
if [ ! -f "backend/.env" ]; then
    echo "⚠️  后端配置文件不存在，创建默认配置..."
    ./start-backend.sh &
    sleep 5
    ./stop-all.sh
fi

if [ ! -f "frontend/.env.local" ]; then
    echo "⚠️  前端配置文件不存在，创建默认配置..."
    cat > frontend/.env.local << EOF
REACT_APP_API_URL=http://localhost:9002/api/v1
EOF
    echo "✅ 前端配置文件已创建"
fi

# 检查数据库
echo "🗄️ 检查数据库连接..."
cd backend
source venv/bin/activate
python -c "
import psycopg2
from config import settings
try:
    conn = psycopg2.connect(settings.database_url)
    print('✅ 数据库连接正常')
    conn.close()
except Exception as e:
    print(f'❌ 数据库连接失败: {e}')
    print('请检查数据库配置或运行: ./scripts/init_database.sh')
    exit(1)
"
cd ..

# 检查Redis
echo "🔴 检查Redis连接..."
cd backend
source venv/bin/activate
python -c "
import redis
from config import settings
try:
    r = redis.from_url(settings.redis_url)
    r.ping()
    print('✅ Redis连接正常')
except Exception as e:
    print(f'❌ Redis连接失败: {e}')
    print('请检查Redis服务')
    exit(1)
"
cd ..

echo ""
echo "🎉 更新完成！"
echo ""
echo "🚀 启动服务:"
echo "   ./start-all.sh"
echo ""
echo "📊 查看状态:"
echo "   ./status.sh"
