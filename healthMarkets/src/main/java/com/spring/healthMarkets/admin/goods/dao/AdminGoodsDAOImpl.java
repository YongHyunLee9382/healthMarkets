package com.spring.healthMarkets.admin.goods.dao;

import java.util.List;
import java.util.Map;

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
	public List<GoodsDTO> selectGoodsList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("adminGoods.selectGoodsList",searchMap);
	}
	@Override
	public void deleteGoods(int productCd) throws Exception {
		sqlSession.delete("adminGoods.deleteGoods",productCd);
		
	}
	@Override
	public void updateGoods(GoodsDTO goodsDTO) throws Exception {
		sqlSession.update("adminGoods.updateGoods" , goodsDTO);
		
	}
	@Override
	public int selectOneAllGoodsCnt(Map<String, String> searchCntMap) throws Exception {
		return sqlSession.selectOne("adminGoods.selectOneAllGoodsCnt" , searchCntMap);
	}
	@Override
	public List<GoodsDTO> selectGoodsList() throws Exception {
		return sqlSession.selectList("adminGoods.selectGoodsLists");
	}
}
