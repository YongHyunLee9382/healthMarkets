package com.spring.healthMarkets.admin.member.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.healthMarkets.admin.member.dao.AdminMemberDAO;
import com.spring.healthMarkets.admin.member.dto.AdminDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	
	@Override
	public boolean adminLogin(AdminDTO adminDTO) throws Exception {
		if(adminMemberDAO.selectAdminLogin(adminDTO) != null) {
			return true;
		}
		
		return false;
	}


	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return adminMemberDAO.selectListMember();
	}

}
