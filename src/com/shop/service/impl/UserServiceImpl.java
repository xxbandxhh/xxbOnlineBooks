package com.shop.service.impl;

import java.sql.SQLException;

import com.shop.dao.UserDao;
import com.shop.dao.impl.UserDaoImpl;
import com.shop.domain.User;
import com.shop.service.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public boolean regist(User user) {
		UserDao userDao = new UserDaoImpl();
		int result = 0;
		try {
			result = userDao.regist(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result>0;
	}

	@Override
	public boolean active(String activeCode) {
		UserDao userDao = new UserDaoImpl();
		int result = 0;
		try {
			result = userDao.active(activeCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result>0;
	}

	@Override
	public User login(String username, String password) {
		UserDao userDao = new UserDaoImpl();
		User user = null;
		try {
			user = userDao.login(username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}
