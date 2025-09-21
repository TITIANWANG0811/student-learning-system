#!/bin/bash

# 初中生学习管理系统启动脚本（兼容性脚本）

echo "🚀 启动初中生学习管理系统..."

# 检查是否在正确的目录
if [ ! -f "backend/main.py" ] || [ ! -f "frontend/package.json" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

echo "ℹ️  此脚本已升级，建议使用新的管理脚本："
echo ""
echo "   ./manage.sh        - 交互式管理工具"
echo "   ./start-all.sh     - 启动所有服务"
echo "   ./start-backend.sh - 只启动后端服务"
echo ""
echo "是否继续使用旧方式启动？(y/N)"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🔄 使用旧方式启动后端服务..."
    ./start-backend.sh
else
    echo "🎯 启动管理工具..."
    ./manage.sh
fi
