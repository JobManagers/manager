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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.mldn.api.IEmployeeService;
import cn.mldn.dto.EmployeeInfoDto;
import cn.mldn.dto.TeamDto;
import cn.mldn.util.action.abs.AbstractBaseAction;
import cn.mldn.util.web.ActionSplitPageUtil;
import cn.mldn.util.web.FileUtils;
@Controller
@RequestMapping("/files/*")
public class EmployeeAction extends AbstractBaseAction {
	public static final String FLAG="雇员" ;
	
	@Resource
	private IEmployeeService employeeService ;
	
	
	@RequestMapping("emp_list")
	@RequiresUser
	@RequiresRoles(value = {"emp"},logical =Logical.OR)
	@RequiresPermissions(value = {"emp:list"},logical = Logical.OR)
	public ModelAndView listEmp(HttpServletRequest request){
		/*ModelAndView mav = new ModelAndView(super.getUrl("emp.list.page"));
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
		return mav ;*/
		ModelAndView mav = new ModelAndView(super.getMsg("emp.list.page"));
		ActionSplitPageUtil aspu=new ActionSplitPageUtil( null, super.getMsg("emp.list.action"),request) ;
		Map<String ,Object> map=this.employeeService.listSplit(aspu.getCurrentPage(), aspu.getLineSize(), "name", aspu.getKeyWord()) ;
		mav.addAllObjects(map);	
		List<TeamDto> allTeams = (List<TeamDto>) map.get("allTeams");
		Iterator<TeamDto> iter = allTeams.iterator();
		Map<Long,Object> teamMap = new HashMap<Long,Object>();
		System.out.println(map);
		while(iter.hasNext()){
			TeamDto dto = iter.next();
			teamMap.put(dto.getTeam_id(),dto.getName());
		}
		mav.addObject("allTeams", teamMap);
		return mav ;
	}
	
	 
	
	@RequestMapping("emp_addpre")
	@RequiresUser
	@RequiresRoles(value = {"emp"},logical =Logical.OR)
	@RequiresPermissions(value = {"emp:add"},logical = Logical.OR)
	public ModelAndView addPre(){
		ModelAndView mav = new ModelAndView(super.getMsg("emp.add.page")) ;
		mav.addAllObjects(this.employeeService.addPre());	
		return mav ;
	}
	
	@RequestMapping("emp_add")
	public String add(EmployeeInfoDto dto,MultipartFile pic, HttpServletRequest request)throws Exception{
		FileUtils fu=null ;
		if(!(pic ==null || pic.isEmpty())){
			fu=new FileUtils(pic) ;
			dto.setAvatar(fu.createFileName());
		}
		if(this.employeeService.add(dto)){
			if(!(pic==null || pic.isEmpty())){
				fu.saveFile(request, "upload/emp/", dto.getAvatar()) ;
			}
			super.setUrlAndMsg(request, "emp.add.action", "emp.add.success", FLAG);
		}else{
			super.setUrlAndMsg(request, "emp.add.action", "emp.add.failure", FLAG);
		}
		return super.getMsg("forward.page") ;
	}
}
