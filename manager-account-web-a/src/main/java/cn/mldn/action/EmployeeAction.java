package cn.mldn.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import cn.mldn.dto.TeamDto;
import cn.mldn.util.action.abs.AbstractBaseAction;
import cn.mldn.util.web.ActionSplitPageUtil;
@Controller
@RequestMapping("/files/*")
public class EmployeeAction extends AbstractBaseAction {
	@Resource
	private IEmployeeService employeeService ;
	
	
	@RequestMapping("emp_list")
	@RequiresUser
	@RequiresRoles(value = {"emp"},logical =Logical.OR)
	@RequiresPermissions(value = {"emp:list"},logical = Logical.OR)
	public ModelAndView listEmp(HttpServletRequest request){
		ModelAndView mav = new ModelAndView(super.getUrl("emp.list.page"));
		ActionSplitPageUtil aspu = new ActionSplitPageUtil("姓名:name", super.getUrl("emp.list.action"), request);
		Map<String,Object> map = this.employeeService.listSplit(aspu.getCurrentPage(), aspu.getLineSize(), aspu.getColumn(), aspu.getKeyWord());
		mav.addAllObjects(map);
		List<TeamDto> allTeams = (List<TeamDto>) map.get("allTeams");
		Iterator<TeamDto> iter = allTeams.iterator();
		Map<Long,Object> teamMap = new HashMap<Long,Object>();
		while(iter.hasNext()){
			TeamDto dto = iter.next();
			teamMap.put(dto.getTeam_id(),dto.getName());
		}
		mav.addObject("allTeams", teamMap);
		return mav ; 
	}
	
	
}
