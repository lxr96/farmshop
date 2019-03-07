package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.OrderItem;
import com.lxr.fshop.pojo.OrderItemExample;

public interface OrderItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderItem record);

    int insertSelective(OrderItem record);

    List<OrderItem> selectByExample(OrderItemExample example);

    OrderItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderItem record);

    int updateByPrimaryKey(OrderItem record);
}