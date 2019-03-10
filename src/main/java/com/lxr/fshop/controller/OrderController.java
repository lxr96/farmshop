package com.lxr.fshop.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lxr.fshop.pojo.Order;
import com.lxr.fshop.service.OrderItemService;
import com.lxr.fshop.service.OrderService;
import com.lxr.fshop.util.Page;


@Controller
@RequestMapping("")
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;

    @RequestMapping("admin_order_list")
    public String list(Model model, Page page){
        List<Order> os= orderService.list();
        orderItemService.fill(os);
        model.addAttribute("os", os);
        return "admin1/listOrder";
    }

    @RequestMapping("admin_order_delivery")
    public String delivery(Order o) throws IOException {
        o.setDeliveryDate(new Date());
        o.setStatus(OrderService.waitConfirm);
        orderService.update(o);
     // 管理员发货后，删除商品库存的数量
		orderItemService.deleteStock(o);
        return "redirect:admin_order_list";
    }
    
    @RequestMapping("admin_order_return_success")
    public String orderReturn(Order o) throws IOException {
        o.setStatus(OrderService.finishReturn);
        orderService.update(o);
        return "redirect:admin_order_list";
    }
    
    @RequestMapping("admin_order_detail")
    public String detail(int id,Model model) throws IOException {
    	Order o =orderService.get(id);
        orderItemService.fill(o);
        model.addAttribute("o", o);
        return "admin1/orderDetail";
    }
    
}

