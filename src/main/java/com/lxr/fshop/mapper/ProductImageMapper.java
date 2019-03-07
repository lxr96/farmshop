package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.ProductImage;
import com.lxr.fshop.pojo.ProductImageExample;

public interface ProductImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductImage record);

    int insertSelective(ProductImage record);

    List<ProductImage> selectByExample(ProductImageExample example);

    ProductImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductImage record);

    int updateByPrimaryKey(ProductImage record);
}