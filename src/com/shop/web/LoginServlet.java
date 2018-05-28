package com.shop.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.domain.User;
import com.shop.service.UserService;
import com.shop.service.impl.UserServiceImpl;
import com.shop.utils.MD5Utils;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserService userService = new UserServiceImpl();
		User user = userService.login(username,MD5Utils.md5(password));
		
		if(user!=null){
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
		
		request.setAttribute("loginInfo", "用户名密码错误或用户尚未激活");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}