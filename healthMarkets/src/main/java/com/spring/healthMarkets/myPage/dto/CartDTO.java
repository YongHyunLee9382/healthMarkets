package com.spring.healthMarkets.myPage.dto;

import java.util.Date;


import org.springframework.stereotype.Component;

@Component
public class CartDTO {

	private long cartCd;
	private int productCd;
	private int orderGoodsQty;
	private String memberId;
	private Date enrollDt;
	
	public long getCartCd() {
		return cartCd;
	}
	public void setCartCd(long cartCd) {
		this.cartCd = cartCd;
	}
	
	public int getProductCd() {
		return productCd;
	}
	public void setProductCd(int productCd) {
		this.productCd = productCd;
	}
	public int getOrderGoodsQty() {
		return orderGoodsQty;
	}
	public void setOrderGoodsQty(int orderGoodsQty) {
		this.orderGoodsQty = orderGoodsQty;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	@Override
	public String toString() {
		return "CartDTO [cartCd=" + cartCd + ", productCd=" + productCd + ", orderGoodsQty=" + orderGoodsQty
				+ ", memberId=" + memberId + ", enrollDt=" + enrollDt + "]";
	}
	

	
}
