#!/bin/bash

# 初中生学习管理系统 - 前端服务启动脚本

echo "🚀 启动学习管理系统前端服务..."

# 检查是否在正确的目录
if [ ! -f "frontend/package.json" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 进入前端目录
cd frontend

# 检查Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装，请先安装Node.js"
    exit 1
fi

# 检查npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm 未安装，请先安装npm"
    exit 1
fi

# 检查依赖是否已安装
if [ ! -d "node_modules" ]; then
    echo "📦 安装依赖包..."
    npm install
else
    echo "📚 检查依赖包..."
    npm install
fi

# 检查环境变量文件
if [ ! -f ".env.local" ]; then
    echo "⚙️ 创建前端环境配置文件..."
    cat > .env.local << EOF
REACT_APP_API_URL=http://localhost:9002/api/v1
EOF
    echo "✅ 前端环境配置文件已创建: frontend/.env.local"
fi

# 检查后端服务是否运行
echo "🔍 检查后端服务状态..."
if curl -s http://localhost:9002/health > /dev/null; then
    echo "✅ 后端服务运行正常"
else
    echo "⚠️  后端服务未运行，请先启动后端服务"
    echo "   运行命令: ./start-backend.sh"
    echo ""
    echo "是否继续启动前端服务？(y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "❌ 前端服务启动已取消"
        exit 1
    fi
fi

# 启动前端服务
echo "🎯 启动前端服务..."
echo "   服务地址: http://localhost:9003"
echo "   按 Ctrl+C 停止服务"
echo ""

PORT=9003 npm start
