package com.spring.healthMarkets.contact.dao;

import java.util.List;

import com.spring.healthMarkets.contact.dto.ContactDTO;

public interface ContactDAO {
	public void insertContact(ContactDTO contactDTO) throws Exception;
	public ContactDTO selectContactOne(int contactCd) throws Exception;
	public List<ContactDTO> selectContactList(String memberId)throws Exception;
}
