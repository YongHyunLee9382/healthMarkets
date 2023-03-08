package com.spring.healthMarkets.admin.goods.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.goods.dto.GoodsDTO;



@Repository
public class AdminGoodsDAOImpl implements AdminGoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGoods(GoodsDTO goodsDTO) throws Exception {
		
		sqlSession.insert("adminGoods.insertGoods",goodsDTO);
	}
	@Override
	public List<GoodsDTO> selectGoodsList() throws Exception {
		return sqlSession.selectList("adminGoods.selectGoodsList");
	}
	@Override
	public void deleteGoods(int productCd) throws Exception {
		sqlSession.delete("adminGoods.deleteGoods",productCd);
		
	}
	@Override
	public void updateGoods(GoodsDTO goodsDTO) throws Exception {
		sqlSession.update("adminGoods.updateGoods" , goodsDTO);
		
	}
}
