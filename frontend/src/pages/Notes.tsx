import React, { useState, useEffect } from 'react';
import { Card, Button, Table, Tag, Space, Modal, Form, Input, Select, message, InputNumber } from 'antd';
import { PlusOutlined, EditOutlined, DeleteOutlined, SearchOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Option } = Select;
const { TextArea } = Input;

interface Note {
  id: string;
  title: string;
  subject: string;
  noteType: string;
  content: string;
  tags: string[];
  isImportant: boolean;
  createdAt: string;
}

const Notes: React.FC = () => {
  const { user } = useAuth();
  const [notes, setNotes] = useState<Note[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalVisible, setModalVisible] = useState(false);
  const [editingNote, setEditingNote] = useState<Note | null>(null);
  const [searchText, setSearchText] = useState('');
  const [selectedSubject, setSelectedSubject] = useState('');
  const [form] = Form.useForm();

  useEffect(() => {
    fetchNotes();
  }, []);

  const fetchNotes = async () => {
    setLoading(true);
    try {
      // 模拟数据
      setNotes([
        {
          id: '1',
          title: '数学公式总结',
          subject: '数学',
          noteType: 'formula',
          content: '二次函数：y = ax² + bx + c\n顶点坐标：(-b/2a, (4ac-b²)/4a)',
          tags: ['公式', '二次函数'],
          isImportant: true,
          createdAt: '2024-01-15',
        },
        {
          id: '2',
          title: '英语单词Unit 5',
          subject: '英语',
          noteType: 'vocabulary',
          content: 'apple - 苹果\nbanana - 香蕉\norange - 橙子',
          tags: ['单词', 'Unit 5'],
          isImportant: false,
          createdAt: '2024-01-14',
        },
        {
          id: '3',
          title: '历史重要事件',
          subject: '历史',
          noteType: 'concept',
          content: '辛亥革命：1911年，推翻清朝统治，建立中华民国',
          tags: ['历史', '辛亥革命'],
          isImportant: true,
          createdAt: '2024-01-13',
        },
      ]);
    } catch (error) {
      message.error('获取笔记失败');
    } finally {
      setLoading(false);
    }
  };

  const handleCreate = () => {
    setEditingNote(null);
    form.resetFields();
    setModalVisible(true);
  };

  const handleEdit = (note: Note) => {
    setEditingNote(note);
    form.setFieldsValue(note);
    setModalVisible(true);
  };

  const handleDelete = async (id: string) => {
    try {
      setNotes(notes.filter(note => note.id !== id));
      message.success('删除成功');
    } catch (error) {
      message.error('删除失败');
    }
  };

  const handleSubmit = async (values: any) => {
    try {
      if (editingNote) {
        setNotes(notes.map(note => 
          note.id === editingNote.id ? { ...note, ...values } : note
        ));
        message.success('更新成功');
      } else {
        const newNote = { 
          ...values, 
          id: Date.now().toString(),
          createdAt: new Date().toISOString().split('T')[0],
        };
        setNotes([...notes, newNote]);
        message.success('创建成功');
      }
      
      setModalVisible(false);
      form.resetFields();
    } catch (error) {
      message.error('操作失败');
    }
  };

  const getNoteTypeText = (type: string) => {
    const typeMap = {
      general: '普通',
      formula: '公式',
      vocabulary: '词汇',
      concept: '概念',
      summary: '总结',
    };
    return typeMap[type as keyof typeof typeMap] || type;
  };

  const getNoteTypeColor = (type: string) => {
    const colorMap = {
      general: 'default',
      formula: 'blue',
      vocabulary: 'green',
      concept: 'orange',
      summary: 'purple',
    };
    return colorMap[type as keyof typeof colorMap] || 'default';
  };

  const filteredNotes = notes.filter(note => {
    const matchesSearch = note.title.toLowerCase().includes(searchText.toLowerCase()) ||
                         note.content.toLowerCase().includes(searchText.toLowerCase());
    const matchesSubject = !selectedSubject || note.subject === selectedSubject;
    return matchesSearch && matchesSubject;
  });

  const columns = [
    {
      title: '标题',
      dataIndex: 'title',
      key: 'title',
      render: (title: string, record: Note) => (
        <div>
          <span style={{ fontWeight: record.isImportant ? 'bold' : 'normal' }}>
            {title}
          </span>
          {record.isImportant && <Tag color="red" style={{ marginLeft: 8 }}>重要</Tag>}
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
      title: '类型',
      dataIndex: 'noteType',
      key: 'noteType',
      render: (type: string) => (
        <Tag color={getNoteTypeColor(type)}>
          {getNoteTypeText(type)}
        </Tag>
      ),
    },
    {
      title: '标签',
      dataIndex: 'tags',
      key: 'tags',
      render: (tags: string[]) => (
        <Space>
          {tags.map(tag => (
                  <Tag key={tag}>{tag}</Tag>
          ))}
        </Space>
      ),
    },
    {
      title: '创建时间',
      dataIndex: 'createdAt',
      key: 'createdAt',
    },
    {
      title: '操作',
      key: 'action',
      render: (_: any, record: Note) => (
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
        title="笔记管理"
        extra={
          <Button type="primary" icon={<PlusOutlined />} onClick={handleCreate}>
            新建笔记
          </Button>
        }
      >
        <div style={{ marginBottom: 16, display: 'flex', gap: 16 }}>
          <Input
            placeholder="搜索笔记..."
            prefix={<SearchOutlined />}
            value={searchText}
            onChange={(e) => setSearchText(e.target.value)}
            style={{ width: 200 }}
          />
          <Select
            placeholder="选择学科"
            value={selectedSubject}
            onChange={setSelectedSubject}
            style={{ width: 150 }}
            allowClear
          >
            <Option value="语文">语文</Option>
            <Option value="数学">数学</Option>
            <Option value="英语">英语</Option>
            <Option value="道法">道法</Option>
            <Option value="历史">历史</Option>
          </Select>
        </div>

        <Table
          columns={columns}
          dataSource={filteredNotes}
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
        title={editingNote ? '编辑笔记' : '新建笔记'}
        open={modalVisible}
        onCancel={() => setModalVisible(false)}
        onOk={() => form.submit()}
        width={800}
      >
        <Form
          form={form}
          layout="vertical"
          onFinish={handleSubmit}
        >
          <Form.Item
            name="title"
            label="笔记标题"
            rules={[{ required: true, message: '请输入笔记标题' }]}
          >
            <Input placeholder="请输入笔记标题" />
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
            name="noteType"
            label="笔记类型"
            rules={[{ required: true, message: '请选择笔记类型' }]}
          >
            <Select placeholder="请选择笔记类型">
              <Option value="general">普通</Option>
              <Option value="formula">公式</Option>
              <Option value="vocabulary">词汇</Option>
              <Option value="concept">概念</Option>
              <Option value="summary">总结</Option>
            </Select>
          </Form.Item>

          <Form.Item
            name="content"
            label="笔记内容"
            rules={[{ required: true, message: '请输入笔记内容' }]}
          >
            <TextArea rows={8} placeholder="请输入笔记内容" />
          </Form.Item>

          <Form.Item
            name="tags"
            label="标签"
          >
            <Select
              mode="tags"
              placeholder="输入标签，按回车添加"
              style={{ width: '100%' }}
            />
          </Form.Item>

          <Form.Item
            name="isImportant"
            valuePropName="checked"
          >
            <input type="checkbox" /> 标记为重要
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

export default Notes;
