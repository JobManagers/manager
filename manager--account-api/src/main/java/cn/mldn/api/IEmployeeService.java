package cn.mldn.api;

import java.util.Map;

public interface IEmployeeService {
	/**
	 * 查询全部雇员信息
	 * @return 返回的信息包含如下信息:<br>
	 * 1、key = allEmployees、value = 所有的雇员信息 
	 */
	public Map<String,Object> list();
}
