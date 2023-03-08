package com.spring.healthMarkets.goods.dao;

import java.util.List;

import com.spring.healthMarkets.goods.dto.GoodsDTO;



public interface GoodsDAO {
	public GoodsDTO selectOneGoods(int productCd)throws Exception;
	public List<GoodsDTO> selectRelatedGoodsList(GoodsDTO goodsDTO) throws Exception;
	
}
