package com.lxr.fshop.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.lxr.fshop.pojo.Order;
import com.lxr.fshop.pojo.OrderItem;

public interface OrderService {

    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String waitReturn = "waitReturn"; //退款中
    String finishReturn = "finishReturn"; //退款成功
    String finish = "finish";
    String delete = "delete";

    void add(Order c);
    float add(Order c,List<OrderItem> ois);
    void delete(int id);
    void update(Order c);
    Order get(int id);
    List list();
    List list(int uid, String excludedStatus);
	List<Order> listByPayDate(Date date) throws ParseException;
}