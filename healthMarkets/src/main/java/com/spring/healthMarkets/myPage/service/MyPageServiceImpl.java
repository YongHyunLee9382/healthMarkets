package com.spring.healthMarkets.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.myPage.dao.MyPageDAO;




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
		//myPageDAO.deleteCartListByRemoveMember(memberId);
		//myPageDAO.deleteOrderListByRemoveMember(memberId);
		
	}

	@Override
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception {
		if (memberDTO.getSmsstsYn() == null) memberDTO.setSmsstsYn("N"); 
		if (memberDTO.getEmailstsYn() == null) memberDTO.setEmailstsYn("N");
		myPageDAO.updateMyInfo(memberDTO);
		
	}
}
