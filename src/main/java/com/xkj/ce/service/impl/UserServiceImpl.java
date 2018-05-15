package com.xkj.ce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xkj.ce.entity.Address;
import com.xkj.ce.entity.Duser;
import com.xkj.ce.entity.Express;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.entity.User;
import com.xkj.ce.mapper.UserMapper;
import com.xkj.ce.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public boolean isExistUN(String tel) {
		return userMapper.findUser(tel) != null;
	}

	@Override
	public String getMail(String tel) {
		String temp_mail = userMapper.getMail(tel);
		// char[] mail=temp_mail.toCharArray();
		// int index=temp_mail.indexOf("@");
		// for (int i = 0; i < mail.length; i++) {
		// if(i >=2 && i<index){
		// mail[i]= '*';
		// }
		// }
		return new String(temp_mail);
	}

	@Override
	public boolean editPwdByTel(String tel, String password) {
		Integer result = userMapper.editPwdByTel(tel, password);
		System.out.println("返回值:" + result);
		if (result == null) {
			return false;
		}
		return true;
	}

	@Override
	public User login(User user) {
		// user.setPassword(Encrypt.md5AndSha(user.getPassword()));
		return userMapper.getUser(user);
	}

	@Override
	public boolean RegisterUser(User user) {
		return userMapper.RegisterUser(user);
	}

	@Override
	public User getUserMsg(String phonenum) {
		return userMapper.getUserMsg(phonenum);
	}

	@Override
	public boolean updatemsg(User user) {
		return userMapper.updatemsg(user);
	}

	@Override
	public List<Address> getAddr(int uuid) {
		return userMapper.getAddr(uuid);
	}

	@Override
	public boolean deladdr(int zid) {
		return userMapper.deladdr(zid);
	}

	@Override
	public boolean addaddr(Address address) {
		return userMapper.addaddr(address);
	}

	@Override
	public Integer getdidbyuuid(int uuid) {
		return userMapper.getdidbyuuid(uuid);
	}

	@Override
	public List<User> searchUser(String tel) {
		return userMapper.searchUser(tel);
	}

	@Override
	public boolean delUserById(String uuid) {

		return userMapper.delUserById(uuid) != null;
	}

	@Override
	public boolean RegisterDai(Duser duser) {
		boolean result = userMapper.RegisterDai(duser) != null;
		return result;
	}

	// 查看所有待递员的申请信息
	@Override
	public PaginationBean<Duser> listDai(String currPage, String pageSize) {
		PaginationBean<Duser> duserBean = new PaginationBean<Duser>();
		if (currPage != null) {
			duserBean.setCurrPage(Integer.parseInt(currPage));
		}
		if (pageSize != null) {
			duserBean.setPageSize(Integer.parseInt(pageSize));
		}
		duserBean = userMapper.getDuserPagination(duserBean);
		return duserBean;
	}

	@Override
	public boolean agreeDai(String uuid) {
		boolean result = userMapper.agreeDai(uuid) != null;
		return result;
	}

	@Override
	public boolean refuseDai(String uuid) {
		boolean result = userMapper.refuseDai(uuid) != null;
		return result;
	}

	@Override
	public boolean checkUser(String tel, String oldPwd) {
		boolean result = userMapper.checkUser(tel,oldPwd) != null;
		return result;
	}

}
