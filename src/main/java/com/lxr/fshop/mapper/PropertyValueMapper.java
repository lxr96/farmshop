package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.PropertyValue;
import com.lxr.fshop.pojo.PropertyValueExample;

public interface PropertyValueMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PropertyValue record);

    int insertSelective(PropertyValue record);

    List<PropertyValue> selectByExample(PropertyValueExample example);

    PropertyValue selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PropertyValue record);

    int updateByPrimaryKey(PropertyValue record);
}