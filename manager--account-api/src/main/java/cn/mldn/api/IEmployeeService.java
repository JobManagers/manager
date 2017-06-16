package cn.mldn.api;

import java.util.Map;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;

import cn.mldn.dto.EmployeeInfoDto;


public interface IEmployeeService {
	/**
	 * 查询全部雇员信息
	 * @return 返回的信息包含如下信息:<br>
	 * 1、key = allEmployees、value = 所有的雇员信息 
	 */
	public Map<String,Object> list();
	
	/**
	 * 雇员列表分页查询
	 * @param currentPage 当前页
	 * @param lineSize 行数
	 * @param column 查询字段
	 * @param keyWord 查询关键字
	 * @return 查询返回的信息包含如下内容:<br>
	 * 1、key = allEmployees、value = 显示的所有雇员信息;<br>
	 * 2、key = allRecorders、value = 全部雇员数量;<br>
	 * 3、key = allTeams、value = 所有的小组信息
	 */
	@RequiresRoles(value = {"emp"},logical =Logical.OR)
	@RequiresPermissions(value = {"emp:list"},logical = Logical.OR)
	public Map<String,Object> listSplit(Long currentPage,Integer lineSize,String column,String keyWord) ;
	
	/**
	 * 雇员增加前的准具
	 * @return 所有的小祖名
	 */
	public Map<String,Object> addPre() ;
	
	/**
	 * 雇员增加
	 * @param dto 传入的雇员dto
	 * @return 增加成功返回true
	 */
	public boolean add(EmployeeInfoDto dto) ;
	
}
