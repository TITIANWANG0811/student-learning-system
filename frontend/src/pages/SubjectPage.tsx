import React, { useState, useEffect } from 'react';
import { Card, Tabs, Row, Col, Button, Tag, Space, Typography, Empty, Spin, Statistic } from 'antd';
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
  const [selectedGrade, setSelectedGrade] = useState(grade || 'grade1');
  const { isMobile } = useResponsive();

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

  const currentSubject = subject ? subjectMap[subject] : null;
  const currentContentType = contentTypeMap[contentType];
  const currentGrade = gradeMap[selectedGrade];

  const handleGradeChange = (newGrade: string) => {
    setSelectedGrade(newGrade);
    // 更新URL但不刷新页面
    navigate(`/${contentType}/${subject}/${newGrade}`, { replace: true });
  };

  useEffect(() => {
    fetchSubjects();
  }, []);

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

  // 模拟数据统计
  const getContentStats = () => {
    const stats = {
      total: Math.floor(Math.random() * 50) + 10,
      completed: Math.floor(Math.random() * 30) + 5,
      inProgress: Math.floor(Math.random() * 15) + 2,
      recent: Math.floor(Math.random() * 8) + 1,
    };
    return stats;
  };

  const stats = getContentStats();

  const renderOverview = () => (
    <Row gutter={[16, 16]}>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="总数量"
            value={stats.total}
            prefix={currentContentType?.icon}
            valueStyle={{ color: currentContentType?.color }}
          />
        </Card>
      </Col>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="已完成"
            value={stats.completed}
            valueStyle={{ color: '#52c41a' }}
          />
        </Card>
      </Col>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="进行中"
            value={stats.inProgress}
            valueStyle={{ color: '#fa8c16' }}
          />
        </Card>
      </Col>
      <Col xs={24} sm={12} md={6}>
        <Card size="small">
          <Statistic
            title="最近新增"
            value={stats.recent}
            valueStyle={{ color: '#1890ff' }}
          />
        </Card>
      </Col>
    </Row>
  );

  const renderContentList = () => (
    <div>
      <div style={{ marginBottom: 16, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <Title level={4} style={{ margin: 0 }}>
          {currentGrade?.name}{currentSubject?.name} {currentContentType?.name}列表
        </Title>
        <Button type="primary" icon={<PlusOutlined />} size={isMobile ? 'small' : undefined}>
          新建{currentContentType?.name}
        </Button>
      </div>
      
      <Card>
        <Empty 
          description={`暂无${currentSubject?.name}${currentContentType?.name}数据`}
          image={Empty.PRESENTED_IMAGE_SIMPLE}
        >
          <Button type="primary" icon={<PlusOutlined />}>
            创建第一个{currentContentType?.name}
          </Button>
        </Empty>
      </Card>
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
          <TabPane tab="内容列表" key="list">
            {renderContentList()}
          </TabPane>
          <TabPane tab="学习进度" key="progress">
            {renderProgress()}
          </TabPane>
        </Tabs>
      </Card>
    </div>
  );
};

export default SubjectPage;
