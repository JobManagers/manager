package cn.mldn.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import cn.mldn.api.IEmployeeService;
import cn.mldn.dao.IEmployeeInfoDAO;
import cn.mldn.service.abs.AbstractService;

@Component(value = "employeeApi")
public class EmployeeServiceImpl extends AbstractService implements IEmployeeService {
	@Resource
	private IEmployeeInfoDAO employeeInfoDAO;

	@Override
	public Map<String, Object> listSplit(Long currentPage, Integer lineSize, String column,
			String keyWord) {
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> param = super.getParamMap(currentPage, lineSize, column, keyWord);
		map.put("allEmployees", this.employeeInfoDAO.findAllSplit(param));
		map.put("allRecorders", this.employeeInfoDAO.getAllCount(param)) ;
		return map;
	}

	@Override
	public Map<String, Object> list() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("allEmployees", this.employeeInfoDAO.findAll());
		return map;
	}

}
