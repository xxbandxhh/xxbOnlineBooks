package com.shop.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.domain.Product;
import com.shop.service.ProductService;
import com.shop.service.impl.ProductServiceImpl;

public class ChangeCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得pid
		String pid = request.getParameter("pid");
		//获得该商品的信息对象
		ProductService productService = new ProductServiceImpl();
		//根据pid查询商品数据
		Product product = productService.findById(pid);
		//获得标志
		String flag = request.getParameter("flag");// 是对购物车中商品的数量增加还是减少
		//获得购物车
		HttpSession session = request.getSession();
		Map<Product,Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
		//判断标志位
		if(flag.equals("minus")){
			//减少车中商品的数量
			cart.put(product, cart.get(product)-1);
		}else{
			//增加车中商品的数量
			cart.put(product, cart.get(product)+1);
		}
		
		response.getWriter().write("true");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}