package com.spring.healthMarkets.admin.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.healthMarkets.admin.order.dao.AdminOrderDAO;

@Service
public class AdminOrderServiceImple implements AdminOrderService {
	@Autowired
	private AdminOrderDAO adminOrderDAO;

	@Override
	public List<Map<String, Object>> getOrderList() throws Exception {
		return adminOrderDAO.selectListOrder();
	}

	@Override
	public int getAllOrderCnt(Map<String, String> searchCntMap) throws Exception {
		return adminOrderDAO.selectOneAllOrderCnt(searchCntMap);
	}

	@Override
	public List<Map<String, Object>> getOrderList(Map<String, Object> searchMap) throws Exception {
		return adminOrderDAO.selectListOrder(searchMap);
	}
}
