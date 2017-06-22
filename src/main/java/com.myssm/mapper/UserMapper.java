package com.myssm.mapper;


import com.myssm.po.User;

import java.util.List;

public interface UserMapper {
	//根据用户名和密码查找用户
	User findUserByNameAndPassword(User user);

	//查询用户列表
	List<User> findUsers();

	//根据ID查找用户信息
	User findUserById(String id);

	//根据用户名查找用户信息
	User findUserByUserName(String userName);

	//根据用户名等模糊查询
	List<User> findUserList(User user);

	//添加用户
	void insertUser(User user);

	//根据id修改用户
	void updateUser(User user);

	//根据id删除用户
	void deleteUser(String id);
}
