package com.shop.web;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.domain.Product;
import com.shop.service.ProductService;
import com.shop.service.impl.ProductServiceImpl;

public class InfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得商品的pid
		String pid = request.getParameter("pid");
		//获得该商品的信息对象
		ProductService productService = new ProductServiceImpl();
		//根据商品id查询该商品信息
		Product product = productService.findById(pid);
		//将该商品放到request域中
		request.setAttribute("product", product);
		
		//添加商品浏览记录
		//*****************************************************
		HttpSession session = request.getSession();
		Map<String,Product> historyMap = (Map<String, Product>) session.getAttribute("historyMap");
		if(historyMap==null){
			historyMap = new LinkedHashMap<String,Product>();
		}
		if(historyMap.containsKey(pid)){
			//包含商品
			historyMap.remove(product);
		}
		historyMap.put(pid, product);
		session.setAttribute("historyMap", historyMap);
		//*****************************************************
		
		request.getRequestDispatcher("/info.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}