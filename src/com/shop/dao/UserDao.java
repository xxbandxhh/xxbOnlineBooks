package com.shop.dao;

import java.sql.SQLException;

import com.shop.domain.User;

public interface UserDao {

	int regist(User user) throws SQLException;

	int active(String activeCode) throws SQLException;

	User login(String username, String password) throws SQLException;

}
