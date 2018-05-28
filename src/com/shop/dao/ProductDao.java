package com.shop.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.shop.domain.Order;
import com.shop.domain.Product;

public interface ProductDao {

	List<Product> list(String cid) throws SQLException;

	Product findById(String pid) throws SQLException;

	void saveOrderItem(Order order) throws SQLException;

	void saveOrder(Order order) throws SQLException;




}
