package com.dao;

import com.pojo.User;

public interface UserDAO {
	int addUser(User user);
	boolean checkLogin(String username, String password);
	String getEmail(String username);

}
