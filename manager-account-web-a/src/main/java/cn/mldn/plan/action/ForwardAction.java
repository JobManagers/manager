package cn.mldn.plan.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.mldn.util.action.abs.AbstractBaseAction;

@Controller
public class ForwardAction extends AbstractBaseAction {
	@RequestMapping("/forward")
	public String forward()
			throws Exception {
		return super.getMsg("forward.page"); 
	}
}
