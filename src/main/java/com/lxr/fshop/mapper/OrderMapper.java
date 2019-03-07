package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.Order;
import com.lxr.fshop.pojo.OrderExample;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}