package cn.mldn.action;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.api.IEmployeeService;
import cn.mldn.api.ITeamService;
import cn.mldn.util.action.abs.AbstractBaseAction;
@Controller
@RequestMapping("/files/*")
public class TeamAction extends AbstractBaseAction {
	@Resource
	private ITeamService teamService;
	
	@RequestMapping("team_list")
	@RequiresUser
	@RequiresRoles(value = {"team"},logical =Logical.OR)
	@RequiresPermissions(value = {"team:list"},logical = Logical.OR)
	public ModelAndView listTeam(){
		ModelAndView mav = new ModelAndView(super.getUrl("team.list.page"));
		mav.addAllObjects(this.teamService.list());
		return mav; 
	}

}
