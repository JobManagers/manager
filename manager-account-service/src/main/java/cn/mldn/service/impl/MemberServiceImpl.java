package cn.mldn.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.mldn.api.IMemberService;
import cn.mldn.dao.IActionDAO;
import cn.mldn.dao.IMemberDAO;
import cn.mldn.dao.IRoleDAO;
import cn.mldn.dto.MemberDto;
import cn.mldn.vo.Member;
@Component(value = "memberApi")
public class MemberServiceImpl implements IMemberService {
	@Resource
	private IMemberDAO memberDAO ;
	@Resource
	private IRoleDAO roleDAO;
	@Resource
	private IActionDAO actionDAO;
	
	@Override
	public MemberDto get(String mid) {
		Member vo = this.memberDAO.findById(mid);
		MemberDto dto = new MemberDto();
		BeanUtils.copyProperties(vo, dto);
		return dto;
	}

	@Override
	public Map<String, Set<String>> getRoleAndAction(String mid) {
		Map<String, Set<String>> map = new HashMap<String, Set<String>>();
		map.put("allRoles", this.roleDAO.findAllIdByMember(mid)) ;
		map.put("allActions", this.actionDAO.findAllIdByMember(mid)) ;
		return map;
	}

}
