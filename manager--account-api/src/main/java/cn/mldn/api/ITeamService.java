package cn.mldn.api;

import java.util.Map;

public interface ITeamService {
	/**
	 * 查询出所有的员工和小组信息
	 * @return 返回信息如下:
	 * 1.key = allEmployees、value = 所有的雇员信息 
	 * 2.key = allTeams value = 所有的小组信息
	 */
	public Map<String, Object> list();
}
