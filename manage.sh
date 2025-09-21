#!/bin/bash

# 初中生学习管理系统 - 主管理脚本

echo "🎓 初中生学习管理系统 - 管理工具"
echo "================================"

# 检查是否在正确的目录
if [ ! -f "backend/main.py" ] || [ ! -f "frontend/package.json" ]; then
    echo "❌ 请在项目根目录运行此脚本"
    exit 1
fi

# 显示主菜单
show_menu() {
    echo ""
    echo "请选择操作:"
    echo "1) 🚀 启动所有服务"
    echo "2) 🛑 停止所有服务"
    echo "3) 🔄 重启所有服务"
    echo "4) 📊 查看服务状态"
    echo "5) 📝 查看日志"
    echo "6) 🔧 启动后端服务"
    echo "7) 🎨 启动前端服务"
    echo "8) 🗄️ 初始化数据库"
    echo "9) 🔄 更新系统"
    echo "10) 🧹 清理日志"
    echo "11) 📋 显示帮助"
    echo "0) 退出"
    echo ""
}

# 清理日志
clean_logs() {
    echo "🧹 清理日志文件..."
    if [ -d "logs" ]; then
        rm -f logs/*.log
        rm -f logs/*.pid
        echo "✅ 日志文件已清理"
    else
        echo "ℹ️  日志目录不存在"
    fi
}

# 显示帮助
show_help() {
    echo "📋 学习管理系统管理工具帮助"
    echo "================================"
    echo ""
    echo "🚀 启动服务:"
    echo "   ./start-all.sh     - 启动所有服务"
    echo "   ./start-backend.sh - 只启动后端服务"
    echo "   ./start-frontend.sh - 只启动前端服务"
    echo ""
    echo "🛑 停止服务:"
    echo "   ./stop-all.sh      - 停止所有服务"
    echo ""
    echo "📊 状态监控:"
    echo "   ./status.sh        - 查看服务状态"
    echo "   ./logs.sh          - 查看日志"
    echo ""
    echo "🔧 系统管理:"
    echo "   ./restart-all.sh   - 重启所有服务"
    echo "   ./update.sh        - 更新系统"
    echo "   ./scripts/init_database.sh - 初始化数据库"
    echo ""
    echo "🌐 访问地址:"
    echo "   前端应用: http://localhost:9003"
    echo "   后端API: http://localhost:9002"
    echo "   API文档: http://localhost:9002/docs"
    echo ""
    echo "📝 日志文件:"
    echo "   后端日志: logs/backend.log"
    echo "   前端日志: logs/frontend.log"
    echo ""
    echo "⚙️ 配置文件:"
    echo "   后端配置: backend/.env"
    echo "   前端配置: frontend/.env.local"
    echo ""
}

# 主循环
while true; do
    show_menu
    read -p "请输入选项 (0-11): " choice
    
    case $choice in
        1)
            echo "🚀 启动所有服务..."
            ./start-all.sh
            ;;
        2)
            echo "🛑 停止所有服务..."
            ./stop-all.sh
            ;;
        3)
            echo "🔄 重启所有服务..."
            ./restart-all.sh
            ;;
        4)
            echo "📊 查看服务状态..."
            ./status.sh
            ;;
        5)
            echo "📝 查看日志..."
            ./logs.sh
            ;;
        6)
            echo "🔧 启动后端服务..."
            ./start-backend.sh
            ;;
        7)
            echo "🎨 启动前端服务..."
            ./start-frontend.sh
            ;;
        8)
            echo "🗄️ 初始化数据库..."
            ./scripts/init_database.sh
            ;;
        9)
            echo "🔄 更新系统..."
            ./update.sh
            ;;
        10)
            clean_logs
            ;;
        11)
            show_help
            ;;
        0)
            echo "👋 再见！"
            exit 0
            ;;
        *)
            echo "❌ 无效选项，请重新选择"
            ;;
    esac
    
    echo ""
    read -p "按回车键继续..."
done
