package cn.mldn.api;

import java.util.List;

import cn.mldn.dto.MemberDto;
import cn.mldn.dto.StudentDTO;

public interface IMemberService {
	/**
	 * 取得登录用户信息
	 * @param mid 用户名
	 * @return 返回用户Dto类
	 */
	public MemberDto get(String mid) ;
}
