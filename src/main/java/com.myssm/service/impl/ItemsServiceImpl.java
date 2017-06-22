package com.myssm.service.impl;

import java.util.List;

import com.myssm.mapper.ItemsMapper;
import com.myssm.po.Items;
import com.myssm.service.ItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("itemsService")
public class ItemsServiceImpl implements ItemsService {

	@Autowired
	private ItemsMapper itemsMapper;

	/**
	 * 商品查询列表
	 * @return List<Items> 商品信息集合
	 */
	public Items findItemsById(String id) {
		Items items=itemsMapper.findItemsById(id);
		if(items!=null) return items;
		else return null;
	}

	/**
	 * 保存商品
	 * @param items 商品信息
	 */
	public void saveItems(Items items) {

		itemsMapper.saveItems(items);
	}

	/**
	 * 批量 保存商品
	 * @param list 商品信息集合
	 */
	public void saveItemsBatch(List<Items> list) {
		itemsMapper.saveItemsBatch(list);
	}

	/**
	 * 查询所需要修改商品
	 * @param id 商品id
	 * @return Items 商品信息
	 */
	public List<Items> findItemsList(){
		List<Items> itemsList=itemsMapper.findItemsList();
		if(itemsList!=null) return itemsList;
		else return null;
	}

	/**
	 * 修改商品
	 * @param items 商品信息
	 */
	public void editItems(String id, Items items){
		items.setId(id);
		itemsMapper.editItems(items);
	}

	/**
	 * 商品模糊查询
	 * @param items 商品信息
	 * @return List<Items> 商品信息集合
	 */
	public List<Items> findItemsByItems(Items items) {
		List<Items> itemsList=itemsMapper.findItemsByItems(items);
		if(itemsList!=null) return itemsList;
		else return null;
	}

	/**
	 * 根据user id 查询商品信息
	 * @param userId 用户id
	 * @return List<Items> 商品信息集合
	 */
	public List<Items> findItemsByUserId(String userId) {
		return itemsMapper.findItemsByUserId(userId);
	}

	/**
	 * 根据id 删除商品信息
	 * @param id 商品id
	 */
	public void deleteItemsById(String id) {
		itemsMapper.deleteItemsById(id);
	}

	/**
	 * 根据List<Integer>删除商品信息
	 * @param List<Integer> 商品id集合
	 */
	public void deleteItemsBatch(List<String> list) {
		itemsMapper.deleteItemsBatch(list);
	}

}
