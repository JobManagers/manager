package cn.mldn.action;

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

import cn.mldn.api.IEmployeeService;
import cn.mldn.api.ITeamService;
import cn.mldn.util.action.abs.AbstractBaseAction;
import cn.mldn.util.web.ActionSplitPageUtil;
@Controller
@RequestMapping("/files/*")
public class TeamAction extends AbstractBaseAction {
	@Resource
	private ITeamService teamService;
	
	@RequestMapping("team_list")
	@RequiresUser
	@RequiresRoles(value = {"team"},logical =Logical.OR)
	@RequiresPermissions(value = {"team:list"},logical = Logical.OR)
	public ModelAndView listTeam(HttpServletRequest request){
//		ModelAndView mav = new ModelAndView(super.getUrl("team.list.page"));
//		mav.addAllObjects(this.teamService.list());
//		return mav; 
		System.err.println("进入------------");
		ModelAndView mav = new ModelAndView(super.getMsg("team.list.page"));
		ActionSplitPageUtil aspu=new ActionSplitPageUtil( null, super.getMsg("team.list.action"),request) ;
		Map<String ,Object> map=this.teamService.getAllSplit(aspu.getCurrentPage(), aspu.getLineSize(), "name", aspu.getKeyWord()) ;
		System.err.println(map);
		mav.addAllObjects(map);		
		return mav ;
	}
	
	
	
	

}
