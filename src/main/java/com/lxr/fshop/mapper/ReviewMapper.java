package com.lxr.fshop.mapper;

import java.util.List;

import com.lxr.fshop.pojo.Review;
import com.lxr.fshop.pojo.ReviewExample;

public interface ReviewMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Review record);

    int insertSelective(Review record);

    List<Review> selectByExample(ReviewExample example);

    Review selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Review record);

    int updateByPrimaryKey(Review record);
}