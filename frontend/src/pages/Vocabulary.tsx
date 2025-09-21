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
        title={selectedWord ? `${selectedWord.title} - 单词详情` : ''}
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
        width={isMobile ? '95%' : isTablet ? '80%' : 600}
        style={{ top: 20 }}
      >
        {selectedWord && (
          <div style={{ maxHeight: '70vh', overflowY: 'auto' }}>
            {/* 单词基本信息 */}
            <div style={{ marginBottom: 20, padding: '16px', background: '#f6f8fa', borderRadius: 8 }}>
              <div style={{ marginBottom: 12 }}>
                <div style={{ display: 'flex', gap: '8px', alignItems: 'center', flexWrap: 'wrap' }}>
                  <Text strong style={{ fontSize: 24, color: '#1890ff' }}>
                    {selectedWord.title}
                  </Text>
                  <Tag color={selectedWord.is_memorized ? 'green' : 'blue'}>
                    {selectedWord.is_memorized ? '已背诵' : '未背诵'}
                  </Tag>
                </div>
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Text type="secondary" style={{ fontSize: 14 }}>
                  练习次数: {selectedWord.practice_count}
                </Text>
                <Text type="secondary" style={{ fontSize: 12 }}>
                  创建: {new Date(selectedWord.created_at).toLocaleDateString()}
                </Text>
              </div>
            </div>

            {/* 单词详细内容 */}
            <div style={{ marginBottom: 20 }}>
              {selectedWord.content.split('\n').map((line, index) => {
                const trimmedLine = line.trim();
                
                if (!trimmedLine) {
                  return <div key={index} style={{ height: 8 }} />;
                }
                
                // 音标
                if (trimmedLine.includes('音标:') || (trimmedLine.includes('/') && !trimmedLine.includes('http'))) {
                  return (
                    <div key={index} style={{ marginBottom: 16, padding: '12px', background: '#e6f7ff', borderRadius: 6 }}>
                      <Text type="secondary" style={{ fontSize: 18, fontWeight: 'bold', color: '#1890ff' }}>
                        {trimmedLine}
                      </Text>
                    </div>
                  );
                }
                
                // 词性
                if (trimmedLine.includes('词性:') || trimmedLine.includes('形容词') || trimmedLine.includes('名词') || trimmedLine.includes('动词') || trimmedLine.includes('副词')) {
                  return (
                    <div key={index} style={{ marginBottom: 14, padding: '8px 12px', background: '#f0f9ff', borderRadius: 4 }}>
                      <Text style={{ fontSize: 16, fontWeight: 'bold', color: '#0050b3' }}>
                        {trimmedLine}
                      </Text>
                    </div>
                  );
                }
                
                // 中文释义
                if (trimmedLine.includes('中文释义:') || trimmedLine.includes('释义:') || trimmedLine.includes('中文意思:')) {
                  return (
                    <div key={index} style={{ marginBottom: 18, padding: '16px', background: '#fff7e6', borderRadius: 8, border: '2px solid #ffd591' }}>
                      <Text strong style={{ fontSize: 20, color: '#d46b08', lineHeight: 1.4 }}>
                        {trimmedLine}
                      </Text>
                    </div>
                  );
                }
                
                // 例句
                if (trimmedLine.includes('例句:') || /^\d+\./.test(trimmedLine) || /[A-Z][a-z].*\./.test(trimmedLine)) {
                  return (
                    <div key={index} style={{ marginBottom: 12, padding: '10px 12px', background: '#f0f9ff', borderRadius: 6 }}>
                      <Text style={{ fontSize: 16, fontStyle: 'italic', lineHeight: 1.6, color: '#003a8c' }}>
                        {trimmedLine}
                      </Text>
                    </div>
                  );
                }
                
                // 联想记忆
                if (trimmedLine.includes('联想记忆:') || trimmedLine.includes('记忆:') || trimmedLine.includes('记忆方法:')) {
                  return (
                    <div key={index} style={{ marginBottom: 12, padding: '10px 12px', background: '#f6ffed', borderRadius: 6 }}>
                      <Text type="secondary" style={{ fontSize: 15, lineHeight: 1.6, color: '#389e0d' }}>
                        {trimmedLine}
                      </Text>
                    </div>
                  );
                }
                
                // 相关词汇
                if (trimmedLine.includes('相关词汇:') || trimmedLine.includes('近义词') || trimmedLine.includes('反义词') || trimmedLine.includes('派生词')) {
                  return (
                    <div key={index} style={{ marginBottom: 12, padding: '10px 12px', background: '#fff2e8', borderRadius: 6 }}>
                      <Text type="secondary" style={{ fontSize: 15, lineHeight: 1.6, color: '#d4380d' }}>
                        {trimmedLine}
                      </Text>
                    </div>
                  );
                }
                
                // 其他信息
                return (
                  <div key={index} style={{ marginBottom: 10, padding: '8px 12px', background: '#fafafa', borderRadius: 4 }}>
                    <Text style={{ fontSize: 15, lineHeight: 1.5, color: '#595959' }}>
                      {trimmedLine}
                    </Text>
                  </div>
                );
              })}
            </div>
          </div>
        )}
      </Modal>

    </div>
  );
};

export default Vocabulary;
