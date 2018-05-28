package com.shop.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.dao.ProductDao;
import com.shop.dao.impl.ProductDaoImpl;
import com.shop.domain.Order;
import com.shop.domain.OrderItem;
import com.shop.domain.Product;
import com.shop.domain.User;
import com.shop.service.ProductService;
import com.shop.service.impl.ProductServiceImpl;
import com.shop.utils.CommonsUtils;

public class SubmitOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//获得购物车中的数据
		HttpSession session = request.getSession();
		
		//获得user对象
		/*
		 * 用户是否登录 根据什么确定
		 * 目前session中有user代表用户已经登录
		 */
		User user = (User) session.getAttribute("user");
		//如果用户是null 没登陆
		if(user==null){
			request.setAttribute("loginInfo", "请先登录在进行订单提交");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		

		Map<Product,Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
		//将购物车传递给dao层
		ProductService productService = new ProductServiceImpl();

		ProductDao productDao = new ProductDaoImpl();
		//将car转换成order实体
		Order order = new Order();

		//private String oid;
		order.setOid(CommonsUtils.getUUID());
		//private String ordertime;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String orderTime = format.format(new Date());
		order.setOrdertime(orderTime);
		//private int state;
		order.setState(0);
		//private String name;
		//private String address;
		//private String telephone;
		//private User user;
		order.setUser(user);
		//private List<OrderItem> items = new ArrayList<OrderItem>();
		double total = 0.0;
		for(Map.Entry<Product, Integer> entry : cart.entrySet()){
			OrderItem item = new OrderItem();
			//private String itemid;
			item.setItemid(CommonsUtils.getUUID());
			//private int count;
			item.setCount(entry.getValue());
			//private double subtotal;
			item.setSubtotal(entry.getKey().getShop_price()*entry.getValue());
			//private Product product;
			item.setProduct(entry.getKey());
			//private Order order;
			item.setOrder(order);
			order.getItems().add(item);

			total+=item.getSubtotal();
		}
		//private double total;
		order.setTotal(total);

		boolean isSubmitSuccess = productService.submitOrder(order);
		
		if(isSubmitSuccess){
			//清除购物车
			session.removeAttribute("cart");
			//将订单信息放入session
			session.setAttribute("order", order);
			//跳转到选择地址页面
			response.sendRedirect(request.getContextPath()+"/order.jsp");

		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}