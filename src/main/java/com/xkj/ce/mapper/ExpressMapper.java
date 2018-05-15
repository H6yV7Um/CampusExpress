package com.xkj.ce.mapper;

import java.util.List;

import com.xkj.ce.entity.Express;
import com.xkj.ce.entity.ExpressType;
import com.xkj.ce.entity.PaginationBean;

public interface ExpressMapper {

	PaginationBean<Express> getExpressPagination(PaginationBean<Express> expressBean);

	List<ExpressType> typeList();

	PaginationBean<Express> getExpressTypePagination(PaginationBean<Express> expressBean);

	PaginationBean<Express> getOrderPagination(PaginationBean<Express> orderBean);

	Express findDU(int did);

	PaginationBean<Express> getWOrderPagination(PaginationBean<Express> orderBean);
	
	PaginationBean<Express> searchOrder( PaginationBean<Express> expressBean  );

	PaginationBean<Express> cancleOrder(PaginationBean<Express> expressBean);

	PaginationBean<Express> comingorderlist(PaginationBean<Express> expressBean);

	int sureOrder(String ooid);

	int count(String did);

	int comments(String ooid);

	int sum(String did);

	Express orderInfo(int ooid);


	
}
