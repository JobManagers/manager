package cn.mldn.api;

import java.util.Map;

import cn.mldn.dto.ShiftPlanBaseDto;


public interface IShiftPlanBaseService {
	
	/**
	 * 查询所有的排班安排方案
	 * @return 所有的排班安排方案
	 */
	public Map<String ,Object> list(Long currentPage, Long lineSize, String column, String keyWord) ;
	
	/**
	 * 排班方案增加
	 * @param vo 新增排班方案
	 * @return 成功返回true
	 */
	public boolean addPlanBase(ShiftPlanBaseDto dto) ;
	
}
