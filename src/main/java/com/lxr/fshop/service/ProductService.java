package com.lxr.fshop.service;

import java.util.List;

import com.lxr.fshop.pojo.Category;
import com.lxr.fshop.pojo.Product;

public interface ProductService {
    void add(Product p);
    void delete(int id);
    void update(Product p);
    Product get(int id);
    List list(int cid);
    void setFirstProductImage(Product p);

    void fill(List<Category> cs);

    void fill(Category c);

    void fillByRow(List<Category> cs);

    void setSaleAndReviewNumber(Product p);

    void setSaleAndReviewNumber(List<Product> ps);

    List<Product> search(String keyword);
	List<Product> list();
	int count();
	List<Product> listAdmin(int cid);
	List<Product> getProductsByCid(int cid,String keyword);
}