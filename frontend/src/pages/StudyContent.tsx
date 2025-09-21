import React, { useState, useEffect } from 'react';
import { Card, Tabs, Row, Col, Button, Tag, Space, Typography, Empty, Spin } from 'antd';
import { 
  BookOutlined, 
  CalculatorOutlined, 
  StarOutlined, 
  FileTextOutlined,
  EditOutlined,
  PlayCircleOutlined,
  BulbOutlined,
  TrophyOutlined
} from '@ant-design/icons';
import { useResponsive } from '../hooks/useResponsive';
import { getSubjectsByCategory, Subject, SubjectCategory } from '../services/subjectApi';

const { Title, Text } = Typography;
const { TabPane } = Tabs;

interface StudyContentStats {
  notes: number;
  assignments: number;
  exams: number;
  mindMaps: number;
  recitations: number;
  practiceRecords: number;
  wrongQuestions: number;
}

const StudyContent: React.FC = () => {
  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [loading, setLoading] = useState(false);
  const [activeTab, setActiveTab] = useState('all');
  const { isMobile } = useResponsive();

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

  // 模拟学习内容统计数据
  const getStudyContentStats = (subjectId: string): StudyContentStats => {
    // 这里应该从API获取实际数据
    return {
      notes: Math.floor(Math.random() * 20) + 5,
      assignments: Math.floor(Math.random() * 15) + 3,
      exams: Math.floor(Math.random() * 10) + 2,
      mindMaps: Math.floor(Math.random() * 8) + 1,
      recitations: Math.floor(Math.random() * 12) + 2,
      practiceRecords: Math.floor(Math.random() * 25) + 5,
      wrongQuestions: Math.floor(Math.random() * 18) + 3,
    };
  };

  // 按分类分组学科
  const groupedSubjects = subjects.reduce((acc, subject) => {
    const categoryName = subject.category?.name || '未分类';
    if (!acc[categoryName]) {
      acc[categoryName] = {
        category: subject.category,
        subjects: []
      };
    }
    acc[categoryName].subjects.push(subject);
    return acc;
  }, {} as Record<string, { category?: SubjectCategory; subjects: Subject[] }>);

  const getSubjectIcon = (subjectCode: string) => {
    switch (subjectCode) {
      case 'chinese': return <BookOutlined />;
      case 'math': return <CalculatorOutlined />;
      case 'english': return <StarOutlined />;
      case 'ethics': return <BulbOutlined />;
      case 'history': return <TrophyOutlined />;
      default: return <FileTextOutlined />;
    }
  };

  const getContentTypeIcon = (type: string) => {
    switch (type) {
      case 'notes': return <EditOutlined />;
      case 'assignments': return <FileTextOutlined />;
      case 'exams': return <TrophyOutlined />;
      case 'mindMaps': return <BulbOutlined />;
      case 'recitations': return <PlayCircleOutlined />;
      case 'practiceRecords': return <CalculatorOutlined />;
      case 'wrongQuestions': return <BookOutlined />;
      default: return <FileTextOutlined />;
    }
  };

  const renderSubjectCard = (subject: Subject) => {
    const stats = getStudyContentStats(subject.id);
    const contentTypes = [
      { key: 'notes', label: '笔记', count: stats.notes, color: '#1890ff' },
      { key: 'assignments', label: '作业', count: stats.assignments, color: '#52c41a' },
      { key: 'exams', label: '考试', count: stats.exams, color: '#fa8c16' },
      { key: 'mindMaps', label: '思维导图', count: stats.mindMaps, color: '#722ed1' },
      { key: 'recitations', label: '默写', count: stats.recitations, color: '#eb2f96' },
      { key: 'practiceRecords', label: '练习', count: stats.practiceRecords, color: '#13c2c2' },
      { key: 'wrongQuestions', label: '错题本', count: stats.wrongQuestions, color: '#f5222d' },
    ];

    return (
      <Col xs={24} sm={12} md={8} lg={6} key={subject.id}>
        <Card
          hoverable
          size="small"
          style={{ 
            border: `1px solid ${subject.color || '#d9d9d9'}`,
            borderRadius: 8,
            height: '100%'
          }}
          bodyStyle={{ padding: isMobile ? 12 : 16 }}
        >
          <div style={{ textAlign: 'center', marginBottom: 16 }}>
            <div 
              style={{ 
                width: 48, 
                height: 48, 
                backgroundColor: subject.color || '#1890ff',
                borderRadius: '50%',
                margin: '0 auto 12px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'center',
                color: 'white',
                fontSize: '20px'
              }}
            >
              {getSubjectIcon(subject.code)}
            </div>
            <Title level={4} style={{ margin: '0 0 8px 0', color: subject.color || '#1890ff' }}>
              {subject.name}
            </Title>
            <Text type="secondary" className="responsive-text-sm">
              {subject.description || '暂无描述'}
            </Text>
          </div>

          <div style={{ marginBottom: 16 }}>
            <Row gutter={[8, 8]}>
              {contentTypes.map(type => (
                <Col span={12} key={type.key}>
                  <div 
                    style={{ 
                      display: 'flex', 
                      alignItems: 'center', 
                      padding: '4px 8px',
                      backgroundColor: '#fafafa',
                      borderRadius: 4,
                      marginBottom: 4
                    }}
                  >
                    <span style={{ color: type.color, marginRight: 4 }}>
                      {getContentTypeIcon(type.key)}
                    </span>
                    <Text className="responsive-text-xs" style={{ marginRight: 4 }}>
                      {type.label}
                    </Text>
                    <Tag color={type.color} className="responsive-text-xs">
                      {type.count}
                    </Tag>
                  </div>
                </Col>
              ))}
            </Row>
          </div>

          <div style={{ textAlign: 'center' }}>
            <Space>
              {subject.is_core_subject && (
                <Tag color="red" className="responsive-text-xs">核心科目</Tag>
              )}
              <Tag color="blue" className="responsive-text-xs">
                难度 {subject.difficulty_level}
              </Tag>
            </Space>
          </div>
        </Card>
      </Col>
    );
  };

  const renderCategorySection = (categoryName: string, group: { category?: SubjectCategory; subjects: Subject[] }) => (
    <div key={categoryName} style={{ marginBottom: 32 }}>
      <div style={{ 
        display: 'flex', 
        alignItems: 'center', 
        marginBottom: 16,
        paddingBottom: 8,
        borderBottom: '2px solid #f0f0f0'
      }}>
        <div 
          style={{ 
            width: 4, 
            height: 24, 
            backgroundColor: group.category?.color || '#1890ff',
            marginRight: 12,
            borderRadius: 2
          }} 
        />
        <Title level={3} style={{ margin: 0, color: group.category?.color || '#1890ff' }}>
          {categoryName}
        </Title>
        <Tag color="blue" style={{ marginLeft: 12 }}>
          {group.subjects.length} 个学科
        </Tag>
      </div>
      
      <Row gutter={[16, 16]}>
        {group.subjects.map(renderSubjectCard)}
      </Row>
    </div>
  );

  if (loading) {
    return (
      <div style={{ textAlign: 'center', padding: '50px 0' }}>
        <Spin size="large" />
        <div style={{ marginTop: 16 }}>加载中...</div>
      </div>
    );
  }

  return (
    <div className="study-content-page">
      <div style={{ marginBottom: 24 }}>
        <Title level={2} className="responsive-text-xl">学习内容管理</Title>
        <Text type="secondary" className="responsive-text-md">
          按学科分类管理所有学习内容，包括笔记、作业、考试、思维导图、默写、练习和错题本
        </Text>
      </div>

      <Card>
        <Tabs 
          activeKey={activeTab} 
          onChange={setActiveTab}
          size={isMobile ? 'small' : undefined}
        >
          <TabPane tab="全部内容" key="all">
            {Object.keys(groupedSubjects).length > 0 ? (
              Object.entries(groupedSubjects).map(([categoryName, group]) => 
                renderCategorySection(categoryName, group)
              )
            ) : (
              <Empty description="暂无学习内容" />
            )}
          </TabPane>
          
          {Object.entries(groupedSubjects).map(([categoryName, group]) => (
            <TabPane 
              tab={
                <span>
                  <span style={{ color: group.category?.color || '#1890ff' }}>
                    {categoryName}
                  </span>
                  <Tag color="blue" style={{ marginLeft: 8 }}>
                    {group.subjects.length}
                  </Tag>
                </span>
              } 
              key={categoryName}
            >
              {renderCategorySection(categoryName, group)}
            </TabPane>
          ))}
        </Tabs>
      </Card>
    </div>
  );
};

export default StudyContent;
