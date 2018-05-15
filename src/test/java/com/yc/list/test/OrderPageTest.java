package com.yc.list.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xkj.ce.entity.Express;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.service.ExpressService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml", "classpath:spring-mvc.xml"})//可插拔式
public class OrderPageTest {

	@Autowired
	private ExpressService expressService;
	@Test
	public void testOrderList() {
		PaginationBean<Express> orders=expressService.orderlist("1","2","1002");
		System.out.println(orders);
		assertNotNull(orders);
	}
	
	@Test
	public void testFindUD() {
		Express dusers=expressService.findDU(201);
		System.out.println(dusers);
		assertNotNull(dusers);
	}
	
	@Test
	public void testCancleOrder() {
		PaginationBean<Express> orders=expressService.cancleorderlist("1", "2", "1002");
		System.out.println(orders);
		assertNotNull(orders);
	}
	

	@Test
	public void testComingorderlist() {
		PaginationBean<Express> orders=expressService.comingorderlist("1", "2", "1002");
		System.out.println(orders);
		assertNotNull(orders);
	}
	
	@Test
	public void testSureOrder() {
		boolean result=expressService.sureOrder("100004");
		System.out.println(result);
		assertNotNull(result);
	}
	
}
