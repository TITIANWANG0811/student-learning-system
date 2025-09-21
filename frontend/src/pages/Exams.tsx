import React, { useState, useEffect } from 'react';
import { Card, Button, Table, Tag, Space, Modal, Form, Input, Select, DatePicker, message, Progress } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined, EyeOutlined, TrophyOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Option } = Select;

interface Exam {
  id: string;
  title: string;
  subject: string;
  examType: string;
  examDate: string;
  duration: number;
  totalScore: number;
  achievedScore?: number;
  isCompleted: boolean;
  description?: string;
}

const Exams: React.FC = () => {
  const { user } = useAuth();
  const [exams, setExams] = useState<Exam[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalVisible, setModalVisible] = useState(false);
  const [editingExam, setEditingExam] = useState<Exam | null>(null);
  const [form] = Form.useForm();

  useEffect(() => {
    fetchExams();
  }, []);

  const fetchExams = async () => {
    setLoading(true);
    try {
      // 模拟数据
      setExams([
        {
          id: '1',
          title: '数学期中考试',
          subject: '数学',
          examType: 'midterm',
          examDate: '2024-01-25',
          duration: 120,
          totalScore: 100,
          achievedScore: 85,
          isCompleted: true,
          description: '第1-5章内容',
        },
        {
          id: '2',
          title: '英语单元测试',
          subject: '英语',
          examType: 'quiz',
          examDate: '2024-01-20',
          duration: 60,
          totalScore: 100,
          isCompleted: false,
          description: 'Unit 5-6 单词和语法',
        },
        {
          id: '3',
          title: '语文期末考试',
          subject: '语文',
          examType: 'final',
          examDate: '2024-02-15',
          duration: 150,
          totalScore: 120,
          isCompleted: false,
          description: '全册内容综合测试',
        },
      ]);
    } catch (error) {
      message.error('获取考试信息失败');
    } finally {
      setLoading(false);
    }
  };

  const handleCreate = () => {
    setEditingExam(null);
    form.resetFields();
    setModalVisible(true);
  };

  const handleEdit = (exam: Exam) => {
    setEditingExam(exam);
    form.setFieldsValue(exam);
    setModalVisible(true);
  };

  const handleDelete = async (id: string) => {
    try {
      setExams(exams.filter(exam => exam.id !== id));
      message.success('删除成功');
    } catch (error) {
      message.error('删除失败');
    }
  };

  const handleSubmit = async (values: any) => {
    try {
      if (editingExam) {
        setExams(exams.map(exam => 
          exam.id === editingExam.id ? { ...exam, ...values } : exam
        ));
        message.success('更新成功');
      } else {
        const newExam = { ...values, id: Date.now().toString() };
        setExams([...exams, newExam]);
        message.success('创建成功');
      }
      
      setModalVisible(false);
      form.resetFields();
    } catch (error) {
      message.error('操作失败');
    }
  };

  const getExamTypeText = (type: string) => {
    const typeMap = {
      quiz: '小测验',
      midterm: '期中考试',
      final: '期末考试',
      mock: '模拟考试',
      practice: '练习测试',
    };
    return typeMap[type as keyof typeof typeMap] || type;
  };

  const getExamTypeColor = (type: string) => {
    const colorMap = {
      quiz: 'blue',
      midterm: 'orange',
      final: 'red',
      mock: 'purple',
      practice: 'green',
    };
    return colorMap[type as keyof typeof colorMap] || 'default';
  };

  const isUpcoming = (examDate: string) => {
    return new Date(examDate) > new Date();
  };

  const getDaysUntilExam = (examDate: string) => {
    const today = new Date();
    const exam = new Date(examDate);
    const diffTime = exam.getTime() - today.getTime();
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return diffDays;
  };

  const columns = [
    {
      title: '考试名称',
      dataIndex: 'title',
      key: 'title',
      render: (title: string, record: Exam) => (
        <div>
          <div style={{ fontWeight: 'bold' }}>{title}</div>
          {isUpcoming(record.examDate) && (
            <div style={{ fontSize: 12, color: '#666' }}>
              还有 {getDaysUntilExam(record.examDate)} 天
            </div>
          )}
        </div>
      ),
    },
    {
      title: '学科',
      dataIndex: 'subject',
      key: 'subject',
      render: (subject: string) => <Tag color="blue">{subject}</Tag>,
    },
    {
      title: '考试类型',
      dataIndex: 'examType',
      key: 'examType',
      render: (type: string) => (
        <Tag color={getExamTypeColor(type)}>
          {getExamTypeText(type)}
        </Tag>
      ),
    },
    {
      title: '考试日期',
      dataIndex: 'examDate',
      key: 'examDate',
      render: (examDate: string, record: Exam) => (
        <div>
          <div>{examDate}</div>
          {isUpcoming(examDate) && (
            <Tag color="orange">即将到来</Tag>
          )}
        </div>
      ),
    },
    {
      title: '考试时长',
      dataIndex: 'duration',
      key: 'duration',
      render: (duration: number) => `${duration}分钟`,
    },
    {
      title: '成绩',
      key: 'score',
      render: (_: any, record: Exam) => {
        if (record.isCompleted && record.achievedScore !== undefined) {
          const percentage = Math.round((record.achievedScore / record.totalScore) * 100);
          return (
            <div>
              <div style={{ fontWeight: 'bold' }}>
                {record.achievedScore}/{record.totalScore}
              </div>
              <Progress 
                percent={percentage} 
                size="small" 
                status={percentage >= 80 ? 'success' : percentage >= 60 ? 'normal' : 'exception'}
              />
            </div>
          );
        }
        return <Tag color="default">未考试</Tag>;
      },
    },
    {
      title: '状态',
      dataIndex: 'isCompleted',
      key: 'isCompleted',
      render: (completed: boolean, record: Exam) => {
        if (completed) {
          return <Tag color="success" icon={<TrophyOutlined />}>已完成</Tag>;
        } else if (isUpcoming(record.examDate)) {
          return <Tag color="processing">待考试</Tag>;
        } else {
          return <Tag color="default">已过期</Tag>;
        }
      },
    },
    {
      title: '操作',
      key: 'action',
      render: (_: any, record: Exam) => (
        <Space>
          <Button type="link" icon={<EyeOutlined />} size="small">
            查看详情
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
        title="考试管理"
        extra={
          <Button type="primary" icon={<PlusOutlined />} onClick={handleCreate}>
            新建考试
          </Button>
        }
      >
        <Table
          columns={columns}
          dataSource={exams}
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
        title={editingExam ? '编辑考试' : '新建考试'}
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
            label="考试名称"
            rules={[{ required: true, message: '请输入考试名称' }]}
          >
            <Input placeholder="请输入考试名称" />
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
            name="examType"
            label="考试类型"
            rules={[{ required: true, message: '请选择考试类型' }]}
          >
            <Select placeholder="请选择考试类型">
              <Option value="quiz">小测验</Option>
              <Option value="midterm">期中考试</Option>
              <Option value="final">期末考试</Option>
              <Option value="mock">模拟考试</Option>
              <Option value="practice">练习测试</Option>
            </Select>
          </Form.Item>

          <Form.Item
            name="examDate"
            label="考试日期"
            rules={[{ required: true, message: '请选择考试日期' }]}
          >
            <DatePicker style={{ width: '100%' }} />
          </Form.Item>

          <Form.Item
            name="duration"
            label="考试时长（分钟）"
            rules={[{ required: true, message: '请输入考试时长' }]}
          >
            <Input type="number" placeholder="请输入考试时长" />
          </Form.Item>

          <Form.Item
            name="totalScore"
            label="总分"
            rules={[{ required: true, message: '请输入总分' }]}
          >
            <Input type="number" placeholder="请输入总分" />
          </Form.Item>

          {editingExam && (
            <Form.Item
              name="achievedScore"
              label="实际得分"
            >
              <Input type="number" placeholder="请输入实际得分" />
            </Form.Item>
          )}

          <Form.Item
            name="description"
            label="考试描述"
          >
            <Input.TextArea rows={3} placeholder="请输入考试描述" />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

export default Exams;
