package com.shop.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.domain.Product;
import com.shop.service.ProductService;
import com.shop.service.impl.ProductServiceImpl;

public class ListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//接受商品类别参数
		String cid = request.getParameter("cid");
		//根据pid查询响应类别的商品
		ProductService productService = new ProductServiceImpl();
		List<Product> productList = productService.list(cid);
		//将数据放置到request域中 转发到list.jsp页面进行显示
		request.setAttribute("productList", productList);
		//转发给list.jsp进行显示
		request.getRequestDispatcher("/list.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}