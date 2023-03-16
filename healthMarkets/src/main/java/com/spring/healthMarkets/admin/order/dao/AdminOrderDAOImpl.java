package com.spring.healthMarkets.admin.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminOrderDAOImpl implements AdminOrderDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectListOrder() throws Exception {
		return sqlSession.selectList("adminOrder.selectListOrder");
	}

	@Override
	public List<Map<String, Object>> selectListOrder(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("adminOrder.selectOrderList",searchMap);
	}

	@Override
	public int selectOneAllOrderCnt(Map<String, String> searchCntMap) throws Exception {
		return sqlSession.selectOne("adminOrder.selectOneAllOrderCnt" , searchCntMap);
	}
}
