import React, { useState, useEffect } from 'react';
import { 
  Card, 
  Table, 
  Button, 
  Space, 
  Tag, 
  Modal, 
  Form, 
  Input, 
  message, 
  Popconfirm,
  Row,
  Col,
  Statistic,
  Typography
} from 'antd';
import { 
  PlusOutlined, 
  EditOutlined, 
  DeleteOutlined, 
  BookOutlined,
  StarOutlined,
  TrophyOutlined
} from '@ant-design/icons';
import { getSubjectCategories, createSubjectCategory, updateSubjectCategory, deleteSubjectCategory, SubjectCategory } from '../services/subjectApi';

const { Title, Text } = Typography;

const SubjectCategories: React.FC = () => {
  const [categories, setCategories] = useState<SubjectCategory[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalVisible, setModalVisible] = useState(false);
  const [editingCategory, setEditingCategory] = useState<SubjectCategory | null>(null);
  const [form] = Form.useForm();

  useEffect(() => {
    fetchCategories();
  }, []);

  const fetchCategories = async () => {
    setLoading(true);
    try {
      const data = await getSubjectCategories();
      setCategories(data);
    } catch (error) {
      message.error('获取分类列表失败');
    } finally {
      setLoading(false);
    }
  };

  const handleCreate = () => {
    setEditingCategory(null);
    form.resetFields();
    setModalVisible(true);
  };

  const handleEdit = (category: SubjectCategory) => {
    setEditingCategory(category);
    form.setFieldsValue(category);
    setModalVisible(true);
  };

  const handleDelete = async (id: string) => {
    try {
      await deleteSubjectCategory(id);
      message.success('删除成功');
      fetchCategories();
    } catch (error) {
      message.error('删除失败');
    }
  };

  const handleSubmit = async (values: any) => {
    try {
      if (editingCategory) {
        await updateSubjectCategory(editingCategory.id, values);
        message.success('更新成功');
      } else {
        await createSubjectCategory(values);
        message.success('创建成功');
      }
      setModalVisible(false);
      form.resetFields();
      fetchCategories();
    } catch (error) {
      message.error('操作失败');
    }
  };

  const columns = [
    {
      title: '分类名称',
      dataIndex: 'name',
      key: 'name',
      render: (name: string, record: SubjectCategory) => (
        <div>
          <div style={{ fontWeight: 'bold' }}>{name}</div>
          <Text type="secondary" className="responsive-text-xs">{record.code}</Text>
        </div>
      ),
    },
    {
      title: '描述',
      dataIndex: 'description',
      key: 'description',
      render: (description: string) => (
        <Text type="secondary" className="responsive-text-sm">
          {description || '-'}
        </Text>
      ),
    },
    {
      title: '主题色',
      dataIndex: 'color',
      key: 'color',
      render: (color: string) => (
        <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
          <div 
            style={{ 
              width: 20, 
              height: 20, 
              backgroundColor: color, 
              borderRadius: 4,
              border: '1px solid #d9d9d9'
            }} 
          />
          <span className="responsive-text-sm">{color}</span>
        </div>
      ),
    },
    {
      title: '排序',
      dataIndex: 'sort_order',
      key: 'sort_order',
      render: (order: number) => (
        <Tag color="blue">{order}</Tag>
      ),
    },
    {
      title: '状态',
      dataIndex: 'is_active',
      key: 'is_active',
      render: (isActive: boolean) => (
        <Tag color={isActive ? 'success' : 'default'}>
          {isActive ? '激活' : '禁用'}
        </Tag>
      ),
    },
    {
      title: '操作',
      key: 'action',
      render: (_: any, record: SubjectCategory) => (
        <Space>
          <Button 
            type="link" 
            icon={<EditOutlined />} 
            size="small"
            onClick={() => handleEdit(record)}
          >
            编辑
          </Button>
          <Popconfirm
            title="确定删除这个分类吗？"
            onConfirm={() => handleDelete(record.id)}
            okText="确定"
            cancelText="取消"
          >
            <Button 
              type="link" 
              danger 
              icon={<DeleteOutlined />} 
              size="small"
            >
              删除
            </Button>
          </Popconfirm>
        </Space>
      ),
    },
  ];

  // 统计信息
  const totalCategories = categories.length;
  const activeCategories = categories.filter(c => c.is_active).length;

  return (
    <div>
      <Title level={2} className="responsive-text-lg">学科分类管理</Title>
      <Text type="secondary" className="responsive-text-sm">
        管理学科分类，帮助更好地组织和展示各学科内容
      </Text>

      {/* 统计卡片 */}
      <Row gutter={[16, 16]} style={{ marginTop: 24 }}>
        <Col xs={24} sm={8}>
          <Card size="small">
            <Statistic
              title="总分类数"
              value={totalCategories}
              prefix={<BookOutlined />}
              valueStyle={{ color: '#1890ff' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={8}>
          <Card size="small">
            <Statistic
              title="激活分类"
              value={activeCategories}
              prefix={<StarOutlined />}
              valueStyle={{ color: '#52c41a' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={8}>
          <Card size="small">
            <Statistic
              title="禁用分类"
              value={totalCategories - activeCategories}
              prefix={<TrophyOutlined />}
              valueStyle={{ color: '#ff4d4f' }}
            />
          </Card>
        </Col>
      </Row>

      {/* 分类列表 */}
      <Card
        title="分类列表"
        extra={
          <Button type="primary" icon={<PlusOutlined />} onClick={handleCreate} size="small">
            新建分类
          </Button>
        }
        style={{ marginTop: 24 }}
        size="small"
      >
        <div className="mobile-only">
          {/* 移动端卡片视图 */}
          {categories.map(category => (
            <Card 
              key={category.id} 
              size="small" 
              style={{ marginBottom: 12 }}
              title={
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <span className="responsive-text-sm">{category.name}</span>
                  <Tag color={category.is_active ? 'success' : 'default'}>
                    {category.is_active ? '激活' : '禁用'}
                  </Tag>
                </div>
              }
              extra={
                <Space>
                  <Button 
                    type="link" 
                    icon={<EditOutlined />} 
                    size="small"
                    onClick={() => handleEdit(category)}
                  >
                    编辑
                  </Button>
                  <Popconfirm
                    title="确定删除这个分类吗？"
                    onConfirm={() => handleDelete(category.id)}
                    okText="确定"
                    cancelText="取消"
                  >
                    <Button 
                      type="link" 
                      danger 
                      icon={<DeleteOutlined />} 
                      size="small"
                    >
                      删除
                    </Button>
                  </Popconfirm>
                </Space>
              }
            >
              <div style={{ fontSize: '12px', color: '#666' }}>
                <div style={{ marginBottom: 4 }}>
                  <strong>代码：</strong>{category.code}
                </div>
                <div style={{ marginBottom: 4 }}>
                  <strong>描述：</strong>{category.description || '-'}
                </div>
                <div style={{ marginBottom: 4 }}>
                  <strong>主题色：</strong>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginTop: 4 }}>
                    <div 
                      style={{ 
                        width: 16, 
                        height: 16, 
                        backgroundColor: category.color, 
                        borderRadius: 4,
                        border: '1px solid #d9d9d9'
                      }} 
                    />
                    <span>{category.color}</span>
                  </div>
                </div>
                <div>
                  <strong>排序：</strong><Tag color="blue">{category.sort_order}</Tag>
                </div>
              </div>
            </Card>
          ))}
        </div>
        
        <div className="desktop-only">
          {/* 桌面端表格视图 */}
          <Table
            columns={columns}
            dataSource={categories}
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

      {/* 创建/编辑模态框 */}
      <Modal
        title={editingCategory ? '编辑分类' : '新建分类'}
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
            name="name"
            label="分类名称"
            rules={[{ required: true, message: '请输入分类名称' }]}
          >
            <Input placeholder="请输入分类名称" />
          </Form.Item>

          <Form.Item
            name="code"
            label="分类代码"
            rules={[{ required: true, message: '请输入分类代码' }]}
          >
            <Input placeholder="请输入分类代码" />
          </Form.Item>

          <Form.Item
            name="description"
            label="分类描述"
          >
            <Input.TextArea placeholder="请输入分类描述" rows={3} />
          </Form.Item>

          <Form.Item
            name="color"
            label="主题色"
          >
            <Input placeholder="#FF6B6B" />
          </Form.Item>

          <Form.Item
            name="icon"
            label="图标名称"
          >
            <Input placeholder="book" />
          </Form.Item>

          <Form.Item
            name="sort_order"
            label="排序"
            initialValue={0}
          >
            <Input type="number" placeholder="0" />
          </Form.Item>

          <Form.Item
            name="is_active"
            label="是否激活"
            valuePropName="checked"
            initialValue={true}
          >
            <input type="checkbox" />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

export default SubjectCategories;
