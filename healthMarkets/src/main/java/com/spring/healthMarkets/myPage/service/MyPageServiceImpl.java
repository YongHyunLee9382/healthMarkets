package com.spring.healthMarkets.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.myPage.dao.MyPageDAO;
import com.spring.healthMarkets.myPage.dto.CartDTO;




@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

	@Override
	public MemberDTO getMyInfo(String memberId) throws Exception {
		
		return myPageDAO.selectOneMyInfo(memberId);
	}

	@Override
	public void removeMember(String memberId) throws Exception {
		myPageDAO.deleteMember(memberId);
		myPageDAO.deleteCartListByRemoveMember(memberId);
		myPageDAO.deleteOrderListByRemoveMember(memberId);
		
	}

	@Override
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception {
		if (memberDTO.getSmsstsYn() == null) memberDTO.setSmsstsYn("N"); 
		if (memberDTO.getEmailstsYn() == null) memberDTO.setEmailstsYn("N");
		myPageDAO.updateMyInfo(memberDTO);
		
	}

	@Override
	public boolean checkDuplicatedCart(CartDTO cartDTO) throws Exception {
		if (myPageDAO.selectOneDuplicatedCart(cartDTO) == null) return false;
		else												    return true; 
	}

	@Override
	public void addCart(CartDTO cartDTO) throws Exception {
		myPageDAO.insertCart(cartDTO);
	}

	@Override
	public List<Map<String, Object>> getMyCartList(String memberId) throws Exception {
		return myPageDAO.selectListMyCart(memberId);
	}

	@Override
	public int countCartList(String memberId) throws Exception {
		return myPageDAO.selectCountMyCart(memberId);
	}

	@Override
	public void removeCart(int[] deleteCartCdList) throws Exception {
		myPageDAO.deleteCart(deleteCartCdList);
	}

	@Override
	public void modifyOrderGoodsQty(Map<String, Object> updateMap) throws Exception {
		myPageDAO.updateOrderGoodsQty(updateMap);
		
	}

	@Override
	public List<Map<String, Object>> getMyOrderList(String memberId) throws Exception {
		return myPageDAO.selectListMyOrder(memberId);
	}

	@Override
	public Map<String, Object> getMyOrderDetail(Map<String, Object> orderDetailMap) throws Exception {
		return myPageDAO.selectOneMyOrder(orderDetailMap);
	}

	
}
