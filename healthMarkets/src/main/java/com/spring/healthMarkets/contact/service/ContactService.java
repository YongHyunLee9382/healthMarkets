package com.spring.healthMarkets.contact.service;

import com.spring.healthMarkets.contact.dto.ContactDTO;

public interface ContactService {
	public void addNewContact(ContactDTO contactDTO) throws Exception;
	public ContactDTO getContactDetail(String memberId) throws Exception;
}
