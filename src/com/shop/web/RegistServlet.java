package com.shop.web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.shop.domain.User;
import com.shop.service.UserService;
import com.shop.service.impl.UserServiceImpl;
import com.shop.utils.CommonsUtils;
import com.shop.utils.MD5Utils;
import com.shop.utils.MailUtils;

public class RegistServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取表单数据的编码 解决post中文乱码
		request.setCharacterEncoding("UTF-8");
		//以map形式获得表单数据
		Map<String, String[]> parameterMap = request.getParameterMap();
		User user = new User();
		try {
			BeanUtils.populate(user, parameterMap);//将表单数据封装user中
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//用户输入的验证码
		String code = request.getParameter("code");
		//获得发送短信时往session中存储的验证码
		String smsCode = (String) request.getSession().getAttribute("smsCode");
		//比对用户输入验证码 与 session存储的是否一致
		if(code==null||!code.equals(smsCode)){
			request.setAttribute("registInfo", "验证码错误");
			request.setAttribute("user", user);
			request.getRequestDispatcher("/regist.jsp").forward(request, response);
			return;
		}
		
		user.setUid(CommonsUtils.getUUID());
		user.setPassword(MD5Utils.md5(user.getPassword()));
		String activeCode = CommonsUtils.getUUID();
		user.setCode(activeCode);
		
		UserService userService = new UserServiceImpl();
		//注册的实现
		boolean isRegistSuccess = userService.regist(user);
		//注册成功
		if(isRegistSuccess){
			//发送激活邮件
			String email = user.getEmail();
			String emailMsg = "您好，请点击下面连接进行激活<a href='http://localhost:8080/HaoShop/activeServlet?activeCode="+activeCode+"'>http://localhost:8080/HaoShop/activeServlet?activeCode="+activeCode+"</a>";
			try {
				//发送邮件
				MailUtils.sendMail(email, emailMsg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else{
			
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
