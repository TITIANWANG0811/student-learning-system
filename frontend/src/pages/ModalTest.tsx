import React, { useState } from 'react';
import { Button, Modal, Space, Typography } from 'antd';
import { LeftOutlined, RightOutlined } from '@ant-design/icons';

const { Title, Text } = Typography;

const ModalTest: React.FC = () => {
  const [modalVisible, setModalVisible] = useState(false);
  const [currentIndex, setCurrentIndex] = useState(0);
  
  const testData = [
    { id: '1', title: 'ready', content: '准备好' },
    { id: '2', title: 'nervous', content: '紧张的' },
    { id: '3', title: 'excited', content: '兴奋的' }
  ];

  const currentItem = testData[currentIndex];

  const goToPrevious = () => {
    setCurrentIndex(prev => prev > 0 ? prev - 1 : testData.length - 1);
  };

  const goToNext = () => {
    setCurrentIndex(prev => prev < testData.length - 1 ? prev + 1 : 0);
  };

  return (
    <div style={{ padding: '24px' }}>
      <Title level={2}>模态框测试</Title>
      
      <Button 
        type="primary" 
        onClick={() => setModalVisible(true)}
        style={{ marginBottom: 20 }}
      >
        打开测试模态框
      </Button>

      <Modal
        title={null}
        open={modalVisible}
        onCancel={() => setModalVisible(false)}
        footer={null}
        width={800}
        style={{ top: 20 }}
        bodyStyle={{ 
          padding: 0, 
          maxHeight: '90vh', 
          overflow: 'hidden',
          display: 'flex',
          flexDirection: 'column'
        }}
      >
        {currentItem && (
          <div style={{ height: '100%', display: 'flex', flexDirection: 'column' }}>
            {/* 头部 */}
            <div style={{ 
              padding: '20px 30px', 
              borderBottom: '1px solid #f0f0f0',
              background: '#fafafa'
            }}>
              <Title level={3}>{currentItem.title}</Title>
              <Text type="secondary">
                第 {currentIndex + 1} 个，共 {testData.length} 个
              </Text>
            </div>

            {/* 内容 */}
            <div style={{ 
              flex: 1, 
              padding: '20px 30px',
              background: '#fff',
              minHeight: 0
            }}>
              <Text>{currentItem.content}</Text>
            </div>

            {/* 底部操作区 */}
            <div style={{ 
              padding: '20px 30px', 
              borderTop: '1px solid #f0f0f0',
              background: '#fafafa',
              flexShrink: 0
            }}>
              {/* 翻页控制 */}
              <div style={{ 
                display: 'flex', 
                justifyContent: 'center', 
                alignItems: 'center', 
                marginBottom: 16,
                gap: 16,
                background: '#e6f7ff',
                padding: '12px',
                borderRadius: '8px',
                border: '2px solid #1890ff'
              }}>
                <Button
                  type="primary"
                  icon={<LeftOutlined />}
                  onClick={goToPrevious}
                  size="large"
                  style={{ minWidth: 100, height: 48, fontSize: 16 }}
                >
                  上一个
                </Button>
                <Text style={{ 
                  fontSize: 18, 
                  minWidth: 140, 
                  textAlign: 'center',
                  fontWeight: 'bold'
                }}>
                  {currentIndex + 1} / {testData.length}
                </Text>
                <Button
                  type="primary"
                  icon={<RightOutlined />}
                  onClick={goToNext}
                  size="large"
                  style={{ minWidth: 100, height: 48, fontSize: 16 }}
                >
                  下一个
                </Button>
              </div>

              {/* 操作按钮 */}
              <div style={{ 
                display: 'flex', 
                justifyContent: 'center', 
                alignItems: 'center',
                gap: 16,
                background: '#f6ffed',
                padding: '12px',
                borderRadius: '8px',
                border: '2px solid #52c41a'
              }}>
                <Button
                  type="default"
                  onClick={() => setModalVisible(false)}
                  size="large"
                  style={{ minWidth: 100, height: 48, fontSize: 16 }}
                >
                  关闭
                </Button>
                <Button
                  type="primary"
                  size="large"
                  style={{ minWidth: 120, height: 48, fontSize: 16 }}
                >
                  测试按钮
                </Button>
              </div>
            </div>
          </div>
        )}
      </Modal>
    </div>
  );
};

export default ModalTest;
