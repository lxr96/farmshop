package com.lxr.fshop.service;

import java.util.List;

import com.lxr.fshop.pojo.Product;
import com.lxr.fshop.pojo.PropertyValue;

public interface PropertyValueService {
    void init(Product p);
    void update(PropertyValue pv);

    PropertyValue get(int ptid, int pid);
    List<PropertyValue> list(int pid);
}