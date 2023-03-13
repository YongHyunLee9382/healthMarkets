package com.spring.healthMarkets.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.contact.dto.ContactDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;



@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String selectDuplicatedId(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectDuplicatedId" , memberId);
	}

	@Override
	public void insertMember(MemberDTO memberDTO) throws Exception {
		sqlSession.insert("member.insertMember",memberDTO);
		
	}

	@Override
	public MemberDTO selectLogin(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne("member.selectLogin" , memberDTO);
	}

	@Override
	public String selectMemberId(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne("member.selectMemberId",memberDTO);
	}

	@Override
	public MemberDTO selectMemberPasswd(MemberDTO memberDTO) throws Exception {
		
		return sqlSession.selectOne("member.selectMemberPasswd",memberDTO);
	}

	@Override
	public void updatePasswd(MemberDTO memberDTO) throws Exception {
		sqlSession.update("member.updatePasswd", memberDTO);
		
	}

	@Override
	public List<MemberDTO> selectListDailyNewMember(String today) throws Exception {
		return sqlSession.selectList("member.selectListDailyNewMember" , today);
	}

	@Override
	public int selectMyOrderCnt(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectMyOrderCnt" , memberId);
	}
}
