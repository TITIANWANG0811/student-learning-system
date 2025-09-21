#!/bin/bash

# 初中生学习管理系统 - 重启所有服务

echo "🔄 重启学习管理系统所有服务..."

# 检查是否在正确的目录
if [ ! -f "start-all.sh" ] || [ ! -f "stop-all.sh" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

echo "🛑 停止所有服务..."
./stop-all.sh

echo ""
echo "⏳ 等待服务完全停止..."
sleep 3

echo ""
echo "🚀 启动所有服务..."
./start-all.sh
