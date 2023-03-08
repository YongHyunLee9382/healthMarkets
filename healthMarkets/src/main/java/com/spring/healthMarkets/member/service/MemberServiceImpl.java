package com.spring.healthMarkets.member.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.healthMarkets.member.dao.MemberDAO;
import com.spring.healthMarkets.member.dto.MemberDTO;



@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public String checkDuplicatedId(String memberId) throws Exception {

		if (memberDAO.selectDuplicatedId(memberId) == null)	return "duplicate";
		else												return "notDuplicate";	
	}

	@Override
	public void addMember(MemberDTO memberDTO) throws Exception {
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
		if (memberDTO.getEmailstsYn() == null)  memberDTO.setEmailstsYn("N");
		if (memberDTO.getSmsstsYn() == null)    memberDTO.setSmsstsYn("N");
		memberDAO.insertMember(memberDTO);
		
	}

	@Override
	public boolean login(MemberDTO memberDTO) throws Exception {
		MemberDTO checkExsistId = memberDAO.selectLogin(memberDTO);
		if (checkExsistId != null) {
			if (bCryptPasswordEncoder.matches(memberDTO.getPasswd() ,checkExsistId.getPasswd())) {
				return true;
			}
		}
		
		return false;
	}

	@Override
	public String findMemberId(MemberDTO memberDTO) throws Exception {
		
		return memberDAO.selectMemberId(memberDTO);
	}

	@Override
	public boolean findMemberPasswd(MemberDTO memberDTO) throws Exception {
		
		boolean isCheck = false;
		
		if(memberDAO.selectMemberPasswd(memberDTO) != null) {
			memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd()));
			memberDAO.updatePasswd(memberDTO);
			isCheck = true;
		}
		
		
		return isCheck;
	}
}
