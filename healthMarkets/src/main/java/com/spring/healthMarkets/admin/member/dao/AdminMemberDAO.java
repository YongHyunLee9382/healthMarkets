package com.spring.healthMarkets.admin.member.dao;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.admin.member.dto.AdminDTO;

import com.spring.healthMarkets.member.dto.MemberDTO;





public interface AdminMemberDAO {
	public AdminDTO selectAdminLogin(AdminDTO adminDTO) throws Exception;
	
	public List<MemberDTO> selectListMember() throws Exception;
	
	public List<MemberDTO> selectMemberList(Map<String, Object> searchMap) throws Exception;
	
	public int selectOneAllMemberCnt(Map<String, String> searchCntMap) throws Exception;
}
