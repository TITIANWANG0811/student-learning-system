import React, { useState, useEffect } from 'react';
import { Card, Tabs, Row, Col, Button, Tag, Space, Typography, Empty, Spin, Statistic, Modal } from 'antd';
import ReactMarkdown from 'react-markdown';
import { 
  BookOutlined, 
  CalculatorOutlined, 
  StarOutlined, 
  FileTextOutlined,
  EditOutlined,
  PlayCircleOutlined,
  BulbOutlined,
  TrophyOutlined,
  PlusOutlined,
  BarChartOutlined
} from '@ant-design/icons';
import { useParams, useNavigate } from 'react-router-dom';
import { useResponsive } from '../hooks/useResponsive';
import { getSubjectsByCategory, Subject } from '../services/subjectApi';

const { Title, Text } = Typography;
const { TabPane } = Tabs;

interface SubjectPageProps {
  contentType: 'notes' | 'assignments' | 'practice' | 'exams' | 'mind-maps' | 'recitations' | 'wrong-questions';
}

const SubjectPage: React.FC<SubjectPageProps> = ({ contentType }) => {
  const { subject, grade } = useParams<{ subject: string; grade?: string }>();
  const navigate = useNavigate();
  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [loading, setLoading] = useState(false);
  const [activeTab, setActiveTab] = useState('overview');
  const [noteList, setNoteList] = useState<any[]>([]);
  const [selectedNote, setSelectedNote] = useState<any>(null);
  const [noteDetailVisible, setNoteDetailVisible] = useState(false);
  const [selectedKnowledgePoint, setSelectedKnowledgePoint] = useState<any>(null);
  const [knowledgePointDetailVisible, setKnowledgePointDetailVisible] = useState(false);
  const [selectedGrade, setSelectedGrade] = useState(grade || 'grade1');
  const { isMobile } = useResponsive();

  // 从当前路径中提取学科名称
  const getSubjectFromPath = () => {
    const path = window.location.pathname;
    if (path.includes('/notes/chinese')) return 'chinese';
    if (path.includes('/notes/math')) return 'math';
    if (path.includes('/notes/english')) return 'english';
    if (path.includes('/notes/history')) return 'history';
    if (path.includes('/notes/ethics')) return 'ethics';
    return subject;
  };

  const currentSubjectCode = getSubjectFromPath();
  
  console.log('当前学科代码:', currentSubjectCode);
  console.log('内容类型:', contentType);

  const subjectMap: Record<string, { name: string; code: string; color: string; icon: React.ReactNode }> = {
    chinese: { name: '语文', code: 'chinese', color: '#FF6B6B', icon: <BookOutlined /> },
    math: { name: '数学', code: 'math', color: '#4ECDC4', icon: <CalculatorOutlined /> },
    english: { name: '英语', code: 'english', color: '#45B7D1', icon: <StarOutlined /> },
    history: { name: '历史', code: 'history', color: '#FFEAA7', icon: <TrophyOutlined /> },
    ethics: { name: '道法', code: 'ethics', color: '#96CEB4', icon: <BulbOutlined /> },
  };

  const gradeMap: Record<string, { name: string; code: string; color: string }> = {
    grade1: { name: '初一', code: 'grade1', color: '#52c41a' },
    grade2: { name: '初二', code: 'grade2', color: '#1890ff' },
    grade3: { name: '初三', code: 'grade3', color: '#fa8c16' },
  };

  const contentTypeMap: Record<string, { name: string; icon: React.ReactNode; color: string }> = {
    'notes': { name: '笔记', icon: <EditOutlined />, color: '#1890ff' },
    'assignments': { name: '作业', icon: <FileTextOutlined />, color: '#52c41a' },
    'practice': { name: '练习', icon: <CalculatorOutlined />, color: '#13c2c2' },
    'exams': { name: '考试', icon: <TrophyOutlined />, color: '#fa8c16' },
    'mind-maps': { name: '思维导图', icon: <BulbOutlined />, color: '#722ed1' },
    'recitations': { name: '默写', icon: <PlayCircleOutlined />, color: '#eb2f96' },
    'wrong-questions': { name: '错题本', icon: <BookOutlined />, color: '#f5222d' },
  };

  const currentSubject = currentSubjectCode ? subjectMap[currentSubjectCode] : null;
  const currentContentType = contentTypeMap[contentType];
  const currentGrade = gradeMap[selectedGrade];

  const handleGradeChange = (newGrade: string) => {
    setSelectedGrade(newGrade);
    // 更新URL但不刷新页面
    navigate(`/${contentType}/${currentSubjectCode}/${newGrade}`, { replace: true });
  };

  const handleViewNoteDetail = (note: any) => {
    setSelectedNote(note);
    setNoteDetailVisible(true);
  };

  const closeNoteDetail = () => {
    setNoteDetailVisible(false);
    setSelectedNote(null);
  };

  const handleViewKnowledgePointDetail = (knowledgePoint: any) => {
    setSelectedKnowledgePoint(knowledgePoint);
    setKnowledgePointDetailVisible(true);
  };

  const closeKnowledgePointDetail = () => {
    setKnowledgePointDetailVisible(false);
    setSelectedKnowledgePoint(null);
  };

  useEffect(() => {
    fetchSubjects();
  }, []);

  useEffect(() => {
    if (currentSubjectCode && contentType) {
      console.log('开始获取内容数据:', { currentSubjectCode, contentType });
      fetchContentData();
    }
  }, [contentType, currentSubjectCode]);

  const fetchSubjects = async () => {
    setLoading(true);
    try {
      const data = await getSubjectsByCategory();
      setSubjects(data);
    } catch (error) {
      console.error('Failed to fetch subjects:', error);
    } finally {
      setLoading(false);
    }
  };

  // 真实数据统计
  const [stats, setStats] = useState({
    total: 0,
    completed: 0,
    inProgress: 0,
    recent: 0,
  });

  const [contentList, setContentList] = useState<any[]>([]);

  const fetchContentData = async () => {
    try {
      if (contentType === 'notes') {
        // 根据当前学科获取对应的笔记数据
        let response;
        if (currentSubjectCode === 'chinese') {
          const token = localStorage.getItem('token');
          const headers: HeadersInit = {};
          if (token) {
            headers['Authorization'] = `Bearer ${token}`;
          }
          response = await fetch(`http://localhost:9002/api/v1/chinese-notes/`, {
            headers
          });
        } else if (currentSubjectCode === 'english') {
          // 英语笔记暂时没有专门的数据，返回空数组
          response = { json: () => [] };
        } else {
          // 其他学科暂时没有笔记数据
          response = { json: () => [] };
        }
        
        const data = await response.json();
        
        console.log(`API返回的${currentSubjectCode}笔记数据:`, data);
        console.log(`${currentSubjectCode}笔记数量:`, data.length);
        
        setContentList(data);
        
        // 创建笔记列表（按unit_name分组）
        const noteMap = new Map();
        data.forEach((item: any) => {
          const noteKey = item.unit_name;
          if (!noteMap.has(noteKey)) {
            noteMap.set(noteKey, {
              id: noteKey,
              title: noteKey,
              date: item.note_date || '2025-09-15',
              subject: item.subject || '语文',
              author: item.author_full_name || item.author_username || '未知作者',
              knowledgePointCount: 0,
              knowledgePoints: []
            });
          }
          noteMap.get(noteKey).knowledgePointCount++;
          noteMap.get(noteKey).knowledgePoints.push({
            id: item.id,
            title: item.title,
            content: item.content,
            markdownContent: item.markdown_content,
            author: item.author_full_name || item.author_username || '未知作者',
            unitName: item.unit_name,
            isMemorized: false // 新表没有is_memorized字段
          });
        });
        
        setNoteList(Array.from(noteMap.values()));
        
        // 计算统计信息
        const totalNotes = data.length > 0 ? 1 : 0; // 如果有数据，显示1个笔记
        const totalKnowledgePoints = data.length; // 知识点数量
        const completed = 0; // 新表没有is_memorized字段，设为0
        const recent = data.filter((item: any) => {
          const createdDate = new Date(item.created_at);
          const now = new Date();
          const diffDays = (now.getTime() - createdDate.getTime()) / (1000 * 3600 * 24);
          return diffDays <= 7; // 最近7天
        }).length;
        
        setStats({
          total: totalNotes, // 显示笔记数量
          completed,
          inProgress: totalKnowledgePoints - completed, // 知识点进行中
          recent,
        });
      }
    } catch (error) {
      console.error('Failed to fetch content data:', error);
    }
  };

  const renderOverview = () => (
    <Row gutter={[16, 16]}>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="笔记数量"
            value={stats.total}
            prefix={currentContentType?.icon}
            valueStyle={{ color: currentContentType?.color }}
          />
        </Card>
      </Col>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="知识点总数"
            value={contentList.length}
            prefix={<BookOutlined />}
            valueStyle={{ color: '#722ed1' }}
          />
        </Card>
      </Col>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="已掌握"
            value={stats.completed}
            valueStyle={{ color: '#52c41a' }}
          />
        </Card>
      </Col>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="学习中"
            value={stats.inProgress}
            valueStyle={{ color: '#fa8c16' }}
          />
        </Card>
      </Col>
    </Row>
  );

  const renderNoteList = () => (
    <div>
      <div style={{ marginBottom: 16, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <Title level={4} style={{ margin: 0 }}>
          {currentGrade?.name}{currentSubject?.name} 笔记列表
        </Title>
        <Button type="primary" icon={<PlusOutlined />} size={isMobile ? 'small' : undefined} disabled>
          新建笔记
        </Button>
      </div>
      
      {noteList.length > 0 ? (
        <div>
          {noteList.map((note, index) => (
            <Card 
              key={note.id || index} 
              style={{ marginBottom: 16 }}
              title={
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <div>
                    <span>{note.title}</span>
                    <div style={{ marginTop: 4 }}>
                      <Text type="secondary" style={{ fontSize: '12px' }}>
                        作者：{note.author}
                      </Text>
                    </div>
                  </div>
                  <div>
                    <Tag color="blue">{note.subject}</Tag>
                    <Tag color="green">{note.date}</Tag>
                    <Tag color="purple">{note.knowledgePointCount}个知识点</Tag>
                  </div>
                </div>
              }
            >
              <div style={{ marginBottom: 12 }}>
                <Text type="secondary">包含知识点：</Text>
                <div style={{ marginTop: 8 }}>
                  {note.knowledgePoints.map((kp: any, kpIndex: number) => (
                    <Tag 
                      key={kpIndex} 
                      color={kp.isMemorized ? 'green' : 'default'}
                      style={{ marginBottom: 4 }}
                    >
                      {kp.title} {kp.isMemorized ? '✓' : ''}
                    </Tag>
                  ))}
                </div>
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Space>
                  <Text type="secondary" style={{ fontSize: '12px' }}>
                    创建时间: {note.date}
                  </Text>
                  <Text type="secondary" style={{ fontSize: '12px' }}>
                    掌握进度: {note.knowledgePoints.filter((kp: any) => kp.isMemorized).length}/{note.knowledgePointCount}
                  </Text>
                </Space>
                       <Space>
                         <Button size="small" type="link" onClick={() => handleViewNoteDetail(note)}>查看详情</Button>
                         <Button size="small" type="link" disabled>编辑</Button>
                       </Space>
              </div>
            </Card>
          ))}
        </div>
      ) : (
        <Card>
          <Empty 
            description={`暂无${currentSubject?.name}笔记数据`}
            image={Empty.PRESENTED_IMAGE_SIMPLE}
          >
            <Button type="primary" icon={<PlusOutlined />} disabled>
              创建第一个笔记
            </Button>
          </Empty>
        </Card>
      )}
    </div>
  );

  const renderContentList = () => (
    <div>
      <div style={{ marginBottom: 16, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <Title level={4} style={{ margin: 0 }}>
          {currentGrade?.name}{currentSubject?.name} 知识点列表
        </Title>
        <Button type="primary" icon={<PlusOutlined />} size={isMobile ? 'small' : undefined} disabled>
          新建{currentContentType?.name}
        </Button>
      </div>
      
      <div style={{ marginBottom: 16, padding: 16, backgroundColor: '#f5f5f5', borderRadius: 4 }}>
        <Text type="secondary">调试信息: 1个笔记，包含 {contentList.length} 个知识点</Text>
      </div>
      
      {contentList.length > 0 ? (
        <div>
          {contentList.map((item, index) => (
            <Card 
              key={item.id || index} 
              style={{ marginBottom: 16 }}
              title={
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <div>
                    <span>{item.title}</span>
                    <div style={{ marginTop: 4 }}>
                      <Text type="secondary" style={{ fontSize: '12px' }}>
                        作者：{item.author_full_name || item.author_username || '未知作者'} | 
                        所属笔记：{item.unit_name || '未知笔记'}
                      </Text>
                    </div>
                  </div>
                  <div>
                    <Tag color="blue">{item.recitation_type === 'definition' ? '定义' : item.recitation_type}</Tag>
                    {item.is_memorized && <Tag color="green">已掌握</Tag>}
                  </div>
                </div>
              }
            >
              <div style={{ maxHeight: '200px', overflow: 'hidden' }}>
                <Text type="secondary">
                  {item.content.length > 300 
                    ? item.content.substring(0, 300) + '...' 
                    : item.content
                  }
                </Text>
              </div>
              <div style={{ marginTop: 12, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <Space>
                  <Text type="secondary" style={{ fontSize: '12px' }}>
                    创建时间: {new Date(item.created_at).toLocaleDateString()}
                  </Text>
                </Space>
                <Space>
                  <Button size="small" type="link" onClick={() => handleViewKnowledgePointDetail(item)}>查看详情</Button>
                  <Button size="small" type="link" disabled>编辑</Button>
                </Space>
              </div>
            </Card>
          ))}
        </div>
      ) : (
        <Card>
          <Empty 
            description={`暂无${currentSubject?.name}${currentContentType?.name}数据`}
            image={Empty.PRESENTED_IMAGE_SIMPLE}
          >
            <Button type="primary" icon={<PlusOutlined />} disabled>
              创建第一个{currentContentType?.name}
            </Button>
          </Empty>
        </Card>
      )}
    </div>
  );

  const renderProgress = () => (
    <Card title="学习进度">
      <Row gutter={[16, 16]}>
        <Col xs={24} md={12}>
          <Card size="small" title="本周进度">
            <div style={{ textAlign: 'center', padding: '20px 0' }}>
              <div style={{ fontSize: '24px', color: currentSubject?.color, marginBottom: '8px' }}>
                {Math.floor(Math.random() * 40) + 60}%
              </div>
              <Text type="secondary">完成度</Text>
            </div>
          </Card>
        </Col>
        <Col xs={24} md={12}>
          <Card size="small" title="学习时间">
            <div style={{ textAlign: 'center', padding: '20px 0' }}>
              <div style={{ fontSize: '24px', color: currentSubject?.color, marginBottom: '8px' }}>
                {Math.floor(Math.random() * 10) + 5}h
              </div>
              <Text type="secondary">本周学习</Text>
            </div>
          </Card>
        </Col>
      </Row>
    </Card>
  );

  if (loading) {
    return (
      <div style={{ textAlign: 'center', padding: '50px 0' }}>
        <Spin size="large" />
        <div style={{ marginTop: 16 }}>加载中...</div>
      </div>
    );
  }

  if (!currentSubject) {
    return (
      <div style={{ textAlign: 'center', padding: '50px 0' }}>
        <Empty description="学科不存在" />
      </div>
    );
  }

  return (
    <div className="subject-page">
      <div style={{ marginBottom: 24 }}>
        <div style={{ display: 'flex', alignItems: 'center', marginBottom: 16 }}>
          <div 
            style={{ 
              width: 48, 
              height: 48, 
              backgroundColor: currentSubject.color,
              borderRadius: '50%',
              marginRight: 16,
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              color: 'white',
              fontSize: '24px'
            }}
          >
            {currentSubject.icon}
          </div>
          <div>
            <Title level={2} style={{ margin: 0, color: currentSubject.color }}>
              {currentSubject.name} {currentContentType?.name}
            </Title>
            <Text type="secondary" className="responsive-text-md">
              管理{currentGrade?.name}{currentSubject.name}相关的{currentContentType?.name}内容
            </Text>
          </div>
        </div>

        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: 16 }}>
          <Space wrap>
            <Tag color="blue" className="responsive-text-sm">
              {currentSubject.name}
            </Tag>
            <Tag color={currentContentType?.color} className="responsive-text-sm">
              {currentContentType?.name}
            </Tag>
            <Tag color={currentGrade?.color} className="responsive-text-sm">
              {currentGrade?.name}
            </Tag>
            <Tag color="green" className="responsive-text-sm">
              总计 {stats.total} 项
            </Tag>
          </Space>
          
          <Space>
            <Text className="responsive-text-sm">年级：</Text>
            <Space.Compact>
              {Object.entries(gradeMap).map(([key, grade]) => (
                <Button
                  key={key}
                  type={selectedGrade === key ? 'primary' : 'default'}
                  size={isMobile ? 'small' : undefined}
                  onClick={() => handleGradeChange(key)}
                  style={{
                    backgroundColor: selectedGrade === key ? grade.color : undefined,
                    borderColor: selectedGrade === key ? grade.color : undefined,
                  }}
                >
                  {grade.name}
                </Button>
              ))}
            </Space.Compact>
          </Space>
        </div>
      </div>

      <Card>
        <Tabs 
          activeKey={activeTab} 
          onChange={setActiveTab}
          size={isMobile ? 'small' : undefined}
        >
          <TabPane tab="概览" key="overview">
            {renderOverview()}
          </TabPane>
          <TabPane tab="笔记列表" key="notes">
            {renderNoteList()}
          </TabPane>
          <TabPane tab="知识点列表" key="knowledge">
            {renderContentList()}
          </TabPane>
          <TabPane tab="学习进度" key="progress">
            {renderProgress()}
          </TabPane>
        </Tabs>
      </Card>

      {/* 笔记详情Modal */}
      <Modal
        title={`笔记详情 - ${selectedNote?.title || ''}`}
        open={noteDetailVisible}
        onCancel={closeNoteDetail}
        footer={[
          <Button key="close" onClick={closeNoteDetail}>
            关闭
          </Button>
        ]}
        width={800}
        styles={{ 
          body: { 
            padding: 0, 
            maxHeight: '70vh',
            overflow: 'hidden'
          } 
        }}
      >
        {selectedNote && (
          <div style={{ 
            padding: '24px', 
            maxHeight: '70vh', 
            overflowY: 'auto',
            overflowX: 'hidden'
          }}>
            <div style={{ marginBottom: 24 }}>
              <Title level={4} style={{ marginBottom: 16 }}>
                {selectedNote.title}
              </Title>
              <Space>
                <Tag color="blue">{selectedNote.subject}</Tag>
                <Tag color="green">{selectedNote.date}</Tag>
                <Tag color="purple">{selectedNote.knowledgePointCount}个知识点</Tag>
              </Space>
            </div>

            <div style={{ marginBottom: 24 }}>
              <Title level={5}>包含的知识点：</Title>
              <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                {selectedNote.knowledgePoints.map((kp: any, index: number) => (
                  <Tag 
                    key={index} 
                    color={kp.isMemorized ? 'green' : 'default'}
                    style={{ marginBottom: 8 }}
                  >
                    {kp.title} {kp.isMemorized ? '✓' : ''}
                  </Tag>
                ))}
              </div>
            </div>

            <div>
              <Title level={5}>知识点详细内容：</Title>
              {selectedNote.knowledgePoints.map((kp: any, index: number) => {
                // 从contentList中找到对应的知识点详情
                const knowledgeDetail = contentList.find((item: any) => item.id === kp.id);
                return (
                  <Card 
                    key={index} 
                    size="small" 
                    style={{ 
                      marginBottom: 16,
                      border: '1px solid #d9d9d9',
                      borderRadius: '8px',
                      boxShadow: '0 2px 4px rgba(0,0,0,0.06)'
                    }}
                    title={
                      <div style={{ 
                        display: 'flex', 
                        justifyContent: 'space-between', 
                        alignItems: 'center',
                        padding: '8px 0',
                        borderBottom: '1px solid #f0f0f0',
                        marginBottom: '12px'
                      }}>
                        <div style={{ 
                          fontSize: '16px', 
                          fontWeight: '600', 
                          color: '#262626',
                          display: 'flex',
                          alignItems: 'center'
                        }}>
                          <div style={{
                            width: '4px',
                            height: '20px',
                            backgroundColor: '#1890ff',
                            marginRight: '8px',
                            borderRadius: '2px'
                          }}></div>
                          {kp.title}
                        </div>
                        {kp.isMemorized && <Tag color="green">已掌握</Tag>}
                      </div>
                    }
                  >
                    <div style={{ 
                      padding: '16px',
                      backgroundColor: '#fafafa',
                      borderRadius: '6px',
                      border: '1px solid #f0f0f0',
                      marginTop: '8px'
                    }}>
                      <div style={{ 
                        lineHeight: '1.6',
                        color: '#595959'
                      }}>
                        <ReactMarkdown>
                          {knowledgeDetail?.content || '暂无详细内容'}
                        </ReactMarkdown>
                      </div>
                    </div>
                  </Card>
                );
              })}
            </div>
          </div>
        )}
      </Modal>

      {/* 知识点详情Modal */}
      <Modal
        title={`知识点详情 - ${selectedKnowledgePoint?.title || ''}`}
        open={knowledgePointDetailVisible}
        onCancel={closeKnowledgePointDetail}
        footer={[
          <Button key="close" onClick={closeKnowledgePointDetail}>
            关闭
          </Button>
        ]}
        width={800}
        styles={{ 
          body: { 
            padding: 0, 
            maxHeight: '70vh',
            overflow: 'hidden'
          } 
        }}
      >
        {selectedKnowledgePoint && (
          <div style={{ 
            padding: '24px', 
            maxHeight: '70vh', 
            overflowY: 'auto',
            overflowX: 'hidden'
          }}>
            <div style={{ marginBottom: 24 }}>
              <Title level={4} style={{ marginBottom: 16 }}>
                {selectedKnowledgePoint.title}
              </Title>
              <Space>
                <Tag color="blue">{selectedKnowledgePoint.recitation_type === 'definition' ? '定义' : selectedKnowledgePoint.recitation_type}</Tag>
                <Tag color="green">{selectedKnowledgePoint.grade_level}</Tag>
                {selectedKnowledgePoint.is_memorized && <Tag color="green">已掌握</Tag>}
              </Space>
            </div>

            <div>
              <Title level={5}>详细内容：</Title>
              <Card 
                size="small" 
                style={{ 
                  border: '1px solid #d9d9d9',
                  borderRadius: '8px',
                  boxShadow: '0 2px 4px rgba(0,0,0,0.06)'
                }}
              >
                <div style={{ 
                  padding: '16px',
                  backgroundColor: '#fafafa',
                  borderRadius: '6px',
                  border: '1px solid #f0f0f0'
                }}>
                  <div style={{ 
                    lineHeight: '1.6',
                    color: '#595959'
                  }}>
                    <ReactMarkdown>
                      {selectedKnowledgePoint.content || '暂无详细内容'}
                    </ReactMarkdown>
                  </div>
                </div>
              </Card>
            </div>

            <div style={{ marginTop: 24 }}>
              <Title level={5}>基本信息：</Title>
              <div style={{ padding: '12px', backgroundColor: '#f5f5f5', borderRadius: '4px' }}>
                <Text type="secondary">创建时间</Text>
                <div style={{ marginTop: '4px', fontWeight: '500' }}>
                  {new Date(selectedKnowledgePoint.created_at).toLocaleString()}
                </div>
              </div>
            </div>
          </div>
        )}
      </Modal>
    </div>
  );
};

export default SubjectPage;
