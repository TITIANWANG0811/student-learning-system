import React, { useState, useEffect } from 'react';
import { Row, Col, Card, Statistic, Progress, List, Avatar, Tag, Button, Typography, Divider } from 'antd';
import { 
  BookOutlined, 
  CheckCircleOutlined, 
  ClockCircleOutlined, 
  TrophyOutlined,
  RightOutlined,
  StarOutlined
} from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';
import api from '../services/api';
import { getSubjectsByCategory, Subject, SubjectCategory } from '../services/subjectApi';

const { Title, Text } = Typography;

interface StudyStats {
  totalSubjects: number;
  completedTasks: number;
  totalTasks: number;
  studyTime: number;
  upcomingExams: number;
}

interface RecentTask {
  id: string;
  title: string;
  subject: string;
  dueDate: string;
  priority: number;
  isCompleted: boolean;
}

const Dashboard: React.FC = () => {
  const { user } = useAuth();
  const [stats, setStats] = useState<StudyStats>({
    totalSubjects: 5,
    completedTasks: 12,
    totalTasks: 20,
    studyTime: 120,
    upcomingExams: 3,
  });
  const [recentTasks, setRecentTasks] = useState<RecentTask[]>([]);
  const [subjectsByCategory, setSubjectsByCategory] = useState<Subject[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchDashboardData();
  }, []);

  const fetchDashboardData = async () => {
    try {
      // 获取学科分类数据
      const subjectsData = await getSubjectsByCategory();
      setSubjectsByCategory(subjectsData);
      
      // 这里应该调用实际的API
      // const response = await api.get('/dashboard');
      // setStats(response.data.stats);
      // setRecentTasks(response.data.recentTasks);
      
      // 模拟数据
      setRecentTasks([
        {
          id: '1',
          title: '完成数学作业第3章',
          subject: '数学',
          dueDate: '2024-01-15',
          priority: 1,
          isCompleted: false,
        },
        {
          id: '2',
          title: '背诵英语单词Unit 5',
          subject: '英语',
          dueDate: '2024-01-16',
          priority: 2,
          isCompleted: true,
        },
        {
          id: '3',
          title: '复习历史第2章',
          subject: '历史',
          dueDate: '2024-01-17',
          priority: 1,
          isCompleted: false,
        },
      ]);
      setLoading(false);
    } catch (error) {
      console.error('获取仪表盘数据失败:', error);
      setLoading(false);
    }
  };

  const getPriorityColor = (priority: number) => {
    switch (priority) {
      case 1: return 'red';
      case 2: return 'orange';
      case 3: return 'green';
      default: return 'default';
    }
  };

  const getPriorityText = (priority: number) => {
    switch (priority) {
      case 1: return '高';
      case 2: return '中';
      case 3: return '低';
      default: return '未知';
    }
  };

  return (
    <div>
      <Title level={2} className="responsive-text-lg">欢迎回来，{user?.full_name}！</Title>
      <Text type="secondary" className="responsive-text-sm">今天是 {new Date().toLocaleDateString('zh-CN')}，继续加油学习吧！</Text>

      <Row gutter={[16, 16]} style={{ marginTop: 24 }} className="responsive-grid">
        <Col xs={24} sm={12} md={8} lg={6}>
          <Card size="small">
            <Statistic
              title="学习科目"
              value={stats.totalSubjects}
              prefix={<BookOutlined />}
              valueStyle={{ color: '#3f8600', fontSize: 'clamp(16px, 4vw, 24px)' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} md={8} lg={6}>
          <Card size="small">
            <Statistic
              title="完成任务"
              value={stats.completedTasks}
              suffix={`/ ${stats.totalTasks}`}
              prefix={<CheckCircleOutlined />}
              valueStyle={{ color: '#1890ff', fontSize: 'clamp(16px, 4vw, 24px)' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} md={8} lg={6}>
          <Card size="small">
            <Statistic
              title="今日学习时间"
              value={stats.studyTime}
              suffix="分钟"
              prefix={<ClockCircleOutlined />}
              valueStyle={{ color: '#722ed1', fontSize: 'clamp(16px, 4vw, 24px)' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} md={8} lg={6}>
          <Card size="small">
            <Statistic
              title="即将考试"
              value={stats.upcomingExams}
              prefix={<TrophyOutlined />}
              valueStyle={{ color: '#eb2f96', fontSize: 'clamp(16px, 4vw, 24px)' }}
            />
          </Card>
        </Col>
      </Row>

      <Row gutter={[16, 16]} style={{ marginTop: 24 }}>
        <Col xs={24} lg={12}>
          <Card 
            title="学习进度" 
            extra={<Button type="link" size="small">查看详情</Button>}
            size="small"
          >
            <div style={{ marginBottom: 16 }}>
              <Text strong className="responsive-text-sm">总体进度</Text>
              <Progress 
                percent={Math.round((stats.completedTasks / stats.totalTasks) * 100)} 
                status="active"
                strokeWidth={6}
              />
            </div>
            <div>
              <Text strong className="responsive-text-sm">各科目进度</Text>
              <div style={{ marginTop: 8 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8 }}>
                  <span className="responsive-text-sm">语文</span>
                  <span className="responsive-text-sm">75%</span>
                </div>
                <Progress percent={75} size="small" strokeWidth={4} />
                
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8, marginTop: 8 }}>
                  <span className="responsive-text-sm">数学</span>
                  <span className="responsive-text-sm">60%</span>
                </div>
                <Progress percent={60} size="small" strokeWidth={4} />
                
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8, marginTop: 8 }}>
                  <span className="responsive-text-sm">英语</span>
                  <span className="responsive-text-sm">80%</span>
                </div>
                <Progress percent={80} size="small" strokeWidth={4} />
              </div>
            </div>
          </Card>
        </Col>

        <Col xs={24} lg={12}>
          <Card 
            title="最近任务" 
            extra={<Button type="link" size="small">查看全部</Button>}
            size="small"
          >
            <List
              dataSource={recentTasks}
              size="small"
              renderItem={(item) => (
                <List.Item
                  actions={[
                    <Button type="link" icon={<RightOutlined />} size="small">
                      查看
                    </Button>
                  ]}
                  style={{ padding: '8px 0' }}
                >
                  <List.Item.Meta
                    avatar={
                      <Avatar 
                        size="small"
                        style={{ 
                          backgroundColor: item.isCompleted ? '#52c41a' : '#1890ff' 
                        }}
                        icon={item.isCompleted ? <CheckCircleOutlined /> : <ClockCircleOutlined />}
                      />
                    }
                    title={
                      <div style={{ display: 'flex', alignItems: 'center', gap: 8, flexWrap: 'wrap' }}>
                        <span 
                          className="responsive-text-sm"
                          style={{ 
                            textDecoration: item.isCompleted ? 'line-through' : 'none',
                            opacity: item.isCompleted ? 0.6 : 1
                          }}
                        >
                          {item.title}
                        </span>
                        <Tag color={getPriorityColor(item.priority)}>
                          {getPriorityText(item.priority)}
                        </Tag>
                      </div>
                    }
                    description={
                      <div>
                        <Text type="secondary" className="responsive-text-xs">{item.subject}</Text>
                        <br />
                        <Text type="secondary" className="responsive-text-xs">截止：{item.dueDate}</Text>
                      </div>
                    }
                  />
                </List.Item>
              )}
            />
          </Card>
        </Col>
      </Row>

      {/* 学科分类展示 */}
      <Row gutter={[16, 16]} style={{ marginTop: 24 }}>
        <Col xs={24}>
          <Card 
            title="学科分类" 
            extra={<Button type="link" size="small">查看全部</Button>}
            size="small"
          >
            {subjectsByCategory.length > 0 ? (
              <div>
                {(() => {
                  // 按分类分组学科
                  const groupedSubjects = subjectsByCategory.reduce((acc, subject) => {
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

                  return Object.entries(groupedSubjects).map(([categoryName, group]) => (
                    <div key={categoryName} style={{ marginBottom: 24 }}>
                      <div style={{ 
                        display: 'flex', 
                        alignItems: 'center', 
                        marginBottom: 12,
                        paddingBottom: 8,
                        borderBottom: '1px solid #f0f0f0'
                      }}>
                        <div 
                          style={{ 
                            width: 4, 
                            height: 20, 
                            backgroundColor: group.category?.color || '#1890ff',
                            marginRight: 8,
                            borderRadius: 2
                          }} 
                        />
                        <Title level={4} style={{ margin: 0, color: group.category?.color || '#1890ff' }}>
                          {categoryName}
                        </Title>
                        <Tag color="blue" style={{ marginLeft: 8 }}>
                          {group.subjects.length} 个学科
                        </Tag>
                      </div>
                      
                      <Row gutter={[12, 12]}>
                        {group.subjects.map(subject => (
                          <Col xs={24} sm={12} md={8} lg={6} key={subject.id}>
                            <Card 
                              size="small"
                              hoverable
                              style={{ 
                                border: `1px solid ${subject.color || '#d9d9d9'}`,
                                borderRadius: 8
                              }}
                            >
                              <div style={{ textAlign: 'center' }}>
                                <div 
                                  style={{ 
                                    width: 40, 
                                    height: 40, 
                                    backgroundColor: subject.color || '#1890ff',
                                    borderRadius: '50%',
                                    margin: '0 auto 8px',
                                    display: 'flex',
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    color: 'white',
                                    fontSize: '18px'
                                  }}
                                >
                                  {subject.icon === 'book' && <BookOutlined />}
                                  {subject.icon === 'calculator' && <TrophyOutlined />}
                                  {subject.icon === 'globe' && <StarOutlined />}
                                  {!subject.icon && <BookOutlined />}
                                </div>
                                <div className="responsive-text-sm" style={{ fontWeight: 'bold', marginBottom: 4 }}>
                                  {subject.name}
                                </div>
                                <div className="responsive-text-xs" style={{ color: '#666', marginBottom: 8 }}>
                                  {subject.description || '暂无描述'}
                                </div>
                                <div style={{ display: 'flex', justifyContent: 'center', gap: 4 }}>
                                  {subject.is_core_subject && (
                                    <Tag color="red">核心</Tag>
                                  )}
                                  <Tag color="blue">
                                    难度 {subject.difficulty_level}
                                  </Tag>
                                </div>
                              </div>
                            </Card>
                          </Col>
                        ))}
                      </Row>
                    </div>
                  ));
                })()}
              </div>
            ) : (
              <div style={{ textAlign: 'center', padding: '40px 0', color: '#999' }}>
                暂无学科数据
              </div>
            )}
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default Dashboard;
