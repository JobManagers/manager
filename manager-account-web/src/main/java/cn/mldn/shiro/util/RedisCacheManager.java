package cn.mldn.shiro.util;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.springframework.data.redis.core.RedisTemplate;

public class RedisCacheManager implements CacheManager {
	// CacheManager负责所有数据的缓存，那么对于数据而言，应该保存在缓存里面，缓存属于高并发的访问，高并发的访问需要安全的修改
	private final ConcurrentMap<String,Cache> caches = new ConcurrentHashMap<String,Cache>() ;
	private RedisTemplate<String, Object> redisTemplate ;
	
	public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}
	@Override
	public Cache<Object, Object> getCache(String name) throws CacheException {
		Cache<Object, Object> cache = this.caches.get(name) ; // 通过Map取得cache数据
		if(cache == null) { // 当前的集合里面没有Cache的数据
			cache = new RedisCache(this.redisTemplate) ; // 实例化一个新的Cache对象
			this.caches.put(name,cache);
		}
		return cache;
	}

}
