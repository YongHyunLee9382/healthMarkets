package com.spring.healthMarkets.admin.goods.service;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.goods.dto.GoodsDTO;




public interface AdminGoodsService {
	public void addNewGoods(GoodsDTO goodsDTO) throws Exception;
	
	public List<GoodsDTO> getGoodsList(Map<String, Object> searchMap) throws Exception;
	
	public List<GoodsDTO> getGoodsList() throws Exception;
	
	public void removeGoods(int productCd)throws Exception;
	
	public void modifyGoods(GoodsDTO goodsDTO) throws Exception;
	
	public int getAllGoodsCnt(Map<String, String> searchCntMap) throws Exception;
}
