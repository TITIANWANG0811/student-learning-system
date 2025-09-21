"""
Redis命名空间客户端
用于避免与其他项目的Redis键名冲突
"""
import redis
from typing import Any, Optional, Union
from config import settings


class RedisNamespaceClient:
    """带命名空间的Redis客户端"""
    
    def __init__(self, namespace: str = "sls:"):
        """
        初始化Redis客户端
        
        Args:
            namespace: 命名空间前缀，默认为 "sls:"
        """
        self.redis = redis.from_url(settings.redis_url, decode_responses=True)
        self.namespace = namespace
    
    def _get_key(self, key: str) -> str:
        """获取带命名空间的键名"""
        return f"{self.namespace}{key}"
    
    def get(self, key: str) -> Optional[str]:
        """获取值"""
        return self.redis.get(self._get_key(key))
    
    def set(self, key: str, value: Any, ex: Optional[int] = None, nx: bool = False) -> bool:
        """
        设置值
        
        Args:
            key: 键名
            value: 值
            ex: 过期时间（秒）
            nx: 仅在键不存在时设置
        """
        return self.redis.set(self._get_key(key), value, ex=ex, nx=nx)
    
    def delete(self, *keys: str) -> int:
        """删除键"""
        namespaced_keys = [self._get_key(key) for key in keys]
        return self.redis.delete(*namespaced_keys)
    
    def exists(self, key: str) -> bool:
        """检查键是否存在"""
        return bool(self.redis.exists(self._get_key(key)))
    
    def expire(self, key: str, time: int) -> bool:
        """设置键的过期时间"""
        return self.redis.expire(self._get_key(key), time)
    
    def ttl(self, key: str) -> int:
        """获取键的剩余生存时间"""
        return self.redis.ttl(self._get_key(key))
    
    def hget(self, name: str, key: str) -> Optional[str]:
        """获取哈希字段值"""
        return self.redis.hget(self._get_key(name), key)
    
    def hset(self, name: str, key: str, value: Any) -> int:
        """设置哈希字段值"""
        return self.redis.hset(self._get_key(name), key, value)
    
    def hgetall(self, name: str) -> dict:
        """获取所有哈希字段"""
        return self.redis.hgetall(self._get_key(name))
    
    def hdel(self, name: str, *keys: str) -> int:
        """删除哈希字段"""
        return self.redis.hdel(self._get_key(name), *keys)
    
    def lpush(self, name: str, *values: Any) -> int:
        """从左侧推入列表"""
        return self.redis.lpush(self._get_key(name), *values)
    
    def rpush(self, name: str, *values: Any) -> int:
        """从右侧推入列表"""
        return self.redis.rpush(self._get_key(name), *values)
    
    def lpop(self, name: str) -> Optional[str]:
        """从左侧弹出列表元素"""
        return self.redis.lpop(self._get_key(name))
    
    def rpop(self, name: str) -> Optional[str]:
        """从右侧弹出列表元素"""
        return self.redis.rpop(self._get_key(name))
    
    def llen(self, name: str) -> int:
        """获取列表长度"""
        return self.redis.llen(self._get_key(name))
    
    def lrange(self, name: str, start: int, end: int) -> list:
        """获取列表范围内的元素"""
        return self.redis.lrange(self._get_key(name), start, end)
    
    def sadd(self, name: str, *values: Any) -> int:
        """添加集合成员"""
        return self.redis.sadd(self._get_key(name), *values)
    
    def srem(self, name: str, *values: Any) -> int:
        """删除集合成员"""
        return self.redis.srem(self._get_key(name), *values)
    
    def smembers(self, name: str) -> set:
        """获取所有集合成员"""
        return self.redis.smembers(self._get_key(name))
    
    def sismember(self, name: str, value: Any) -> bool:
        """检查值是否为集合成员"""
        return self.redis.sismember(self._get_key(name), value)
    
    def zadd(self, name: str, mapping: dict) -> int:
        """添加有序集合成员"""
        return self.redis.zadd(self._get_key(name), mapping)
    
    def zrem(self, name: str, *values: Any) -> int:
        """删除有序集合成员"""
        return self.redis.zrem(self._get_key(name), *values)
    
    def zrange(self, name: str, start: int, end: int, withscores: bool = False) -> list:
        """获取有序集合范围内的成员"""
        return self.redis.zrange(self._get_key(name), start, end, withscores=withscores)
    
    def zscore(self, name: str, value: Any) -> Optional[float]:
        """获取有序集合成员的分数"""
        return self.redis.zscore(self._get_key(name), value)
    
    def keys(self, pattern: str = "*") -> list:
        """获取匹配模式的键名（包含命名空间）"""
        return self.redis.keys(self._get_key(pattern))
    
    def scan(self, cursor: int = 0, match: str = "*", count: int = 10) -> tuple:
        """扫描键名"""
        return self.redis.scan(cursor, match=self._get_key(match), count=count)
    
    def flushdb(self) -> bool:
        """清空当前数据库"""
        return self.redis.flushdb()
    
    def ping(self) -> bool:
        """测试连接"""
        try:
            return self.redis.ping()
        except:
            return False


# 创建全局Redis客户端实例
redis_client = RedisNamespaceClient()

# 为了向后兼容，提供原有的redis_client
from app.core.redis_client import redis_client as original_redis_client

# 如果需要使用原始Redis客户端，可以导入
# from app.core.redis_client import redis_client as original_redis_client
