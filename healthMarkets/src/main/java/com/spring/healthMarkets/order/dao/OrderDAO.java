package com.spring.healthMarkets.order.dao;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.contact.dto.ContactDTO;
import com.spring.healthMarkets.goods.dto.GoodsDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.order.dto.OrderDTO;

public interface OrderDAO {
	public MemberDTO selectOneOrderer(String memberId) throws Exception;
	
	public GoodsDTO selectOneCartGoods(int productCd) throws Exception;
	
	public void updateMemberPoint(Map<String,Object> orderMap) throws Exception;
	
	public void insertOrder(OrderDTO orderDTO) throws Exception;
	
	public List<GoodsDTO> selectListCartGoods(int[] goodsCdList) throws Exception;
	
	public void updateMemberPointByCart(Map<String,Object> memberMap) throws Exception;
	
	public void insertOrderByCart(List<OrderDTO> orderList) throws Exception;
	
	public void deleteCartByOrder(int[] cartCdList)  throws Exception;
	
	public List<OrderDTO> selectListDailyNewOrder(String today) throws Exception;
	
}
