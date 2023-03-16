package com.spring.healthMarkets.myPage.dao;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.myPage.dto.CartDTO;

public interface MyPageDAO {
	public MemberDTO selectOneMyInfo(String memberId) throws Exception;
	
	public void deleteMember(String memberId) throws Exception;
	
	public void updateMyInfo(MemberDTO memberDTO) throws Exception;
	
	public CartDTO selectOneDuplicatedCart(CartDTO cartDTO) throws Exception;
	
	public void insertCart(CartDTO cartDTO) throws Exception;
	
	public List<Map<String, Object>> selectListMyCart(String memberId)throws Exception;
	
	public int selectCountMyCart(String memberId) throws Exception; 
	
	public void deleteCart(int[] deleteCartCdList) throws Exception;
	
	public void updateOrderGoodsQty(Map<String,Object> updateMap) throws Exception;
	
	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception;
	
	public void deleteCartListByRemoveMember(String memberId) throws Exception;
	
	public void deleteOrderListByRemoveMember(String memberId) throws Exception;
	
	public Map<String,Object> selectOneMyOrder(Map<String,Object> orderDetailMap) throws Exception;
	
	
}
