import React, { useState } from 'react';
import { Form, Input, Button, Card, Typography, Row, Col, Select, message } from 'antd';
import { UserOutlined, LockOutlined, MailOutlined, TeamOutlined } from '@ant-design/icons';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

const { Title, Text } = Typography;
const { Option } = Select;

const Register: React.FC = () => {
  const [loading, setLoading] = useState(false);
  const { register } = useAuth();
  const navigate = useNavigate();

  const onFinish = async (values: any) => {
    setLoading(true);
    const success = await register(values);
    setLoading(false);
    
    if (success) {
      navigate('/login');
    }
  };

  return (
    <div style={{ 
      minHeight: '100vh', 
      background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      padding: '20px',
    }}>
      <Row justify="center" style={{ width: '100%', maxWidth: 500 }}>
        <Col span={24}>
          <Card 
            style={{ 
              boxShadow: '0 8px 32px rgba(0,0,0,0.1)',
              borderRadius: 16,
            }}
          >
            <div style={{ textAlign: 'center', marginBottom: 32 }}>
              <Title level={2} style={{ color: '#1890ff', marginBottom: 8 }}>
                注册账号
              </Title>
              <Text type="secondary">
                创建您的学习管理账号
              </Text>
            </div>

            <Form
              name="register"
              onFinish={onFinish}
              autoComplete="off"
              size="large"
              layout="vertical"
            >
              <Form.Item
                name="username"
                label="用户名"
                rules={[{ required: true, message: '请输入用户名!' }]}
              >
                <Input
                  prefix={<UserOutlined />}
                  placeholder="用户名"
                />
              </Form.Item>

              <Form.Item
                name="email"
                label="邮箱"
                rules={[
                  { required: true, message: '请输入邮箱!' },
                  { type: 'email', message: '请输入有效的邮箱地址!' }
                ]}
              >
                <Input
                  prefix={<MailOutlined />}
                  placeholder="邮箱"
                />
              </Form.Item>

              <Form.Item
                name="password"
                label="密码"
                rules={[
                  { required: true, message: '请输入密码!' },
                  { min: 6, message: '密码至少6位!' }
                ]}
              >
                <Input.Password
                  prefix={<LockOutlined />}
                  placeholder="密码"
                />
              </Form.Item>

              <Form.Item
                name="full_name"
                label="姓名"
                rules={[{ required: true, message: '请输入姓名!' }]}
              >
                <Input
                  prefix={<UserOutlined />}
                  placeholder="姓名"
                />
              </Form.Item>

              <Form.Item
                name="role"
                label="角色"
                rules={[{ required: true, message: '请选择角色!' }]}
              >
                <Select placeholder="选择角色">
                  <Option value="student">学生</Option>
                  <Option value="parent">家长</Option>
                  <Option value="teacher">教师</Option>
                </Select>
              </Form.Item>

              <Form.Item
                name="grade"
                label="年级"
                rules={[{ required: true, message: '请选择年级!' }]}
              >
                <Select placeholder="选择年级">
                  <Option value="初一">初一</Option>
                  <Option value="初二">初二</Option>
                  <Option value="初三">初三</Option>
                </Select>
              </Form.Item>

              <Form.Item
                name="class_name"
                label="班级"
              >
                <Input
                  prefix={<TeamOutlined />}
                  placeholder="班级（可选）"
                />
              </Form.Item>

              <Form.Item>
                <Button
                  type="primary"
                  htmlType="submit"
                  loading={loading}
                  style={{ width: '100%', height: 48 }}
                >
                  注册
                </Button>
              </Form.Item>
            </Form>

            <div style={{ textAlign: 'center' }}>
              <Text>
                已有账号？{' '}
                <Link to="/login" style={{ color: '#1890ff' }}>
                  立即登录
                </Link>
              </Text>
            </div>
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default Register;
