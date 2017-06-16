package cn.mldn.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.mldn.api.ITeamService;
import cn.mldn.dao.IEmployeeInfoDAO;
import cn.mldn.dao.ITeamDAO;
import cn.mldn.dto.TeamDto;
import cn.mldn.service.abs.AbstractService;
import cn.mldn.vo.Team;
@Component(value="teamApi")
public class TeamServiceImpl extends AbstractService implements ITeamService {
	@Resource 
	private IEmployeeInfoDAO employeeInfoDAO;
	@Resource
	private ITeamDAO teamDAO;
	/**
	 * 1.1 实现了列表展示的功能
	 */
	@Override
	public Map<String, Object> list() {
		Map<String, Object> map = new HashMap<>();
		map.put("allEmployees", this.employeeInfoDAO.findAll());
		map.put("allTeams", this.teamDAO.findAll());
		return map;
	}
	
	/**
	 * 1.2实现了模糊分页查询功能
	 */
	@Override
	public Map<String, Object> getAllSplit(Long currentPage, Integer lineSize, String column,
			String keyWord) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> param = super.getParamMap(currentPage, lineSize, column, keyWord);
		List<Team> list = this.teamDAO.findAllSplit(param);
		List<TeamDto> listDto =  new ArrayList<>();
		Iterator<Team> iter = list.iterator();
		while (iter.hasNext()) {
			TeamDto dto=new TeamDto() ;
			BeanUtils.copyProperties(iter.next(), dto) ;
			listDto.add(dto) ; 
		}
		
		
		map.put("allTeams",listDto);
		map.put("allEmployees", this.employeeInfoDAO.findAll());
//		map.put("allTeams", this.teamDAO.findAllSplit(map));
		map.put("allRecorders", this.teamDAO.getAllCount(param)) ;//返回的是查询到的数量
		return map ;
		
	}

}
