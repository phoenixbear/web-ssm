package com.myssm.controller;

import java.util.Date;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.myssm.po.Items;
import com.myssm.po.User;
import com.myssm.service.ItemsService;
import com.myssm.service.UserService;
import com.myssm.util.MD5;
import com.myssm.util.ResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource(name="userService")
	private UserService userService;

	@Resource(name="itemsService")
	private ItemsService itemsService;

	/**
	 * 登录
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request){
		user.setPassword(MD5.getInstance().getMD5(user.getPassword()));
		User u=userService.findUserByUserNameAndPassword(user);
		if(u==null){
			request.setAttribute("user", u);
			request.setAttribute("errorMsg", "用户名或密码错误！");
			return "user/login";
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("currentUser", u);
			return "user/main";
		}
	}

	/*
	 * 用户首页
	 */
	@RequestMapping("/userIndex")
	public String userIndex(HttpServletRequest request){
		List<User> userlist=userService.findUsers();
		request.getSession().setAttribute("userlist", userlist);
		return "user/userList";
	}

	/*
	 * 查询搜索
	 */
	@RequestMapping("/userList")
	public String userList(HttpServletRequest request,User user){
		List<User> userlist=userService.findUserList(user);
		request.getSession().setAttribute("userlist", userlist);
		return "user/userList";
	}

	/*
	 * ajax请求用户信息
	 */
	@RequestMapping("/ajaxRequestUser")
	public void ajaxRequestUser(HttpServletRequest request,HttpServletResponse response,User user) throws Exception{
		String id=request.getParameter("id");
		user=userService.findUserById(id);

		JSONObject result=new JSONObject();
		try{
			result.put("userName", user.getUserName());
			result.put("createTime", user.getCreateTime());
			result.put("description", user.getDescription());
			result.put("password", user.getPassword());
		}catch(Exception e){
			result.put("message", "加载数据失败");
		}

		ResponseUtil.write(response, result);
	}

	/**
	 * 添加用户
	 * @throws Exception
	 */
	@RequestMapping("/addUser")
	public void addUser(HttpServletResponse response,User user,HttpServletRequest request) throws Exception{
		JSONObject result=new JSONObject();
		try {
			User user2=userService.findUserByUserName(user.getUserName());
			if(user2!=null){
				result.put("message", "用户名重复！");
			}else{
				user.setPassword(MD5.getInstance().getMD5(user.getPassword()));
				user.setCreateTime(new Date());
				userService.insertUser(user);;
				result.put("message", "添加用户成功！");
			}
		} catch (Exception e) {
			result.put("message", "添加用户失败！");
		}
		ResponseUtil.write(response, result);
	}

	/**
	 *修改用户
	 * @throws Exception
	 */
	@RequestMapping("/editUser")
	public void editUser(HttpServletResponse response,User user,String id,HttpServletRequest request) throws Exception{
		JSONObject result=new JSONObject();
		try {
			user=userService.findUserById(id);

			userService.updateUser(user);
			result.put("message", "修改用户成功！");
		} catch (Exception e) {
			result.put("message", "修改用户失败！");
		}
		ResponseUtil.write(response, result);
	}

	/**
	 *删除单个用户
	 * @throws Exception
	 */
	@RequestMapping("/deleteUser")
	public void deleteUser(HttpServletResponse response,String id,HttpServletRequest request) throws Exception{
		JSONObject result=new JSONObject();
		try {
			//删除用户之前，先删除其他使用user id作为外键的表的信息
			List<Items> itemslist=itemsService.findItemsByUserId(id);
			for(Items items:itemslist){
				itemsService.deleteItemsById(items.getId());
			}

			userService.deleteUser(id);
			result.put("message", "删除用户成功！");
		} catch (Exception e) {
			result.put("message", "删除用户失败！");
		}
		ResponseUtil.write(response, result);
	}

	/**
	 *删除用户（批量）
	 * @throws Exception
	 */
	@RequestMapping("/batchDeleteUser")
	public void batchDeleteUser(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject result=new JSONObject();
		String ids=request.getParameter("ids");
		String[] idlist=ids.split(",");
		for(String id:idlist){
			try {
				//删除用户之前，先删除其他使用user id作为外键的表的信息
				List<Items> itemslist=itemsService.findItemsByUserId(id);
				for(Items items:itemslist){
					itemsService.deleteItemsById(items.getId());
				}

				userService.deleteUser(id);
				result.put("message", "删除用户成功！");
			} catch (Exception e) {
				result.put("message", "删除用户失败！");
			}
		}
		ResponseUtil.write(response, result);
	}
}
