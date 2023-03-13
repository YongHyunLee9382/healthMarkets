package com.spring.healthMarkets.order.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.goods.dto.GoodsDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.order.dto.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO selectOneOrderer(String memberId) throws Exception {
		return sqlSession.selectOne("order.selectOneOrderer" , memberId);
	}

	@Override
	public GoodsDTO selectOneCartGoods(int productCd) throws Exception {
		return sqlSession.selectOne("order.selectOneCartGoods" , productCd);
	}

	@Override
	public void updateMemberPoint(Map<String, Object> orderMap) throws Exception {
		sqlSession.update("order.updateMemberPoint" , orderMap);
	}

	@Override
	public void insertOrder(OrderDTO orderDTO) throws Exception {
		sqlSession.insert("order.insertOrder" , orderDTO);
		
	}
}
