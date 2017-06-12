package cn.mldn.shiro.util;

import java.io.Serializable;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.springframework.data.redis.core.RedisTemplate;

public class RedisSessionDAO extends EnterpriseCacheSessionDAO {
	@Resource(name ="redisTemplate0")
	private RedisTemplate<String, Object> redisTemplate ;
	
	protected Session doReadSession(Serializable sessionId){
		Session session = super.doReadSession(sessionId); // 读取Session数据
		if(session == null) {	// 现在没有读取到session数据，通过Redis读取
			return (Session) this.redisTemplate.opsForValue().get(sessionId.toString());
		}
		return null ;
	}
	
	@Override
	protected void doDelete(Session session) {
		super.doDelete(session);
		this.redisTemplate.delete(session.getId().toString());
	}
	
	@Override
	protected void doUpdate(Session session) {
		super.doUpdate(session);
		if(session != null){
			this.redisTemplate.opsForValue().set(session.getId().toString(), session,1800);
		}
	}
	
	@Override
	protected Serializable doCreate(Session session) {
		Serializable sessionid = super.doCreate(session); // 每一个web需要处理session内容
		this.redisTemplate.opsForValue().set(sessionid.toString(), session,1800); // 设置一个超时的时间
		return sessionid;
	}
}
