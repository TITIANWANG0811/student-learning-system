#!/bin/bash

# 初中生学习管理系统 - 日志查看脚本

echo "📝 学习管理系统日志查看"
echo "================================"

# 检查日志目录
if [ ! -d "logs" ]; then
    echo "❌ 日志目录不存在"
    exit 1
fi

# 显示选项
echo "请选择要查看的日志:"
echo "1) 后端日志 (backend.log)"
echo "2) 前端日志 (frontend.log)"
echo "3) 所有日志 (实时监控)"
echo "4) 后端日志最后50行"
echo "5) 前端日志最后50行"
echo "6) 搜索错误日志"
echo ""

read -p "请输入选项 (1-6): " choice

case $choice in
    1)
        echo "📋 显示后端日志 (按 Ctrl+C 退出):"
        echo "================================"
        tail -f logs/backend.log
        ;;
    2)
        echo "📋 显示前端日志 (按 Ctrl+C 退出):"
        echo "================================"
        tail -f logs/frontend.log
        ;;
    3)
        echo "📋 显示所有日志 (按 Ctrl+C 退出):"
        echo "================================"
        tail -f logs/backend.log logs/frontend.log
        ;;
    4)
        echo "📋 后端日志最后50行:"
        echo "================================"
        tail -50 logs/backend.log
        ;;
    5)
        echo "📋 前端日志最后50行:"
        echo "================================"
        tail -50 logs/frontend.log
        ;;
    6)
        echo "🔍 搜索错误日志:"
        echo "================================"
        echo "后端错误:"
        grep -i "error\|exception\|failed" logs/backend.log | tail -20
        echo ""
        echo "前端错误:"
        grep -i "error\|exception\|failed" logs/frontend.log | tail -20
        ;;
    *)
        echo "❌ 无效选项"
        exit 1
        ;;
esac
