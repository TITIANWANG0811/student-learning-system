import React from 'react';
import { Typography } from 'antd';

const { Text } = Typography;

interface VocabularyDetailCardProps {
  selectedWord: any;
}

const VocabularyDetailCard: React.FC<VocabularyDetailCardProps> = ({ selectedWord }) => {
  const parseContent = () => {
    const lines = selectedWord.content.split('\n');
    let wordInfo: any = {};
    let examples: string[] = [];
    let memoryMethods: any = {};
    let relatedWords: any = {};
    
  // 解析所有内容
  lines.forEach((line: string, index: number) => {
      const trimmedLine = line.trim();
      if (!trimmedLine) return;
      
      // 音标
      if (trimmedLine.includes('**音标**:') || (trimmedLine.includes('/') && !trimmedLine.includes('http') && !trimmedLine.includes('#'))) {
        const phonetic = trimmedLine
          .replace(/^>\s*-\s*\*\*音标\*\*:\s*/, '')
          .replace(/\*\*音标\*\*:\s*/, '')
          .replace(/>/g, '')
          .replace(/\*/g, '')
          .replace(/^[-•]\s*/, '')
          .replace(/#[a-zA-Z0-9\-/]+/g, '')
          .replace(/^#+\s*/, '')
          .trim();
        
        if (phonetic && (phonetic.includes('/') || phonetic.includes('[') || phonetic.includes(']'))) {
          wordInfo.phonetic = phonetic;
        }
      }
      
      // 词性
      else if (trimmedLine.includes('**词性**:') || trimmedLine.includes('词性:')) {
        const posText = trimmedLine
          .replace(/^>\s*-\s*\*\*词性\*\*:\s*/, '')
          .replace(/\*\*词性\*\*:\s*/, '')
          .replace(/词性:\s*/, '')
          .replace(/>/g, '')
          .replace(/\*/g, '')
          .replace(/^[-•]\s*/, '')
          .replace(/#[a-zA-Z0-9\-/]+/g, '')
          .replace(/^#+\s*/, '')
          .trim();
        
        if (posText) {
          wordInfo.pos = posText;
        }
      }
      
      // 中文释义
      else if (trimmedLine.includes('**中文释义**:') || trimmedLine.includes('中文释义:')) {
        const meaning = trimmedLine
          .replace(/^>\s*-\s*\*\*中文释义\*\*:\s*/, '')
          .replace(/\*\*中文释义\*\*:\s*/, '')
          .replace(/中文释义:\s*/, '')
          .replace(/>/g, '')
          .replace(/\*/g, '')
          .replace(/^[-•]\s*/, '')
          .replace(/#[a-zA-Z0-9\-/]+/g, '')
          .replace(/^#+\s*/, '')
          .trim();
        
        if (meaning) {
          wordInfo.meaning = meaning;
        }
      }
      
      // 例句
      else if (trimmedLine.includes('**例句**:') || /^\d+\./.test(trimmedLine) || /^[A-Z][a-z].*\./.test(trimmedLine) || /^>\s*\d+\./.test(trimmedLine) || trimmedLine.includes('[!note] 例句')) {
        const example = trimmedLine
          .replace(/^>\s*-\s*\*\*例句\*\*:\s*/, '')
          .replace(/\*\*例句\*\*:\s*/, '')
          .replace(/^>\s*\[!note\]\s*例句\s*/, '')
          .replace(/\[!note\]\s*例句\s*/, '')
          .replace(/>/g, '')
          .replace(/\*/g, '')
          .replace(/^[-•]\s*/, '')
          .replace(/^\d+\.\s*/, '')
          .replace(/#[a-zA-Z0-9\-/]+/g, '')
          .trim();
        
        if (example && example.length > 10) {
          examples.push(example);
        }
      }
      
      // 联想记忆
      else if (trimmedLine.includes('**联想记忆**:') || trimmedLine.includes('**记忆**:') || trimmedLine.includes('联想记忆') || trimmedLine.includes('记忆') || trimmedLine.includes('[!tip] 联想记忆')) {
        let memoryLines: string[] = [];
        let currentIndex = index;
        
        while (currentIndex < lines.length) {
          const currentLine = lines[currentIndex].trim();
          if (!currentLine) {
            currentIndex++;
            continue;
          }
          
          if (currentIndex > index && (
            currentLine.includes('**相关词汇**:') || 
            currentLine.includes('**近义词**:') || 
            currentLine.includes('**反义词**:') ||
            currentLine.includes('[!abstract] 相关词汇') ||
            currentLine.includes('**例句**:') ||
            currentLine.includes('[!note] 例句') ||
            currentLine.startsWith('##') ||
            currentLine.startsWith('#')
          )) {
            break;
          }
          
          const cleanedLine = currentLine
            .replace(/^>\s*-\s*\*\*联想记忆\*\*:\s*/, '')
            .replace(/\*\*联想记忆\*\*:\s*/, '')
            .replace(/\*\*记忆\*\*:\s*/, '')
            .replace(/联想记忆:\s*/, '')
            .replace(/记忆:\s*/, '')
            .replace(/^>\s*\[!tip\]\s*联想记忆\s*/, '')
            .replace(/\[!tip\]\s*联想记忆\s*/, '')
            .replace(/>/g, '')
            .replace(/\*/g, '')
            .replace(/^[-•]\s*/, '')
            .replace(/#[a-zA-Z0-9\-/]+/g, '')
            .trim();
          
          if (cleanedLine) {
            memoryLines.push(cleanedLine);
          }
          
          currentIndex++;
        }
        
        // 解析记忆方法
        memoryLines.forEach(line => {
          if (line.includes('拆分记忆法')) {
            memoryMethods.split = line.replace('拆分记忆法:', '').trim();
          } else if (line.includes('场景记忆法')) {
            memoryMethods.scenario = line.replace('场景记忆法:', '').trim();
          } else if (line.includes('谐音记忆法')) {
            memoryMethods.homophonic = line.replace('谐音记忆法:', '').trim();
          }
        });
      }
      
      // 相关词汇
      else if (trimmedLine.includes('**相关词汇**:') || trimmedLine.includes('**近义词**:') || trimmedLine.includes('**反义词**:') || trimmedLine.includes('[!abstract] 相关词汇')) {
        let relatedLines: string[] = [];
        let currentIndex = index;
        
        while (currentIndex < lines.length) {
          const currentLine = lines[currentIndex].trim();
          if (!currentLine) {
            currentIndex++;
            continue;
          }
          
          if (currentIndex > index && (
            currentLine.includes('**联想记忆**:') || 
            currentLine.includes('**记忆**:') ||
            currentLine.includes('[!tip] 联想记忆') ||
            currentLine.includes('**例句**:') ||
            currentLine.includes('[!note] 例句') ||
            currentLine.startsWith('##') ||
            currentLine.startsWith('#')
          )) {
            break;
          }
          
          const cleanedLine = currentLine
            .replace(/^>\s*-\s*\*\*相关词汇\*\*:\s*/, '')
            .replace(/\*\*相关词汇\*\*:\s*/, '')
            .replace(/\*\*近义词\*\*:\s*/, '')
            .replace(/\*\*反义词\*\*:\s*/, '')
            .replace(/^>\s*\[!abstract\]\s*相关词汇\s*/, '')
            .replace(/\[!abstract\]\s*相关词汇\s*/, '')
            .replace(/>/g, '')
            .replace(/\*/g, '')
            .replace(/^[-•]\s*/, '')
            .replace(/#[a-zA-Z0-9\-/]+/g, '')
            .trim();
          
          if (cleanedLine) {
            relatedLines.push(cleanedLine);
          }
          
          currentIndex++;
        }
        
        // 解析相关词汇
        relatedLines.forEach(line => {
          if (line.includes('近义词:')) {
            relatedWords.synonyms = line.replace('近义词:', '').split(',').map(w => w.trim()).filter(w => w);
          } else if (line.includes('反义词:')) {
            relatedWords.antonyms = line.replace('反义词:', '').split(',').map(w => w.trim()).filter(w => w);
          } else if (line.includes('派生词:')) {
            relatedWords.derivatives = line.replace('派生词:', '').split(',').map(w => w.trim()).filter(w => w);
          }
        });
      }
    });
    
    return { wordInfo, examples, memoryMethods, relatedWords };
  };

  const { wordInfo, examples, memoryMethods, relatedWords } = parseContent();

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
      {/* 单词信息 */}
      <div style={{ 
        background: '#ffffff', 
        borderRadius: '12px',
        border: '1px solid #e0e0e0',
        overflow: 'hidden'
      }}>
        <div style={{ 
          display: 'flex', 
          alignItems: 'center', 
          padding: '16px 20px',
          background: '#f5f5f5',
          borderBottom: '1px solid #e0e0e0'
        }}>
          <div style={{
            background: '#2196f3',
            color: 'white',
            borderRadius: '50%',
            width: '32px',
            height: '32px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            marginRight: 12,
            fontSize: '16px'
          }}>
            ℹ️
          </div>
          <Text style={{ fontSize: 18, fontWeight: '600', color: '#333' }}>
            单词基本信息
          </Text>
        </div>
        <div style={{ padding: '20px' }}>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '16px' }}>
            <div>
              <Text style={{ fontSize: 14, color: '#666', marginBottom: 4 }}>单词</Text>
              <Text style={{ fontSize: 18, fontWeight: 'bold', color: '#333' }}>{selectedWord.title}</Text>
            </div>
            {wordInfo.phonetic && (
              <div>
                <Text style={{ fontSize: 14, color: '#666', marginBottom: 4 }}>音标</Text>
                <Text style={{ fontSize: 16, color: '#333' }}>{wordInfo.phonetic}</Text>
              </div>
            )}
            {wordInfo.pos && (
              <div>
                <Text style={{ fontSize: 14, color: '#666', marginBottom: 4 }}>词性</Text>
                <Text style={{ fontSize: 16, color: '#333' }}>{wordInfo.pos}</Text>
              </div>
            )}
            {wordInfo.meaning && (
              <div style={{ gridColumn: '1 / -1' }}>
                <Text style={{ fontSize: 14, color: '#666', marginBottom: 4 }}>中文释义</Text>
                <Text style={{ fontSize: 16, color: '#333' }}>{wordInfo.meaning}</Text>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* 详细内容 - 例句 */}
      {examples.length > 0 && (
        <div style={{ 
          background: '#ffffff', 
          borderRadius: '12px',
          border: '1px solid #e0e0e0',
          overflow: 'hidden'
        }}>
          <div style={{ 
            display: 'flex', 
            alignItems: 'center', 
            padding: '16px 20px',
            background: '#f5f5f5',
            borderBottom: '1px solid #e0e0e0'
          }}>
            <div style={{
              background: '#4caf50',
              color: 'white',
              borderRadius: '50%',
              width: '32px',
              height: '32px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              marginRight: 12,
              fontSize: '16px'
            }}>
              📝
            </div>
            <Text style={{ fontSize: 18, fontWeight: '600', color: '#333' }}>
              例句
            </Text>
          </div>
          <div style={{ padding: '20px' }}>
            {examples.map((example, idx) => (
              <div key={idx} style={{ 
                marginBottom: idx < examples.length - 1 ? '12px' : '0',
                padding: '12px',
                background: '#f8f9fa',
                borderRadius: '8px',
                fontSize: '15px',
                lineHeight: '1.6',
                color: '#333'
              }}>
                {idx + 1}. {example}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* 联想记忆 */}
      {(memoryMethods.split || memoryMethods.scenario || memoryMethods.homophonic) && (
        <div style={{ 
          background: '#ffffff', 
          borderRadius: '12px',
          border: '1px solid #e0e0e0',
          overflow: 'hidden'
        }}>
          <div style={{ 
            display: 'flex', 
            alignItems: 'center', 
            padding: '16px 20px',
            background: '#f5f5f5',
            borderBottom: '1px solid #e0e0e0'
          }}>
            <div style={{
              background: '#9c27b0',
              color: 'white',
              borderRadius: '50%',
              width: '32px',
              height: '32px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              marginRight: 12,
              fontSize: '16px'
            }}>
              💡
            </div>
            <Text style={{ fontSize: 18, fontWeight: '600', color: '#333' }}>
              联想记忆
            </Text>
          </div>
          <div style={{ padding: '20px' }}>
            {memoryMethods.split && (
              <div style={{ marginBottom: '16px' }}>
                <Text style={{ fontSize: 14, fontWeight: '600', color: '#9c27b0', marginBottom: '8px' }}>
                  拆分记忆法
                </Text>
                <Text style={{ fontSize: 14, color: '#666', lineHeight: '1.5' }}>
                  {memoryMethods.split}
                </Text>
              </div>
            )}
            {memoryMethods.scenario && (
              <div style={{ marginBottom: '16px' }}>
                <Text style={{ fontSize: 14, fontWeight: '600', color: '#9c27b0', marginBottom: '8px' }}>
                  场景记忆法
                </Text>
                <Text style={{ fontSize: 14, color: '#666', lineHeight: '1.5' }}>
                  {memoryMethods.scenario}
                </Text>
              </div>
            )}
            {memoryMethods.homophonic && (
              <div>
                <Text style={{ fontSize: 14, fontWeight: '600', color: '#9c27b0', marginBottom: '8px' }}>
                  谐音记忆法
                </Text>
                <Text style={{ fontSize: 14, color: '#666', lineHeight: '1.5' }}>
                  {memoryMethods.homophonic}
                </Text>
              </div>
            )}
          </div>
        </div>
      )}

      {/* 相关词汇 */}
      {(relatedWords.synonyms || relatedWords.antonyms || relatedWords.derivatives) && (
        <div style={{ 
          background: '#ffffff', 
          borderRadius: '12px',
          border: '1px solid #e0e0e0',
          overflow: 'hidden'
        }}>
          <div style={{ 
            display: 'flex', 
            alignItems: 'center', 
            padding: '16px 20px',
            background: '#f5f5f5',
            borderBottom: '1px solid #e0e0e0'
          }}>
            <div style={{
              background: '#4caf50',
              color: 'white',
              borderRadius: '50%',
              width: '32px',
              height: '32px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              marginRight: 12,
              fontSize: '16px'
            }}>
              🔗
            </div>
            <Text style={{ fontSize: 18, fontWeight: '600', color: '#333' }}>
              相关词汇
            </Text>
          </div>
          <div style={{ padding: '20px' }}>
            {relatedWords.synonyms && (
              <div style={{ marginBottom: '16px' }}>
                <Text style={{ fontSize: 14, fontWeight: '600', color: '#4caf50', marginBottom: '8px' }}>
                  近义词
                </Text>
                <Text style={{ fontSize: 14, color: '#666', lineHeight: '1.5' }}>
                  {relatedWords.synonyms.join(', ')}
                </Text>
              </div>
            )}
            {relatedWords.antonyms && (
              <div style={{ marginBottom: '16px' }}>
                <Text style={{ fontSize: 14, fontWeight: '600', color: '#f44336', marginBottom: '8px' }}>
                  反义词
                </Text>
                <Text style={{ fontSize: 14, color: '#666', lineHeight: '1.5' }}>
                  {relatedWords.antonyms.join(', ')}
                </Text>
              </div>
            )}
            {relatedWords.derivatives && (
              <div>
                <Text style={{ fontSize: 14, fontWeight: '600', color: '#2196f3', marginBottom: '8px' }}>
                  派生词
                </Text>
                <Text style={{ fontSize: 14, color: '#666', lineHeight: '1.5' }}>
                  {relatedWords.derivatives.join(', ')}
                </Text>
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
};

export default VocabularyDetailCard;
