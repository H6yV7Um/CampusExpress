package com.xkj.ce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xkj.ce.entity.Express;
import com.xkj.ce.entity.ExpressType;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.mapper.ExpressMapper;
import com.xkj.ce.service.ExpressService;

@Service("expressService")
public class ExpressServiceImpl implements ExpressService {

	@Autowired
	private ExpressMapper expressMapper;
	
	@Override
	public PaginationBean<Express> pageList(String currPage, String pageSize) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean=expressMapper.getExpressPagination(expressBean);
		return expressBean;
	}

	@Override
	public List<ExpressType> typeList() {
		return expressMapper.typeList();
	}

	@Override
	public PaginationBean<Express> findType(String currPage, String pageSize, String otype) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean.setOtype(otype);
		expressBean=expressMapper.getExpressTypePagination(expressBean);
		return expressBean;
	}

	@Override
	public PaginationBean<Express> orderlist(String currPage, String pageSize, String uuid) {
		PaginationBean<Express> orderBean=new PaginationBean<Express>();
		if(currPage!=null){
			orderBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			orderBean.setPageSize(Integer.parseInt(pageSize));
		}
		orderBean.setUuid(uuid);
		orderBean=expressMapper.getOrderPagination(orderBean);
		return orderBean;
	}

	@Override
	public Express findDU(int did) {
		return expressMapper.findDU(did);
	}

	@Override
	public PaginationBean<Express> worderlist(String currPage, String pageSize, String uuid) {
		PaginationBean<Express> orderBean=new PaginationBean<Express>();
		if(currPage!=null){
			orderBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			orderBean.setPageSize(Integer.parseInt(pageSize));
		}
		orderBean.setUuid(uuid);
		orderBean=expressMapper.getWOrderPagination(orderBean);
		return orderBean;
	}

	
	public PaginationBean<Express> searchOrder(String currPage,String pageSize,String orelname) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean.setOtype(orelname);
		expressBean=expressMapper.searchOrder(expressBean);
		return expressBean;
	}

	@Override
	public PaginationBean<Express> cancleorderlist(String currPage, String pageSize, String uuid) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean.setUuid(uuid);
		expressBean=expressMapper.cancleOrder(expressBean);
		return expressBean;
	}

	@Override
	public PaginationBean<Express> comingorderlist(String currPage, String pageSize, String uuid) {
		PaginationBean<Express> expressBean=new PaginationBean<Express>();
		if(currPage!=null){
			expressBean.setCurrPage(Integer.parseInt(currPage));
		}
		if(pageSize!=null){
			expressBean.setPageSize(Integer.parseInt(pageSize));
		}
		expressBean.setUuid(uuid);
		expressBean=expressMapper.comingorderlist(expressBean);
		return expressBean;
	}

	@Override
	public boolean sureOrder(String ooid) {
		return expressMapper.sureOrder(ooid)>0;
	}

	@Override
	public boolean comments(String ooid, String did) {
		return expressMapper.comments(ooid)>0&&expressMapper.count(did)>0&&expressMapper.sum(did)>0;
	}

	@Override
	public Express orderInfo(int ooid) {
		return expressMapper.orderInfo(ooid);
	}


}
