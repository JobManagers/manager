package cn.mldn.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.mldn.api.IEmployeeService;
import cn.mldn.dao.IEmployeeInfoDAO;
import cn.mldn.dao.ITeamDAO;
import cn.mldn.dto.EmployeeInfoDto;
import cn.mldn.dto.TeamDto;
import cn.mldn.service.abs.AbstractService;
import cn.mldn.vo.EmployeeInfo;

@Component(value = "employeeApi")
public class EmployeeServiceImpl extends AbstractService implements IEmployeeService {
	@Resource
	private IEmployeeInfoDAO employeeInfoDAO;
	@Resource
	private ITeamDAO teamDAO ;
	
//	@Override
//	public Map<String, Object> listSplit(Long currentPage, Integer lineSize, String column,
//			String keyWord) {
//		Map<String,Object> map = new HashMap<String,Object>();
//		Map<String,Object> param = super.getParamMap(currentPage, lineSize, column, keyWord);
//		map.put("allEmployees", this.employeeInfoDAO.findAllSplit(param));
//		map.put("allRecorders", this.employeeInfoDAO.getAllCount(param)) ;
//		List<Team> list = this.teamDAO.findAll() ;
//		List<TeamDto> dtoList = new ArrayList<TeamDto>();
//		Iterator<Team> iter = list.iterator(); 
//		while(iter.hasNext()){
//			Team team = iter.next();
//			TeamDto teamDto = new TeamDto();
//			BeanUtils.copyProperties(team, teamDto);
//			dtoList.add(teamDto);
//		}
//		map.put("allTeams",dtoList);
//		return map;
//	}
	
	@Override
	public Map<String, Object> listSplit(Long currentPage, Integer lineSize, String column,
			String keyWord) {
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> param = super.getParamMap(currentPage, lineSize, column, keyWord);
		List<EmployeeInfoDto> allEmpdtos = super.listVoToDto(this.employeeInfoDAO.findAllSplit(param));
		map.put("allEmployees",allEmpdtos );
		map.put("allRecorders", this.employeeInfoDAO.getAllCount(param)) ;
		List<TeamDto> dtoList = super.listVoToDto(this.teamDAO.findAll());
		map.put("allTeams",dtoList);
		return map;
	}

	@Override
	public Map<String, Object> list() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<EmployeeInfo> allEmp = this.employeeInfoDAO.findAll();
		List<EmployeeInfoDto> allEmpdto = new ArrayList<EmployeeInfoDto>();
		Iterator<EmployeeInfo> iter = allEmp.iterator();
		while(iter.hasNext()){
			EmployeeInfoDto empDto = new EmployeeInfoDto();
			BeanUtils.copyProperties(iter.next(), empDto);
			allEmpdto.add(empDto);
		}
		
		
//		List<EmployeeInfoDto> allEmpdtos = super.listVoToDto(this.employeeInfoDAO.findAll());
		map.put("allEmployees", allEmpdto);
		return map;
	}

}
