package cn.mldn.service.impl;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.mldn.api.IShiftPlanDetailService;
import cn.mldn.dao.IShiftPlanDetailDAO;
import cn.mldn.dto.ShiftPlanDetailDto;
import cn.mldn.vo.ShiftPlanDetail;

@Component(value = "shiftPlanDetailApi")
public class ShiftPlanDetailServiceImpl implements IShiftPlanDetailService {

	@Resource
	private IShiftPlanDetailDAO shiftPlanDetail;

	@Override
	public boolean addPlanDetail(ShiftPlanDetailDto dto) {
		ShiftPlanDetail vo =new ShiftPlanDetail() ;
		BeanUtils.copyProperties(dto,vo) ;
		return this.shiftPlanDetail.doCreate(vo);
	}
}
