import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import { ConfigProvider } from 'antd';
import zhCN from 'antd/locale/zh_CN';
import 'antd/dist/reset.css';
import './styles/responsive.css';

import Layout from './components/Layout';
import Login from './pages/Login';
import Register from './pages/Register';
import Dashboard from './pages/Dashboard';
import StudyPlan from './pages/StudyPlan';
import StudyTasks from './pages/StudyTasks';
import Notes from './pages/Notes';
import Assignments from './pages/Assignments';
import Practice from './pages/Practice';
import Exams from './pages/Exams';
import Progress from './pages/Progress';
import SubjectCategories from './pages/SubjectCategories';
import StudyContent from './pages/StudyContent';
import SubjectPage from './pages/SubjectPage';
import ScrollTest from './pages/ScrollTest';
import Vocabulary from './pages/Vocabulary';
import ModalTest from './pages/ModalTest';
import Settings from './pages/Settings';

import { AuthProvider } from './contexts/AuthContext';

const App: React.FC = () => {
  return (
    <ConfigProvider locale={zhCN}>
      <AuthProvider>
        <Router>
          <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
            <Route path="/" element={<Layout />}>
              <Route index element={<Navigate to="/dashboard" replace />} />
              <Route path="dashboard" element={<Dashboard />} />
              <Route path="study-plan" element={<StudyPlan />} />
              <Route path="study-tasks" element={<StudyTasks />} />
              <Route path="notes" element={<Notes />} />
              <Route path="assignments" element={<Assignments />} />
              <Route path="practice" element={<Practice />} />
              <Route path="exams" element={<Exams />} />
              <Route path="progress" element={<Progress />} />
              
              {/* 学科分类路由 */}
              <Route path="subject-categories" element={<SubjectCategories />} />
              <Route path="study-content" element={<StudyContent />} />
              
              {/* 笔记学科路由 */}
              <Route path="notes/chinese" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/chinese/:grade" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/math" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/math/:grade" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/english" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/english/:grade" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/history" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/history/:grade" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/ethics" element={<SubjectPage contentType="notes" />} />
              <Route path="notes/ethics/:grade" element={<SubjectPage contentType="notes" />} />
              
              {/* 作业学科路由 */}
              <Route path="assignments/chinese" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/chinese/:grade" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/math" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/math/:grade" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/english" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/english/:grade" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/history" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/history/:grade" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/ethics" element={<SubjectPage contentType="assignments" />} />
              <Route path="assignments/ethics/:grade" element={<SubjectPage contentType="assignments" />} />
              
              {/* 练习学科路由 */}
              <Route path="practice/chinese" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/chinese/:grade" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/math" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/math/:grade" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/english" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/english/:grade" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/history" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/history/:grade" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/ethics" element={<SubjectPage contentType="practice" />} />
              <Route path="practice/ethics/:grade" element={<SubjectPage contentType="practice" />} />
              
              {/* 考试学科路由 */}
              <Route path="exams/chinese" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/chinese/:grade" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/math" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/math/:grade" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/english" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/english/:grade" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/history" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/history/:grade" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/ethics" element={<SubjectPage contentType="exams" />} />
              <Route path="exams/ethics/:grade" element={<SubjectPage contentType="exams" />} />
              
              {/* 思维导图学科路由 */}
              <Route path="mind-maps/chinese" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/chinese/:grade" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/math" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/math/:grade" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/english" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/english/:grade" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/history" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/history/:grade" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/ethics" element={<SubjectPage contentType="mind-maps" />} />
              <Route path="mind-maps/ethics/:grade" element={<SubjectPage contentType="mind-maps" />} />
              
              {/* 默写学科路由 */}
              <Route path="recitations/chinese" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/chinese/:grade" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/math" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/math/:grade" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/english" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/english/:grade" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/history" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/history/:grade" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/ethics" element={<SubjectPage contentType="recitations" />} />
              <Route path="recitations/ethics/:grade" element={<SubjectPage contentType="recitations" />} />
              
              {/* 错题本学科路由 */}
              <Route path="wrong-questions/chinese" element={<SubjectPage contentType="wrong-questions" />} />
              <Route path="wrong-questions/chinese/:grade" element={<SubjectPage contentType="wrong-questions" />} />
              <Route path="wrong-questions/math" element={<SubjectPage contentType="wrong-questions" />} />
              <Route path="wrong-questions/math/:grade" element={<SubjectPage contentType="wrong-questions" />} />
              <Route path="wrong-questions/english" element={<SubjectPage contentType="wrong-questions" />} />
              <Route path="wrong-questions/english/:grade" element={<SubjectPage contentType="wrong-questions" />} />
              <Route path="wrong-questions/history" element={<SubjectPage contentType="wrong-questions" />} />
              <Route path="wrong-questions/history/:grade" element={<SubjectPage contentType="wrong-questions" />} />
                     <Route path="wrong-questions/ethics" element={<SubjectPage contentType="wrong-questions" />} />
                     <Route path="wrong-questions/ethics/:grade" element={<SubjectPage contentType="wrong-questions" />} />
                     <Route path="vocabulary" element={<Vocabulary />} />
                     <Route path="modal-test" element={<ModalTest />} />
                     <Route path="scroll-test" element={<ScrollTest />} />
                     <Route path="settings" element={<Settings />} />
            </Route>
          </Routes>
        </Router>
      </AuthProvider>
    </ConfigProvider>
  );
};

export default App;