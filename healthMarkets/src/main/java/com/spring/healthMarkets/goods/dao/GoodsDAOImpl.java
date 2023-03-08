package com.spring.healthMarkets.goods.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.goods.dto.GoodsDTO;



@Repository
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public GoodsDTO selectOneGoods(int productCd) throws Exception {
		
		return sqlSession.selectOne("goods.selectOneGoods" , productCd);
	}

	@Override
	public List<GoodsDTO> selectRelatedGoodsList(GoodsDTO goodsDTO) throws Exception {
		return sqlSession.selectList("goods.selectListRelatedGoods" , goodsDTO);
	}
}
