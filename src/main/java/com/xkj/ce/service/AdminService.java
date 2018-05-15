package com.xkj.ce.service;

import com.xkj.ce.entity.Admin;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.entity.User;

public interface AdminService {

	Admin login(Admin admin);

	PaginationBean<User> getAllUser(String page, String rows);

	boolean modifyPwd(String newPwd, String adid);

}
