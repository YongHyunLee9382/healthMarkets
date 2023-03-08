package com.spring.healthMarkets.admin.goods.dao;

import java.util.List;

import com.spring.healthMarkets.goods.dto.GoodsDTO;




public interface AdminGoodsDAO {
	public void insertGoods(GoodsDTO goodsDTO) throws Exception;
	
	public List<GoodsDTO> selectGoodsList() throws Exception;
	
	public void deleteGoods(int productCd)throws Exception;
	
	public void updateGoods(GoodsDTO goodsDTO) throws Exception;
}
