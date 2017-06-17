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
import cn.mldn.vo.Team;

@Component(value = "employeeApi")
public class EmployeeServiceImpl extends AbstractService implements IEmployeeService {
	@Resource
	private IEmployeeInfoDAO employeeInfoDAO;
	@Resource
	private ITeamDAO teamDAO ;
	
	@Override
	public Map<String, Object> listSplit(Long currentPage, Integer lineSize, String column,
			String keyWord) {

		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> param = super.getParamMap(currentPage, lineSize, column, keyWord);
		List<EmployeeInfo> list = this.employeeInfoDAO.findAllSplit(param);
		List<EmployeeInfoDto> listDto = new ArrayList<>();
		Iterator<EmployeeInfo> iter = list.iterator();
		while (iter.hasNext()) {
			EmployeeInfoDto dto=new EmployeeInfoDto() ;
			BeanUtils.copyProperties(iter.next(), dto) ;
			listDto.add(dto) ; 
		}
		List<Team> list2 = this.teamDAO.findAll() ;
		List<TeamDto> dtoList = new ArrayList<TeamDto>();
		Iterator<Team> iter2 = list2.iterator(); 
		while(iter.hasNext()){
			Team team = iter2.next();
			TeamDto teamDto = new TeamDto();
			BeanUtils.copyProperties(team, teamDto);
			dtoList.add(teamDto);
		}
		map.put("allEmployees",listDto);
		map.put("allRecorders", this.employeeInfoDAO.getAllCount(param)) ;
		map.put("allTeams",dtoList) ;
		return map ;
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
		map.put("allEmployees", allEmpdto);
		return map;
	}
	
	@Override
	public Map<String, Object> addPre() {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Team> list = this.teamDAO.findAll() ;
		List<TeamDto> dtoList = new ArrayList<TeamDto>();
		Iterator<Team> iter = list.iterator(); 
		while(iter.hasNext()){
			Team team = iter.next();
			TeamDto teamDto = new TeamDto();
			BeanUtils.copyProperties(team, teamDto);
			dtoList.add(teamDto);
		}
		map.put("allTeams",dtoList) ;
		return map ;
	}
	
	@Override
	public boolean add(EmployeeInfoDto dto) {
		EmployeeInfo vo=new EmployeeInfo() ;
		BeanUtils.copyProperties(dto, vo);
		return this.employeeInfoDAO.doCreate(vo);
	}

}
