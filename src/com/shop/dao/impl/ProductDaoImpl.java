package com.shop.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.shop.dao.ProductDao;
import com.shop.domain.Order;
import com.shop.domain.OrderItem;
import com.shop.domain.Product;
import com.shop.utils.DataSourceUtils;

public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Product> list(String cid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where cid=?";
		List<Product> productList = runner.query(sql, new BeanListHandler<Product>(Product.class),cid);
		return productList;
	}

	@Override
	public Product findById(String pid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pid=?";
		Product product= runner.query(sql, new BeanHandler<Product>(Product.class),pid);
		return product;
	}

	@Override
	public void saveOrderItem(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into orderitem values(?,?,?,?,?)";
		Connection conn = DataSourceUtils.getConnection();
		List<OrderItem> items = order.getItems();
		for(OrderItem item : items){
			runner.update(conn,sql,item.getItemid(),item.getCount(),
					item.getSubtotal(),item.getProduct().getPid(),item.getOrder().getOid());
		}
	}

	@Override
	public void saveOrder(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner();
		Connection conn = DataSourceUtils.getConnection();
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		runner.update(conn,sql,order.getOid(),order.getOrdertime(),order.getTotal(),
				order.getState(),order.getAddress(),order.getName(),order.getTelephone(),
				order.getUser().getUid());
		
	}

	

	

}
