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
import cn.mldn.util.action.abs.AbstractBaseAction;
@Controller
@RequestMapping("/files/*")
public class EmployeeAction extends AbstractBaseAction {
	@Resource
	private IEmployeeService employeeService ;
	
	
	@RequestMapping("emp_list")
	@RequiresUser
	@RequiresRoles(value = {"emp"},logical =Logical.OR)
	@RequiresPermissions(value = {"emp:list"},logical = Logical.OR)
	public ModelAndView listEmp(){
		ModelAndView mav = new ModelAndView(super.getUrl("emp.list.page"));
		mav.addAllObjects(this.employeeService.list());
		return mav ; 
	}
	
	
}
