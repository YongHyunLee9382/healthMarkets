package com.spring.healthMarkets.admin.contact.service;

import java.util.List;
import java.util.Map;

import com.spring.healthMarkets.contact.dto.ContactDTO;


public interface AdminContactService {
	public List<ContactDTO> getContactList() throws Exception;
	
	public ContactDTO getContactDetail(int contactCd) throws Exception;
	
	public void removeContact(int[] deleteContactCdList) throws Exception;
	
	public void getDailyNewContactList() throws Exception;
	
	public void addAdminReply(ContactDTO contactDTO) throws Exception;
	
	public List<ContactDTO> getContactList(Map<String, Object> searchMap) throws Exception;
	
	public int getAllContactCnt(Map<String, String> searchCntMap) throws Exception;
}
