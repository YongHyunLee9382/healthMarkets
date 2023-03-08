package com.spring.healthMarkets.contact.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.spring.healthMarkets.contact.dao.ContactDAO;
import com.spring.healthMarkets.contact.dto.ContactDTO;



@Service
public class ContactServiceImple implements ContactService {
	@Autowired
	private ContactDAO contactDAO;

	@Override
	public void addNewContact(ContactDTO contactDTO) throws Exception {
		contactDAO.insertContact(contactDTO);
		
	}

	@Override
	public ContactDTO getContactDetail(String memberId) throws Exception {
		
		return contactDAO.selectContactOne(memberId);
	}
}
