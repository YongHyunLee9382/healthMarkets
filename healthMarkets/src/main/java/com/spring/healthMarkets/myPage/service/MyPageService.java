package com.spring.healthMarkets.myPage.service;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.myPage.dto.CartDTO;

public interface MyPageService {
	public MemberDTO getMyInfo(String memberId) throws Exception;
	
	public void removeMember(String memberId) throws Exception;
	
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception;
	
	public boolean checkDuplicatedCart(CartDTO cartDTO) throws Exception;
	
	public void addCart(CartDTO cartDTO) throws Exception;
	
	public List<Map<String,Object>> getMyCartList(String memberId) throws Exception;
	
	public int countCartList(String memberId) throws Exception;
	
	public void removeCart(int[] deleteCartCdList) throws Exception;
	
	public void modifyOrderGoodsQty(Map<String,Object> updateMap) throws Exception;
	
	public List<Map<String,Object>> getMyOrderList(String memberId) throws Exception;
	
}
