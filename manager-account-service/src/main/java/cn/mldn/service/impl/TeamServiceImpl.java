package cn.mldn.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import cn.mldn.api.ITeamService;
import cn.mldn.dao.IEmployeeInfoDAO;
import cn.mldn.dao.ITeamDAO;
@Component(value="teamApi")
public class TeamServiceImpl implements ITeamService {
	@Resource 
	private IEmployeeInfoDAO employeeInfoDAO;
	@Resource
	private ITeamDAO teamDAO;
	@Override
	public Map<String, Object> list() {
		Map<String, Object> map = new HashMap<>();
		map.put("allEmployees", this.employeeInfoDAO.findAll());
		map.put("allTeams", this.teamDAO.findAll());
		return map;
	}

}
