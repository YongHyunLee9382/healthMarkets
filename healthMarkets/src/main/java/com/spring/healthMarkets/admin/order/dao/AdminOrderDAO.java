package com.spring.healthMarkets.admin.order.dao;

import java.util.List;
import java.util.Map;

public interface AdminOrderDAO {
	public List<Map<String,Object>> selectListOrder() throws Exception;
	
	public List<Map<String,Object>> selectListOrder(Map<String, Object> searchMap) throws Exception;
	
	public int selectOneAllOrderCnt(Map<String, String> searchCntMap) throws Exception;
}
