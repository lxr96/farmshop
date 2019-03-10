package com.lxr.fshop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lxr.fshop.pojo.*;
import com.lxr.fshop.service.*;

import comparator.*;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("")
public class ForeController {
	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@Autowired
	ProductImageService productImageService;
	@Autowired
	PropertyValueService propertyValueService;
	@Autowired
	OrderService orderService;
	@Autowired
	OrderItemService orderItemService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	UserDetailService userDetailService;

	@RequestMapping("forehome")
	public String home(Model model) {
		List<Category> cs = new ArrayList<Category>();
		cs = categoryService.list();
		if (cs.size() > 18) {
			cs = cs.subList(0, 17);// 0~16,不包括17
		}
		productService.fill(cs);
		productService.fillByRow(cs);
		model.addAttribute("cs", cs);
		return "fore/home";
	}

	@RequestMapping("foreregister")
	public String register(Model model, User user) {
		String name = user.getName();
		name = HtmlUtils.htmlEscape(name);
		user.setName(name);
		boolean exist = userService.isExist(name);

		if (exist) {
			String m = "用户名已经被使用,不能使用";
			model.addAttribute("msg", m);

			return "fore/register";
		}
		userService.add(user);
		model.addAttribute("user", user);
		return "redirect:loginPage";
	}

	@RequestMapping("forelogin")
	public String login(@RequestParam("name") String name, @RequestParam("password") String password, Model model,
			HttpSession session) {
		name = HtmlUtils.htmlEscape(name);
		User user = userService.get(name, password);

		if (null == user) {
			model.addAttribute("msg", "账号密码错误");
			return "fore/login";
		}
		session.setAttribute("user", user);
		return "redirect:forehome";
	}

	@RequestMapping("forelogout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:forehome";
	}

	@RequestMapping("foreproduct")
	public String product(int pid, Model model) {
		Product p = productService.get(pid);

		List<ProductImage> productSingleImages = productImageService.list(p.getId(), ProductImageService.type_single);
		List<ProductImage> productDetailImages = productImageService.list(p.getId(), ProductImageService.type_detail);
		p.setProductSingleImages(productSingleImages);
		p.setProductDetailImages(productDetailImages);

		List<PropertyValue> pvs = propertyValueService.list(p.getId());
		List<Review> reviews = reviewService.list(p.getId());
		productService.setSaleAndReviewNumber(p);

		model.addAttribute("reviews", reviews);
		model.addAttribute("p", p);
		model.addAttribute("pvs", pvs);
		return "fore/product";
	}

