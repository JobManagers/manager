package cn.mldn.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import cn.mldn.api.IStudentService;
import cn.mldn.dao.IStudentDAO;
import cn.mldn.dto.StudentDTO;
import cn.mldn.vo.Student;
@Component( value = "studentApi")
public class StudentServiceImpl implements IStudentService {
	@Resource
	private IStudentDAO studentDAO ;
	
	@Override
	public List<StudentDTO> list() {
		List<Student> allStudents = this.studentDAO.findAll() ;
		List<StudentDTO> all = new ArrayList<StudentDTO>() ;
		for(Student stu : allStudents){
			StudentDTO sdto = new StudentDTO() ;
			BeanUtils.copyProperties(stu, sdto);
			all.add(sdto);
		}
//		for(int x = 0 ; x < 10 ;x ++){
//			Student stu = new Student() ;
//			stu.setAge(x);
//			stu.setName("hello - " + x);
//			StudentDTO adto = new StudentDTO() ;
//			BeanUtils.copyProperties(stu, adto);
//			all.add(adto);
//		}
		return all;
	}

}
