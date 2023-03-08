package com.spring.healthMarkets.myPage.dao;

import com.spring.healthMarkets.member.dto.MemberDTO;

public interface MyPageDAO {
	public MemberDTO selectOneMyInfo(String memberId) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	
	public void updateMyInfo(MemberDTO memberDTO) throws Exception;
}
