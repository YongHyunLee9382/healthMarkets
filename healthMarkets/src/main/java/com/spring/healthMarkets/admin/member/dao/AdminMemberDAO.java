package com.spring.healthMarkets.admin.member.dao;

import java.util.List;

import com.spring.healthMarkets.admin.member.dto.AdminDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;





public interface AdminMemberDAO {
	public AdminDTO selectAdminLogin(AdminDTO adminDTO) throws Exception;
	public List<MemberDTO> selectListMember() throws Exception;
}
