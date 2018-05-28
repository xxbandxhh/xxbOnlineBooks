package com.shop.service;

import java.util.List;
import java.util.Map;

import com.shop.domain.Order;
import com.shop.domain.Product;

public interface ProductService {

	List<Product> list(String cid);

	Product findById(String pid);

	boolean submitOrder(Order order);

}
