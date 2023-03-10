package com.spring.healthMarkets.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.healthMarkets.admin.goods.dao.AdminGoodsDAO;
import com.spring.healthMarkets.goods.dto.GoodsDTO;



@Service
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;

	@Override
	public void addNewGoods(GoodsDTO goodsDTO) throws Exception {
		adminGoodsDAO.insertGoods(goodsDTO);
		
	}

	@Override
	public List<GoodsDTO> getGoodsList(Map<String, Object> searchMap) throws Exception {
		
		return adminGoodsDAO.selectGoodsList(searchMap);
	}

	@Override
	public void removeGoods(int productCd) throws Exception {
		adminGoodsDAO.deleteGoods(productCd);
		
	}

	@Override
	public void modifyGoods(GoodsDTO goodsDTO) throws Exception {
		adminGoodsDAO.updateGoods(goodsDTO);
		
	}

	@Override
	public int getAllGoodsCnt(Map<String, String> searchCntMap) throws Exception {
		return adminGoodsDAO.selectOneAllGoodsCnt(searchCntMap);
	}

	@Override
	public List<GoodsDTO> getGoodsList() throws Exception {
		return adminGoodsDAO.selectGoodsList();
	}
}
