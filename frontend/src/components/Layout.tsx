import React, { useState, useEffect } from 'react';
import { Layout as AntLayout, Menu, Avatar, Dropdown, Button, theme, Drawer } from 'antd';
import { Outlet, useNavigate, useLocation } from 'react-router-dom';
import {
  DashboardOutlined,
  BookOutlined,
  CheckSquareOutlined,
  FileTextOutlined,
  ExperimentOutlined,
  BarChartOutlined,
  SettingOutlined,
  UserOutlined,
  LogoutOutlined,
  MenuFoldOutlined,
  MenuUnfoldOutlined,
  TagsOutlined,
  AppstoreOutlined,
  PlayCircleOutlined,
  TrophyOutlined,
  CalendarOutlined,
  QuestionCircleOutlined,
} from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';
import { useResponsive } from '../hooks/useResponsive';

const { Header, Sider, Content } = AntLayout;

const Layout: React.FC = () => {
  const [collapsed, setCollapsed] = useState(false);
  const [drawerVisible, setDrawerVisible] = useState(false);
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();
  const { token: themeToken } = theme.useToken();
  const { isMobile, isTablet, isDesktop } = useResponsive();

  // 在移动端默认收起侧边栏
  useEffect(() => {
    if (isMobile) {
      setCollapsed(true);
    }
  }, [isMobile]);

  const menuItems = [
    {
      key: '/dashboard',
      icon: <DashboardOutlined />,
      label: '仪表盘',
    },
    {
      key: '/study-plan',
      icon: <BookOutlined />,
      label: '学习计划',
    },
    {
      key: '/study-tasks',
      icon: <CheckSquareOutlined />,
      label: '学习任务',
    },
    {
      key: 'notes',
      icon: <FileTextOutlined />,
      label: '笔记管理',
      children: [
        { key: '/notes/chinese', label: '语文笔记' },
        { key: '/notes/math', label: '数学笔记' },
        { key: '/notes/english', label: '英语笔记' },
        { key: '/notes/history', label: '历史笔记' },
        { key: '/notes/ethics', label: '道法笔记' },
      ],
    },
    {
      key: 'assignments',
      icon: <FileTextOutlined />,
      label: '作业管理',
      children: [
        { key: '/assignments/chinese', label: '语文作业' },
        { key: '/assignments/math', label: '数学作业' },
        { key: '/assignments/english', label: '英语作业' },
        { key: '/assignments/history', label: '历史作业' },
        { key: '/assignments/ethics', label: '道法作业' },
      ],
    },
    {
      key: 'practice',
      icon: <ExperimentOutlined />,
      label: '练习测试',
      children: [
        { key: '/practice/chinese', label: '语文练习' },
        { key: '/practice/math', label: '数学练习' },
        { key: '/practice/english', label: '英语练习' },
        { key: '/practice/history', label: '历史练习' },
        { key: '/practice/ethics', label: '道法练习' },
      ],
    },
    {
      key: 'exams',
      icon: <BarChartOutlined />,
      label: '考试管理',
      children: [
        { key: '/exams/chinese', label: '语文考试' },
        { key: '/exams/math', label: '数学考试' },
        { key: '/exams/english', label: '英语考试' },
        { key: '/exams/history', label: '历史考试' },
        { key: '/exams/ethics', label: '道法考试' },
      ],
    },
    {
      key: '/progress',
      icon: <BarChartOutlined />,
      label: '学习进度',
    },
    {
      key: 'mind-maps',
      icon: <AppstoreOutlined />,
      label: '思维导图',
      children: [
        { key: '/mind-maps/chinese', label: '语文思维导图' },
        { key: '/mind-maps/math', label: '数学思维导图' },
        { key: '/mind-maps/english', label: '英语思维导图' },
        { key: '/mind-maps/history', label: '历史思维导图' },
        { key: '/mind-maps/ethics', label: '道法思维导图' },
      ],
    },
    {
      key: 'recitations',
      icon: <PlayCircleOutlined />,
      label: '默写背诵',
      children: [
        { key: '/recitations/chinese', label: '语文默写' },
        { key: '/recitations/math', label: '数学默写' },
        { key: '/recitations/english', label: '英语默写' },
        { key: '/recitations/history', label: '历史默写' },
        { key: '/recitations/ethics', label: '道法默写' },
      ],
    },
    {
      key: 'wrong-questions',
      icon: <BookOutlined />,
      label: '错题本',
      children: [
        { key: '/wrong-questions/chinese', label: '语文错题' },
        { key: '/wrong-questions/math', label: '数学错题' },
        { key: '/wrong-questions/english', label: '英语错题' },
        { key: '/wrong-questions/history', label: '历史错题' },
        { key: '/wrong-questions/ethics', label: '道法错题' },
      ],
    },
    {
      key: '/settings',
      icon: <SettingOutlined />,
      label: '个人设置',
    },
    // 添加一些额外的菜单项来测试滚动条
    {
      key: '/reports',
      icon: <BarChartOutlined />,
      label: '学习报告',
    },
    {
      key: '/achievements',
      icon: <TrophyOutlined />,
      label: '学习成就',
    },
    {
      key: '/calendar',
      icon: <CalendarOutlined />,
      label: '学习日历',
    },
    {
      key: '/resources',
      icon: <BookOutlined />,
      label: '学习资源',
    },
    {
      key: '/help',
      icon: <QuestionCircleOutlined />,
      label: '帮助中心',
    },
    {
      key: '/scroll-test',
      icon: <BarChartOutlined />,
      label: '滚动测试',
    },
  ];

  const userMenuItems = [
    {
      key: 'profile',
      icon: <UserOutlined />,
      label: '个人资料',
    },
    {
      key: 'logout',
      icon: <LogoutOutlined />,
      label: '退出登录',
      onClick: logout,
    },
  ];

  const handleMenuClick = ({ key }: { key: string }) => {
    navigate(key);
    // 移动端点击菜单后关闭抽屉
    if (isMobile) {
      setDrawerVisible(false);
    }
  };

  const handleUserMenuClick = ({ key }: { key: string }) => {
    if (key === 'logout') {
      logout();
    } else if (key === 'profile') {
      navigate('/settings');
    }
  };

  return (
    <AntLayout style={{ minHeight: '100vh' }}>
      {/* 桌面端侧边栏 */}
      {!isMobile && (
        <Sider 
          trigger={null} 
          collapsible 
          collapsed={collapsed}
          style={{
            background: themeToken.colorBgContainer,
            borderRight: `1px solid ${themeToken.colorBorder}`,
            height: '100vh',
            overflow: 'hidden',
            display: 'flex',
            flexDirection: 'column',
          }}
        >
          <div style={{ 
            height: 64, 
            display: 'flex', 
            alignItems: 'center', 
            justifyContent: 'center',
            borderBottom: `1px solid ${themeToken.colorBorder}`,
            flexShrink: 0,
          }}>
            <h2 style={{ 
              color: themeToken.colorPrimary, 
              margin: 0,
              fontSize: collapsed ? 16 : 18,
            }}>
              {collapsed ? '学习' : '学习管理系统'}
            </h2>
          </div>
          <div 
            className="sidebar-scroll"
            style={{
              flex: 1,
              overflowY: 'scroll',
              overflowX: 'hidden',
              paddingRight: isTablet ? 8 : 0,
              // 强制显示滚动条
              scrollbarWidth: 'thin',
              scrollbarColor: '#d9d9d9 #f5f5f5',
              // 确保有足够的内容触发滚动
              height: 'calc(100vh - 64px)',
              maxHeight: 'calc(100vh - 64px)',
            }}
          >
            <Menu
              mode="inline"
              selectedKeys={[location.pathname]}
              items={menuItems}
              onClick={handleMenuClick}
              style={{ 
                borderRight: 0,
                height: '100%',
              }}
            />
          </div>
        </Sider>
      )}

      {/* 移动端抽屉菜单 */}
      {isMobile && (
        <Drawer
          title="学习管理系统"
          placement="left"
          onClose={() => setDrawerVisible(false)}
          open={drawerVisible}
          width={280}
          bodyStyle={{ 
            padding: 0,
            height: '100%',
            overflow: 'hidden',
            display: 'flex',
            flexDirection: 'column',
          }}
        >
          <div 
            className="sidebar-scroll"
            style={{
              flex: 1,
              overflowY: 'scroll',
              overflowX: 'hidden',
              // 强制显示滚动条
              scrollbarWidth: 'thin',
              scrollbarColor: '#d9d9d9 #f5f5f5',
              // 确保有足够的内容触发滚动
              height: 'calc(100vh - 64px)',
              maxHeight: 'calc(100vh - 64px)',
            }}
          >
            <Menu
              mode="inline"
              selectedKeys={[location.pathname]}
              items={menuItems}
              onClick={handleMenuClick}
              style={{ 
                borderRight: 0,
                height: '100%',
              }}
            />
          </div>
        </Drawer>
      )}
      
      <AntLayout>
        <Header style={{ 
          padding: isMobile ? '0 12px' : '0 16px', 
          background: themeToken.colorBgContainer,
          borderBottom: `1px solid ${themeToken.colorBorder}`,
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'space-between',
          height: isMobile ? 56 : 64,
        }}>
          <div style={{ display: 'flex', alignItems: 'center' }}>
            <Button
              type="text"
              icon={isMobile ? <MenuUnfoldOutlined /> : (collapsed ? <MenuUnfoldOutlined /> : <MenuFoldOutlined />)}
              onClick={() => isMobile ? setDrawerVisible(true) : setCollapsed(!collapsed)}
              style={{ 
                fontSize: '16px', 
                width: isMobile ? 48 : 64, 
                height: isMobile ? 48 : 64 
              }}
            />
            {isMobile && (
              <h2 style={{ 
                color: themeToken.colorPrimary, 
                margin: 0,
                fontSize: 16,
                marginLeft: 8,
              }}>
                学习管理系统
              </h2>
            )}
          </div>
          
          <div style={{ 
            display: 'flex', 
            alignItems: 'center', 
            gap: isMobile ? 8 : 16 
          }}>
            {!isMobile && <span>欢迎，{user?.full_name}</span>}
            <Dropdown
              menu={{ items: userMenuItems, onClick: handleUserMenuClick }}
              placement="bottomRight"
            >
              <Avatar 
                size={isMobile ? "default" : "large"} 
                icon={<UserOutlined />} 
                style={{ cursor: 'pointer' }}
              />
            </Dropdown>
          </div>
        </Header>
        
        <Content style={{ 
          margin: isMobile ? '8px' : '16px',
          padding: isMobile ? '16px' : '24px',
          background: themeToken.colorBgContainer,
          borderRadius: themeToken.borderRadius,
          minHeight: isMobile ? 'calc(100vh - 72px)' : 'calc(100vh - 96px)',
        }}>
          <Outlet />
        </Content>
      </AntLayout>
    </AntLayout>
  );
};

export default Layout;
