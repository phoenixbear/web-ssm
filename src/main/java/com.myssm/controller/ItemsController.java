package com.myssm.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.myssm.po.Items;
import com.myssm.po.User;
import com.myssm.service.ItemsService;
import com.myssm.service.UserService;
import com.myssm.util.ResponseUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/items")
public class ItemsController {

	private Logger log = LoggerFactory.getLogger(ItemsController.class);


	@Resource(name="itemsService")
	private ItemsService itemsService;

	@Resource(name="userService")
	private UserService userService;

	/*
	 * 商品首页
	 */
	@RequestMapping("/itemsIndex")
	public ModelAndView itemsIndex(HttpServletRequest request,Items items) throws Exception {
		List<Items> itemsList = itemsService.findItemsList();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemsList", itemsList);
		modelAndView.setViewName("items/itemsList");

//		try {
//			int a = 1/0;
//		}catch (Exception e){
//			StringWriter sw = new StringWriter();
//			PrintWriter pw = new PrintWriter(sw);
//			e.printStackTrace(pw);
//			log.error("Main错误：" + sw.toString());
//		}

		return modelAndView;

	}
	//模糊查询
	@RequestMapping("/queryItems")
	public ModelAndView queryItems(HttpServletRequest request,Items items) throws Exception {
		List<Items> itemsList = itemsService.findItemsByItems(items);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("itemsList", itemsList);
		modelAndView.setViewName("items/itemsList");

		return modelAndView;

	}

	//ajax请求给修改页面赋值
	@RequestMapping("/ajaxRequestItems")
	public void ajaxRequestItems(HttpServletResponse response, HttpServletRequest request, Items items, String id)throws Exception{
		JSONObject result=new JSONObject();
		try{
			if(null != id) {
				items=itemsService.findItemsById(id);
				result.put("name", items.getName());
				result.put("price", items.getPrice());
				result.put("pic", items.getPic());
				result.put("detail", items.getDetail());
				User user=userService.findUserById(items.getUserId());
				result.put("userName", user.getUserName());
			} else {
				User user = (User) request.getSession().getAttribute("currentUser");
				result.put("userName", user.getUserName());
			}
		}catch(Exception e){
			result.put("message", "加载数据失败");
		}
		ResponseUtil.write(response, result);
	}

	//商品修改或保存
	@RequestMapping(value="/editItems",method={RequestMethod.POST,RequestMethod.GET})
	public void editItems(HttpServletResponse response,HttpServletRequest request, Items items)throws Exception {
		JSONObject result=new JSONObject();
		String idItem = items.getId();
		try{
			if(null != idItem) {
				items.setModifyTime(new Date());
				itemsService.editItems(items.getId(), items);
				result.put("message", "商品信息修改成功");
			} else {
				User user = (User) request.getSession().getAttribute("currentUser");
				items.setUser(user);
			items.setCreateTime(new Date());
			itemsService.saveItems(items);
			result.put("message", "商品信息保存成功");
		}
		}catch(Exception e){
			e.printStackTrace();
			if(null != idItem) {
				result.put("message", "商品信息修改失败");
			} else {
				result.put("message", "商品信息保存失败");
			}
		}
		ResponseUtil.write(response, result);
	}


	//删除商品--single
	@RequestMapping(value="/deleteItemsById",method={RequestMethod.POST,RequestMethod.GET})
	public void deleteItemsById(HttpServletResponse response,Items items)throws Exception {
		JSONObject result=new JSONObject();
		try{
			itemsService.deleteItemsById(items.getId());
			result.put("message", "商品信息删除成功");
		}catch(Exception e){
			result.put("message", "商品信息删除失败");
		}
		ResponseUtil.write(response, result);
	}


	//删除商品--batch
	@RequestMapping(value="/deleteItemsBatch",method={RequestMethod.POST,RequestMethod.GET})
	public void deleteItemsBatch(HttpServletResponse response, String ids)throws Exception {
		JSONObject result=new JSONObject();
		try{
			String[] idsArr = ids.split(",");
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < idsArr.length; i++) {
				list.add(idsArr[i]);
			}
			itemsService.deleteItemsBatch(list);
			result.put("message", "商品信息批量删除成功");
		}catch(Exception e){
			result.put("message", "商品信息批量删除失败");
		}
		ResponseUtil.write(response, result);
	}

}
