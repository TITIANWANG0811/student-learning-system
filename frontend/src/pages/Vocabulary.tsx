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

const { Title, Text } = Typography;
const { Search } = Input;
const { Option } = Select;
const { TabPane } = Tabs;

interface VocabularyItem {
  id: string;
  title: string;
  content: string;
  recitation_type: string;
  difficulty_level: number;
  is_memorized: boolean;
  practice_count: number;
  created_at: string;
  updated_at: string;
}

interface VocabularyStats {
  total_words: number;
  memorized_words: number;
  memorization_rate: number;
  difficulty_stats: Record<string, number>;
  total_practice_count: number;
  average_practice_count: number;
}

const Vocabulary: React.FC = () => {
  const [vocabulary, setVocabulary] = useState<VocabularyItem[]>([]);
  const [stats, setStats] = useState<VocabularyStats | null>(null);
  const [loading, setLoading] = useState(false);
  const [searchText, setSearchText] = useState('');
  const [difficultyFilter, setDifficultyFilter] = useState<number | undefined>();
  const [memorizedFilter, setMemorizedFilter] = useState<boolean | undefined>();
  const [activeTab, setActiveTab] = useState('list');
  const { isMobile } = useResponsive();

  // 模拟数据 - 实际项目中应该从API获取
  useEffect(() => {
    loadVocabulary();
    loadStats();
  }, []);

  const loadVocabulary = async () => {
    setLoading(true);
    try {
      // 这里应该调用实际的API
      // const response = await vocabularyApi.getGrade1English();
      // setVocabulary(response.data);
      
      // 模拟数据
      const mockData: VocabularyItem[] = [
        {
          id: '1',
          title: 'ready',
          content: '准备好(做某事)的',
          recitation_type: 'vocabulary',
          difficulty_level: 1,
          is_memorized: true,
          practice_count: 5,
          created_at: '2025-01-01T00:00:00Z',
          updated_at: '2025-01-01T00:00:00Z'
        },
        {
          id: '2',
          title: 'nervous',
          content: '紧张的，不安的',
          recitation_type: 'vocabulary',
          difficulty_level: 2,
          is_memorized: false,
          practice_count: 2,
          created_at: '2025-01-01T00:00:00Z',
          updated_at: '2025-01-01T00:00:00Z'
        }
      ];
      setVocabulary(mockData);
    } catch (error) {
      message.error('加载词汇表失败');
    } finally {
      setLoading(false);
    }
  };

  const loadStats = async () => {
    try {
      // 这里应该调用实际的API
      // const response = await vocabularyApi.getStats();
      // setStats(response.data);
      
      // 模拟数据
      const mockStats: VocabularyStats = {
        total_words: 321,
        memorized_words: 156,
        memorization_rate: 48.6,
        difficulty_stats: {
          level_1: 80,
          level_2: 120,
          level_3: 80,
          level_4: 30,
          level_5: 11
        },
        total_practice_count: 1250,
        average_practice_count: 3.9
      };
      setStats(mockStats);
    } catch (error) {
      message.error('加载统计信息失败');
    }
  };

  const handleImport = async () => {
    try {
      // 这里应该调用实际的API
      // await vocabularyApi.importGrade1English(studentId);
      message.success('成功导入初一英语单词表！');
      loadVocabulary();
      loadStats();
    } catch (error) {
      message.error('导入失败');
    }
  };

  const handleClear = async () => {
    try {
      // 这里应该调用实际的API
      // await vocabularyApi.clearGrade1English(studentId);
      message.success('成功清空单词表！');
      loadVocabulary();
      loadStats();
    } catch (error) {
      message.error('清空失败');
    }
  };

  const handleMemorize = async (id: string, memorized: boolean) => {
    try {
      // 这里应该调用实际的API
      // await vocabularyApi.updateMemorized(id, memorized);
      setVocabulary(prev => 
        prev.map(item => 
          item.id === id ? { ...item, is_memorized: memorized } : item
        )
      );
      message.success(memorized ? '标记为已背诵' : '标记为未背诵');
    } catch (error) {
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
