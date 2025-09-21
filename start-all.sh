#!/bin/bash

# 初中生学习管理系统 - 一键启动所有服务

echo "🚀 启动学习管理系统所有服务..."

# 检查是否在正确的目录
if [ ! -f "backend/main.py" ] || [ ! -f "frontend/package.json" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 创建日志目录
mkdir -p logs

# 启动后端服务（后台运行）
echo "🔧 启动后端服务..."
nohup ./start-backend.sh > logs/backend.log 2>&1 &
BACKEND_PID=$!
echo "   后端服务PID: $BACKEND_PID"
echo "   后端日志: logs/backend.log"

# 等待后端服务启动
echo "⏳ 等待后端服务启动..."
sleep 5

# 检查后端服务是否启动成功
for i in {1..30}; do
    if curl -s http://localhost:9002/health > /dev/null; then
        echo "✅ 后端服务启动成功"
        break
    fi
    if [ $i -eq 30 ]; then
        echo "❌ 后端服务启动失败，请检查日志: logs/backend.log"
        kill $BACKEND_PID 2>/dev/null
        exit 1
    fi
    sleep 1
done

# 启动前端服务（后台运行）
echo "🎨 启动前端服务..."
nohup ./start-frontend.sh > logs/frontend.log 2>&1 &
FRONTEND_PID=$!
echo "   前端服务PID: $FRONTEND_PID"
echo "   前端日志: logs/frontend.log"

# 等待前端服务启动
echo "⏳ 等待前端服务启动..."
sleep 10

# 检查前端服务是否启动成功
for i in {1..30}; do
    if curl -s http://localhost:9003 > /dev/null; then
        echo "✅ 前端服务启动成功"
        break
    fi
    if [ $i -eq 30 ]; then
        echo "❌ 前端服务启动失败，请检查日志: logs/frontend.log"
        kill $BACKEND_PID $FRONTEND_PID 2>/dev/null
        exit 1
    fi
    sleep 1
done

# 保存PID到文件
echo $BACKEND_PID > logs/backend.pid
echo $FRONTEND_PID > logs/frontend.pid

echo ""
echo "🎉 所有服务启动成功！"
echo ""
echo "📋 服务信息："
echo "   前端应用: http://localhost:9003"
echo "   后端API: http://localhost:9002"
echo "   API文档: http://localhost:9002/docs"
echo ""
echo "📝 日志文件："
echo "   后端日志: logs/backend.log"
echo "   前端日志: logs/frontend.log"
echo ""
echo "🛑 停止服务："
echo "   ./stop-all.sh"
echo ""
echo "📊 查看状态："
echo "   ./status.sh"
