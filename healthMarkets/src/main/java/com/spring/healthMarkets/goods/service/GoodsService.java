package com.spring.healthMarkets.goods.service;

import java.util.List;

import com.spring.healthMarkets.goods.dto.GoodsDTO;




public interface GoodsService {
	public GoodsDTO getGoodsDetail(int productCd) throws Exception;
	public List<GoodsDTO> getRelatedGoodsList(GoodsDTO goodsDTO) throws Exception;
}
