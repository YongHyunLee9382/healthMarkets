package com.spring.healthMarkets.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.admin.member.dto.AdminDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;



@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public AdminDTO selectAdminLogin(AdminDTO adminDTO) throws Exception {
		
		return sqlSession.selectOne("adminMapper.selectAdminLogin",adminDTO);
	}
	@Override
	public List<MemberDTO> selectListMember() throws Exception {
		return sqlSession.selectList("adminMapper.selectListMember");
	}
	@Override
	public List<MemberDTO> selectMemberList(Map<String, Object> searchMap) throws Exception {
		return sqlSession.selectList("adminMapper.selectMemberList",searchMap);
	}
	@Override
	public int selectOneAllMemberCnt(Map<String, String> searchCntMap) throws Exception {
		return sqlSession.selectOne("adminMapper.selectOneAllMemberCnt" , searchCntMap);
	}

}
