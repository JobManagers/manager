package cn.mldn.dao;

import cn.mldn.util.dao.IBaseDAO;
import cn.mldn.vo.Member;

public interface IMemberDAO extends IBaseDAO<String, Member> {
	public Member findById(String mid) ;
}
