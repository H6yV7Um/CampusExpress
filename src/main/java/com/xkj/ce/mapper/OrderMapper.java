package com.xkj.ce.mapper;

import java.util.List;

import com.xkj.ce.entity.Applyorder;
import com.xkj.ce.entity.Order;
import com.xkj.ce.entity.ProOrder;

public interface OrderMapper {

	public boolean order(Order ord);

	public Integer getIdByAddr(String addr);

	public boolean addzaccept(Applyorder applyorder);

	public List<ProOrder> getapporderbyoid(Integer oid);

	public boolean addorder(Integer aid);

	public boolean updatezac(Integer aid);

	public boolean deletezac(Integer oid);

	public List<Order> getzordersByuuid(Integer uuid);

	public boolean updateorder(Integer oid);

	public List<Order> zxdgetordersbyuuid(Integer uuid);

}
