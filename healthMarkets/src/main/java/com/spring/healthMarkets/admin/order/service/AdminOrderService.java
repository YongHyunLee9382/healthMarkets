package com.spring.healthMarkets.admin.order.service;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {
	public List<Map<String,Object>> getOrderList() throws Exception;
	
	public int getAllOrderCnt(Map<String, String> searchCntMap) throws Exception;
	
	public List<Map<String,Object>> getOrderList(Map<String, Object> searchMap) throws Exception;
}
