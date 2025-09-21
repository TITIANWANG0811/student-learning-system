import React, { useState, useEffect } from 'react';
import {
  Card,
  Button,
  Table,
  Tag,
  Typography,
  Row,
  Col,
  Statistic,
  message,
  Input,
  Select,
  Modal
} from 'antd';
import {
  BookOutlined,
  TrophyOutlined,
  ClockCircleOutlined,
  CheckCircleOutlined,
  BarChartOutlined,
  StarOutlined
} from '@ant-design/icons';
import { useResponsive } from '../hooks/useResponsive';
import { 
  getGrade1EnglishVocabulary, 
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
  const [memorizedFilter, setMemorizedFilter] = useState<boolean | undefined>();
  const [vocabularyTypeFilter, setVocabularyTypeFilter] = useState<string | undefined>();
  const [unitFilter, setUnitFilter] = useState<string | undefined>();
  const [selectedGrade, setSelectedGrade] = useState<string>('初一');
  const [selectedWord, setSelectedWord] = useState<VocabularyItem | null>(null);
  const [wordDetailVisible, setWordDetailVisible] = useState(false);
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
  }, [memorizedFilter, vocabularyTypeFilter, unitFilter, selectedGrade]);

  const loadVocabulary = async () => {
    setLoading(true);
    try {
      let response;
      
      // 根据选择的年级加载不同的数据
      if (selectedGrade === '初一') {
        response = await getGrade1EnglishVocabulary({
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

  const handleWordClick = (word: VocabularyItem) => {
    setSelectedWord(word);
    setWordDetailVisible(true);
  };

  const closeWordDetail = () => {
    setWordDetailVisible(false);
    setSelectedWord(null);
  };

  const filteredVocabulary = vocabulary.filter(item => {
    const matchesSearch = item.title.toLowerCase().includes(searchText.toLowerCase()) ||
                          item.content.toLowerCase().includes(searchText.toLowerCase());
    const matchesMemorized = memorizedFilter === undefined || item.is_memorized === memorizedFilter;
    
    // 支持地名、人名和其他筛选
    let matchesVocabularyType = true;
    if (vocabularyTypeFilter) {
      if (vocabularyTypeFilter === 'proper_place') {
        matchesVocabularyType = item.vocabulary_type === 'proper_place';
      } else if (vocabularyTypeFilter === 'proper_name') {
        matchesVocabularyType = item.vocabulary_type === 'proper_name';
      } else if (vocabularyTypeFilter === 'proper_other') {
        // 其他：只包含proper_other类型
        matchesVocabularyType = item.vocabulary_type === 'proper_other';
      } else {
        matchesVocabularyType = item.vocabulary_type === vocabularyTypeFilter;
      }
    }
    
    const matchesUnit = !unitFilter || item.unit_name === unitFilter;
    
    return matchesSearch && matchesMemorized && matchesVocabularyType && matchesUnit;
  });

  const columns = [
    {
      title: '单词',
      dataIndex: 'title',
      key: 'title',
      width: 150,
      render: (text: string, record: VocabularyItem) => (
        <Button
          type="link"
          style={{ 
            padding: 0, 
            height: 'auto', 
            fontSize: 16,
            fontWeight: 'bold',
            color: '#1890ff',
            whiteSpace: 'normal', // 允许换行
            wordBreak: 'break-word', // 单词内换行
            textAlign: 'left', // 左对齐
            lineHeight: '1.4' // 行高
          }}
          onClick={() => handleWordClick(record)}
        >
          {text}
        </Button>
      ),
    },
    {
      title: '类型',
      dataIndex: 'vocabulary_type',
      key: 'vocabulary_type',
      width: 100,
      align: 'center' as const,
             render: (type: string) => {
               const typeConfig = {
                 'word': { color: 'blue', text: '单词' },
                 'phrase': { color: 'green', text: '短语' },
                 'idiom': { color: 'orange', text: '习语' },
                 'proper_name': { color: 'purple', text: '人名' },
                 'proper_place': { color: 'cyan', text: '地名' },
                 'proper_other': { color: 'magenta', text: '其他' }
               };
               const config = typeConfig[type as keyof typeof typeConfig] || { color: 'default', text: '未知' };
               return <Tag color={config.color}>{config.text}</Tag>;
             },
    },
    {
      title: '音标',
      dataIndex: 'content',
      key: 'phonetic',
      width: 150,
      align: 'center' as const,
      render: (content: string) => {
        const lines = content.split('\n');
        const phoneticLine = lines.find(line => line.includes('**音标**:'));
        if (phoneticLine) {
          // 更精确的解析，处理各种Markdown格式
          let phonetic = phoneticLine
            .replace(/^>\s*-\s*\*\*音标\*\*:\s*/, '') // 处理 > - **音标**: 格式
            .replace(/\*\*音标\*\*:\s*/, '') // 处理 **音标**: 格式
            .replace(/>/g, '') // 移除所有 >
            .replace(/\*/g, '') // 移除所有 *
            .trim();
          
          return (
            <Text 
              code 
              style={{ 
                fontSize: 12, 
                color: '#1890ff',
                fontFamily: 'Monaco, Consolas, "Courier New", monospace',
                background: '#f0f8ff',
                padding: '2px 6px',
                borderRadius: '4px',
                border: '1px solid #d6e4ff'
              }}
            >
              {phonetic}
            </Text>
          );
        }
        return <Text type="secondary">-</Text>;
      },
    },
    {
      title: '词性',
      dataIndex: 'content',
      key: 'pos',
      width: 100,
      align: 'center' as const,
      render: (content: string) => {
        const lines = content.split('\n');
        const posLine = lines.find(line => line.includes('**词性**:'));
        if (posLine) {
          // 更精确的解析，处理各种Markdown格式
          let pos = posLine
            .replace(/^>\s*-\s*\*\*词性\*\*:\s*/, '') // 处理 > - **词性**: 格式
            .replace(/\*\*词性\*\*:\s*/, '') // 处理 **词性**: 格式
            .replace(/>/g, '') // 移除所有 >
            .replace(/\*/g, '') // 移除所有 *
            .trim();
          
          // 根据词性类型选择不同颜色
          const getPosColor = (posText: string) => {
            if (posText.includes('n.') || posText.includes('名词')) return 'blue';
            if (posText.includes('v.') || posText.includes('动词')) return 'green';
            if (posText.includes('adj.') || posText.includes('形容词')) return 'orange';
            if (posText.includes('adv.') || posText.includes('副词')) return 'purple';
            if (posText.includes('prep.') || posText.includes('介词')) return 'cyan';
            if (posText.includes('pron.') || posText.includes('代词')) return 'magenta';
            return 'blue';
          };
          
          return (
            <Tag 
              color={getPosColor(pos)} 
              style={{ 
                fontSize: 11,
                fontWeight: 'bold',
                borderRadius: '12px',
                padding: '2px 8px'
              }}
            >
              {pos}
            </Tag>
          );
        }
        return <Text type="secondary">-</Text>;
      },
    },
    {
      title: '释义',
      dataIndex: 'content',
      key: 'content',
      ellipsis: true,
      render: (content: string) => {
        const lines = content.split('\n');
        const definition = lines.find(line => line.includes('**中文释义**:'));
        if (definition) {
          // 更精确的解析，处理各种Markdown格式
          let meaning = definition
            .replace(/^>\s*-\s*\*\*中文释义\*\*:\s*/, '') // 处理 > - **中文释义**: 格式
            .replace(/\*\*中文释义\*\*:\s*/, '') // 处理 **中文释义**: 格式
            .replace(/>/g, '') // 移除所有 >
            .replace(/\*/g, '') // 移除所有 *
            .trim();
          
          return (
            <Text 
              ellipsis={{ tooltip: meaning }}
              style={{
                fontSize: 13,
                lineHeight: '1.4',
                color: '#262626'
              }}
            >
              {meaning}
            </Text>
          );
        }
        return <Text type="secondary">-</Text>;
      },
    },
  ];


  return (
    <div style={{ padding: isMobile ? '12px' : '24px' }}>
             <div style={{ marginBottom: 24, display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'wrap', gap: 16 }}>
               <Title level={2} style={{ marginBottom: 0 }}>
                 <BookOutlined style={{ marginRight: 8 }} />
                 词汇管理
               </Title>
               <div style={{ display: 'flex', gap: '12px', justifyContent: 'flex-end' }}>
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
               </div>
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
                 <Col xs={24} sm={12} md={6}>
                   <Search
                     placeholder="搜索单词或释义"
                     value={searchText}
                     onChange={(e) => setSearchText(e.target.value)}
                     style={{ width: '100%' }}
                   />
                 </Col>
                 <Col xs={24} sm={12} md={6}>
                   <Select
                     placeholder="单元筛选"
                     value={unitFilter}
                     onChange={setUnitFilter}
                     style={{ width: '100%' }}
                     allowClear
                   >
                     <Option value="Starter">Starter</Option>
                     <Option value="Unit 1">Unit 1</Option>
                     <Option value="Unit 2">Unit 2</Option>
                     <Option value="Unit 3">Unit 3</Option>
                     <Option value="Unit 4">Unit 4</Option>
                     <Option value="Unit 5">Unit 5</Option>
                     <Option value="Unit 6">Unit 6</Option>
                     <Option value="Proper">专有名词</Option>
                   </Select>
                 </Col>
                 <Col xs={24} sm={12} md={6}>
                   <Select
                     placeholder="背诵状态"
                     value={memorizedFilter}
                     onChange={setMemorizedFilter}
                     style={{ width: '100%' }}
                     allowClear
                   >
                     <Option value={true}>已背诵</Option>
                     <Option value={false}>未背诵</Option>
                   </Select>
                 </Col>
                 <Col xs={24} sm={12} md={6}>
                   <Select
                     placeholder="词汇类型"
                     value={vocabularyTypeFilter}
                     onChange={setVocabularyTypeFilter}
                     style={{ width: '100%' }}
                     allowClear
                   >
                     <Option value="word">单词</Option>
                     <Option value="phrase">短语</Option>
                     <Option value="idiom">习语</Option>
                     <Option value="proper_name">人名</Option>
                     <Option value="proper_place">地名</Option>
                     <Option value="proper_other">其他</Option>
                   </Select>
                 </Col>
               </Row>
             </Card>

             {/* 词汇列表 */}
             <Card>
               <div style={{ marginBottom: 16, padding: '12px 0', borderBottom: '1px solid #f0f0f0' }}>
                 <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                   <Text strong style={{ fontSize: 16 }}>
                     {selectedGrade}英语词汇
                   </Text>
                   <Text type="secondary">
                     共 {filteredVocabulary.length} 个单词
                   </Text>
                 </div>
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
                     {selectedGrade === '初一' ? '暂无词汇数据' : '请选择其他年级或联系管理员添加数据'}
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

      {/* 单词详情模态框 */}
      <Modal
        title={
          <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
            <BookOutlined style={{ color: '#1890ff', fontSize: 20 }} />
            <span>{selectedWord ? `${selectedWord.title} - 单词详情` : '单词详情'}</span>
          </div>
        }
        open={wordDetailVisible}
        onCancel={closeWordDetail}
        footer={[
          <Button key="close" onClick={closeWordDetail}>
            关闭
          </Button>,
          selectedWord && (
            <Button
              key="memorize"
              type={selectedWord.is_memorized ? 'default' : 'primary'}
              icon={selectedWord.is_memorized ? <ClockCircleOutlined /> : <CheckCircleOutlined />}
              onClick={() => {
                handleMemorize(selectedWord.id, !selectedWord.is_memorized);
                closeWordDetail();
              }}
            >
              {selectedWord.is_memorized ? '取消背诵' : '标记背诵'}
            </Button>
          )
        ]}
        width={isMobile ? '95%' : isTablet ? '85%' : 700}
        style={{ top: 20 }}
        styles={{ body: { padding: 0 } }}
      >
        {selectedWord && (
          <div style={{ maxHeight: '75vh', overflowY: 'auto' }}>
            {/* 单词头部信息 */}
            <div style={{ 
              background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)', 
              color: 'white', 
              padding: '24px', 
              marginBottom: 0,
              borderRadius: '6px 6px 0 0'
            }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 16 }}>
                <div>
                  <h1 style={{ 
                    fontSize: 32, 
                    fontWeight: 'bold', 
                    margin: 0, 
                    color: 'white',
                    textShadow: '0 2px 4px rgba(0,0,0,0.3)'
                  }}>
                    {selectedWord.title}
                  </h1>
                  <div style={{ display: 'flex', gap: 8, marginTop: 8, flexWrap: 'wrap' }}>
                    <Tag color="white" style={{ color: '#667eea', fontWeight: 'bold' }}>
                      {selectedWord.vocabulary_type === 'word' ? '单词' : 
                       selectedWord.vocabulary_type === 'proper_name' ? '人名' :
                       selectedWord.vocabulary_type === 'proper_place' ? '地名' : '其他'}
                    </Tag>
                    <Tag color={selectedWord.is_memorized ? 'green' : 'orange'} style={{ fontWeight: 'bold' }}>
                      {selectedWord.is_memorized ? '已背诵' : '未背诵'}
                    </Tag>
                    {selectedWord.unit_name && (
                      <Tag color="blue" style={{ fontWeight: 'bold' }}>
                        {selectedWord.unit_name}
                      </Tag>
                    )}
                  </div>
                </div>
                <div style={{ textAlign: 'right', color: 'rgba(255,255,255,0.8)' }}>
                  <div style={{ fontSize: 14, marginBottom: 4 }}>
                    练习次数: <strong>{selectedWord.practice_count}</strong>
                  </div>
                  <div style={{ fontSize: 12 }}>
                    {new Date(selectedWord.created_at).toLocaleDateString()}
                  </div>
                </div>
              </div>
            </div>

            {/* 单词详细内容 */}
            <div style={{ padding: '24px' }}>
              {(() => {
                const lines = selectedWord.content.split('\n');
                const sections: React.ReactNode[] = [];
                let currentSection = null;
                
                lines.forEach((line, index) => {
                  const trimmedLine = line.trim();
                  if (!trimmedLine) return;
                  
                  // 音标
                  if (trimmedLine.includes('**音标**:') || (trimmedLine.includes('/') && !trimmedLine.includes('http') && !trimmedLine.includes('#'))) {
                    const phonetic = trimmedLine
                      .replace(/^>\s*-\s*\*\*音标\*\*:\s*/, '')
                      .replace(/\*\*音标\*\*:\s*/, '')
                      .replace(/>/g, '')
                      .replace(/\*/g, '')
                      .replace(/^[-•]\s*/, '') // 移除列表符号
                      .replace(/#[a-zA-Z0-9\-/]+/g, '') // 移除标签如 #mcl/list-card
                      .replace(/^#+\s*/, '') // 移除Markdown标题符号
                      .trim();
                    
                    // 只有当音标不为空且包含音标符号时才显示
                    if (phonetic && (phonetic.includes('/') || phonetic.includes('[') || phonetic.includes(']'))) {
                      sections.push(
                        <div key={`phonetic-${index}`} style={{ 
                          marginBottom: 16, 
                          padding: '0', 
                          background: '#ffffff', 
                          borderRadius: '8px',
                          border: '2px solid #e8f5e8',
                          boxShadow: '0 2px 4px rgba(0,0,0,0.1)',
                          overflow: 'hidden'
                        }}>
                          <div style={{ 
                            padding: '12px 16px',
                            background: 'linear-gradient(135deg, #4caf50 0%, #2e7d32 100%)',
                            color: 'white',
                            fontSize: '14px',
                            fontWeight: '600'
                          }}>
                            🔊 音标
                          </div>
                          <div style={{ 
                            padding: '16px',
                            fontSize: '20px',
                            fontWeight: 'bold',
                            color: '#2e7d32',
                            fontFamily: 'monospace'
                          }}>
                            {phonetic}
                          </div>
                        </div>
                      );
                    }
                  }
                  
                  // 词性
                  else if (trimmedLine.includes('**词性**:')) {
                    const pos = trimmedLine
                      .replace(/^>\s*-\s*\*\*词性\*\*:\s*/, '')
                      .replace(/\*\*词性\*\*:\s*/, '')
                      .replace(/>/g, '')
                      .replace(/\*/g, '')
                      .replace(/^[-•]\s*/, '') // 移除列表符号
                      .replace(/#[a-zA-Z0-9\-/]+/g, '') // 移除标签如 #mcl/list-card
                      .trim();
                    
                    const getPosColor = (posText: string) => {
                      if (posText.includes('n.') || posText.includes('名词')) return '#1890ff';
                      if (posText.includes('v.') || posText.includes('动词')) return '#52c41a';
                      if (posText.includes('adj.') || posText.includes('形容词')) return '#fa8c16';
                      if (posText.includes('adv.') || posText.includes('副词')) return '#722ed1';
                      return '#1890ff';
                    };
                    
                    sections.push(
                      <div key={`pos-${index}`} style={{ 
                        marginBottom: 16, 
                        padding: '0', 
                        background: '#ffffff', 
                        borderRadius: '8px',
                        border: '2px solid #fff3e0',
                        boxShadow: '0 2px 4px rgba(0,0,0,0.1)',
                        overflow: 'hidden'
                      }}>
                        <div style={{ 
                          padding: '12px 16px',
                          background: 'linear-gradient(135deg, #ff9800 0%, #f57c00 100%)',
                          color: 'white',
                          fontSize: '14px',
                          fontWeight: '600'
                        }}>
                          🏷️ 词性
                        </div>
                        <div style={{ 
                          padding: '16px',
                          display: 'flex',
                          alignItems: 'center'
                        }}>
                          <Tag color={getPosColor(pos)} style={{ 
                            fontSize: 16, 
                            fontWeight: 'bold', 
                            padding: '8px 16px',
                            borderRadius: 20
                          }}>
                            {pos}
                          </Tag>
                        </div>
                      </div>
                    );
                  }
                  
                  // 中文释义
                  else if (trimmedLine.includes('**中文释义**:')) {
                    const meaning = trimmedLine
                      .replace(/^>\s*-\s*\*\*中文释义\*\*:\s*/, '')
                      .replace(/\*\*中文释义\*\*:\s*/, '')
                      .replace(/>/g, '')
                      .replace(/\*/g, '')
                      .replace(/^[-•]\s*/, '') // 移除列表符号
                      .replace(/#[a-zA-Z0-9\-/]+/g, '') // 移除标签如 #mcl/list-card
                      .trim();
                    
                    sections.push(
                      <div key={`meaning-${index}`} style={{ 
                        marginBottom: 16, 
                        padding: '0', 
                        background: '#ffffff', 
                        borderRadius: '8px',
                        border: '2px solid #ffebee',
                        boxShadow: '0 2px 4px rgba(0,0,0,0.1)',
                        overflow: 'hidden'
                      }}>
                        <div style={{ 
                          padding: '12px 16px',
                          background: 'linear-gradient(135deg, #f44336 0%, #d32f2f 100%)',
                          color: 'white',
                          fontSize: '14px',
                          fontWeight: '600'
                        }}>
                          📖 中文释义
                        </div>
                        <div style={{ 
                          padding: '16px',
                          fontSize: '18px',
                          fontWeight: 'bold',
                          color: '#d32f2f',
                          lineHeight: 1.6
                        }}>
                          {meaning}
                        </div>
                      </div>
                    );
                  }
                  
                  // 例句
                  else if (trimmedLine.includes('**例句**:') || /^\d+\./.test(trimmedLine) || /^[A-Z][a-z].*\./.test(trimmedLine) || /^>\s*\d+\./.test(trimmedLine)) {
                    const example = trimmedLine
                      .replace(/^>\s*-\s*\*\*例句\*\*:\s*/, '')
                      .replace(/\*\*例句\*\*:\s*/, '')
                      .replace(/>/g, '')
                      .replace(/\*/g, '')
                      .replace(/^[-•]\s*/, '') // 移除列表符号
                      .replace(/^\d+\.\s*/, '') // 移除数字编号
                      .replace(/#[a-zA-Z0-9\-/]+/g, '') // 移除标签如 #mcl/list-card
                      .trim();
                    
                    sections.push(
                      <div key={`example-${index}`} style={{ 
                        marginBottom: 16, 
                        padding: '0', 
                        background: '#ffffff', 
                        borderRadius: '8px',
                        border: '2px solid #e8f5e8',
                        boxShadow: '0 2px 4px rgba(0,0,0,0.1)',
                        overflow: 'hidden'
                      }}>
                        <div style={{ 
                          padding: '12px 16px',
                          background: 'linear-gradient(135deg, #4caf50 0%, #2e7d32 100%)',
                          color: 'white',
                          fontSize: '14px',
                          fontWeight: '600'
                        }}>
                          📝 例句
                        </div>
                        <div style={{ 
                          padding: '16px',
                          fontSize: '14px',
                          lineHeight: '1.6',
                          color: '#2e7d32',
                          fontStyle: 'italic'
                        }}>
                          {example}
                        </div>
                      </div>
                    );
                  }
                  
                  // 联想记忆
                  else if (trimmedLine.includes('**联想记忆**:') || trimmedLine.includes('**记忆**:') || trimmedLine.includes('联想记忆') || trimmedLine.includes('记忆') || trimmedLine.includes('[!tip] 联想记忆')) {
                    const memory = trimmedLine
                      .replace(/^>\s*-\s*\*\*联想记忆\*\*:\s*/, '')
                      .replace(/\*\*联想记忆\*\*:\s*/, '')
                      .replace(/\*\*记忆\*\*:\s*/, '')
                      .replace(/联想记忆:\s*/, '')
                      .replace(/记忆:\s*/, '')
                      .replace(/^>\s*\[!tip\]\s*联想记忆\s*/, '')
                      .replace(/\[!tip\]\s*联想记忆\s*/, '')
                      .replace(/>/g, '')
                      .replace(/\*/g, '')
                      .replace(/^[-•]\s*/, '') // 移除列表符号
                      .replace(/#[a-zA-Z0-9\-/]+/g, '') // 移除标签如 #mcl/list-card
                      .trim();
                    
                    // 解析联想记忆内容，按方法分类显示
                    const memoryLines = memory.split('\n').filter(line => line.trim());
                    const splitMethod = memoryLines.find(line => line.includes('拆分记忆法'));
                    const scenarioMethod = memoryLines.find(line => line.includes('场景记忆法'));
                    const homophonicMethod = memoryLines.find(line => line.includes('谐音记忆法'));
                    
                    const splitContent = memoryLines.filter((line, i) => {
                      const prevLine = memoryLines[i - 1];
                      return prevLine && prevLine.includes('拆分记忆法') && !line.includes('场景记忆法') && !line.includes('谐音记忆法');
                    });
                    const scenarioContent = memoryLines.filter((line, i) => {
                      const prevLine = memoryLines[i - 1];
                      return prevLine && prevLine.includes('场景记忆法') && !line.includes('谐音记忆法');
                    });
                    const homophonicContent = memoryLines.filter((line, i) => {
                      const prevLine = memoryLines[i - 1];
                      return prevLine && prevLine.includes('谐音记忆法');
                    });

                    sections.push(
                      <div key={`memory-${index}`} style={{ 
                        marginBottom: 24, 
                        padding: '0', 
                        background: '#ffffff', 
                        borderRadius: 12,
                        border: '2px solid #e3f2fd',
                        boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
                        overflow: 'hidden'
                      }}>
                        <div style={{ 
                          display: 'flex', 
                          alignItems: 'center', 
                          padding: '20px 24px',
                          background: 'linear-gradient(135deg, #9c27b0 0%, #7b1fa2 100%)',
                          color: 'white'
                        }}>
                          <div style={{
                            background: 'rgba(255,255,255,0.2)',
                            color: 'white',
                            borderRadius: '50%',
                            width: '36px',
                            height: '36px',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            marginRight: 12,
                            fontSize: '18px',
                            fontWeight: 'bold'
                          }}>
                            🧠
                          </div>
                          <Text style={{ fontSize: 20, fontWeight: 'bold', color: 'white' }}>
                            联想记忆技巧
                          </Text>
                        </div>
                        <div style={{ padding: '24px' }}>
                        
                        <div style={{ display: 'grid', gap: '20px' }}>
                          {splitMethod && splitContent.length > 0 && (
                            <div style={{ 
                              padding: '16px', 
                              background: '#f8f9fa', 
                              borderRadius: '8px',
                              border: '1px solid #e9ecef'
                            }}>
                              <div style={{ 
                                display: 'flex', 
                                alignItems: 'center', 
                                marginBottom: 12 
                              }}>
                                <span style={{
                                  background: '#4caf50',
                                  color: 'white',
                                  padding: '4px 8px',
                                  borderRadius: '4px',
                                  fontSize: '12px',
                                  fontWeight: 'bold',
                                  marginRight: '8px'
                                }}>
                                  方法1
                                </span>
                                <Text style={{ fontSize: 15, fontWeight: '600', color: '#2e7d32' }}>
                                  拆分记忆法
                                </Text>
                              </div>
                              <div style={{ paddingLeft: 8 }}>
                                {splitContent.map((item, idx) => (
                                  <div key={idx} style={{ 
                                    marginBottom: 8, 
                                    padding: '8px 12px',
                                    background: '#ffffff',
                                    borderRadius: '6px',
                                    fontSize: 14, 
                                    lineHeight: 1.6, 
                                    color: '#495057',
                                    border: '1px solid #e0e0e0'
                                  }}>
                                    <span style={{ color: '#4caf50', fontWeight: 'bold' }}>•</span> {item.replace(/^[-•]\s*/, '').trim()}
                                  </div>
                                ))}
                              </div>
                            </div>
                          )}
                          
                          {scenarioMethod && scenarioContent.length > 0 && (
                            <div style={{ 
                              padding: '16px', 
                              background: '#fff3e0', 
                              borderRadius: '8px',
                              border: '1px solid #ffcc02'
                            }}>
                              <div style={{ 
                                display: 'flex', 
                                alignItems: 'center', 
                                marginBottom: 12 
                              }}>
                                <span style={{
                                  background: '#ff9800',
                                  color: 'white',
                                  padding: '4px 8px',
                                  borderRadius: '4px',
                                  fontSize: '12px',
                                  fontWeight: 'bold',
                                  marginRight: '8px'
                                }}>
                                  方法2
                                </span>
                                <Text style={{ fontSize: 15, fontWeight: '600', color: '#f57c00' }}>
                                  场景记忆法
                                </Text>
                              </div>
                              <div style={{ paddingLeft: 8 }}>
                                {scenarioContent.map((item, idx) => (
                                  <div key={idx} style={{ 
                                    marginBottom: 8, 
                                    padding: '8px 12px',
                                    background: '#ffffff',
                                    borderRadius: '6px',
                                    fontSize: 14, 
                                    lineHeight: 1.6, 
                                    color: '#495057',
                                    border: '1px solid #ffcc02'
                                  }}>
                                    <span style={{ color: '#ff9800', fontWeight: 'bold' }}>•</span> {item.replace(/^[-•]\s*/, '').trim()}
                                  </div>
                                ))}
                              </div>
                            </div>
                          )}
                          
                          {homophonicMethod && homophonicContent.length > 0 && (
                            <div style={{ 
                              padding: '16px', 
                              background: '#f3e5f5', 
                              borderRadius: '8px',
                              border: '1px solid #ba68c8'
                            }}>
                              <div style={{ 
                                display: 'flex', 
                                alignItems: 'center', 
                                marginBottom: 12 
                              }}>
                                <span style={{
                                  background: '#9c27b0',
                                  color: 'white',
                                  padding: '4px 8px',
                                  borderRadius: '4px',
                                  fontSize: '12px',
                                  fontWeight: 'bold',
                                  marginRight: '8px'
                                }}>
                                  方法3
                                </span>
                                <Text style={{ fontSize: 15, fontWeight: '600', color: '#7b1fa2' }}>
                                  谐音记忆法
                                </Text>
                              </div>
                              <div style={{ paddingLeft: 8 }}>
                                {homophonicContent.map((item, idx) => (
                                  <div key={idx} style={{ 
                                    marginBottom: 8, 
                                    padding: '8px 12px',
                                    background: '#ffffff',
                                    borderRadius: '6px',
                                    fontSize: 14, 
                                    lineHeight: 1.6, 
                                    color: '#495057',
                                    border: '1px solid #ba68c8'
                                  }}>
                                    <span style={{ color: '#9c27b0', fontWeight: 'bold' }}>•</span> {item.replace(/^[-•]\s*/, '').trim()}
                                  </div>
                                ))}
                              </div>
                            </div>
                          )}
                        </div>
                        </div>
                      </div>
                    );
                  }
                  
                  // 相关词汇
                  else if (trimmedLine.includes('**相关词汇**:') || trimmedLine.includes('**近义词**:') || trimmedLine.includes('**反义词**:')) {
                    const related = trimmedLine
                      .replace(/^>\s*-\s*\*\*相关词汇\*\*:\s*/, '')
                      .replace(/\*\*相关词汇\*\*:\s*/, '')
                      .replace(/\*\*近义词\*\*:\s*/, '')
                      .replace(/\*\*反义词\*\*:\s*/, '')
                      .replace(/>/g, '')
                      .replace(/\*/g, '')
                      .replace(/^[-•]\s*/, '') // 移除列表符号
                      .replace(/#[a-zA-Z0-9\-/]+/g, '') // 移除标签如 #mcl/list-card
                      .trim();
                    
                    // 解析相关词汇内容，按类型分类显示
                    const relatedLines = related.split('\n').filter(line => line.trim());
                    const synonyms = relatedLines.find(line => line.includes('近义词:'));
                    const antonyms = relatedLines.find(line => line.includes('反义词:'));
                    const derivatives = relatedLines.find(line => line.includes('派生词:'));
                    const phrases = relatedLines.find(line => line.includes('相关短语'));
                    
                    const synonymWords = synonyms ? synonyms.replace('近义词:', '').split(',').map(w => w.trim()).filter(w => w) : [];
                    const antonymWords = antonyms ? antonyms.replace('反义词:', '').split(',').map(w => w.trim()).filter(w => w) : [];
                    const derivativeWords = derivatives ? derivatives.replace('派生词:', '').split(',').map(w => w.trim()).filter(w => w) : [];
                    const phraseContent = relatedLines.filter((line, i) => {
                      const prevLine = relatedLines[i - 1];
                      return prevLine && prevLine.includes('相关短语');
                    });

                    sections.push(
                      <div key={`related-${index}`} style={{ 
                        marginBottom: 24, 
                        padding: '0', 
                        background: '#ffffff', 
                        borderRadius: 12,
                        border: '2px solid #fff3e0',
                        boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
                        overflow: 'hidden'
                      }}>
                        <div style={{ 
                          display: 'flex', 
                          alignItems: 'center', 
                          padding: '20px 24px',
                          background: 'linear-gradient(135deg, #2196f3 0%, #1976d2 100%)',
                          color: 'white'
                        }}>
                          <div style={{
                            background: 'rgba(255,255,255,0.2)',
                            color: 'white',
                            borderRadius: '50%',
                            width: '36px',
                            height: '36px',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            marginRight: 12,
                            fontSize: '18px',
                            fontWeight: 'bold'
                          }}>
                            🔗
                          </div>
                          <Text style={{ fontSize: 20, fontWeight: 'bold', color: 'white' }}>
                            词汇网络
                          </Text>
                        </div>
                        <div style={{ padding: '24px' }}>
                        
                        <div style={{ display: 'grid', gap: '16px' }}>
                          {synonymWords.length > 0 && (
                            <div style={{ 
                              padding: '16px', 
                              background: '#e8f5e8', 
                              borderRadius: '8px',
                              border: '1px solid #4caf50'
                            }}>
                              <div style={{ 
                                display: 'flex', 
                                alignItems: 'center', 
                                marginBottom: 12 
                              }}>
                                <span style={{
                                  background: '#4caf50',
                                  color: 'white',
                                  padding: '4px 8px',
                                  borderRadius: '4px',
                                  fontSize: '12px',
                                  fontWeight: 'bold',
                                  marginRight: '8px'
                                }}>
                                  同义
                                </span>
                                <Text style={{ fontSize: 15, fontWeight: '600', color: '#2e7d32' }}>
                                  近义词 ({synonymWords.length}个)
                                </Text>
                              </div>
                              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                {synonymWords.map((word, idx) => (
                                  <span key={idx} style={{ 
                                    background: '#ffffff', 
                                    color: '#2e7d32', 
                                    padding: '6px 12px', 
                                    borderRadius: '20px', 
                                    fontSize: '13px',
                                    fontWeight: '500',
                                    border: '1px solid #4caf50',
                                    boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
                                  }}>
                                    {word}
                                  </span>
                                ))}
                              </div>
                            </div>
                          )}
                          
                          {antonymWords.length > 0 && (
                            <div style={{ 
                              padding: '16px', 
                              background: '#ffebee', 
                              borderRadius: '8px',
                              border: '1px solid #f44336'
                            }}>
                              <div style={{ 
                                display: 'flex', 
                                alignItems: 'center', 
                                marginBottom: 12 
                              }}>
                                <span style={{
                                  background: '#f44336',
                                  color: 'white',
                                  padding: '4px 8px',
                                  borderRadius: '4px',
                                  fontSize: '12px',
                                  fontWeight: 'bold',
                                  marginRight: '8px'
                                }}>
                                  反义
                                </span>
                                <Text style={{ fontSize: 15, fontWeight: '600', color: '#c62828' }}>
                                  反义词 ({antonymWords.length}个)
                                </Text>
                              </div>
                              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                {antonymWords.map((word, idx) => (
                                  <span key={idx} style={{ 
                                    background: '#ffffff', 
                                    color: '#c62828', 
                                    padding: '6px 12px', 
                                    borderRadius: '20px', 
                                    fontSize: '13px',
                                    fontWeight: '500',
                                    border: '1px solid #f44336',
                                    boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
                                  }}>
                                    {word}
                                  </span>
                                ))}
                              </div>
                            </div>
                          )}
                          
                          {derivativeWords.length > 0 && (
                            <div style={{ 
                              padding: '16px', 
                              background: '#f3e5f5', 
                              borderRadius: '8px',
                              border: '1px solid #9c27b0'
                            }}>
                              <div style={{ 
                                display: 'flex', 
                                alignItems: 'center', 
                                marginBottom: 12 
                              }}>
                                <span style={{
                                  background: '#9c27b0',
                                  color: 'white',
                                  padding: '4px 8px',
                                  borderRadius: '4px',
                                  fontSize: '12px',
                                  fontWeight: 'bold',
                                  marginRight: '8px'
                                }}>
                                  派生
                                </span>
                                <Text style={{ fontSize: 15, fontWeight: '600', color: '#7b1fa2' }}>
                                  派生词 ({derivativeWords.length}个)
                                </Text>
                              </div>
                              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                {derivativeWords.map((word, idx) => (
                                  <span key={idx} style={{ 
                                    background: '#ffffff', 
                                    color: '#7b1fa2', 
                                    padding: '6px 12px', 
                                    borderRadius: '20px', 
                                    fontSize: '13px',
                                    fontWeight: '500',
                                    border: '1px solid #9c27b0',
                                    boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
                                  }}>
                                    {word}
                                  </span>
                                ))}
                              </div>
                            </div>
                          )}
                          
                          {phraseContent.length > 0 && (
                            <div style={{ 
                              padding: '16px', 
                              background: '#e3f2fd', 
                              borderRadius: '8px',
                              border: '1px solid #2196f3'
                            }}>
                              <div style={{ 
                                display: 'flex', 
                                alignItems: 'center', 
                                marginBottom: 12 
                              }}>
                                <span style={{
                                  background: '#2196f3',
                                  color: 'white',
                                  padding: '4px 8px',
                                  borderRadius: '4px',
                                  fontSize: '12px',
                                  fontWeight: 'bold',
                                  marginRight: '8px'
                                }}>
                                  短语
                                </span>
                                <Text style={{ fontSize: 15, fontWeight: '600', color: '#1976d2' }}>
                                  相关短语 ({phraseContent.length}个)
                                </Text>
                              </div>
                              <div style={{ paddingLeft: 8 }}>
                                {phraseContent.map((item, idx) => (
                                  <div key={idx} style={{ 
                                    marginBottom: 8, 
                                    padding: '8px 12px',
                                    background: '#ffffff',
                                    borderRadius: '6px',
                                    fontSize: 14, 
                                    lineHeight: 1.6, 
                                    color: '#1976d2',
                                    border: '1px solid #bbdefb',
                                    fontWeight: '500'
                                  }}>
                                    <span style={{ color: '#2196f3', fontWeight: 'bold' }}>•</span> {item.replace(/^[-•]\s*/, '').trim()}
                                  </div>
                                ))}
                              </div>
                            </div>
                          )}
                        </div>
                        </div>
                      </div>
                    );
                  }
                  
                  // 其他信息
                  else {
                    const cleanText = trimmedLine
                      .replace(/>/g, '')
                      .replace(/\*/g, '')
                      .replace(/^[-•]\s*/, '') // 移除列表符号
                      .replace(/^\d+\.\s*/, '') // 移除数字编号
                      .replace(/#[a-zA-Z0-9\-/]+/g, '') // 移除标签如 #mcl/list-card
                      .replace(/^#+\s*/, '') // 移除Markdown标题符号
                      .replace(/^\[!info\]\s*/, '') // 移除信息框标记
                      .replace(/^\[!note\]\s*/, '') // 移除笔记标记
                      .replace(/^\[!tip\]\s*/, '') // 移除提示标记
                      .replace(/^\[!warning\]\s*/, '') // 移除警告标记
                      .trim();
                    
                    // 跳过空行、只有符号的行和标题行
                    if (!cleanText || cleanText.length < 2 || cleanText.startsWith('英语单词学习卡片') || cleanText.startsWith('单词信息')) return;
                    
                    sections.push(
                      <div key={`other-${index}`} style={{ 
                        marginBottom: 12, 
                        padding: '12px 16px', 
                        background: '#fafafa', 
                        borderRadius: 6,
                        border: '1px solid #d9d9d9'
                      }}>
                        <Text style={{ 
                          fontSize: 15, 
                          lineHeight: 1.5, 
                          color: '#595959',
                          display: 'block'
                        }}>
                          {cleanText}
                        </Text>
                      </div>
                    );
                  }
                });
                
                return sections;
              })()}
            </div>
          </div>
        )}
      </Modal>

    </div>
  );
};

export default Vocabulary;
