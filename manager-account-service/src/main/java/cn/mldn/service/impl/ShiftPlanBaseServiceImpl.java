package cn.mldn.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.mldn.api.IShiftPlanBaseService;
import cn.mldn.dao.IShiftPlanBaseDAO;
import cn.mldn.dto.ShiftPlanBaseDto;
import cn.mldn.vo.ShiftPlanBase;

@Component(value = "shiftPlanBaseApi")
public class ShiftPlanBaseServiceImpl implements IShiftPlanBaseService {

	@Resource
	private IShiftPlanBaseDAO shiftPlanBase;

	@Override
	public Map<String, Object> list(Long currentPage, Long lineSize, String column, String keyWord) {
		Map<String, Object> map = new HashMap<>();
		if (column == null || keyWord == null || "".equals(keyWord) || "".equals(column)) {
			Map<String,Object> map1 = new HashMap<>();
			map1.put("start", (currentPage - 1) * lineSize);
			map1.put("lineSize", lineSize);
			List<ShiftPlanBase> list = this.shiftPlanBase.findAllBySplit(map1);
			List<ShiftPlanBaseDto> listDto = new ArrayList<>();
			Iterator<ShiftPlanBase> iter = list.iterator();
			while (iter.hasNext()) {
				ShiftPlanBaseDto dto=new ShiftPlanBaseDto() ;
				BeanUtils.copyProperties(iter.next(), dto) ;
				listDto.add(dto) ; 
			}
			map.put("allShiftPlanBases",listDto);
			map.put("allRecorders", this.shiftPlanBase.getAllCount(map1)) ;
		}else{
			Map<String,Object> map1 = new HashMap<>();
			map1.put("start", (currentPage - 1) * lineSize);
			map1.put("lineSize", lineSize);
			map1.put("column", column);
			map1.put("keyWord", "%" + keyWord + "%");
			List<ShiftPlanBase> list = this.shiftPlanBase.findAllBySplit(map1);
			List<ShiftPlanBaseDto> listDto = new ArrayList<>();
			Iterator<ShiftPlanBase> iter = list.iterator();
			while (iter.hasNext()) {
				ShiftPlanBaseDto dto=new ShiftPlanBaseDto() ;
				BeanUtils.copyProperties(iter.next(), dto) ;
				listDto.add(dto) ; 
			}
			map.put("allShiftPlanBases",listDto);
			map.put("allRecorders", this.shiftPlanBase.getAllCount(map1)) ;
		}
		return map ;
	}
	
	@Override
	public boolean addPlanBase(ShiftPlanBaseDto dto) {
		ShiftPlanBase vo =new ShiftPlanBase() ;
		BeanUtils.copyProperties(dto,vo) ;
		return this.shiftPlanBase.doCreate(vo);
	}
}
