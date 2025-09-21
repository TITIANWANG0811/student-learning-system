import React, { useState, useEffect } from 'react';
import { Card, Button, Table, Tag, Space, Modal, Form, Input, Select, DatePicker, message, Checkbox } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined, CheckOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Option } = Select;

interface StudyTask {
  id: string;
  title: string;
  subject: string;
  taskType: string;
  scheduledDate: string;
  isCompleted: boolean;
  priority: number;
  estimatedDuration: number;
  description?: string;
}

const StudyTasks: React.FC = () => {
  const { user } = useAuth();
  const [tasks, setTasks] = useState<StudyTask[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalVisible, setModalVisible] = useState(false);
  const [editingTask, setEditingTask] = useState<StudyTask | null>(null);
  const [form] = Form.useForm();

  useEffect(() => {
    fetchTasks();
  }, []);

  const fetchTasks = async () => {
    setLoading(true);
    try {
      // 模拟数据
      setTasks([
        {
          id: '1',
          title: '完成数学作业第3章',
          subject: '数学',
          taskType: 'homework',
          scheduledDate: '2024-01-15',
          isCompleted: false,
          priority: 1,
          estimatedDuration: 60,
          description: '完成第3章练习题1-20题',
        },
        {
          id: '2',
          title: '背诵英语单词Unit 5',
          subject: '英语',
          taskType: 'recitation',
          scheduledDate: '2024-01-16',
          isCompleted: true,
          priority: 2,
          estimatedDuration: 30,
          description: '背诵Unit 5所有单词',
        },
        {
          id: '3',
          title: '默写古诗词',
          subject: '语文',
          taskType: 'dictation',
          scheduledDate: '2024-01-17',
          isCompleted: false,
          priority: 1,
          estimatedDuration: 45,
          description: '默写《春晓》和《静夜思》',
        },
      ]);
    } catch (error) {
      message.error('获取学习任务失败');
    } finally {
      setLoading(false);
    }
  };

  const handleCreate = () => {
    setEditingTask(null);
    form.resetFields();
    setModalVisible(true);
  };

  const handleEdit = (task: StudyTask) => {
    setEditingTask(task);
    form.setFieldsValue(task);
    setModalVisible(true);
  };

  const handleDelete = async (id: string) => {
    try {
      setTasks(tasks.filter(task => task.id !== id));
      message.success('删除成功');
    } catch (error) {
      message.error('删除失败');
    }
  };

  const handleToggleComplete = async (id: string) => {
    try {
      setTasks(tasks.map(task => 
        task.id === id ? { ...task, isCompleted: !task.isCompleted } : task
      ));
      message.success('状态更新成功');
    } catch (error) {
      message.error('状态更新失败');
    }
  };

  const handleSubmit = async (values: any) => {
    try {
      if (editingTask) {
        setTasks(tasks.map(task => 
          task.id === editingTask.id ? { ...task, ...values } : task
        ));
        message.success('更新成功');
      } else {
        const newTask = { ...values, id: Date.now().toString() };
        setTasks([...tasks, newTask]);
        message.success('创建成功');
      }
      
      setModalVisible(false);
      form.resetFields();
    } catch (error) {
      message.error('操作失败');
    }
  };

  const getTaskTypeText = (type: string) => {
    const typeMap = {
      reading: '阅读',
      homework: '作业',
      recitation: '背诵',
      dictation: '默写',
      practice: '练习',
      review: '复习',
    };
    return typeMap[type as keyof typeof typeMap] || type;
  };

  const getPriorityColor = (priority: number) => {
    switch (priority) {
      case 1: return 'red';
      case 2: return 'orange';
      case 3: return 'green';
      default: return 'default';
    }
  };

  const getPriorityText = (priority: number) => {
    switch (priority) {
      case 1: return '高';
      case 2: return '中';
      case 3: return '低';
      default: return '未知';
    }
  };

  const columns = [
    {
      title: '完成',
      dataIndex: 'isCompleted',
      key: 'isCompleted',
      width: 80,
      render: (completed: boolean, record: StudyTask) => (
        <Checkbox
          checked={completed}
          onChange={() => handleToggleComplete(record.id)}
        />
      ),
    },
    {
      title: '任务名称',
      dataIndex: 'title',
      key: 'title',
      render: (title: string, record: StudyTask) => (
        <span style={{ 
          textDecoration: record.isCompleted ? 'line-through' : 'none',
          opacity: record.isCompleted ? 0.6 : 1
        }}>
          {title}
        </span>
      ),
    },
    {
      title: '学科',
      dataIndex: 'subject',
      key: 'subject',
      render: (subject: string) => <Tag color="blue">{subject}</Tag>,
    },
    {
      title: '任务类型',
      dataIndex: 'taskType',
      key: 'taskType',
      render: (type: string) => <Tag>{getTaskTypeText(type)}</Tag>,
    },
    {
      title: '计划日期',
      dataIndex: 'scheduledDate',
      key: 'scheduledDate',
    },
    {
      title: '优先级',
      dataIndex: 'priority',
      key: 'priority',
      render: (priority: number) => (
        <Tag color={getPriorityColor(priority)}>
          {getPriorityText(priority)}
        </Tag>
      ),
    },
    {
      title: '预计时长',
      dataIndex: 'estimatedDuration',
      key: 'estimatedDuration',
      render: (duration: number) => `${duration}分钟`,
    },
    {
      title: '操作',
      key: 'action',
      render: (_: any, record: StudyTask) => (
        <Space>
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
        title="学习任务管理"
        extra={
          <Button type="primary" icon={<PlusOutlined />} onClick={handleCreate}>
            新建任务
          </Button>
        }
      >
        <Table
          columns={columns}
          dataSource={tasks}
          rowKey="id"
          loading={loading}
          pagination={{
            pageSize: 10,
            showSizeChanger: true,
            showQuickJumper: true,
            showTotal: (total) => `共 ${total} 条记录`,
          }}
        />
      </Card>

      <Modal
        title={editingTask ? '编辑学习任务' : '新建学习任务'}
        open={modalVisible}
        onCancel={() => setModalVisible(false)}
        onOk={() => form.submit()}
        width={600}
      >
        <Form
          form={form}
          layout="vertical"
          onFinish={handleSubmit}
        >
          <Form.Item
            name="title"
            label="任务名称"
            rules={[{ required: true, message: '请输入任务名称' }]}
          >
            <Input placeholder="请输入任务名称" />
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
            name="taskType"
            label="任务类型"
            rules={[{ required: true, message: '请选择任务类型' }]}
          >
            <Select placeholder="请选择任务类型">
              <Option value="reading">阅读</Option>
              <Option value="homework">作业</Option>
              <Option value="recitation">背诵</Option>
              <Option value="dictation">默写</Option>
              <Option value="practice">练习</Option>
              <Option value="review">复习</Option>
            </Select>
          </Form.Item>

          <Form.Item
            name="scheduledDate"
            label="计划日期"
            rules={[{ required: true, message: '请选择计划日期' }]}
          >
            <DatePicker style={{ width: '100%' }} />
          </Form.Item>

          <Form.Item
            name="priority"
            label="优先级"
            rules={[{ required: true, message: '请选择优先级' }]}
          >
            <Select placeholder="请选择优先级">
              <Option value={1}>高</Option>
              <Option value={2}>中</Option>
              <Option value={3}>低</Option>
            </Select>
          </Form.Item>

          <Form.Item
            name="estimatedDuration"
            label="预计时长（分钟）"
            rules={[{ required: true, message: '请输入预计时长' }]}
          >
            <Input type="number" placeholder="请输入预计时长" />
          </Form.Item>

          <Form.Item
            name="description"
            label="任务描述"
          >
            <Input.TextArea rows={4} placeholder="请输入任务描述" />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

export default StudyTasks;
