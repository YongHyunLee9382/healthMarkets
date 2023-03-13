package com.spring.healthMarkets.order.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.healthMarkets.goods.dto.GoodsDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.order.dao.OrderDAO;
import com.spring.healthMarkets.order.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public MemberDTO getOrdererDetail(String memberId) throws Exception {
		return orderDAO.selectOneOrderer(memberId);
	}

	@Override
	public GoodsDTO getGoodsDetail(int productCd) throws Exception {
		return orderDAO.selectOneCartGoods(productCd);
	}

	@Override
	@Transactional
	public void addOrder(OrderDTO orderDTO, int point) throws Exception {
	
		Map<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("point"         , point);
		orderMap.put("orderGoodsQty" , orderDTO.getOrderGoodsQty());
		orderMap.put("productCd"       , orderDTO.getProductCd());
		orderMap.put("memberId"      , orderDTO.getMemberId());
		
		orderDAO.updateMemberPoint(orderMap);
		orderDAO.insertOrder(orderDTO);
	}
	
}
