package com.lxr.fshop.service.impl;

import com.lxr.fshop.mapper.PropertyMapper;
import com.lxr.fshop.pojo.Category;
import com.lxr.fshop.pojo.Product;
import com.lxr.fshop.pojo.Property;
import com.lxr.fshop.pojo.PropertyExample;
import com.lxr.fshop.service.CategoryService;
import com.lxr.fshop.service.PropertyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PropertyServiceImpl implements PropertyService {
    @Autowired
    PropertyMapper propertyMapper;

    @Override
    public void add(Property p) {
        propertyMapper.insert(p);
    }

    @Override
    public void delete(int id) {
        propertyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Property p) {
        propertyMapper.updateByPrimaryKeySelective(p);
    }

    @Override
    public Property get(int id) {
        return propertyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List list(int cid) {
        PropertyExample example =new PropertyExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        return propertyMapper.selectByExample(example);
    }
}