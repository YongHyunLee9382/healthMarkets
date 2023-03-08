package com.spring.healthMarkets.admin.contact.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.healthMarkets.contact.dto.ContactDTO;



@Repository
public class AdminContactDAOImpl implements AdminContactDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ContactDTO> selectListContact() throws Exception {
		return sqlSession.selectList("adminContact.selectListContact");
	}

	@Override
	public ContactDTO selectOneContact(int contactCd) throws Exception {
		return sqlSession.selectOne("adminContact.selectOneContact" , contactCd);
	}

	@Override
	public void deleteContact(int[] deleteContactCdList) throws Exception {
		sqlSession.delete("adminContact.deleteContact" , deleteContactCdList);
	}

	@Override
	public List<ContactDTO> selectListDailyNewContact(String today) throws Exception {
		return sqlSession.selectList("adminContact.selectListDailyNewContact" , today);
	}

	@Override
	public void updateAdminReply(ContactDTO contactDTO) throws Exception {
		sqlSession.update("adminContact.updateAdminReply",contactDTO);
		
	}
}
