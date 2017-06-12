package cn.mldn.shiro.util;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;

public class RedisCache<K, V> implements Cache<K, V> {	// 这个类的对象无法直接进行注入
	private RedisTemplate<String, Object> redisTemplate ;	// 要提供有Redis处理工具类
	public RedisCache(RedisTemplate<String, Object> redisTemplate) {	// 通过构造方法配置注入
		this.redisTemplate = redisTemplate ;
	}
	@Override
	public V get(K key) throws CacheException {
		return (V) this.redisTemplate.opsForValue().get(key.toString());
	}

	@Override
	public V put(K key, V value) throws CacheException {
		this.redisTemplate.opsForValue().set(key.toString(), value);
		return value;
	}

	@Override
	public V remove(K key) throws CacheException {
		V val = this.get(key);
		this.redisTemplate.delete(key.toString());
		return val;
	}

	@Override
	public void clear() throws CacheException {
		this.redisTemplate.execute(new RedisCallback<Boolean>() {

			@Override
			public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
				connection.flushDb(); // 清空数据库
				return true;
			}
			
		});
	}

	@Override
	public int size() {
		return this.redisTemplate.execute(new RedisCallback<Integer>() {

			@Override
			public Integer doInRedis(RedisConnection connection) throws DataAccessException {
				return connection.keys("*".getBytes()).size();
			}
		});
	}

	@Override
	public Set<K> keys() {
		return this.redisTemplate.execute(new RedisCallback<Set<K>>() {

			@Override
			public Set<K> doInRedis(RedisConnection connection) throws DataAccessException {
				Set<K> set = new HashSet<K>();
				Set<byte[]> keys = connection.keys("*".getBytes());
				Iterator<byte[]> iter = keys.iterator();
				while(iter.hasNext()){
					set.add((K) iter.next());
				}
				return set;
			}
		});
	}

	@Override
	public Collection<V> values() {
		return this.redisTemplate.execute(new RedisCallback<Set<V>>() {

			@Override
			public Set<V> doInRedis(RedisConnection connection) throws DataAccessException {
				Set<V> set = new HashSet<V>() ;
				Set<byte[]> keys = connection.keys("*".getBytes());
				Iterator<byte[]> iter = keys.iterator() ;
				while(iter.hasNext()){
					set.add((V) connection.get(iter.next())) ;
				}
				return set;
			}
		});
	}

}
