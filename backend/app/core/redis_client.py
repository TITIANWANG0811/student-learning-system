"""
Redis客户端配置
"""
import redis
from config import settings

# 创建Redis连接
redis_client = redis.from_url(settings.redis_url, decode_responses=True)


def get_redis():
    """获取Redis客户端"""
    return redis_client
