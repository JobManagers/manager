package cn.mldn.plan.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
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

	@RequestMapping("planadd")
	@RequiresUser
	@RequiresRoles(value = { "shift_plan_manager" }, logical = Logical.OR)
	@RequiresPermissions(value = { "shift_plan_manager:add" }, logical = Logical.OR)
	public ModelAndView add(ShiftPlanBaseDto planBaseDto, ShiftPlanDetailDto planDetailDto,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(super.getUrl("plan.add.page"));
		System.err.println(planBaseDto);
		System.err.println(planDetailDto);

		return mav;
	}

	@RequestMapping("planlist")
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(super.getMsg("plan.list.page"));
		ActionSplitPageUtil aspu = new ActionSplitPageUtil(request, null,
				super.getMsg("plan.list.action"));
		Map<String, Object> map = this.shiftPlanBaseService.list(aspu.getCurrentPage(),
				aspu.getLineSize(), "plan_name", aspu.getKeyWord());
		System.err.println(map);
		mav.addObject("allShiftPlanBases", map.get("allShiftPlanBases"));
		return mav;
	}

}
