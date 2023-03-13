package com.spring.healthMarkets.admin.contact.service;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.spring.healthMarkets.admin.contact.dao.AdminContactDAO;
import com.spring.healthMarkets.contact.dto.ContactDTO;



@Service
public class AdminContactServiceImpl implements AdminContactService {
	@Autowired
	private AdminContactDAO adminContactDAO;

	@Override
	public List<ContactDTO> getContactList() throws Exception {
		
		return adminContactDAO.selectListContact(); 
	}

	@Override
	public ContactDTO getContactDetail(int contactCd) throws Exception {
		return adminContactDAO.selectOneContact(contactCd);
	}

	@Override
	public void removeContact(int[] deleteContactCdList) throws Exception {
		adminContactDAO.deleteContact(deleteContactCdList);
		
	}

	@Override
	@Scheduled(cron="59 59 23 * * *")
	public void getDailyNewContactList() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<ContactDTO> dailyNewContactList =  adminContactDAO.selectListDailyNewContact(sdf.format(new Date()));
		System.out.println("- 오늘 받은 메일 (관리자) - ");
		for (ContactDTO contactDTO : dailyNewContactList) {
			System.out.println(contactDTO);
		}
		
	}

	@Override
	public void addAdminReply(ContactDTO contactDTO) throws Exception {
		adminContactDAO.updateAdminReply(contactDTO);
		
	}

	@Override
	public List<ContactDTO> getContactList(Map<String, Object> searchMap) throws Exception {
		return adminContactDAO.selectContactList(searchMap);
	}

	@Override
	public int getAllContactCnt(Map<String, String> searchCntMap) throws Exception {
		return adminContactDAO.selectOneAllContactCnt(searchCntMap);
	}
}
