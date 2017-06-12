package cn.mldn;
import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.mldn.api.IStudentService;
@ContextConfiguration({"classpath:spring/dubbo-consumer.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class DemoApiTest {
	@Resource
	private IStudentService studentService;
	@Test
	public void testList() {
		System.err.println(this.studentService.list());
	}
}