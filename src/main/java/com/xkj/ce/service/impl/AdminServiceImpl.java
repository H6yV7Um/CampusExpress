package com.xkj.ce.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xkj.ce.entity.Admin;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.entity.User;
import com.xkj.ce.mapper.AdminMapper;
import com.xkj.ce.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	

	@Autowired
	private AdminMapper adminMapper;

	 
	
	@Override
	public Admin login(Admin admin) {
		
		return adminMapper.getAdmin(admin);	
	}



	@Override
	public PaginationBean<User> getAllUser(String currPage, String pageSize) {
		PaginationBean<User> userBean=new PaginationBean<User>();
		if(currPage!=null){
			userBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			userBean.setPageSize(Integer.parseInt(pageSize));
		}
		userBean=adminMapper.getUserPagination(userBean);
		return userBean;
	}



	@Override
	public boolean modifyPwd(String newPwd, String adid) {
		
		return adminMapper.modifyPwd(newPwd,adid) >0;	
	}

}
