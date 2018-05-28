package com.shop.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.shop.dao.UserDao;
import com.shop.domain.User;
import com.shop.utils.DataSourceUtils;

public class UserDaoImpl implements UserDao {

	@Override
	public int regist(User user) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into user(uid,username,name,password,email,state,code) values(?,?,?,?,?,?,?)";
		int update = runner.update(sql,user.getUid(),user.getUsername(),user.getName(),user.getPassword(),user.getEmail(),user.getState(),user.getCode());
		return update;
	}

	@Override
	public int active(String activeCode) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update user set state=? where code=?";
		int update = runner.update(sql,1,activeCode);
		return update;
	}

	@Override
	public User login(String username, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username=? and password=? and state=?";
		User user = runner.query(sql, new BeanHandler<User>(User.class), username,password,1);
		return user;
	}

}
