package cn.mldn.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.mldn.api.IEmployeeService;
import cn.mldn.api.IMemberService;

@ContextConfiguration({"classpath:spring/dubbo-consumer.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestMember {
	@Resource
	private IMemberService memberService ;
	@Resource
	private IEmployeeService employeeService ;
	@Test
	public void testGet(){
		System.err.println(this.memberService.get("admin"));
	}
	
	@Test
	public void testListAll(){
		System.err.println(this.employeeService.list());
	}
}
