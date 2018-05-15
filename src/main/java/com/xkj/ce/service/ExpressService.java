package com.xkj.ce.service;

import java.util.List;

import com.xkj.ce.entity.Express;
import com.xkj.ce.entity.ExpressType;
import com.xkj.ce.entity.PaginationBean;

public interface ExpressService {

	PaginationBean<Express> pageList(String page, String rows);

	List<ExpressType> typeList();

	PaginationBean<Express> findType(String page, String rows, String otype);

	PaginationBean<Express> orderlist(String page, String rows, String uuid);

	Express findDU(int did);

	PaginationBean<Express> worderlist(String page, String rows, String uuid);
	
	PaginationBean<Express> searchOrder( String page, String rows,String name );

	PaginationBean<Express> cancleorderlist(String page, String rows, String uuid);

	PaginationBean<Express> comingorderlist(String page, String rows, String uuid);

	boolean sureOrder(String ooid);

	boolean comments(String ooid, String did);

	Express orderInfo(int ooid);


}
