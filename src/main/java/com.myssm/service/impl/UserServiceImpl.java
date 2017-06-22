package com.myssm.service.impl;


import com.myssm.mapper.UserMapper;
import com.myssm.po.User;
import com.myssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public User findUserByUserNameAndPassword(User user) {
		User u= userMapper.findUserByNameAndPassword(user);
		if(u==null){
			return null;
		}
		else{
			return u;
		}
	}

	public List<User> findUsers() {
		List<User> list=userMapper.findUsers();
		if(list==null){
			return null;
		}else{
			return list;
		}
	}

	public User findUserById(String id) {
		return userMapper.findUserById(id);
	}

	public User findUserByUserName(String userName) {
		User u= userMapper.findUserByUserName(userName);
		if(u==null) return null;
		else return u;
	}

	public void insertUser(User user) {
		userMapper.insertUser(user);
	}

	public void updateUser(User user) {
		userMapper.updateUser(user);
	}

	public void deleteUser(String id) {
		userMapper.deleteUser(id);
	}

	public List<User> findUserList(User user) {
		return userMapper.findUserList(user);
	}

}
