package com.spring.healthMarkets.contact.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.contact.dto.ContactDTO;



@Repository
public class ContactDAOImpl implements ContactDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertContact(ContactDTO contactDTO) throws Exception {
		sqlSession.insert("contact.insertContact" , contactDTO);
		
	}

	@Override
	public ContactDTO selectContactOne(int contactCd) throws Exception {
		return sqlSession.selectOne("contact.selectContactOne" , contactCd);
	}

	@Override
	public List<ContactDTO> selectContactList(String memberId) throws Exception {
		
		return sqlSession.selectList("contact.selectContactList" , memberId);
	}
}
