package com.spring.healthMarkets.goods.service;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.goods.dto.GoodsDTO;




public interface GoodsService {
	public GoodsDTO getGoodsDetail(int productCd) throws Exception;
	public List<GoodsDTO> getRelatedGoodsList(GoodsDTO goodsDTO) throws Exception;
	public List<GoodsDTO> getGoodsList(GoodsDTO goodsDTO) throws Exception;
	public List<GoodsDTO> getSearchGoodsList(Map<String,Object> searchMap) throws Exception;
}
