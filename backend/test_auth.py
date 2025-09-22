"""
测试认证API
"""
from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from app.core.database import get_db
from app.models.chinese_notes import ChineseNotes
from app.models.user import User
from app.core.security import verify_token

app = FastAPI(title="测试认证API")

# 配置OAuth2
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/v1/auth/login")

# 添加CORS中间件
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:9003"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    """获取当前用户"""
    print(f"Received token: {token}")  # 调试信息
    try:
        payload = verify_token(token)
        if payload is None:
            print("Token verification failed")
            raise HTTPException(
                status_code=401,
                detail="无效的令牌",
                headers={"WWW-Authenticate": "Bearer"},
            )
        
        user_id = payload.get("sub")
        user = db.query(User).filter(User.id == user_id).first()
        if user is None:
            print(f"User not found: {user_id}")
            raise HTTPException(
                status_code=404,
                detail="用户不存在"
            )
        
        print(f"User found: {user.username}")
        return user
    except Exception as e:
        print(f"Authentication error: {e}")
        raise HTTPException(
            status_code=401,
            detail="认证失败",
            headers={"WWW-Authenticate": "Bearer"},
        )

@app.get("/test-auth")
def test_auth(current_user: User = Depends(get_current_user)):
    """测试认证"""
    return {"message": f"Hello {current_user.username}!", "user_id": str(current_user.id)}

@app.get("/test-notes")
def test_notes(current_user: User = Depends(get_current_user), db: Session = Depends(get_db)):
    """测试笔记权限控制"""
    # 只返回当前用户的笔记
    notes = db.query(ChineseNotes).filter(ChineseNotes.user_id == current_user.id).all()
    return {
        "user": current_user.username,
        "notes_count": len(notes),
        "notes": [{"title": note.title, "is_public": note.is_public, "is_shared": note.is_shared} for note in notes]
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=9004)
