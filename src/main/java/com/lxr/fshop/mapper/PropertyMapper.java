package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.Property;
import com.lxr.fshop.pojo.PropertyExample;

public interface PropertyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Property record);

    int insertSelective(Property record);

    List<Property> selectByExample(PropertyExample example);

    Property selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Property record);

    int updateByPrimaryKey(Property record);
}