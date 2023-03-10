package com.spring.healthMarkets.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.healthMarkets.goods.dao.GoodsDAO;
import com.spring.healthMarkets.goods.dto.GoodsDTO;



@Service
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	@Override
	public GoodsDTO getGoodsDetail(int productCd) throws Exception {
		
		return goodsDAO.selectOneGoods(productCd);
	}

	@Override
	public List<GoodsDTO> getRelatedGoodsList(GoodsDTO goodsDTO) throws Exception {
		return goodsDAO.selectRelatedGoodsList(goodsDTO);
	}

	@Override
	public List<GoodsDTO> getGoodsList(GoodsDTO goodsDTO) throws Exception {

		return goodsDAO.selectGoodsList(goodsDTO);
	}

	@Override
	public List<GoodsDTO> getSearchGoodsList(Map<String, Object> searchMap) throws Exception {
		return goodsDAO.selectListSearchGoods(searchMap);
	}
}
