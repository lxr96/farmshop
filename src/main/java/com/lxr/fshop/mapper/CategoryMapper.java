package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.Category;
import com.lxr.fshop.pojo.CategoryExample;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    List<Category> selectByExample(CategoryExample example);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}

