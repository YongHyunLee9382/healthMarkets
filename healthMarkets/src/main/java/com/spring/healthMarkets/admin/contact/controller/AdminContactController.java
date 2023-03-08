package com.spring.healthMarkets.admin.contact.controller;




import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.healthMarkets.admin.contact.service.AdminContactService;
import com.spring.healthMarkets.contact.dto.ContactDTO;



@Controller
@RequestMapping("/admin/contact")
public class AdminContactController {
	@Autowired
	private AdminContactService adminContactService;
	
	@GetMapping("/contactDetail")
	public ModelAndView contactDetail(@RequestParam("contactCd") int contactCd) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/contact/contactDetail");
		mv.addObject("contactDTO" , adminContactService.getContactDetail(contactCd));
		return mv;
	}
	
	@PostMapping("/contactDetail")
	public ResponseEntity<Object> contactDetail(@ModelAttribute ContactDTO contactDTO , HttpServletRequest request) throws Exception {
		
		adminContactService.addAdminReply(contactDTO);
		
		String jsScript = "<script>";
		jsScript += "alert('컨텍트 정보를 등록하였습니다.'); ";
		jsScript += " location.href='" + request.getContextPath() + "/';";
		jsScript += "</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
		
	@GetMapping("/contactList")
	public ModelAndView contactList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/contact/contactList");
		mv.addObject("contactList" , adminContactService.getContactList());
		return mv;
	}
	
	@GetMapping("/removeContact")
	public ResponseEntity<Object> removeCart(@RequestParam("contactCdList") String contactCdList) throws Exception {
		
		String[] temp = contactCdList.split(",");
		int[] deleteContactCdList = new int[temp.length];

		for (int i = 0; i < temp.length; i++) {
			deleteContactCdList[i] = Integer.parseInt(temp[i]);
		}
		
		adminContactService.removeContact(deleteContactCdList);
		
		String jsScript = "<script>";
				jsScript += "alert('컨텍트 정보를 삭제하였습니다.'); ";
				jsScript += "location.href='contactList'";
				jsScript += "</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
}
