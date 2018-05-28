package com.shop.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.shop.dao.ProductDao;
import com.shop.dao.impl.ProductDaoImpl;
import com.shop.domain.Order;
import com.shop.domain.OrderItem;
import com.shop.domain.Product;
import com.shop.service.ProductService;
import com.shop.utils.CommonsUtils;
import com.shop.utils.DataSourceUtils;

public class ProductServiceImpl implements ProductService {

	@Override
	public List<Product> list(String cid) {
		//调用dao层获得商品数据
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = null;
		try {
			productList = productDao.list(cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}

	@Override
	public Product findById(String pid) {
		//调用dao层获得商品数据
		ProductDao productDao = new ProductDaoImpl();
		Product product = null;
		try {
			product = productDao.findById(pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}

	@Override
	public boolean submitOrder(Order order) {
		boolean flag = true;
		ProductDao productDao = new ProductDaoImpl();
		try {
			DataSourceUtils.startTransaction();
			productDao.saveOrder(order);
			productDao.saveOrderItem(order);
		} catch (SQLException e) {
			flag = false;
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DataSourceUtils.commitAndRelease();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
		
	}

}
