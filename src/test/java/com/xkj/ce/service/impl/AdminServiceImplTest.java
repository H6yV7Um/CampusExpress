package com.xkj.ce.service.impl;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xkj.ce.entity.Admin;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.entity.User;
import com.xkj.ce.service.AdminService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class AdminServiceImplTest {
	
	@Autowired
	private AdminService adminService;
	
	@Test
	public void TestgetAllUser() {
		PaginationBean<User> str = adminService.getAllUser("1", "2");
		assertNotNull(str);
		System.out.println(str);
		
	}
	
	@Test
	public void testLogin() {
		Admin admin=new Admin();
		admin.setAdname("admin");
		admin.setAdpwd("a");
		admin=adminService.login(admin);
		System.out.println(admin.toString());
	}
	
	@Test
	public void testEditPwd() {
		boolean result = adminService.modifyPwd("1010", "10");
		System.out.println(result);
		return ;
	}

}
