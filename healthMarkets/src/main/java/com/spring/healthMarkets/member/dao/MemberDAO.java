package com.spring.healthMarkets.member.dao;

import com.spring.healthMarkets.member.dto.MemberDTO;

public interface MemberDAO {
	public String selectDuplicatedId(String memberId) throws Exception;
	
	public void insertMember(MemberDTO memberDTO)throws Exception;
	
	public MemberDTO selectLogin(MemberDTO memberDTO) throws Exception;
	
	public String selectMemberId(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO selectMemberPasswd(MemberDTO memberDTO) throws Exception;
	
	public void updatePasswd(MemberDTO memberDTO)throws Exception;
	
}
