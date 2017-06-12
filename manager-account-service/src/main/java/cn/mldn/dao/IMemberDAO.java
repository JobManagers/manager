package cn.mldn.dao;

import java.util.List;

import cn.mldn.util.dao.IBaseDAO;
import cn.mldn.vo.Member;
import cn.mldn.vo.Student;

public interface IMemberDAO extends IBaseDAO<String, Member> {
	public Member findById(String mid) ;
}
