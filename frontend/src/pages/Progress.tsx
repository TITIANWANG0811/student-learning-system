import React, { useState, useEffect } from 'react';
import { Card, Row, Col, Progress as AntProgress, Statistic, Table, Tag, Select, DatePicker, Space } from 'antd';
import { TrophyOutlined, ClockCircleOutlined, BookOutlined, CheckCircleOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Option } = Select;
const { RangePicker } = DatePicker;

interface SubjectProgress {
  subject: string;
  totalTasks: number;
  completedTasks: number;
  studyTime: number;
  accuracy: number;
  lastStudied: string;
}

interface WeeklyProgress {
  week: string;
  studyTime: number;
  completedTasks: number;
  accuracy: number;
}

const Progress: React.FC = () => {
  const { user } = useAuth();
  const [subjectProgress, setSubjectProgress] = useState<SubjectProgress[]>([]);
  const [weeklyProgress, setWeeklyProgress] = useState<WeeklyProgress[]>([]);
  const [selectedSubject, setSelectedSubject] = useState<string>('');
  const [dateRange, setDateRange] = useState<[any, any] | null>(null);

  useEffect(() => {
    fetchProgressData();
  }, []);

  const fetchProgressData = async () => {
    try {
      // 模拟数据
      setSubjectProgress([
        {
          subject: '数学',
          totalTasks: 20,
          completedTasks: 15,
          studyTime: 300,
          accuracy: 85,
          lastStudied: '2024-01-15',
        },
        {
          subject: '语文',
          totalTasks: 18,
          completedTasks: 12,
          studyTime: 250,
          accuracy: 78,
          lastStudied: '2024-01-14',
        },
        {
          subject: '英语',
          totalTasks: 25,
          completedTasks: 20,
          studyTime: 400,
          accuracy: 92,
          lastStudied: '2024-01-16',
        },
        {
          subject: '道法',
          totalTasks: 15,
          completedTasks: 8,
          studyTime: 180,
          accuracy: 75,
          lastStudied: '2024-01-13',
        },
        {
          subject: '历史',
          totalTasks: 22,
          completedTasks: 16,
          studyTime: 320,
          accuracy: 88,
          lastStudied: '2024-01-15',
        },
      ]);

      setWeeklyProgress([
        { week: '第1周', studyTime: 1200, completedTasks: 45, accuracy: 82 },
        { week: '第2周', studyTime: 1350, completedTasks: 52, accuracy: 85 },
        { week: '第3周', studyTime: 1100, completedTasks: 38, accuracy: 79 },
        { week: '第4周', studyTime: 1400, completedTasks: 48, accuracy: 87 },
      ]);
    } catch (error) {
      console.error('获取进度数据失败:', error);
    }
  };

  const getSubjectColor = (subject: string) => {
    const colorMap: { [key: string]: string } = {
      '数学': '#1890ff',
      '语文': '#52c41a',
      '英语': '#faad14',
      '道法': '#f5222d',
      '历史': '#722ed1',
    };
    return colorMap[subject] || '#666';
  };

  const getAccuracyStatus = (accuracy: number) => {
    if (accuracy >= 90) return 'success';
    if (accuracy >= 80) return 'normal';
    if (accuracy >= 70) return 'active';
    return 'exception';
  };

  const filteredSubjectProgress = selectedSubject 
    ? subjectProgress.filter(item => item.subject === selectedSubject)
    : subjectProgress;

  const subjectColumns = [
    {
      title: '学科',
      dataIndex: 'subject',
      key: 'subject',
      render: (subject: string) => (
        <Tag color={getSubjectColor(subject)} style={{ fontSize: 14, padding: '4px 8px' }}>
          {subject}
        </Tag>
      ),
    },
    {
      title: '任务完成情况',
      key: 'tasks',
      render: (record: SubjectProgress) => (
        <div>
          <div style={{ marginBottom: 8 }}>
            {record.completedTasks}/{record.totalTasks} 个任务
          </div>
          <AntProgress 
            percent={Math.round((record.completedTasks / record.totalTasks) * 100)} 
            size="small"
            status={record.completedTasks === record.totalTasks ? 'success' : 'active'}
          />
        </div>
      ),
    },
    {
      title: '学习时间',
      dataIndex: 'studyTime',
      key: 'studyTime',
      render: (time: number) => (
        <div style={{ display: 'flex', alignItems: 'center' }}>
          <ClockCircleOutlined style={{ marginRight: 4, color: '#1890ff' }} />
          {time} 分钟
        </div>
      ),
    },
    {
      title: '准确率',
      dataIndex: 'accuracy',
      key: 'accuracy',
      render: (accuracy: number) => (
        <div>
          <div style={{ marginBottom: 8, fontWeight: 'bold' }}>{accuracy}%</div>
          <AntProgress 
            percent={accuracy} 
            size="small"
            status={getAccuracyStatus(accuracy)}
          />
        </div>
      ),
    },
    {
      title: '最后学习',
      dataIndex: 'lastStudied',
      key: 'lastStudied',
    },
  ];

  const weeklyColumns = [
    {
      title: '周次',
      dataIndex: 'week',
      key: 'week',
    },
    {
      title: '学习时间',
      dataIndex: 'studyTime',
      key: 'studyTime',
      render: (time: number) => `${time} 分钟`,
    },
    {
      title: '完成任务',
      dataIndex: 'completedTasks',
      key: 'completedTasks',
      render: (tasks: number) => `${tasks} 个`,
    },
    {
      title: '平均准确率',
      dataIndex: 'accuracy',
      key: 'accuracy',
      render: (accuracy: number) => (
        <Tag color={getAccuracyStatus(accuracy)}>{accuracy}%</Tag>
      ),
    },
  ];

  const totalStats = subjectProgress.reduce((acc, curr) => ({
    totalTasks: acc.totalTasks + curr.totalTasks,
    completedTasks: acc.completedTasks + curr.completedTasks,
    studyTime: acc.studyTime + curr.studyTime,
    accuracy: acc.accuracy + curr.accuracy,
  }), { totalTasks: 0, completedTasks: 0, studyTime: 0, accuracy: 0 });

  const averageAccuracy = subjectProgress.length > 0 
    ? Math.round(totalStats.accuracy / subjectProgress.length)
    : 0;

  return (
    <div>
      <Row gutter={[16, 16]} style={{ marginBottom: 24 }}>
        <Col xs={24} sm={12} lg={6}>
          <Card>
            <Statistic
              title="总任务数"
              value={totalStats.totalTasks}
              prefix={<BookOutlined />}
              valueStyle={{ color: '#1890ff' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card>
            <Statistic
              title="已完成任务"
              value={totalStats.completedTasks}
              prefix={<CheckCircleOutlined />}
              valueStyle={{ color: '#52c41a' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card>
            <Statistic
              title="总学习时间"
              value={totalStats.studyTime}
              suffix="分钟"
              prefix={<ClockCircleOutlined />}
              valueStyle={{ color: '#faad14' }}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} lg={6}>
          <Card>
            <Statistic
              title="平均准确率"
              value={averageAccuracy}
              suffix="%"
              prefix={<TrophyOutlined />}
              valueStyle={{ color: '#722ed1' }}
            />
          </Card>
        </Col>
      </Row>

      <Row gutter={[16, 16]}>
        <Col xs={24} lg={16}>
          <Card 
            title="各学科学习进度"
            extra={
              <Space>
                <Select
                  placeholder="选择学科"
                  value={selectedSubject}
                  onChange={setSelectedSubject}
                  style={{ width: 120 }}
                  allowClear
                >
                  <Option value="数学">数学</Option>
                  <Option value="语文">语文</Option>
                  <Option value="英语">英语</Option>
                  <Option value="道法">道法</Option>
                  <Option value="历史">历史</Option>
                </Select>
              </Space>
            }
          >
            <Table
              columns={subjectColumns}
              dataSource={filteredSubjectProgress}
              rowKey="subject"
              pagination={false}
            />
          </Card>
        </Col>

        <Col xs={24} lg={8}>
          <Card title="总体完成情况">
            <div style={{ textAlign: 'center', marginBottom: 24 }}>
              <AntProgress
                type="circle"
                percent={Math.round((totalStats.completedTasks / totalStats.totalTasks) * 100)}
                size={120}
                strokeColor={{
                  '0%': '#108ee9',
                  '100%': '#87d068',
                }}
              />
              <div style={{ marginTop: 16, fontSize: 16, fontWeight: 'bold' }}>
                任务完成率
              </div>
            </div>

            <div style={{ marginBottom: 16 }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 8 }}>
                <span>学习时间分布</span>
              </div>
              {subjectProgress.map(item => (
                <div key={item.subject} style={{ marginBottom: 8 }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 4 }}>
                    <span>{item.subject}</span>
                    <span>{item.studyTime}分钟</span>
                  </div>
                  <AntProgress
                    percent={Math.round((item.studyTime / totalStats.studyTime) * 100)}
                    size="small"
                    strokeColor={getSubjectColor(item.subject)}
                    showInfo={false}
                  />
                </div>
              ))}
            </div>
          </Card>
        </Col>
      </Row>

      <Row style={{ marginTop: 16 }}>
        <Col span={24}>
          <Card title="每周学习统计">
            <Table
              columns={weeklyColumns}
              dataSource={weeklyProgress}
              rowKey="week"
              pagination={false}
            />
          </Card>
        </Col>
      </Row>
    </div>
  );
};

export default Progress;
