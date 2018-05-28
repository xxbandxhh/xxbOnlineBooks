package com.shop.service;

import com.shop.domain.User;

public interface UserService {

	boolean regist(User user);

	boolean active(String activeCode);

	User login(String username, String password);

}
