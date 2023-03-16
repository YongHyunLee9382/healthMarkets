package com.spring.healthMarkets.order.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.healthMarkets.contact.dto.ContactDTO;
import com.spring.healthMarkets.goods.dto.GoodsDTO;
import com.spring.healthMarkets.member.dto.MemberDTO;
import com.spring.healthMarkets.order.dao.OrderDAO;
import com.spring.healthMarkets.order.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public MemberDTO getOrdererDetail(String memberId) throws Exception {
		return orderDAO.selectOneOrderer(memberId);
	}

	@Override
	public GoodsDTO getGoodsDetail(int productCd) throws Exception {
		return orderDAO.selectOneCartGoods(productCd);
	}

	@Override
	@Transactional
	public void addOrder(OrderDTO orderDTO, int point) throws Exception {
	
		Map<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("point"         , point);
		orderMap.put("orderGoodsQty" , orderDTO.getOrderGoodsQty());
		orderMap.put("productCd"       , orderDTO.getProductCd());
		orderMap.put("memberId"      , orderDTO.getMemberId());
		
		orderDAO.updateMemberPoint(orderMap);
		orderDAO.insertOrder(orderDTO);
	}

	@Override
	public List<GoodsDTO> getGoodsListByCart(int[] productCdList) throws Exception {
		return orderDAO.selectListCartGoods(productCdList);
	}

	@Override
	public void addOrderByCart(Map<String, String> orderListMap) throws Exception {
		
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		
		String[] temp1 = orderListMap.get("productCdList").split(","); 
		int[] productCdList = new int[temp1.length];
		for (int i = 0; i < temp1.length; i++) {
			productCdList[i] = Integer.parseInt(temp1[i]);
		}
		
		String[] temp2 = orderListMap.get("orderGoodsQtyList").split(",");
		int[] orderGoodsQtyList = new int[temp2.length];
		for (int i = 0; i < temp2.length; i++) {
			orderGoodsQtyList[i] = Integer.parseInt(temp2[i]);
		}
		
		String[] temp3 = orderListMap.get("paymentAmtList").split(",");
		int[] paymentAmtList = new int[temp3.length];
		for (int i = 0; i < temp3.length; i++) {
			paymentAmtList[i] = Integer.parseInt(temp3[i]);
		}
		
		for (int i = 0; i < productCdList.length; i++) {
			
			OrderDTO orderDTO = new OrderDTO();
			orderDTO.setProductCd(productCdList[i]);
			orderDTO.setMemberId(orderListMap.get("memberId"));
			orderDTO.setOrderGoodsQty(orderGoodsQtyList[i]);
			orderDTO.setPaymentAmt(paymentAmtList[i]);
			orderDTO.setOrdererNm(orderListMap.get("ordererNm"));
			orderDTO.setOrdererHp(orderListMap.get("ordererHp"));
			orderDTO.setReceiverNm(orderListMap.get("receiverNm"));
			orderDTO.setReceiverHp(orderListMap.get("receiverHp"));
			orderDTO.setZipcode(orderListMap.get("zipcode"));
			orderDTO.setRoadAddress(orderListMap.get("roadAddress"));
			orderDTO.setJibunAddress(orderListMap.get("jibunAddress"));
			orderDTO.setNamujiAddress(orderListMap.get("namujiAddress"));
			orderDTO.setDeliveryMethod(orderListMap.get("deliveryMethod"));
			orderDTO.setDeliveryMessage(orderListMap.get("deliveryMessage"));
			orderDTO.setGiftWrapping(orderListMap.get("giftWrapping"));
			orderDTO.setPayMethod(orderListMap.get("payMethod"));
			orderDTO.setPayOrdererHp(orderListMap.get("payOrdererHp"));
			orderDTO.setCardCompanyNm(orderListMap.get("cardCompanyNm"));
			orderDTO.setCardPayMonth(orderListMap.get("cardPayMonth"));
			orderList.add(orderDTO);
			
		}
		Map<String, Object> memberMap = new HashMap<String, Object>();
		memberMap.put("point", Integer.parseInt(orderListMap.get("totalPoint")));
		memberMap.put("memberId" , orderListMap.get("memberId"));
		
		orderDAO.updateMemberPointByCart(memberMap);
		orderDAO.insertOrderByCart(orderList);
		
		String[] temp4 = orderListMap.get("cartCdList").split(",");
		int[] cartCdList = new int[temp4.length];
		for (int i = 0; i < temp4.length; i++) {
			cartCdList[i] = Integer.parseInt(temp4[i]);
		}
		
		orderDAO.deleteCartByOrder(cartCdList);
		
	}
	
	@Override
	@Scheduled(cron="59 9 18 * * *")
	public void getDailyNewOrderList() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<OrderDTO> dailyNewOrderList = orderDAO.selectListDailyNewOrder(sdf.format(new Date()));
		System.out.println("- 오늘 받은 주문 - ");
		for (OrderDTO orderDTO : dailyNewOrderList) {
			System.out.println(orderDTO);
		}
		
	}
	
}
