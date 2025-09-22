import React, { useState } from 'react';
import { Form, Input, Button, Card, Typography, Row, Col, Select, message, Space } from 'antd';
import { UserOutlined, LockOutlined, MailOutlined, TeamOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Title, Text } = Typography;
const { Option } = Select;

const TestRegister: React.FC = () => {
  const [loading, setLoading] = useState(false);
  const { register } = useAuth();

  const onFinish = async (values: any) => {
    setLoading(true);
    console.log('注册数据:', values);
    
    const success = await register(values);
    setLoading(false);
    
    if (success) {
      console.log('注册成功');
    } else {
      console.log('注册失败');
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
                测试注册功能
              </Title>
              <Text type="secondary">
                请使用新的用户名和邮箱进行测试
              </Text>
            </div>

            <Form
              name="testRegister"
              onFinish={onFinish}
              autoComplete="off"
              size="large"
              layout="vertical"
              initialValues={{
                username: `testuser${Date.now()}`,
                email: `test${Date.now()}@example.com`,
                password: '123456',
                full_name: '测试用户',
                role: 'student',
                grade: '初一'
              }}
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
                <Space direction="vertical" style={{ width: '100%' }}>
                  <Button
                    type="primary"
                    htmlType="submit"
                    loading={loading}
                    style={{ width: '100%', height: 48 }}
                  >
                    测试注册
                  </Button>
                  <Button
                    onClick={() => {
                      const timestamp = Date.now();
                      // 更新表单字段
                      const form = document.querySelector('form[name="testRegister"]') as any;
                      if (form) {
                        form.querySelector('input[name="username"]').value = `testuser${timestamp}`;
                        form.querySelector('input[name="email"]').value = `test${timestamp}@example.com`;
                      }
                    }}
                    style={{ width: '100%' }}
                  >
                    生成新的测试数据
                  </Button>
                </Space>
              </Form.Item>
            </Form>

            <div style={{ textAlign: 'center', marginTop: 16 }}>
              <Text type="secondary">
                用户名和邮箱会自动生成唯一值
              </Text>
            </div>
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default TestRegister;
