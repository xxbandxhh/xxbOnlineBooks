package com.shop.web;

import java.io.IOException;
import java.util.HashMap;
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

public class AddCartServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得商品的pid
		String pid = request.getParameter("pid");
		//获得该商品的信息对象
		ProductService productService = new ProductServiceImpl();
		//根据pid查询商品
		Product product = productService.findById(pid);
		//获得会话对象session (将cart存储到session 才能保证同一个会话 商品不丢失)
		HttpSession session = request.getSession();
		//从session获得购物车 --- 面授时使用Cart对象进行封装
		Map<Product,Integer> cart = (Map<Product,Integer>) session.getAttribute("cart");
		//如果该客户是第一次加入购物车 那么车是没有的 手动创建一个cart
		if(cart==null){
			cart = new HashMap<Product,Integer>();
		}
		if(cart.containsKey(product)){
			//购物车包含该商品 将该商品的
			cart.put(product, cart.get(product)+1);
		}else{
			//车中没有该种商品
			cart.put(product, 1);
		}
		//将购物车放到session中  等客户在将商品加入到购物车中时  保证购物车使用是同一个
		session.setAttribute("cart", cart);
		//重定向到购物车页面
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}