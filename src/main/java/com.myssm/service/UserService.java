package com.myssm.service;


import com.myssm.po.User;

import java.util.List;

public interface UserService {

	public User findUserByUserNameAndPassword(User user);

	public List<User> findUsers();

	public User findUserById(String id);

	public User findUserByUserName(String userName);

	public void insertUser(User user);

	public void updateUser(User user);

	public void deleteUser(String id);

	public List<User> findUserList(User user);
}
