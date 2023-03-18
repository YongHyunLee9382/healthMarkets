package com.spring.healthMarkets.contact.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.healthMarkets.contact.dto.ContactDTO;
import com.spring.healthMarkets.contact.service.ContactService;
import com.spring.healthMarkets.myPage.service.MyPageService;



@Controller
@RequestMapping("/contact")
public class ContactController {
	@Autowired
	private ContactService contactService;
	
	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("/addContact")
	public ModelAndView contact(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();	
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/addContact");
		mv.addObject("memberDTO", myPageService.getMyInfo((String)session.getAttribute("memberId")));
		
		
		return mv;
	}
	
	
	@PostMapping("/addContact")
	public ResponseEntity<Object> contact(ContactDTO contactDTO , HttpServletRequest request) throws Exception{
		
		contactService.addNewContact(contactDTO);
		String jsScript  = "<script>";
				jsScript += " alert('컨텍트 정보가 등록 되었습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/';";
				jsScript += " </script>";
 
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
	   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@GetMapping("/contactDetail")
	public ModelAndView contactDetail(@RequestParam("contactCd") int contactCd) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/contactDetail");
		mv.addObject("contactDTO" , contactService.getContactDetail(contactCd));
		return mv;
	}
	
	@GetMapping("/contactList")
	public ModelAndView contactList(@RequestParam("memberId") String memberId) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/contactList");
		mv.addObject("contactList" , contactService.getContactList(memberId));
		return mv;
	}
	
	@GetMapping("/removeContact")
	public ResponseEntity<Object> removeCart(@RequestParam("contactCdList") String contactCdList, HttpServletRequest request) throws Exception {
		
		String[] temp = contactCdList.split(",");
		int[] deleteContactCdList = new int[temp.length];

		for (int i = 0; i < temp.length; i++) {
			deleteContactCdList[i] = Integer.parseInt(temp[i]);
		}
		
		contactService.removeContact(deleteContactCdList);
		
		String jsScript = "<script>";
				jsScript += "alert('컨텍트 정보를 삭제하였습니다.'); ";
				jsScript += "location.href='" + request.getContextPath() + "/';";
				jsScript += "</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
}
