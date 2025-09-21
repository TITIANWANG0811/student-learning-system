#!/bin/bash

# 初中生学习管理系统 - 一键停止所有服务

echo "🛑 停止学习管理系统所有服务..."

# 创建日志目录（如果不存在）
mkdir -p logs

# 停止后端服务
if [ -f "logs/backend.pid" ]; then
    BACKEND_PID=$(cat logs/backend.pid)
    if ps -p $BACKEND_PID > /dev/null 2>&1; then
        echo "🔧 停止后端服务 (PID: $BACKEND_PID)..."
        kill $BACKEND_PID
        sleep 2
        
        # 强制杀死如果还在运行
        if ps -p $BACKEND_PID > /dev/null 2>&1; then
            echo "⚠️  强制停止后端服务..."
            kill -9 $BACKEND_PID
        fi
        echo "✅ 后端服务已停止"
    else
        echo "ℹ️  后端服务未运行"
    fi
    rm -f logs/backend.pid
else
    echo "ℹ️  未找到后端服务PID文件"
fi

# 停止前端服务
if [ -f "logs/frontend.pid" ]; then
    FRONTEND_PID=$(cat logs/frontend.pid)
    if ps -p $FRONTEND_PID > /dev/null 2>&1; then
        echo "🎨 停止前端服务 (PID: $FRONTEND_PID)..."
        kill $FRONTEND_PID
        sleep 2
        
        # 强制杀死如果还在运行
        if ps -p $FRONTEND_PID > /dev/null 2>&1; then
            echo "⚠️  强制停止前端服务..."
            kill -9 $FRONTEND_PID
        fi
        echo "✅ 前端服务已停止"
    else
        echo "ℹ️  前端服务未运行"
    fi
    rm -f logs/frontend.pid
else
    echo "ℹ️  未找到前端服务PID文件"
fi

# 停止所有相关进程（备用方案）
echo "🔍 检查并停止相关进程..."

# 停止后端相关进程
BACKEND_PROCESSES=$(ps aux | grep "python.*main.py" | grep -v grep | awk '{print $2}')
if [ ! -z "$BACKEND_PROCESSES" ]; then
    echo "🔧 发现后端进程，正在停止..."
    echo $BACKEND_PROCESSES | xargs kill -9 2>/dev/null
    echo "✅ 后端进程已停止"
fi

# 停止前端相关进程
FRONTEND_PROCESSES=$(ps aux | grep "react-scripts start" | grep -v grep | awk '{print $2}')
if [ ! -z "$FRONTEND_PROCESSES" ]; then
    echo "🎨 发现前端进程，正在停止..."
    echo $FRONTEND_PROCESSES | xargs kill -9 2>/dev/null
    echo "✅ 前端进程已停止"
fi

# 停止Node.js进程（如果还有残留）
NODE_PROCESSES=$(ps aux | grep "node.*9003" | grep -v grep | awk '{print $2}')
if [ ! -z "$NODE_PROCESSES" ]; then
    echo "🔧 发现Node.js进程，正在停止..."
    echo $NODE_PROCESSES | xargs kill -9 2>/dev/null
    echo "✅ Node.js进程已停止"
fi

echo ""
echo "🎉 所有服务已停止！"
echo ""
echo "📝 日志文件保留在 logs/ 目录中"
echo "   后端日志: logs/backend.log"
echo "   前端日志: logs/frontend.log"
