package cn.mldn.dao;

import java.util.List;
import java.util.Map;

import cn.mldn.util.dao.IBaseDAO;
import cn.mldn.vo.ShiftPlanBase;

public interface IShiftPlanBaseDAO extends IBaseDAO<Long, ShiftPlanBase> {
	
	/**
	 * 进行排班方案的分页
	 * @param param 需要的分页数据
	 * @return 所有需要分页的排班方案
	 */
	public List<ShiftPlanBase> findAllBySplit(Map<String ,Object> param) ;
	/**
	 * 进行排班方案的分页数量统计
	 * @param param 需要的分页数据
	 * @return 所有需要分页的排班方案的数量
	 */
	public Long getAllCount(Map<String ,Object> param) ;
}	
