package com.xkj.ce.service;

import java.util.List;

import com.xkj.ce.entity.Address;
import com.xkj.ce.entity.Duser;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.entity.User;
public interface UserService {

	boolean isExistUN(String username);

	String getMail(String tel);
	
	User login(User user);

	boolean RegisterUser(User user);

	boolean editPwdByTel(String tel, String password);

	User getUserMsg(String phonenum);

	boolean updatemsg(User user);

	List<Address> getAddr(int  uuid);

	boolean deladdr(int zid);

	boolean addaddr(Address address);


	Integer getdidbyuuid(int uuid);

	List<User> searchUser(String tel);

	boolean delUserById(String uuid);

	boolean RegisterDai(Duser duser);

	PaginationBean<Duser> listDai(String page, String rows);

	boolean agreeDai(String uuid);

	boolean refuseDai(String uuid);

	boolean checkUser(String tel, String oldPwd);






}
