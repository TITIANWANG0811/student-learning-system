import React from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

interface ProtectedRouteProps {
  children: React.ReactNode;
}

const ProtectedRoute: React.FC<ProtectedRouteProps> = ({ children }) => {
  const { user, loading } = useAuth();

  // 调试信息
  console.log('ProtectedRoute - loading:', loading, 'user:', user);

  // 如果正在加载，显示加载状态
  if (loading) {
    return (
      <div style={{ 
        display: 'flex', 
        justifyContent: 'center', 
        alignItems: 'center', 
        height: '100vh',
        fontSize: '16px'
      }}>
        加载中...
      </div>
    );
  }

  // 如果用户未登录，重定向到登录页面
  if (!user) {
    console.log('ProtectedRoute - 用户未登录，重定向到登录页面');
    return <Navigate to="/login" replace />;
  }

  // 如果用户已登录，渲染子组件
  console.log('ProtectedRoute - 用户已登录，渲染受保护的内容');
  return <>{children}</>;
};

export default ProtectedRoute;
