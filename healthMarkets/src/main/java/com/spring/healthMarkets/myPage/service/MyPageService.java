package com.spring.healthMarkets.myPage.service;

import com.spring.healthMarkets.member.dto.MemberDTO;

public interface MyPageService {
	public MemberDTO getMyInfo(String memberId) throws Exception;
	public void removeMember(String memberId) throws Exception;
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception;
}
