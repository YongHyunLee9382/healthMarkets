package com.spring.healthMarkets.admin.goods.service;

import java.util.List;


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
	public List<GoodsDTO> getGoodsList() throws Exception {
		
		return adminGoodsDAO.selectGoodsList();
	}

	@Override
	public void removeGoods(int productCd) throws Exception {
		adminGoodsDAO.deleteGoods(productCd);
		
	}

	@Override
	public void modifyGoods(GoodsDTO goodsDTO) throws Exception {
		adminGoodsDAO.updateGoods(goodsDTO);
		
	}
}
