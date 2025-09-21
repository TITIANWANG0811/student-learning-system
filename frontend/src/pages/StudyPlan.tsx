import React, { useState, useEffect } from 'react';
import { Card, Button, Table, Tag, Space, Modal, Form, Input, Select, DatePicker, message } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined, EyeOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';
import api from '../services/api';

const { Option } = Select;
const { RangePicker } = DatePicker;

interface StudyPlan {
  id: string;
  title: string;
  subject: string;
  planType: string;
  startDate: string;
  endDate: string;
  isCompleted: boolean;
  description?: string;
}

const StudyPlan: React.FC = () => {
  const { user } = useAuth();
  const [plans, setPlans] = useState<StudyPlan[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalVisible, setModalVisible] = useState(false);
  const [editingPlan, setEditingPlan] = useState<StudyPlan | null>(null);
  const [form] = Form.useForm();

  useEffect(() => {
    fetchPlans();
  }, []);

  const fetchPlans = async () => {
    setLoading(true);
    try {
      // 这里应该调用实际的API
      // const response = await api.get('/study/plans');
      // setPlans(response.data);
      
      // 模拟数据
      setPlans([
        {
          id: '1',
          title: '数学复习计划',
          subject: '数学',
          planType: 'weekly',
          startDate: '2024-01-15',
          endDate: '2024-01-21',
          isCompleted: false,
          description: '复习第1-3章内容',
        },
        {
          id: '2',
          title: '英语单词背诵',
          subject: '英语',
          planType: 'daily',
          startDate: '2024-01-15',
          endDate: '2024-01-15',
          isCompleted: true,
          description: '背诵Unit 5单词',
        },
      ]);
    } catch (error) {
      message.error('获取学习计划失败');
    } finally {
      setLoading(false);
    }
  };

  const handleCreate = () => {
    setEditingPlan(null);
    form.resetFields();
    setModalVisible(true);
  };

  const handleEdit = (plan: StudyPlan) => {
    setEditingPlan(plan);
    form.setFieldsValue({
      ...plan,
      dateRange: [plan.startDate, plan.endDate],
    });
    setModalVisible(true);
  };

  const handleDelete = async (id: string) => {
    try {
      // await api.delete(`/study/plans/${id}`);
      setPlans(plans.filter(plan => plan.id !== id));
      message.success('删除成功');
    } catch (error) {
      message.error('删除失败');
    }
  };

  const handleSubmit = async (values: any) => {
    try {
      const planData = {
        ...values,
        startDate: values.dateRange[0].format('YYYY-MM-DD'),
        endDate: values.dateRange[1].format('YYYY-MM-DD'),
      };
      delete planData.dateRange;

      if (editingPlan) {
        // await api.put(`/study/plans/${editingPlan.id}`, planData);
        setPlans(plans.map(plan => 
          plan.id === editingPlan.id ? { ...plan, ...planData } : plan
        ));
        message.success('更新成功');
      } else {
        // await api.post('/study/plans', planData);
        const newPlan = { ...planData, id: Date.now().toString() };
        setPlans([...plans, newPlan]);
        message.success('创建成功');
      }
      
      setModalVisible(false);
      form.resetFields();
    } catch (error) {
      message.error('操作失败');
    }
  };

  const columns = [
    {
      title: '计划名称',
      dataIndex: 'title',
      key: 'title',
    },
    {
      title: '学科',
      dataIndex: 'subject',
      key: 'subject',
      render: (subject: string) => <Tag color="blue">{subject}</Tag>,
    },
    {
      title: '计划类型',
      dataIndex: 'planType',
      key: 'planType',
      render: (type: string) => {
        const typeMap = {
          daily: { text: '每日', color: 'green' },
          weekly: { text: '每周', color: 'blue' },
          monthly: { text: '每月', color: 'orange' },
          exam_prep: { text: '考试准备', color: 'red' },
        };
        const config = typeMap[type as keyof typeof typeMap] || { text: type, color: 'default' };
        return <Tag color={config.color}>{config.text}</Tag>;
      },
    },
    {
      title: '开始日期',
      dataIndex: 'startDate',
      key: 'startDate',
    },
    {
      title: '结束日期',
      dataIndex: 'endDate',
      key: 'endDate',
    },
    {
      title: '状态',
      dataIndex: 'isCompleted',
      key: 'isCompleted',
      render: (completed: boolean) => (
        <Tag color={completed ? 'success' : 'processing'}>
          {completed ? '已完成' : '进行中'}
        </Tag>
      ),
    },
    {
      title: '操作',
      key: 'action',
      render: (_: any, record: StudyPlan) => (
        <Space>
          <Button type="link" icon={<EyeOutlined />} size="small">
            查看
          </Button>
          <Button type="link" icon={<EditOutlined />} size="small" onClick={() => handleEdit(record)}>
            编辑
          </Button>
          <Button type="link" danger icon={<DeleteOutlined />} size="small" onClick={() => handleDelete(record.id)}>
            删除
          </Button>
        </Space>
      ),
    },
  ];

  return (
    <div>
      <Card
        title="学习计划管理"
        extra={
          <Button type="primary" icon={<PlusOutlined />} onClick={handleCreate} size="small">
            新建计划
          </Button>
        }
        size="small"
      >
        <div className="mobile-only">
          {/* 移动端卡片视图 */}
          {plans.map(plan => (
            <Card 
              key={plan.id} 
              size="small" 
              style={{ marginBottom: 12 }}
              title={
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <span className="responsive-text-sm">{plan.title}</span>
                  <Tag color={plan.isCompleted ? 'success' : 'processing'}>
                    {plan.isCompleted ? '已完成' : '进行中'}
                  </Tag>
                </div>
              }
              extra={
                <Space>
                  <Button type="link" icon={<EyeOutlined />} size="small">
                    查看
                  </Button>
                  <Button type="link" icon={<EditOutlined />} size="small" onClick={() => handleEdit(plan)}>
                    编辑
                  </Button>
                  <Button type="link" danger icon={<DeleteOutlined />} size="small" onClick={() => handleDelete(plan.id)}>
                    删除
                  </Button>
                </Space>
              }
            >
              <div style={{ fontSize: '12px', color: '#666' }}>
                <div style={{ marginBottom: 4 }}>
                  <strong>学科：</strong><Tag color="blue">{plan.subject}</Tag>
                </div>
                <div style={{ marginBottom: 4 }}>
                  <strong>类型：</strong>
                  {(() => {
                    const typeMap = {
                      daily: { text: '每日', color: 'green' },
                      weekly: { text: '每周', color: 'blue' },
                      monthly: { text: '每月', color: 'orange' },
                      exam_prep: { text: '考试准备', color: 'red' },
                    };
                    const config = typeMap[plan.planType as keyof typeof typeMap] || { text: plan.planType, color: 'default' };
                    return <Tag color={config.color}>{config.text}</Tag>;
                  })()}
                </div>
                <div style={{ marginBottom: 4 }}>
                  <strong>时间：</strong>{plan.startDate} 至 {plan.endDate}
                </div>
                {plan.description && (
                  <div>
                    <strong>描述：</strong>{plan.description}
                  </div>
                )}
              </div>
            </Card>
          ))}
        </div>
        
        <div className="desktop-only">
          {/* 桌面端表格视图 */}
          <Table
            columns={columns}
            dataSource={plans}
            rowKey="id"
            loading={loading}
            scroll={{ x: 800 }}
            pagination={{
              pageSize: 10,
              showSizeChanger: true,
              showQuickJumper: true,
              showTotal: (total) => `共 ${total} 条记录`,
              size: 'small',
            }}
          />
        </div>
      </Card>

      <Modal
        title={editingPlan ? '编辑学习计划' : '新建学习计划'}
        open={modalVisible}
        onCancel={() => setModalVisible(false)}
        onOk={() => form.submit()}
        width={window.innerWidth < 768 ? '90%' : 600}
        style={{ top: window.innerWidth < 768 ? 20 : undefined }}
      >
        <Form
          form={form}
          layout="vertical"
          onFinish={handleSubmit}
        >
          <Form.Item
            name="title"
            label="计划名称"
            rules={[{ required: true, message: '请输入计划名称' }]}
          >
            <Input placeholder="请输入计划名称" />
          </Form.Item>

          <Form.Item
            name="subject"
            label="学科"
            rules={[{ required: true, message: '请选择学科' }]}
          >
            <Select placeholder="请选择学科">
              <Option value="语文">语文</Option>
              <Option value="数学">数学</Option>
              <Option value="英语">英语</Option>
              <Option value="道法">道法</Option>
              <Option value="历史">历史</Option>
            </Select>
          </Form.Item>

          <Form.Item
            name="planType"
            label="计划类型"
            rules={[{ required: true, message: '请选择计划类型' }]}
          >
            <Select placeholder="请选择计划类型">
              <Option value="daily">每日计划</Option>
              <Option value="weekly">每周计划</Option>
              <Option value="monthly">每月计划</Option>
              <Option value="exam_prep">考试准备</Option>
            </Select>
          </Form.Item>

          <Form.Item
            name="dateRange"
            label="计划时间"
            rules={[{ required: true, message: '请选择计划时间' }]}
          >
            <RangePicker style={{ width: '100%' }} />
          </Form.Item>

          <Form.Item
            name="description"
            label="计划描述"
          >
            <Input.TextArea rows={4} placeholder="请输入计划描述" />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

export default StudyPlan;
