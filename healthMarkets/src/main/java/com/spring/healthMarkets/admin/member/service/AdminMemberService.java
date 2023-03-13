package com.spring.healthMarkets.admin.member.service;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.admin.member.dto.AdminDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;




public interface AdminMemberService {
	public boolean adminLogin(AdminDTO adminDTO) throws Exception;
	
	public List<MemberDTO> getMemberList() throws Exception;
	
	public List<MemberDTO> getMemberList(Map<String, Object> searchMap) throws Exception;
	
	public int getAllMemberCnt(Map<String, String> searchCntMap) throws Exception;
}
