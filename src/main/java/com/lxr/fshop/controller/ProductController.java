package com.lxr.fshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lxr.fshop.pojo.Category;
import com.lxr.fshop.pojo.Product;
import com.lxr.fshop.service.CategoryService;
import com.lxr.fshop.service.ProductService;
import com.lxr.fshop.util.Page;

@Controller
@RequestMapping("")
public class ProductController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;

    @RequestMapping("admin_product_add")
    public String add(Model model, Product p) {
    	p.setStatus(1);
        productService.add(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_delete")
    public String delete(int id) {
        Product p = productService.get(id);
        productService.delete(id);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_edit")
    public String edit(Model model, int id) {
        Product p = productService.get(id);
        Category c = categoryService.get(p.getCid());
        p.setCategory(c);
        model.addAttribute("p", p);
        return "admin1/editProduct";
    }

    @RequestMapping("admin_product_update")
    public String update(Product p) {
        productService.update(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_list")
    public String list(int cid, Model model) {
        Category c = categoryService.get(cid);
        List<Product> ps = productService.listAdmin(cid);
        model.addAttribute("ps", ps);
        model.addAttribute("c", c);

        return "admin1/listProduct";
    }
    
    
    @RequestMapping("admin_product_all")
    public String list(Model model) {
    	List<Category> cs = categoryService.list();
        List<Product> ps = productService.list();
        model.addAttribute("cs", cs);
        model.addAttribute("ps", ps);
        return "admin1/product";
    }
}

