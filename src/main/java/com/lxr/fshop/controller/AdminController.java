package com.lxr.fshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import com.lxr.fshop.pojo.Order;
import com.lxr.fshop.pojo.OrderItem;
import com.lxr.fshop.pojo.User;
import com.lxr.fshop.service.CategoryService;
import com.lxr.fshop.service.OrderItemService;
import com.lxr.fshop.service.OrderService;
import com.lxr.fshop.service.ProductService;
import com.lxr.fshop.service.UserService;

@Controller
@RequestMapping("")
public class AdminController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    UserService userService;
	
	@RequestMapping("admin_index")
	public String index()  {
		return "admin1/index";
	}
	
	@RequestMapping("admin_home")
	public String homeIndex(Model model)  {
		
		float revenue = 0;
		int sales = 0;
		String status = null;
		List<Order> os= orderService.list();
        orderItemService.fill(os);
        for (Order o : os) {
        	status = o.getStatus();
        	if(status.equals(orderService.waitPay)||status.equals(orderService.finishReturn)) {
        		
        	}else {
        		revenue+=o.getTotal();
            	sales+=o.getTotalNumber();
        	}		
        }
        
        model.addAttribute("os", os);
        
		model.addAttribute("revenue", revenue);
		model.addAttribute("sales", sales);
		model.addAttribute("products", productService.count());
		model.addAttribute("users", userService.list().size());
		
		return "admin1/home";
	}
	
	@RequestMapping("admin")
	public String home(Model model)  {
		return "admin1/login";
	}
	
	@RequestMapping("admin1_product_delete")
	 public String delete(int id) {
        productService.delete(id);
        return "redirect:admin_product_all";
    }
	
    @RequestMapping("adminlogin")
    public String login(@RequestParam("name") String name,@RequestParam("password") String password, Model model, HttpSession session) {
        name = HtmlUtils.htmlEscape(name);
        User user = userService.get(name,password);
        
        if(name.equals("admin")) {
        	if(null==user){
                model.addAttribute("msg", "账号密码错误");
                return "admin1/login";
            }
            session.setAttribute("admin", user);
            return "redirect:admin_index";
        }else {
        	model.addAttribute("msg", "账号密码错误");
            return "admin1/login";
        }
    }
    
    @RequestMapping("adminisExist")
    @ResponseBody
    public boolean register(Model model,String name) {
        boolean exist = userService.isExist(name);
        return exist;
    }
    
    
 
    @RequestMapping("loginCheck")
    @ResponseBody
    public boolean loginCheck(String name,String password, Model model, HttpSession session) {
        name = HtmlUtils.htmlEscape(name);
        User user = userService.get(name,password);
        if(null==user){
            return false;
        }
        return true;
    }
    
    @RequestMapping("adminlogout")
    public String logout( HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:admin";
    }
    

    @RequestMapping("admin_report_list")
    public String report(Model model) {
    	float revenue = 0;
		int sales = 0;
		String status = null;
		List<Order> os= orderService.list();
        orderItemService.fill(os);
        for (Order o : os) {
        	status = o.getStatus();
        	if(status.equals(orderService.waitPay)||status.equals(orderService.finishReturn)) {
        		
        	}else {
        		revenue+=o.getTotal();
            	sales+=o.getTotalNumber();
        	}		
        }
        
        model.addAttribute("os", os);
        
		model.addAttribute("revenue", revenue);
		model.addAttribute("sales", sales);
		model.addAttribute("products", productService.count());
		model.addAttribute("users", userService.list().size());
        return "admin1/listReport";
    }
    
    @RequestMapping("admin_product_delete_list")
    @ResponseBody
    public boolean deleteListProduct(String ids) {
    	ids.split(",");
    	System.out.println(ids);
    	List<String> list = new ArrayList<String>();
	     String[] str = ids.split(",");
	     for (int i = 0; i < str.length; i++) {
	         list.add(str[i]);
	         productService.delete(Integer.parseInt(str[i]));
	    }
        return true;
    }
    
    public List<String> getList(String id) {
    	     List<String> list = new ArrayList<String>();
    	     String[] str = id.split(",");
    	     for (int i = 0; i < str.length; i++) {
    	         list.add(str[i]);
    	    }
    	     return list;
    	 }
}
