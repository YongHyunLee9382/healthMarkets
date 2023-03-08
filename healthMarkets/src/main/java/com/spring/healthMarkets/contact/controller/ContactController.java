package com.spring.healthMarkets.contact.controller;

import javax.servlet.http.HttpServletRequest;


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



@Controller
@RequestMapping("/contact")
public class ContactController {
	@Autowired
	private ContactService contactService;
	
	@GetMapping("/addContact")
	public ModelAndView contact() throws Exception{
		return new ModelAndView("/addContact");
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
	public ModelAndView contactDetail(@RequestParam("memberId") String memberId) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/contactDetail");
		mv.addObject("contactDTO" , contactService.getContactDetail(memberId));
		return mv;
	}
	
}
