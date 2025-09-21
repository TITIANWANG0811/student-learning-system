#!/bin/bash

# 初中生学习管理系统 - 服务状态检查脚本

echo "📊 学习管理系统服务状态"
echo "================================"

# 检查后端服务
echo "🔧 后端服务状态:"
if [ -f "logs/backend.pid" ]; then
    BACKEND_PID=$(cat logs/backend.pid)
    if ps -p $BACKEND_PID > /dev/null 2>&1; then
        echo "   ✅ 运行中 (PID: $BACKEND_PID)"
        
        # 检查端口
        if netstat -tulpn 2>/dev/null | grep -q ":9002.*LISTEN"; then
            echo "   ✅ 端口9002已监听"
        else
            echo "   ⚠️  端口9002未监听"
        fi
        
        # 检查健康状态
        if curl -s http://localhost:9002/health > /dev/null 2>&1; then
            echo "   ✅ 健康检查通过"
        else
            echo "   ⚠️  健康检查失败"
        fi
    else
        echo "   ❌ 未运行 (PID文件存在但进程不存在)"
    fi
else
    echo "   ❌ 未运行 (无PID文件)"
fi

echo ""

# 检查前端服务
echo "🎨 前端服务状态:"
if [ -f "logs/frontend.pid" ]; then
    FRONTEND_PID=$(cat logs/frontend.pid)
    if ps -p $FRONTEND_PID > /dev/null 2>&1; then
        echo "   ✅ 运行中 (PID: $FRONTEND_PID)"
        
        # 检查端口
        if netstat -tulpn 2>/dev/null | grep -q ":9003.*LISTEN"; then
            echo "   ✅ 端口9003已监听"
        else
            echo "   ⚠️  端口9003未监听"
        fi
        
        # 检查服务响应
        if curl -s http://localhost:9003 > /dev/null 2>&1; then
            echo "   ✅ 服务响应正常"
        else
            echo "   ⚠️  服务响应异常"
        fi
    else
        echo "   ❌ 未运行 (PID文件存在但进程不存在)"
    fi
else
    echo "   ❌ 未运行 (无PID文件)"
fi

echo ""

# 检查数据库连接
echo "🗄️ 数据库状态:"
if command -v psql &> /dev/null; then
    if psql -h localhost -U student_learning_user -d student_learning_system -c "SELECT 1;" > /dev/null 2>&1; then
        echo "   ✅ PostgreSQL连接正常"
    else
        echo "   ❌ PostgreSQL连接失败"
    fi
else
    echo "   ⚠️  psql命令未找到，无法检查数据库"
fi

# 检查Redis连接
echo "🔴 Redis状态:"
if command -v redis-cli &> /dev/null; then
    if redis-cli -n 1 ping > /dev/null 2>&1; then
        echo "   ✅ Redis连接正常"
    else
        echo "   ❌ Redis连接失败"
    fi
else
    echo "   ⚠️  redis-cli命令未找到，无法检查Redis"
fi

echo ""

# 显示端口占用情况
echo "🔌 端口占用情况:"
echo "   端口9002 (后端):"
netstat -tulpn 2>/dev/null | grep ":9002" || echo "      未占用"
echo "   端口9003 (前端):"
netstat -tulpn 2>/dev/null | grep ":9003" || echo "      未占用"

echo ""

# 显示日志文件信息
echo "📝 日志文件信息:"
if [ -d "logs" ]; then
    echo "   后端日志:"
    if [ -f "logs/backend.log" ]; then
        echo "     大小: $(du -h logs/backend.log | cut -f1)"
        echo "     最后修改: $(stat -c %y logs/backend.log 2>/dev/null || stat -f %Sm logs/backend.log 2>/dev/null)"
    else
        echo "     文件不存在"
    fi
    
    echo "   前端日志:"
    if [ -f "logs/frontend.log" ]; then
        echo "     大小: $(du -h logs/frontend.log | cut -f1)"
        echo "     最后修改: $(stat -c %y logs/frontend.log 2>/dev/null || stat -f %Sm logs/frontend.log 2>/dev/null)"
    else
        echo "     文件不存在"
    fi
else
    echo "   日志目录不存在"
fi

echo ""

# 显示访问地址
echo "🌐 访问地址:"
echo "   前端应用: http://localhost:9003"
echo "   后端API: http://localhost:9002"
echo "   API文档: http://localhost:9002/docs"

echo ""

# 显示管理命令
echo "🛠️  管理命令:"
echo "   启动所有服务: ./start-all.sh"
echo "   停止所有服务: ./stop-all.sh"
echo "   重启所有服务: ./restart-all.sh"
echo "   查看实时日志: ./logs.sh"
