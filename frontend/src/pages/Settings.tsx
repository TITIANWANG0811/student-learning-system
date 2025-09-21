import React, { useState, useEffect } from 'react';
import { Card, Form, Input, Button, Select, Upload, Avatar, message, Switch, Row, Col } from 'antd';
import { UserOutlined, CameraOutlined, SaveOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Option } = Select;

const Settings: React.FC = () => {
  const { user, logout } = useAuth();
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (user) {
      form.setFieldsValue({
        username: user.username,
        email: user.email,
        full_name: user.full_name,
        grade: user.grade,
        class_name: user.class_name,
      });
    }
  }, [user, form]);

  const handleSubmit = async (values: any) => {
    setLoading(true);
    try {
      // 这里应该调用更新用户信息的API
      // await api.put('/users/profile', values);
      message.success('个人信息更新成功');
    } catch (error) {
      message.error('更新失败');
    } finally {
      setLoading(false);
    }
  };

  const handleAvatarChange = (info: any) => {
    if (info.file.status === 'done') {
      message.success('头像上传成功');
      // 这里应该更新用户头像
    } else if (info.file.status === 'error') {
      message.error('头像上传失败');
    }
  };

  const handlePasswordChange = (values: any) => {
    if (values.newPassword !== values.confirmPassword) {
      message.error('两次输入的密码不一致');
      return;
    }
    
    setLoading(true);
    try {
      // 这里应该调用修改密码的API
      // await api.put('/users/password', {
      //   oldPassword: values.oldPassword,
      //   newPassword: values.newPassword
      // });
      message.success('密码修改成功');
    } catch (error) {
      message.error('密码修改失败');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <Row gutter={[24, 24]}>
        <Col xs={24} lg={16}>
          <Card title="个人信息" extra={<Button type="primary" icon={<SaveOutlined />} onClick={() => form.submit()}>保存</Button>}>
            <Form
              form={form}
              layout="vertical"
              onFinish={handleSubmit}
            >
              <Form.Item
                name="username"
                label="用户名"
                rules={[{ required: true, message: '请输入用户名' }]}
              >
                <Input disabled />
              </Form.Item>

              <Form.Item
                name="email"
                label="邮箱"
                rules={[
                  { required: true, message: '请输入邮箱' },
                  { type: 'email', message: '请输入有效的邮箱地址' }
                ]}
              >
                <Input />
              </Form.Item>

              <Form.Item
                name="full_name"
                label="姓名"
                rules={[{ required: true, message: '请输入姓名' }]}
              >
                <Input />
              </Form.Item>

              <Form.Item
                name="grade"
                label="年级"
                rules={[{ required: true, message: '请选择年级' }]}
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
                <Input placeholder="请输入班级" />
              </Form.Item>
            </Form>
          </Card>

          <Card title="修改密码" style={{ marginTop: 24 }}>
            <Form
              layout="vertical"
              onFinish={handlePasswordChange}
            >
              <Form.Item
                name="oldPassword"
                label="当前密码"
                rules={[{ required: true, message: '请输入当前密码' }]}
              >
                <Input.Password />
              </Form.Item>

              <Form.Item
                name="newPassword"
                label="新密码"
                rules={[
                  { required: true, message: '请输入新密码' },
                  { min: 6, message: '密码至少6位' }
                ]}
              >
                <Input.Password />
              </Form.Item>

              <Form.Item
                name="confirmPassword"
                label="确认新密码"
                rules={[{ required: true, message: '请确认新密码' }]}
              >
                <Input.Password />
              </Form.Item>

              <Form.Item>
                <Button type="primary" htmlType="submit" loading={loading}>
                  修改密码
                </Button>
              </Form.Item>
            </Form>
          </Card>
        </Col>

        <Col xs={24} lg={8}>
          <Card title="头像设置">
            <div style={{ textAlign: 'center' }}>
              <Avatar
                size={120}
                icon={<UserOutlined />}
                src={user?.avatar_url}
                style={{ marginBottom: 16 }}
              />
              <div>
                <Upload
                  name="avatar"
                  listType="picture-card"
                  showUploadList={false}
                  onChange={handleAvatarChange}
                  beforeUpload={(file) => {
                    const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png';
                    if (!isJpgOrPng) {
                      message.error('只能上传 JPG/PNG 格式的图片!');
                    }
                    const isLt2M = file.size / 1024 / 1024 < 2;
                    if (!isLt2M) {
                      message.error('图片大小不能超过 2MB!');
                    }
                    return isJpgOrPng && isLt2M;
                  }}
                >
                  <Button icon={<CameraOutlined />}>更换头像</Button>
                </Upload>
              </div>
            </div>
          </Card>

          <Card title="系统设置" style={{ marginTop: 24 }}>
            <div style={{ marginBottom: 16 }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <span>学习提醒</span>
                <Switch defaultChecked />
              </div>
              <div style={{ fontSize: 12, color: '#666', marginTop: 4 }}>
                开启后会在学习时间提醒您
              </div>
            </div>

            <div style={{ marginBottom: 16 }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <span>邮件通知</span>
                <Switch defaultChecked />
              </div>
              <div style={{ fontSize: 12, color: '#666', marginTop: 4 }}>
                接收学习进度和考试提醒邮件
              </div>
            </div>

            <div style={{ marginBottom: 16 }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <span>数据统计</span>
                <Switch defaultChecked />
              </div>
              <div style={{ fontSize: 12, color: '#666', marginTop: 4 }}>
                允许系统收集学习数据用于分析
              </div>
            </div>
          </Card>

          <Card title="账户操作" style={{ marginTop: 24 }}>
            <div style={{ textAlign: 'center' }}>
              <Button 
                type="primary" 
                danger 
                onClick={logout}
                style={{ width: '100%' }}
              >
                退出登录
              </Button>
            </div>
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default Settings;
