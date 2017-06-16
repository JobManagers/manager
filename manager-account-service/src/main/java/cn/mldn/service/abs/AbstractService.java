package cn.mldn.service.abs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;

public abstract class AbstractService {
	/**
	 * 将VO类List集合转换为Dto类List集合
	 * @param <T>
	 * @param <K>
	 * @return 返回Dto类的List集合
	 */
	public <T, K> List<T> listVoToDto(List<K> all) {
		Iterator<K> iter = all.iterator() ;
		List<T> allDto = new ArrayList<T>();
		while(iter.hasNext()){
			T dto =(T) new Object();
			BeanUtils.copyProperties(iter.next(), dto);
			allDto.add((T) dto);
		}
		return allDto ;
	}
	
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
