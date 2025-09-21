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
  message,
  Input,
  Select,
  Popconfirm
} from 'antd';
import {
  BookOutlined,
  TrophyOutlined,
  ClockCircleOutlined,
  CheckCircleOutlined,
  ImportOutlined,
  DeleteOutlined,
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

// 接口定义已移动到 vocabularyApi.ts

const Vocabulary: React.FC = () => {
  const [vocabulary, setVocabulary] = useState<VocabularyItem[]>([]);
  const [stats, setStats] = useState<VocabularyStats | null>(null);
  const [loading, setLoading] = useState(false);
  const [searchText, setSearchText] = useState('');
  const [difficultyFilter, setDifficultyFilter] = useState<number | undefined>();
  const [memorizedFilter, setMemorizedFilter] = useState<boolean | undefined>();
  const [selectedGrade, setSelectedGrade] = useState<string>('初一');
  const { isMobile, isTablet } = useResponsive();
  const { user } = useAuth();

  // 加载真实数据
  useEffect(() => {
    // 测试模式：直接加载数据，不需要用户认证
    loadVocabulary();
    loadStats();
  }, []);

  // 当筛选条件或年级改变时重新加载数据
  useEffect(() => {
    // 测试模式：直接重新加载数据
    loadVocabulary();
  }, [difficultyFilter, memorizedFilter, selectedGrade]);

  const loadVocabulary = async () => {
    setLoading(true);
    try {
      let response;
      
      // 根据选择的年级加载不同的数据
      if (selectedGrade === '初一') {
        response = await getGrade1EnglishVocabulary({
          difficulty_level: difficultyFilter,
          is_memorized: memorizedFilter
        });
      } else if (selectedGrade === '初二') {
        // 初二暂时没有数据，显示空列表
        response = [];
        message.info('初二英语词汇数据暂未维护，请选择其他年级');
      } else if (selectedGrade === '初三') {
        // 初三暂时没有数据，显示空列表
        response = [];
        message.info('初三英语词汇数据暂未维护，请选择其他年级');
      }
      
      setVocabulary(response || []);
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
    try {
      // 测试模式：使用固定的学生ID
      const response = await importGrade1EnglishVocabulary('test-user');
      message.success(`成功导入 ${response.imported_count} 个初一英语单词！`);
      loadVocabulary();
      loadStats();
    } catch (error) {
      console.error('导入失败:', error);
      message.error('导入失败');
    }
  };

  const handleClear = async () => {
    try {
      // 测试模式：使用固定的学生ID
      const response = await clearGrade1EnglishVocabulary('test-user');
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
      width: 120,
      render: (text: string) => (
        <Text strong style={{ fontSize: 16, color: '#1890ff' }}>
          {text}
        </Text>
      ),
    },
    {
      title: '释义',
      dataIndex: 'content',
      key: 'content',
      ellipsis: true,
      render: (content: string) => {
        const lines = content.split('\n');
        const definition = lines.find(line => line.includes('中文释义:')) || lines[2] || '';
        return (
          <Text ellipsis={{ tooltip: definition }}>
            {definition.replace('中文释义:', '').trim()}
          </Text>
        );
      },
    },
    {
      title: '难度',
      dataIndex: 'difficulty_level',
      key: 'difficulty_level',
      width: 80,
      align: 'center' as const,
      render: (level: number) => (
        <Tag color="gold">{level} 星</Tag>
      ),
    },
    {
      title: '状态',
      dataIndex: 'is_memorized',
      key: 'is_memorized',
      width: 100,
      align: 'center' as const,
      render: (memorized: boolean) => (
        <Tag color={memorized ? 'green' : 'blue'}>
          {memorized ? '已背诵' : '未背诵'}
        </Tag>
      ),
    },
    {
      title: '练习',
      dataIndex: 'practice_count',
      key: 'practice_count',
      width: 80,
      align: 'center' as const,
      render: (count: number) => (
        <Text type="secondary">{count} 次</Text>
      ),
    },
    {
      title: '操作',
      key: 'actions',
      width: 120,
      align: 'center' as const,
      render: (record: VocabularyItem) => (
        <Button
          type={record.is_memorized ? 'default' : 'primary'}
          size="small"
          onClick={() => handleMemorize(record.id, !record.is_memorized)}
        >
          {record.is_memorized ? '取消背诵' : '标记背诵'}
        </Button>
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
             <div style={{ marginBottom: 24, display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'wrap', gap: 16 }}>
               <Title level={2} style={{ marginBottom: 0 }}>
                 <BookOutlined style={{ marginRight: 8 }} />
                 词汇管理
               </Title>
               <Space size="middle">
                 <Button
                   type={selectedGrade === '初一' ? 'primary' : 'default'}
                   size="large"
                   onClick={() => setSelectedGrade('初一')}
                   style={{ minWidth: 80 }}
                 >
                   初一
                 </Button>
                 <Button
                   type={selectedGrade === '初二' ? 'primary' : 'default'}
                   size="large"
                   onClick={() => setSelectedGrade('初二')}
                   style={{ minWidth: 80 }}
                 >
                   初二
                 </Button>
                 <Button
                   type={selectedGrade === '初三' ? 'primary' : 'default'}
                   size="large"
                   onClick={() => setSelectedGrade('初三')}
                   style={{ minWidth: 80 }}
                 >
                   初三
                 </Button>
               </Space>
             </div>

      {/* 统计卡片 - 只在有数据时显示 */}
      {stats && vocabulary.length > 0 && (
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

             {/* 词汇列表 */}
             <Card>
               <div style={{ marginBottom: 16, padding: '12px 0', borderBottom: '1px solid #f0f0f0' }}>
                 <Space>
                   <Text strong style={{ fontSize: 16 }}>
                     {selectedGrade}英语词汇
                   </Text>
                   <Text type="secondary">
                     共 {filteredVocabulary.length} 个单词
                   </Text>
                 </Space>
               </div>
               
               {filteredVocabulary.length === 0 && !loading ? (
                 <div style={{ 
                   textAlign: 'center', 
                   padding: '60px 20px',
                   color: '#999'
                 }}>
                   <BookOutlined style={{ fontSize: 48, marginBottom: 16, color: '#d9d9d9' }} />
                   <div style={{ fontSize: 16, marginBottom: 8 }}>
                     {selectedGrade === '初一' ? '暂无词汇数据' : `${selectedGrade}英语词汇数据暂未维护`}
                   </div>
                   <div style={{ fontSize: 14, color: '#bfbfbf' }}>
                     {selectedGrade === '初一' ? '请尝试导入词汇数据' : '请选择其他年级或联系管理员添加数据'}
                   </div>
                 </div>
               ) : (
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
               )}
             </Card>

    </div>
  );
};

export default Vocabulary;
