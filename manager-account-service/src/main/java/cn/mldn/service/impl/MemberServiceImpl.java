package cn.mldn.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.mldn.api.IMemberService;
import cn.mldn.dao.IMemberDAO;
import cn.mldn.dto.MemberDto;
import cn.mldn.dto.StudentDTO;
import cn.mldn.vo.Member;
import cn.mldn.vo.Student;
@Component(value = "memberApi")
public class MemberServiceImpl implements IMemberService {
	@Resource
	private IMemberDAO memberDAO ;
	
	@Override
	public MemberDto get(String mid) {
		Member vo = this.memberDAO.findById(mid);
//		Member vo = new Member() ;
//		vo.setId(1);
//		vo.setLocked(0);
//		vo.setMid("admin");
//		vo.setPassword("hello");
		MemberDto dto = new MemberDto();
		BeanUtils.copyProperties(vo, dto);
		return dto;
	}

}
