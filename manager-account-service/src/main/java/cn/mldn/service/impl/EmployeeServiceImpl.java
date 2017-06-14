package cn.mldn.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import cn.mldn.api.IEmployeeService;
import cn.mldn.dao.IEmployeeInfoDAO;
@Component(value = "employeeApi")
public class EmployeeServiceImpl implements IEmployeeService {
	@Resource
	private IEmployeeInfoDAO employeeInfoDAO ;
	@Override
	public Map<String, Object> list() {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("allEmployees", this.employeeInfoDAO.findAll());
		return map;
	}

}
