import React, { useState, useEffect } from 'react';
import { Card, Button, Table, Tag, Space, Modal, Form, Input, Select, message, Radio, Progress } from 'antd';
import { PlayCircleOutlined, EyeOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons';
import { useAuth } from '../contexts/AuthContext';

const { Option } = Select;

interface PracticeQuestion {
  id: string;
  subject: string;
  chapter: string;
  questionType: string;
  questionText: string;
  options?: string[];
  correctAnswer: string;
  difficultyLevel: number;
  points: number;
}

interface PracticeSession {
  id: string;
  subject: string;
  questionCount: number;
  completedCount: number;
  correctCount: number;
  startTime: string;
  endTime?: string;
  isCompleted: boolean;
}

const Practice: React.FC = () => {
  const { user } = useAuth();
  const [questions, setQuestions] = useState<PracticeQuestion[]>([]);
  const [sessions, setSessions] = useState<PracticeSession[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalVisible, setModalVisible] = useState(false);
  const [currentQuestion, setCurrentQuestion] = useState<PracticeQuestion | null>(null);
  const [userAnswer, setUserAnswer] = useState<string>('');
  const [showAnswer, setShowAnswer] = useState(false);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [form] = Form.useForm();

  useEffect(() => {
    fetchQuestions();
    fetchSessions();
  }, []);

  const fetchQuestions = async () => {
    setLoading(true);
    try {
      // 模拟数据
      setQuestions([
        {
          id: '1',
          subject: '数学',
          chapter: '第3章 二次函数',
          questionType: 'choice',
          questionText: '二次函数 y = x² - 4x + 3 的顶点坐标是？',
          options: ['(2, -1)', '(2, 1)', '(-2, -1)', '(-2, 1)'],
          correctAnswer: '(2, -1)',
          difficultyLevel: 3,
          points: 5,
        },
        {
          id: '2',
          subject: '英语',
          chapter: 'Unit 5',
          questionType: 'fill_blank',
          questionText: 'I _____ (go) to school every day.',
          correctAnswer: 'go',
          difficultyLevel: 2,
          points: 3,
        },
        {
          id: '3',
          subject: '语文',
          chapter: '古诗词',
          questionType: 'short_answer',
          questionText: '请默写《静夜思》的前两句。',
          correctAnswer: '床前明月光，疑是地上霜。',
          difficultyLevel: 4,
          points: 8,
        },
      ]);
    } catch (error) {
      message.error('获取练习题失败');
    } finally {
      setLoading(false);
    }
  };

  const fetchSessions = async () => {
    try {
      // 模拟数据
      setSessions([
        {
          id: '1',
          subject: '数学',
          questionCount: 10,
          completedCount: 8,
          correctCount: 6,
          startTime: '2024-01-15 14:00',
          endTime: '2024-01-15 14:30',
          isCompleted: true,
        },
        {
          id: '2',
          subject: '英语',
          questionCount: 15,
          completedCount: 5,
          correctCount: 4,
          startTime: '2024-01-16 10:00',
          isCompleted: false,
        },
      ]);
    } catch (error) {
      message.error('获取练习记录失败');
    }
  };

  const handleStartPractice = (subject: string) => {
    const subjectQuestions = questions.filter(q => q.subject === subject);
    if (subjectQuestions.length === 0) {
      message.warning('该学科暂无练习题');
      return;
    }

    const newSession: PracticeSession = {
      id: Date.now().toString(),
      subject,
      questionCount: subjectQuestions.length,
      completedCount: 0,
      correctCount: 0,
      startTime: new Date().toLocaleString('zh-CN'),
      isCompleted: false,
    };

    setSessions([newSession, ...sessions]);
    setSessionId(newSession.id);
    setCurrentQuestion(subjectQuestions[0]);
    setUserAnswer('');
    setShowAnswer(false);
    setModalVisible(true);
  };

  const handleNextQuestion = () => {
    if (!sessionId || !currentQuestion) return;

    const currentSession = sessions.find(s => s.id === sessionId);
    if (!currentSession) return;

    const subjectQuestions = questions.filter(q => q.subject === currentSession.subject);
    const currentIndex = subjectQuestions.findIndex(q => q.id === currentQuestion.id);
    
    if (currentIndex < subjectQuestions.length - 1) {
      setCurrentQuestion(subjectQuestions[currentIndex + 1]);
      setUserAnswer('');
      setShowAnswer(false);
    } else {
      // 完成练习
      setSessions(sessions.map(s => 
        s.id === sessionId 
          ? { ...s, isCompleted: true, endTime: new Date().toLocaleString('zh-CN') }
          : s
      ));
      setModalVisible(false);
      setSessionId(null);
      setCurrentQuestion(null);
      message.success('练习完成！');
    }
  };

  const handleSubmitAnswer = () => {
    if (!currentQuestion || !sessionId) return;

    const isCorrect = userAnswer.trim() === currentQuestion.correctAnswer;
    
    setSessions(sessions.map(s => 
      s.id === sessionId 
        ? { 
            ...s, 
            completedCount: s.completedCount + 1,
            correctCount: s.correctCount + (isCorrect ? 1 : 0)
          }
        : s
    ));

    setShowAnswer(true);
    message.info(isCorrect ? '回答正确！' : '回答错误，正确答案已显示');
  };

  const getQuestionTypeText = (type: string) => {
    const typeMap = {
      choice: '选择题',
      fill_blank: '填空题',
      short_answer: '简答题',
      essay: '论述题',
      calculation: '计算题',
    };
    return typeMap[type as keyof typeof typeMap] || type;
  };

  const getDifficultyColor = (level: number) => {
    switch (level) {
      case 1: return 'green';
      case 2: return 'blue';
      case 3: return 'orange';
      case 4: return 'red';
      case 5: return 'purple';
      default: return 'default';
    }
  };

  const getDifficultyText = (level: number) => {
    switch (level) {
      case 1: return '简单';
      case 2: return '容易';
      case 3: return '中等';
      case 4: return '困难';
      case 5: return '极难';
      default: return '未知';
    }
  };

  const columns = [
    {
      title: '学科',
      dataIndex: 'subject',
      key: 'subject',
      render: (subject: string) => <Tag color="blue">{subject}</Tag>,
    },
    {
      title: '题目数量',
      dataIndex: 'questionCount',
      key: 'questionCount',
    },
    {
      title: '完成进度',
      key: 'progress',
      render: (_: any, record: PracticeSession) => (
        <div>
          <Progress 
            percent={Math.round((record.completedCount / record.questionCount) * 100)} 
            size="small"
          />
          <div style={{ fontSize: 12, color: '#666' }}>
            {record.completedCount}/{record.questionCount}
          </div>
        </div>
      ),
    },
    {
      title: '正确率',
      key: 'accuracy',
      render: (_: any, record: PracticeSession) => {
        const accuracy = record.completedCount > 0 
          ? Math.round((record.correctCount / record.completedCount) * 100)
          : 0;
        return `${accuracy}%`;
      },
    },
    {
      title: '开始时间',
      dataIndex: 'startTime',
      key: 'startTime',
    },
    {
      title: '状态',
      dataIndex: 'isCompleted',
      key: 'isCompleted',
      render: (completed: boolean) => (
        <Tag color={completed ? 'success' : 'processing'}>
          {completed ? '已完成' : '进行中'}
        </Tag>
      ),
    },
    {
      title: '操作',
      key: 'action',
      render: (_: any, record: PracticeSession) => (
        <Space>
          <Button 
            type="link" 
            icon={<PlayCircleOutlined />} 
            size="small"
            onClick={() => handleStartPractice(record.subject)}
            disabled={!record.isCompleted}
          >
            {record.isCompleted ? '重新练习' : '继续练习'}
          </Button>
        </Space>
      ),
    },
  ];

  return (
    <div>
      <Card title="练习测试">
        <div style={{ marginBottom: 24 }}>
          <h3>选择学科开始练习</h3>
          <Space wrap>
            {['数学', '语文', '英语', '道法', '历史'].map(subject => (
              <Button
                key={subject}
                type="primary"
                size="large"
                onClick={() => handleStartPractice(subject)}
                style={{ marginBottom: 8 }}
              >
                {subject} 练习
              </Button>
            ))}
          </Space>
        </div>

        <h3>练习记录</h3>
        <Table
          columns={columns}
          dataSource={sessions}
          rowKey="id"
          loading={loading}
          pagination={{
            pageSize: 10,
            showSizeChanger: true,
            showQuickJumper: true,
            showTotal: (total) => `共 ${total} 条记录`,
          }}
        />
      </Card>

      <Modal
        title="练习测试"
        open={modalVisible}
        onCancel={() => setModalVisible(false)}
        footer={null}
        width={800}
      >
        {currentQuestion && (
          <div>
            <div style={{ marginBottom: 16 }}>
              <Tag color="blue">{currentQuestion.subject}</Tag>
              <Tag color="green">{currentQuestion.chapter}</Tag>
              <Tag color={getDifficultyColor(currentQuestion.difficultyLevel)}>
                {getDifficultyText(currentQuestion.difficultyLevel)}
              </Tag>
              <Tag>分值: {currentQuestion.points}</Tag>
            </div>

            <div style={{ marginBottom: 24, fontSize: 16, lineHeight: 1.6 }}>
              {currentQuestion.questionText}
            </div>

            {currentQuestion.questionType === 'choice' && currentQuestion.options && (
              <Radio.Group
                value={userAnswer}
                onChange={(e) => setUserAnswer(e.target.value)}
                disabled={showAnswer}
              >
                <Space direction="vertical">
                  {currentQuestion.options.map((option, index) => (
                    <Radio key={index} value={option}>
                      {option}
                    </Radio>
                  ))}
                </Space>
              </Radio.Group>
            )}

            {currentQuestion.questionType === 'fill_blank' && (
              <Input
                value={userAnswer}
                onChange={(e) => setUserAnswer(e.target.value)}
                placeholder="请输入答案"
                disabled={showAnswer}
                style={{ width: 200 }}
              />
            )}

            {currentQuestion.questionType === 'short_answer' && (
              <Input.TextArea
                value={userAnswer}
                onChange={(e) => setUserAnswer(e.target.value)}
                placeholder="请输入答案"
                rows={4}
                disabled={showAnswer}
              />
            )}

            {showAnswer && (
              <div style={{ 
                marginTop: 16, 
                padding: 16, 
                background: '#f6ffed', 
                border: '1px solid #b7eb8f',
                borderRadius: 6
              }}>
                <div style={{ fontWeight: 'bold', marginBottom: 8 }}>正确答案：</div>
                <div>{currentQuestion.correctAnswer}</div>
              </div>
            )}

            <div style={{ marginTop: 24, textAlign: 'right' }}>
              <Space>
                <Button onClick={() => setModalVisible(false)}>
                  退出练习
                </Button>
                {!showAnswer ? (
                  <Button type="primary" onClick={handleSubmitAnswer}>
                    提交答案
                  </Button>
                ) : (
                  <Button type="primary" onClick={handleNextQuestion}>
                    下一题
                  </Button>
                )}
              </Space>
            </div>
          </div>
        )}
      </Modal>
    </div>
  );
};

export default Practice;
