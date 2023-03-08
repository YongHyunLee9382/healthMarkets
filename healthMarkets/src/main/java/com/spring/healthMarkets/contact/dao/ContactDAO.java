package com.spring.healthMarkets.contact.dao;

import com.spring.healthMarkets.contact.dto.ContactDTO;

public interface ContactDAO {
	public void insertContact(ContactDTO contactDTO) throws Exception;
	public ContactDTO selectContactOne(String memberId) throws Exception;
}
