package com.spring.healthMarkets.order.service;


import java.util.List;


import com.spring.healthMarkets.goods.dto.GoodsDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.order.dto.OrderDTO;

public interface OrderService {
	public MemberDTO getOrdererDetail(String memberId) throws Exception;
	
	public GoodsDTO getGoodsDetail(int productCd) throws Exception;
	
	public void addOrder(OrderDTO orderDTO, int point) throws Exception;
	
	public List<GoodsDTO> getGoodsListByCart(int[] goodsCdList) throws Exception;
}
