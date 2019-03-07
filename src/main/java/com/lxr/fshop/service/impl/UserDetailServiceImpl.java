package com.lxr.fshop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxr.fshop.mapper.UserDetailMapper;
import com.lxr.fshop.pojo.UserDetail;
import com.lxr.fshop.service.UserDetailService;

@Service
public class UserDetailServiceImpl implements UserDetailService {
	@Autowired
	UserDetailMapper userDetailMapper;

	@Override
	public UserDetail get(int id) {
		return userDetailMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(UserDetail userDetail) {
		userDetailMapper.updateByPrimaryKeySelective(userDetail);
	}

	@Override
	public void add(UserDetail userDetail) {
		userDetailMapper.insert(userDetail);
	}

}
