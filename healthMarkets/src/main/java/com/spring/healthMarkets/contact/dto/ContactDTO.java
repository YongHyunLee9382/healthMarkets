package com.spring.healthMarkets.contact.dto;

import java.util.Date;


import org.springframework.stereotype.Component;

@Component
public class ContactDTO {
	private String memberId;
	private int contactCd;
	private String name;
	private String email;
	private String subject;
	private String content;
	private Date regDt;
	private String adminReply;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAdminReply() {
		return adminReply;
	}
	public void setAdminReply(String adminReply) {
		this.adminReply = adminReply;
	}
	public int getContactCd() {
		return contactCd;
	}
	public void setContactCd(int contactCd) {
		this.contactCd = contactCd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	
	@Override
	public String toString() {
		return "ContactDTO [contactCd=" + contactCd + ", name=" + name + ", email=" + email + ", subject=" + subject
				+ ", content=" + content + ", regDt=" + regDt + "]";
	}
	
}