	@RequestMapping("forecheckLogin")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (null != user)
			return "success";
		return "fail";
	}

	@RequestMapping("foreloginAjax")
	@ResponseBody
	public String loginAjax(@RequestParam("name") String name, @RequestParam("password") String password,
			HttpSession session) {
		name = HtmlUtils.htmlEscape(name);
		User user = userService.get(name, password);

		if (null == user) {
			return "fail";
		}
		session.setAttribute("user", user);
		return "success";
	}

	@RequestMapping("forecategory")
	public String category(int cid, String sort, Model model) {
		Category c = categoryService.get(cid);
		productService.fill(c);
		productService.setSaleAndReviewNumber(c.getProducts());

		if (null != sort) {
			switch (sort) {
			case "review":
				Collections.sort(c.getProducts(), new ProductReviewComparator());
				break;
			case "date":
				Collections.sort(c.getProducts(), new ProductDateComparator());
				break;

			case "saleCount":
				Collections.sort(c.getProducts(), new ProductSaleCountComparator());
				break;

			case "price":
				Collections.sort(c.getProducts(), new ProductPriceComparator());
				break;

			case "all":
				Collections.sort(c.getProducts(), new ProductAllComparator());
				break;
			}
		}

		model.addAttribute("c", c);
		return "fore/category";
	}

	@RequestMapping("foresearch")
	public String search(@RequestParam(value = "pn", defaultValue = "1") int pn,
			@RequestParam(value = "cid", defaultValue = "0") int cid,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, Model model) {
		int pageSize = 12;
		List<Product> ps = new ArrayList<Product>();
		PageHelper.startPage(pn, pageSize);
		if (cid == 0) {// 全部
			ps = productService.search(keyword);
		} else {
			ps = productService.getProductsByCid(cid, keyword);
		}

		productService.setSaleAndReviewNumber(ps);
		PageInfo<Product> pageinfo = new PageInfo<Product>(ps);

		List<Category> cs = new ArrayList<Category>();
		cs = categoryService.list();

		model.addAttribute("cs", cs);
		model.addAttribute("ps", ps);
		model.addAttribute("page", pageinfo);
		model.addAttribute("keyword", keyword);
		model.addAttribute("cid", cid);
		return "fore/searchResult";
	}

	@RequestMapping("foresearch_ajax")
	@ResponseBody
	public PageInfo<Product> search1(String keyword, Model model) {
		int pn = 0;
		int pageSize = 16;
		PageHelper.startPage(pn, pageSize);
		List<Product> ps = productService.search("");
		productService.setSaleAndReviewNumber(ps);
		PageInfo<Product> pageinfo = new PageInfo<Product>(ps);
		model.addAttribute("ps", ps);
		model.addAttribute("page", pageinfo);
		model.addAttribute("keyword", keyword);
		return pageinfo;
	}

	@RequestMapping("forebuyone")
	public String buyone(int pid, int num, HttpSession session) {
		Product p = productService.get(pid);
		int oiid = 0;

		User user = (User) session.getAttribute("user");
		boolean found = false;
		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == p.getId().intValue()) {
				oi.setNumber(oi.getNumber() + num);
				orderItemService.update(oi);
				found = true;
				oiid = oi.getId();
				break;
			}
		}

		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setUid(user.getId());
			oi.setNumber(num);
			oi.setPid(pid);
			orderItemService.add(oi);
			oiid = oi.getId();
		}
		return "redirect:forebuy?oiid=" + oiid;
	}

	@RequestMapping("forebuy")
	public String buy(Model model, String[] oiid, HttpSession session) {
		List<OrderItem> ois = new ArrayList<>();
		float total = 0;

		for (String strid : oiid) {
			int id = Integer.parseInt(strid);
			OrderItem oi = orderItemService.get(id);
			total += oi.getProduct().getPromotePrice() * oi.getNumber();
			ois.add(oi);
		}

		User user = (User) session.getAttribute("user");
		UserDetail userDetail = userDetailService.get(user.getId());
		session.setAttribute("ois", ois);
		model.addAttribute("total", total);
		model.addAttribute("udate", userDetail);
		return "fore/buy";
	}

	@RequestMapping("foreaddCart")
	@ResponseBody
	public String addCart(int pid, int num, Model model, HttpSession session) {
		Product p = productService.get(pid);
		User user = (User) session.getAttribute("user");
		boolean found = false;

		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == p.getId().intValue()) {
				oi.setNumber(oi.getNumber() + num);
				orderItemService.update(oi);
				found = true;
				break;
			}
		}

		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setUid(user.getId());
			oi.setNumber(num);
			oi.setPid(pid);
			orderItemService.add(oi);
		}
		return "success";
	}

	@RequestMapping("forecart")
	public String cart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		model.addAttribute("ois", ois);
		return "fore/cart";
	}

	@RequestMapping("forechangeOrderItem")
	@ResponseBody
	public String changeOrderItem(Model model, HttpSession session, int pid, int number) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";

		List<OrderItem> ois = orderItemService.listByUser(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == pid) {
				oi.setNumber(number);
				orderItemService.update(oi);
				break;
			}

		}
		return "success";
	}

	@RequestMapping("foredeleteOrderItem")
	@ResponseBody
	public String deleteOrderItem(Model model, HttpSession session, int oiid) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";
		orderItemService.delete(oiid);
		return "success";
	}

	@RequestMapping("forecreateOrder")
	public String createOrder(Model model, Order order, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) + RandomUtils.nextInt(10000);
		order.setOrderCode(orderCode);
		order.setCreateDate(new Date());
		order.setUid(user.getId());
		order.setStatus(OrderService.waitPay);
		List<OrderItem> ois = (List<OrderItem>) session.getAttribute("ois");

		float total = orderService.add(order, ois);
		return "redirect:forealipay?oid=" + order.getId() + "&total=" + total;
	}

	@RequestMapping("forepayed")
	public String payed(int oid, float total, Model model) {
		Order order = orderService.get(oid);
		order.setStatus(OrderService.waitDelivery);
		order.setPayDate(new Date());
		orderService.update(order);
		model.addAttribute("o", order);
		return "fore/payed";
	}

	@RequestMapping("forebought")
	public String bought(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> os = orderService.list(user.getId(), OrderService.delete);

		orderItemService.fill(os);

		model.addAttribute("os", os);

		return "fore/bought";
	}

	@RequestMapping("foreconfirmPay")
	public String confirmPay(Model model, int oid) {
		Order o = orderService.get(oid);
		orderItemService.fill(o);
		
		model.addAttribute("o", o);
		return "fore/confirmPay";
	}

	@RequestMapping("foreorderConfirmed")
	public String orderConfirmed(Model model, int oid) {
		Order o = orderService.get(oid);
		o.setStatus(OrderService.waitReview);
		o.setConfirmDate(new Date());
		orderService.update(o);
		model.addAttribute("o", o);
		return "fore/orderConfirmed";
	}

	@RequestMapping("foredeleteOrder")
	@ResponseBody
	public String deleteOrder(Model model, int oid) {
		Order o = orderService.get(oid);
		o.setStatus(OrderService.delete);
		orderService.update(o);
		return "success";
	}

	@RequestMapping("forereview")
	public String review(Model model, int oid) {
		Order o = orderService.get(oid);
		orderItemService.fill(o);
		Product p = o.getOrderItems().get(0).getProduct();
		List<Review> reviews = reviewService.list(p.getId());
		productService.setSaleAndReviewNumber(p);
		model.addAttribute("p", p);
		model.addAttribute("o", o);
		model.addAttribute("reviews", reviews);
		return "fore/review";
	}

	@RequestMapping("forereturn")
	public String foreReturn(Model model, int oid) {
		Order o = orderService.get(oid);
		o.setStatus(orderService.waitReturn);
		orderService.update(o);
		return "redirect:forebought";
	}

	@RequestMapping("foredoreview")
	public String doreview(Model model, HttpSession session, @RequestParam("oid") int oid, @RequestParam("pid") int pid,
			String content) {
		Order o = orderService.get(oid);
		o.setStatus(OrderService.finish);
		orderService.update(o);

		Product p = productService.get(pid);
		content = HtmlUtils.htmlEscape(content);

		User user = (User) session.getAttribute("user");
		Review review = new Review();
		review.setContent(content);
		review.setPid(pid);
		review.setCreateDate(new Date());
		review.setUid(user.getId());
		reviewService.add(review);

		return "redirect:forereview?oid=" + oid + "&showonly=true";
	}

	@RequestMapping("fore_user_info")
	public String userInfo(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		UserDetail userDetail = userDetailService.get(user.getId());
		user.setUserDetail(userDetail);

		model.addAttribute("user", user);
		return "fore/userInfo";
	}

	// 新增或更新用户信息
	@RequestMapping("update_usedetail_info")
	public String userDetail(UserDetail userDetail) {
		if (userDetail.getId() == null) {
			userDetailService.add(userDetail);
		} else {
			userDetailService.update(userDetail);
		}
		return "redirect:fore_user_info";
	}
	// 更新用户密码
	@RequestMapping("foreuser")
	public String updateUser(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		user.getPassword();
		return "fore/userInfo2";	
	}
	// 更新用户密码
		@RequestMapping("update_user_info")
		public String updateUserInfo(int uid, String password, HttpSession session) {
			User user = (User) session.getAttribute("user");
			user.setPassword(password);
			userService.update(user);
			return "fore/userInfo2";	
		}

	// 热销推送
	@RequestMapping("forehotproduct1")
	public String hotProduct1(Model model) {
		List<Category> cs = new ArrayList<Category>();
		cs = categoryService.list();

		List<Product> ps = new ArrayList<Product>();
		for (Category c : cs) {
			productService.fill(c);
			productService.setSaleAndReviewNumber(c.getProducts());
			ps = c.getProducts();
		}

		Collections.sort(ps, new ProductSaleCountComparator());

		model.addAttribute("cs", cs);
		model.addAttribute("ps", ps);

		return "fore/searchResult";
	}

	// 热销推送
	@RequestMapping("forehotproduct2")
	public String hotProduct2(Model model) {
		List<Product> ps = new ArrayList<Product>();

		List<Category> cs = new ArrayList<Category>();
		cs = categoryService.list();

		Category c = categoryService.get(1);
		productService.fill(c);
		productService.setSaleAndReviewNumber(c.getProducts());
		ps = c.getProducts();
		Collections.sort(ps, new ProductSaleCountComparator());

		model.addAttribute("cs", cs);
		model.addAttribute("c", c);
		model.addAttribute("ps", c.getProducts());
		return "fore/category";
	}

	// 热销推送
	@RequestMapping("forehotproduct")
	public String hotProduct(Model model) {
		List<Product> ps = new ArrayList<Product>();

		List<Category> cs = new ArrayList<Category>();
		cs = categoryService.list();

		Category c = categoryService.get(1);
		productService.fill(c);
		productService.setSaleAndReviewNumber(c.getProducts());
		ps = c.getProducts();
		Collections.sort(ps, new ProductSaleCountComparator());

		model.addAttribute("cs", cs);
		model.addAttribute("c", c);
		model.addAttribute("ps", c.getProducts());
		return "fore/category";
	}
}
