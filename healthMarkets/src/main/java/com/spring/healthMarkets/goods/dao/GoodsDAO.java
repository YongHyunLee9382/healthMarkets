package com.spring.healthMarkets.goods.dao;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.goods.dto.GoodsDTO;



public interface GoodsDAO {
	public GoodsDTO selectOneGoods(int productCd)throws Exception;
	public List<GoodsDTO> selectRelatedGoodsList(GoodsDTO goodsDTO) throws Exception;
	public List<GoodsDTO> selectGoodsList(GoodsDTO goodsDTO) throws Exception;
	public List<GoodsDTO> selectListSearchGoods(Map<String,Object> searchMap) throws Exception;
	
}
