package com.spring.healthMarkets.myPage.dao;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.member.dto.MemberDTO;



@Repository
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO selectOneMyInfo(String memberId) throws Exception {
		
		return sqlSession.selectOne("myPage.selectOneMyInfo" , memberId);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteMember" , memberId);
	}

	@Override
	public void updateMyInfo(MemberDTO memberDTO) throws Exception {
		sqlSession.update("myPage.updateMyInfo" , memberDTO);
		
	}
	
}
