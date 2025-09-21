import React, { useState, useEffect } from 'react';
import {
  Card,
  Button,
  Table,
  Tag,
  Space,
  Typography,
  Row,
  Col,
  Statistic,
  Progress,
  message,
  Modal,
  Input,
  Select,
  Tabs,
  List,
  Avatar,
  Badge,
  Tooltip,
  Popconfirm
} from 'antd';
import {
  BookOutlined,
  TrophyOutlined,
  ClockCircleOutlined,
  CheckCircleOutlined,
  ImportOutlined,
  DeleteOutlined,
  SearchOutlined,
  FilterOutlined,
  BarChartOutlined,
  StarOutlined
} from '@ant-design/icons';
import { useResponsive } from '../hooks/useResponsive';
import { 
  getGrade1EnglishVocabulary, 
  importGrade1EnglishVocabulary, 
  clearGrade1EnglishVocabulary, 
  getVocabularyStats,
  updateVocabularyMemorized,
  VocabularyItem,
  VocabularyStats
} from '../services/vocabularyApi';
import { useAuth } from '../contexts/AuthContext';

const { Title, Text } = Typography;
const { Search } = Input;
const { Option } = Select;
const { TabPane } = Tabs;

// 接口定义已移动到 vocabularyApi.ts

const Vocabulary: React.FC = () => {
  const [vocabulary, setVocabulary] = useState<VocabularyItem[]>([]);
  const [stats, setStats] = useState<VocabularyStats | null>(null);
  const [loading, setLoading] = useState(false);
  const [searchText, setSearchText] = useState('');
  const [difficultyFilter, setDifficultyFilter] = useState<number | undefined>();
  const [memorizedFilter, setMemorizedFilter] = useState<boolean | undefined>();
  const [activeTab, setActiveTab] = useState('list');
  const { isMobile } = useResponsive();
  const { user } = useAuth();

  // 加载真实数据
  useEffect(() => {
    if (user?.id) {
      loadVocabulary();
      loadStats();
    }
  }, [user?.id]);

  // 当筛选条件改变时重新加载数据
  useEffect(() => {
    if (user?.id) {
      loadVocabulary();
    }
  }, [difficultyFilter, memorizedFilter]);

  const loadVocabulary = async () => {
    setLoading(true);
    try {
      const response = await getGrade1EnglishVocabulary({
        difficulty_level: difficultyFilter,
        is_memorized: memorizedFilter
      });
      setVocabulary(response);
    } catch (error) {
      console.error('加载词汇表失败:', error);
      message.error('加载词汇表失败');
    } finally {
      setLoading(false);
    }
  };

  const loadStats = async () => {
    if (!user?.id) return;
    
    try {
      const response = await getVocabularyStats(user.id);
      setStats(response);
    } catch (error) {
      console.error('加载统计信息失败:', error);
      message.error('加载统计信息失败');
    }
  };

  const handleImport = async () => {
    if (!user?.id) {
      message.error('请先登录');
      return;
    }
    
    try {
      const response = await importGrade1EnglishVocabulary(user.id);
      message.success(`成功导入 ${response.imported_count} 个初一英语单词！`);
      loadVocabulary();
      loadStats();
    } catch (error) {
      console.error('导入失败:', error);
      message.error('导入失败');
    }
  };

  const handleClear = async () => {
    if (!user?.id) {
      message.error('请先登录');
      return;
    }
    
    try {
      const response = await clearGrade1EnglishVocabulary(user.id);
      message.success(`成功清空 ${response.deleted_count} 个单词！`);
      loadVocabulary();
      loadStats();
    } catch (error) {
      console.error('清空失败:', error);
      message.error('清空失败');
    }
  };

  const handleMemorize = async (id: string, memorized: boolean) => {
    try {
      await updateVocabularyMemorized(id, memorized);
      setVocabulary(prev => 
        prev.map(item => 
          item.id === id ? { ...item, is_memorized: memorized } : item
        )
      );
      message.success(memorized ? '标记为已背诵' : '标记为未背诵');
      // 重新加载统计信息
      loadStats();
    } catch (error) {
      console.error('更新失败:', error);
      message.error('更新失败');
    }
  };

  const filteredVocabulary = vocabulary.filter(item => {
    const matchesSearch = item.title.toLowerCase().includes(searchText.toLowerCase()) ||
                         item.content.toLowerCase().includes(searchText.toLowerCase());
    const matchesDifficulty = !difficultyFilter || item.difficulty_level === difficultyFilter;
    const matchesMemorized = memorizedFilter === undefined || item.is_memorized === memorizedFilter;
    
    return matchesSearch && matchesDifficulty && matchesMemorized;
  });

  const columns = [
    {
      title: '单词',
      dataIndex: 'title',
      key: 'title',
      render: (text: string) => (
        <Text strong style={{ fontSize: isMobile ? 14 : 16 }}>
          {text}
        </Text>
      ),
    },
    {
      title: '释义',
      dataIndex: 'content',
      key: 'content',
      render: (text: string) => (
        <Text style={{ fontSize: isMobile ? 12 : 14 }}>
          {text}
        </Text>
      ),
    },
    {
      title: '难度',
      dataIndex: 'difficulty_level',
      key: 'difficulty_level',
      render: (level: number) => (
        <Tag color={level <= 2 ? 'green' : level <= 3 ? 'orange' : 'red'}>
          {level}级
        </Tag>
      ),
    },
    {
      title: '状态',
      dataIndex: 'is_memorized',
      key: 'is_memorized',
      render: (memorized: boolean) => (
        <Tag color={memorized ? 'success' : 'default'}>
          {memorized ? '已背诵' : '未背诵'}
        </Tag>
      ),
    },
    {
      title: '练习次数',
      dataIndex: 'practice_count',
      key: 'practice_count',
      render: (count: number) => (
        <Badge count={count} showZero color="blue" />
      ),
    },
    {
      title: '操作',
      key: 'actions',
      render: (record: VocabularyItem) => (
        <Space>
          <Button
            type={record.is_memorized ? 'default' : 'primary'}
            size="small"
            icon={record.is_memorized ? <ClockCircleOutlined /> : <CheckCircleOutlined />}
            onClick={() => handleMemorize(record.id, !record.is_memorized)}
          >
            {record.is_memorized ? '未背诵' : '已背诵'}
          </Button>
        </Space>
      ),
    },
  ];

  const difficultyOptions = [
    { value: 1, label: '1级 (简单)', color: 'green' },
    { value: 2, label: '2级 (较易)', color: 'blue' },
    { value: 3, label: '3级 (中等)', color: 'orange' },
    { value: 4, label: '4级 (较难)', color: 'red' },
    { value: 5, label: '5级 (困难)', color: 'purple' },
  ];

  return (
    <div style={{ padding: isMobile ? '12px' : '24px' }}>
      <Title level={2} style={{ marginBottom: 24 }}>
        <BookOutlined style={{ marginRight: 8 }} />
        初一英语词汇管理
      </Title>

      {/* 统计卡片 */}
      {stats && (
        <Row gutter={[16, 16]} style={{ marginBottom: 24 }}>
          <Col xs={24} sm={12} md={6}>
            <Card>
              <Statistic
                title="总单词数"
                value={stats.total_words}
                prefix={<BookOutlined />}
                valueStyle={{ color: '#1890ff' }}
              />
            </Card>
          </Col>
          <Col xs={24} sm={12} md={6}>
            <Card>
              <Statistic
                title="已背诵"
                value={stats.memorized_words}
                prefix={<TrophyOutlined />}
                valueStyle={{ color: '#52c41a' }}
              />
            </Card>
          </Col>
          <Col xs={24} sm={12} md={6}>
            <Card>
              <Statistic
                title="背诵率"
                value={stats.memorization_rate}
                suffix="%"
                prefix={<BarChartOutlined />}
                valueStyle={{ color: '#fa8c16' }}
              />
            </Card>
          </Col>
          <Col xs={24} sm={12} md={6}>
            <Card>
              <Statistic
                title="平均练习"
                value={stats.average_practice_count}
                prefix={<StarOutlined />}
                valueStyle={{ color: '#722ed1' }}
              />
            </Card>
          </Col>
        </Row>
      )}

      {/* 操作栏 */}
      <Card style={{ marginBottom: 16 }}>
        <Row gutter={[16, 16]} align="middle">
          <Col xs={24} sm={12} md={8}>
            <Space>
              <Button
                type="primary"
                icon={<ImportOutlined />}
                onClick={handleImport}
              >
                导入单词表
              </Button>
              <Popconfirm
                title="确定要清空所有单词吗？"
                onConfirm={handleClear}
                okText="确定"
                cancelText="取消"
              >
                <Button
                  danger
                  icon={<DeleteOutlined />}
                >
                  清空单词表
                </Button>
              </Popconfirm>
            </Space>
          </Col>
          <Col xs={24} sm={12} md={8}>
            <Search
              placeholder="搜索单词或释义"
              value={searchText}
              onChange={(e) => setSearchText(e.target.value)}
              style={{ width: '100%' }}
            />
          </Col>
          <Col xs={24} sm={12} md={8}>
            <Space wrap>
              <Select
                placeholder="难度筛选"
                value={difficultyFilter}
                onChange={setDifficultyFilter}
                style={{ minWidth: 120 }}
                allowClear
              >
                {difficultyOptions.map(option => (
                  <Option key={option.value} value={option.value}>
                    {option.label}
                  </Option>
                ))}
              </Select>
              <Select
                placeholder="背诵状态"
                value={memorizedFilter}
                onChange={setMemorizedFilter}
                style={{ minWidth: 120 }}
                allowClear
              >
                <Option value={true}>已背诵</Option>
                <Option value={false}>未背诵</Option>
              </Select>
            </Space>
          </Col>
        </Row>
      </Card>

      {/* 内容区域 */}
      <Card>
        <Tabs
          activeKey={activeTab}
          onChange={setActiveTab}
          size={isMobile ? 'small' : undefined}
        >
          <TabPane tab="列表视图" key="list">
            <Table
              columns={columns}
              dataSource={filteredVocabulary}
              rowKey="id"
              loading={loading}
              pagination={{
                pageSize: isMobile ? 10 : 20,
                showSizeChanger: true,
                showQuickJumper: true,
                showTotal: (total) => `共 ${total} 个单词`,
              }}
              scroll={{ x: isMobile ? 600 : undefined }}
            />
          </TabPane>
          
          <TabPane tab="卡片视图" key="cards">
            <List
              grid={{
                gutter: 16,
                xs: 1,
                sm: 2,
                md: 3,
                lg: 4,
                xl: 5,
              }}
              dataSource={filteredVocabulary}
              renderItem={(item) => (
                <List.Item>
                  <Card
                    size="small"
                    hoverable
                    actions={[
                      <Button
                        type={item.is_memorized ? 'default' : 'primary'}
                        size="small"
                        icon={item.is_memorized ? <ClockCircleOutlined /> : <CheckCircleOutlined />}
                        onClick={() => handleMemorize(item.id, !item.is_memorized)}
                      >
                        {item.is_memorized ? '未背诵' : '已背诵'}
                      </Button>
                    ]}
                  >
                    <Card.Meta
                      title={
                        <Space>
                          <Text strong>{item.title}</Text>
                          <Tag color={item.difficulty_level <= 2 ? 'green' : item.difficulty_level <= 3 ? 'orange' : 'red'}>
                            {item.difficulty_level}级
                          </Tag>
                        </Space>
                      }
                      description={
                        <Space direction="vertical" size="small">
                          <Text type="secondary">{item.content}</Text>
                          <Space>
                            <Badge count={item.practice_count} showZero color="blue" />
                            <Text type="secondary">练习次数</Text>
                          </Space>
                        </Space>
                      }
                    />
                  </Card>
                </List.Item>
              )}
            />
          </TabPane>
        </Tabs>
      </Card>
    </div>
  );
};

export default Vocabulary;
