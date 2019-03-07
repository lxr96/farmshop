package com.lxr.fshop.service;

import com.lxr.fshop.pojo.UserDetail;

public interface UserDetailService {
	UserDetail get(int id);

	void update(UserDetail userDetail);

	void add(UserDetail userDetail);

}
