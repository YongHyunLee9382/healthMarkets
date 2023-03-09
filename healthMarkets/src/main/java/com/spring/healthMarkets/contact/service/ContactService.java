package com.spring.healthMarkets.contact.service;

import java.util.List;

import com.spring.healthMarkets.contact.dto.ContactDTO;

public interface ContactService {
	public void addNewContact(ContactDTO contactDTO) throws Exception;
	public ContactDTO getContactDetail(int contactCd) throws Exception;
	public List<ContactDTO> getContactList(String memberId) throws Exception;
}
