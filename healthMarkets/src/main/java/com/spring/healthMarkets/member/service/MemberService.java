package com.spring.healthMarkets.member.service;

import com.spring.healthMarkets.member.dto.MemberDTO;

public interface MemberService {
	public String checkDuplicatedId(String memberId) throws Exception;
	
	public void addMember(MemberDTO memberDTO)throws Exception;
	
	public boolean login(MemberDTO memberDTO) throws Exception;
	
	public String findMemberId(MemberDTO memberDTO) throws Exception;
	
	public boolean findMemberPasswd(MemberDTO memberDTO) throws Exception;
	
	public void getDailyNewMemberList() throws Exception;
	
	public int getMyOrderCnt(String memberId) throws Exception;
	
	public int getMyCartCnt(String memberId) throws Exception;
}
