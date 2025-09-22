"""
测试JWT令牌
"""
from app.core.security import verify_token, create_access_token
from datetime import timedelta

# 测试创建令牌
test_data = {"sub": "2604ab4e-e2de-4f62-a176-270e5b0bd092"}
token = create_access_token(test_data, timedelta(minutes=30))
print(f"Created token: {token}")

# 测试验证令牌
payload = verify_token(token)
print(f"Verified payload: {payload}")

# 测试无效令牌
invalid_payload = verify_token("invalid_token")
print(f"Invalid token result: {invalid_payload}")
