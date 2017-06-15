package cn.mldn.service.abs;

import java.util.HashMap;
import java.util.Map;

public abstract class AbstractService {
	
	public Map<String,Object> getParamMap(Long currentPage,Integer lineSize,String column,String keyWord){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("start", (currentPage - 1) * lineSize) ;
		param.put("lineSize", lineSize);
		if(column == null || keyWord == null || "".equals(column) || "".equals(keyWord)){
			param.put("column", null);
			param.put("keyWord", null);
		} else {
			param.put("column", column);
			param.put("keyWord", "%"+keyWord+"%") ;
		}
		
		return param ;
	}
}
