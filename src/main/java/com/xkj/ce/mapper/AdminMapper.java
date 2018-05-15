package com.xkj.ce.mapper;

import org.apache.ibatis.annotations.Param;

import com.xkj.ce.entity.Admin;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.entity.User;

public interface AdminMapper {

	public Admin getAdmin(Admin admin);

	public PaginationBean<User> getUserPagination(PaginationBean<User> userBean);

	public Integer modifyPwd(@Param("newPwd") String newPwd, @Param("adid")String adid);

}
