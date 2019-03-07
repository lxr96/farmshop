package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.User;
import com.lxr.fshop.pojo.UserExample;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}