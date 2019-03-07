package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.Product;
import com.lxr.fshop.pojo.ProductExample;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}	
