package cn.mldn.comtroller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.api.IMemberService;
import cn.mldn.dto.MemberDto;


@RequestMapping("/demo")
@Controller
public class TestController {
	@Resource
	private IMemberService memberService ;
	@RequestMapping("/testList")
	public ModelAndView test(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("/test_list");
		MemberDto mdto = memberService.get("admin");
		mav.addObject("member",mdto);
		return mav;
	}
}
