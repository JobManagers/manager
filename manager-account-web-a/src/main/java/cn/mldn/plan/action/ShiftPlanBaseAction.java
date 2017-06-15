package cn.mldn.plan.action;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.api.IShiftPlanBaseService;
import cn.mldn.api.IShiftPlanDetailService;
import cn.mldn.dto.ShiftPlanBaseDto;
import cn.mldn.dto.ShiftPlanDetailDto;
import cn.mldn.job.util.action.ActionSplitPageUtil;
import cn.mldn.util.action.abs.AbstractBaseAction;

@Controller
@RequestMapping("/files/*")
public class ShiftPlanBaseAction extends AbstractBaseAction {

	public static final String FLAG = "排班方案";

	@Resource
	private IShiftPlanBaseService shiftPlanBaseService;
	@Resource
	private IShiftPlanDetailService shiftPlanDetailService;

	@RequestMapping("planlist")
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(super.getMsg("plan.list.page"));
		ActionSplitPageUtil aspu=new ActionSplitPageUtil(request, null, super.getMsg("plan.list.action")) ;
		Map<String ,Object> map=this.shiftPlanBaseService.list(aspu.getCurrentPage(), aspu.getLineSize(), "plan_name", aspu.getKeyWord()) ;
		System.err.println(map);
		mav.addObject("allShiftPlanBases", map.get("allShiftPlanBases"));
		return mav ;
	}

	@RequestMapping("planadd")
	public String add(ShiftPlanBaseDto dto, ShiftPlanDetailDto dto1, HttpServletRequest request) {
		dto.setCreate_time(new Date());
		dto.setUpdate_time(new Date());
		if (this.shiftPlanBaseService.addPlanBase(dto)) {
			dto1.setShift_plan_base_id(dto.getShift_plan_base_id());
			super.setUrlAndMsg(request, "plan.list.action", "plan.list.success", FLAG);
		} else {
			super.setUrlAndMsg(request, "plan.list.action", "plan.list.failure", FLAG);
		}
		return super.getMsg("forward.page");
	}
}
