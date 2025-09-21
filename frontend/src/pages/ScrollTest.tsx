import React from 'react';
import { Card, Typography, Space, Button } from 'antd';

const { Title, Paragraph } = Typography;

const ScrollTest: React.FC = () => {
  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>滚动条测试页面</Title>
      <Paragraph>
        这个页面用于测试菜单滚动条功能。请检查左侧菜单是否显示滚动条。
      </Paragraph>
      
      <Space direction="vertical" size="large" style={{ width: '100%' }}>
        <Card title="测试说明">
          <Paragraph>
            1. 检查左侧菜单是否显示滚动条
          </Paragraph>
          <Paragraph>
            2. 尝试滚动菜单内容
          </Paragraph>
          <Paragraph>
            3. 确认滚动条样式是否正确
          </Paragraph>
        </Card>
        
        <Card title="菜单项列表">
          <Paragraph>当前菜单包含以下项目：</Paragraph>
          <ul>
            <li>仪表盘</li>
            <li>学习计划</li>
            <li>学习任务</li>
            <li>笔记管理（包含5个子项）</li>
            <li>作业管理（包含5个子项）</li>
            <li>练习测试（包含5个子项）</li>
            <li>考试管理（包含5个子项）</li>
            <li>学习进度</li>
            <li>思维导图（包含5个子项）</li>
            <li>默写背诵（包含5个子项）</li>
            <li>错题本（包含5个子项）</li>
            <li>个人设置</li>
            <li>学习报告</li>
            <li>学习成就</li>
            <li>学习日历</li>
            <li>学习资源</li>
            <li>帮助中心</li>
          </ul>
        </Card>
        
        <Card title="滚动条样式">
          <Paragraph>
            桌面端：6px宽度，浅灰色
          </Paragraph>
          <Paragraph>
            iPad端：8px宽度，深灰色
          </Paragraph>
          <Paragraph>
            移动端：6px宽度，浅灰色
          </Paragraph>
        </Card>
      </Space>
    </div>
  );
};

export default ScrollTest;
