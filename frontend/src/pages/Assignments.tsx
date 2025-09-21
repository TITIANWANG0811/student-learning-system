import React, { useState, useEffect } from 'react';
import { Card, Button, Table, Tag, Space, Modal, Form, Input, Select, DatePicker, message } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined, CheckOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Option } = Select;

interface Assignment {
  id: string;
  title: string;
  subject: string;
  dueDate: string;
  isSubmitted: boolean;
  grade?: string;
  feedback?: string;
  description?: string;
}

const Assignments: React.FC = () => {
  const { user } = useAuth();
  const [assignments, setAssignments] = useState<Assignment[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalVisible, setModalVisible] = useState(false);
  const [editingAssignment, setEditingAssignment] = useState<Assignment | null>(null);
  const [form] = Form.useForm();

  useEffect(() => {
    fetchAssignments();
  }, []);

  const fetchAssignments = async () => {
    setLoading(true);
    try {
      // 模拟数据
      setAssignments([
        {
          id: '1',
          title: '数学作业第3章',
          subject: '数学',
          dueDate: '2024-01-20',
          isSubmitted: false,
          description: '完成第3章练习题1-20题',
        },
        {
          id: '2',
          title: '英语作文',
          subject: '英语',
          dueDate: '2024-01-18',
          isSubmitted: true,
          grade: 'A',
          feedback: '写得很好，继续努力！',
          description: '写一篇关于我的家庭的英语作文',
        },
        {
          id: '3',
          title: '历史报告',
          subject: '历史',
          dueDate: '2024-01-25',
          isSubmitted: false,
          description: '研究辛亥革命的历史意义',
        },
      ]);
    } catch (error) {
      message.error('获取作业失败');
    } finally {
      setLoading(false);
    }
  };

  const handleCreate = () => {
    setEditingAssignment(null);
    form.resetFields();
    setModalVisible(true);
  };

  const handleEdit = (assignment: Assignment) => {
    setEditingAssignment(assignment);
    form.setFieldsValue(assignment);
    setModalVisible(true);
  };

  const handleDelete = async (id: string) => {
    try {
      setAssignments(assignments.filter(assignment => assignment.id !== id));
      message.success('删除成功');
    } catch (error) {
      message.error('删除失败');
    }
  };

  const handleSubmit = async (values: any) => {
    try {
      if (editingAssignment) {
        setAssignments(assignments.map(assignment => 
          assignment.id === editingAssignment.id ? { ...assignment, ...values } : assignment
        ));
        message.success('更新成功');
      } else {
        const newAssignment = { ...values, id: Date.now().toString() };
        setAssignments([...assignments, newAssignment]);
        message.success('创建成功');
      }
      
      setModalVisible(false);
      form.resetFields();
    } catch (error) {
      message.error('操作失败');
    }
  };

  const handleMarkSubmitted = async (id: string) => {
    try {
      setAssignments(assignments.map(assignment => 
        assignment.id === id ? { ...assignment, isSubmitted: true } : assignment
      ));
      message.success('标记为已提交');
    } catch (error) {
      message.error('操作失败');
    }
  };

  const isOverdue = (dueDate: string) => {
    return new Date(dueDate) < new Date();
  };

  const columns = [
    {
      title: '作业标题',
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
      title: '截止日期',
      dataIndex: 'dueDate',
      key: 'dueDate',
      render: (dueDate: string, record: Assignment) => (
        <span style={{ 
          color: isOverdue(dueDate) && !record.isSubmitted ? 'red' : 'inherit' 
        }}>
          {dueDate}
          {isOverdue(dueDate) && !record.isSubmitted && (
            <Tag color="red" style={{ marginLeft: 8 }}>已逾期</Tag>
          )}
        </span>
      ),
    },
    {
      title: '状态',
      dataIndex: 'isSubmitted',
      key: 'isSubmitted',
      render: (submitted: boolean, record: Assignment) => (
        <div>
          <Tag color={submitted ? 'success' : 'processing'}>
            {submitted ? '已提交' : '未提交'}
          </Tag>
          {record.grade && (
            <Tag color="gold" style={{ marginLeft: 8 }}>
              成绩: {record.grade}
            </Tag>
          )}
        </div>
      ),
    },
    {
      title: '操作',
      key: 'action',
      render: (_: any, record: Assignment) => (
        <Space>
          {!record.isSubmitted && (
            <Button 
              type="link" 
              icon={<CheckOutlined />} 
              size="small" 
              onClick={() => handleMarkSubmitted(record.id)}
            >
              标记已提交
            </Button>
          )}
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
        title="作业管理"
        extra={
          <Button type="primary" icon={<PlusOutlined />} onClick={handleCreate}>
            新建作业
          </Button>
        }
      >
        <Table
          columns={columns}
          dataSource={assignments}
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
        title={editingAssignment ? '编辑作业' : '新建作业'}
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
            label="作业标题"
            rules={[{ required: true, message: '请输入作业标题' }]}
          >
            <Input placeholder="请输入作业标题" />
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
            name="dueDate"
            label="截止日期"
            rules={[{ required: true, message: '请选择截止日期' }]}
          >
            <DatePicker style={{ width: '100%' }} />
          </Form.Item>

          <Form.Item
            name="description"
            label="作业描述"
          >
            <Input.TextArea rows={4} placeholder="请输入作业描述" />
          </Form.Item>

          {editingAssignment && (
            <>
              <Form.Item
                name="grade"
                label="成绩"
              >
                <Select placeholder="请选择成绩" allowClear>
                  <Option value="A+">A+</Option>
                  <Option value="A">A</Option>
                  <Option value="B+">B+</Option>
                  <Option value="B">B</Option>
                  <Option value="C+">C+</Option>
                  <Option value="C">C</Option>
                  <Option value="D">D</Option>
                </Select>
              </Form.Item>

              <Form.Item
                name="feedback"
                label="教师反馈"
              >
                <Input.TextArea rows={3} placeholder="请输入教师反馈" />
              </Form.Item>
            </>
          )}
        </Form>
      </Modal>
    </div>
  );
};

export default Assignments;
