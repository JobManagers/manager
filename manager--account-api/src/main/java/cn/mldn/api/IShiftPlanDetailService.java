package cn.mldn.api;


import cn.mldn.dto.ShiftPlanDetailDto;


public interface IShiftPlanDetailService {
	
	/**
	 * 排班方案增加
	 * @param vo 新增排班方案
	 * @return 成功返回true
	 */
	public boolean addPlanDetail(ShiftPlanDetailDto dto) ;
	
}
