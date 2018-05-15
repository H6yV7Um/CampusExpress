package com.xkj.ce.service.impl;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xkj.ce.entity.Duser;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.entity.User;
import com.xkj.ce.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class UserServiceImplTest {

	@Autowired
	private UserService userService;
//	private UserService userService = new UserServiceImpl();

	
	@Test
	public void TestCheckUser() {
		boolean str = userService.checkUser("13237343452", "a");
		assertNotNull(str);
		System.out.println(str);
		
	}
	@Test
	public void TestRefusefDai() {
		boolean str = userService.refuseDai("1020");
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void Testlogin() {
		User user=new User("a","13237343452");
		User str = userService.login(user);
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestAgreeDai() {
		boolean str = userService.agreeDai("1020");
		assertNotNull(str);
		System.out.println(str);
		
	}
	@Test
	public void TestisExistUN() {
		boolean str = userService.isExistUN("xkj");
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestListDai() {
		PaginationBean<Duser> str = userService.listDai("1", "3");
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestReDai() {
		Duser duser = new Duser();
		duser.setUuid(1);
		duser.setDspic("123456789");
		boolean str = userService.RegisterDai(duser);
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestDelUser() {
		boolean str = userService.delUserById("1000");
		System.out.println(str);
		
	}
	
	@Test
	public void TestGetMail() {
		String str = userService.getMail("13237343452");
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TestsearchUserByTel() {
		List<User> str = userService.searchUser(null);
//		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void TesteditPwdByTel() {
		boolean str = userService.editPwdByTel("13237343452", "123");
//		assertNotNull(str);
		System.out.println("结果:"+str);
		
	}

}
