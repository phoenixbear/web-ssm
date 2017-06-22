package com.myssm.service;



import com.myssm.po.Items;

import java.util.List;



public interface ItemsService {

	/**
	 * 商品查询列表
	 * @return List<Items> 商品信息集合
	 */
	public List<Items> findItemsList();


	/**
	 * 保存商品
	 * @param items 商品信息
	 */
	public void saveItems(Items items);


	/**
	 * 批量 保存商品
	 * @param list 商品信息集合
	 */
	public void saveItemsBatch(List<Items> list);


	/**
	 * 查询所需要修改商品
	 * @param id 商品id
	 * @return Items 商品信息
	 */
	public Items findItemsById(String id);

	/**
	 * 修改商品
	 * @param items 商品信息
	 */
	public void editItems(String id, Items items);

	/**
	 * 商品模糊查询
	 * @param items 商品信息
	 * @return List<Items> 商品信息集合
	 */
	public List<Items> findItemsByItems(Items items);

	/**
	 * 根据user id 查询商品信息
	 * @param userId 用户id
	 * @return List<Items> 商品信息集合
	 */
	public List<Items> findItemsByUserId(String userId);

	/**
	 * 根据id 删除商品信息
	 * @param id 商品id
	 */
	public void deleteItemsById(String id);

	/**
	 * 根据List<Integer>删除商品信息
	 * @param List<Integer> 商品id集合
	 */
	public void deleteItemsBatch(List<String> list);



}
