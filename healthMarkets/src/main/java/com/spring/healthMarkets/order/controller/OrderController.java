package com.spring.healthMarkets.order.controller;

import java.util.Map;

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

import com.spring.healthMarkets.member.service.MemberService;
import com.spring.healthMarkets.myPage.service.MyPageService;
import com.spring.healthMarkets.order.dto.OrderDTO;
import com.spring.healthMarkets.order.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MyPageService myPageService;

	
	@GetMapping("/orderGoods")
	public ModelAndView orderGoods(@RequestParam("productCd") int productCd , @RequestParam("orderGoodsQty") int orderGoodsQty , HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();  			
		mv.setViewName("/order/orderGoods");
		
		HttpSession session = request.getSession();
		
		mv.addObject("orderer"       , orderService.getOrdererDetail((String)session.getAttribute("memberId")));
		mv.addObject("goodsDTO"      , orderService.getGoodsDetail(productCd));
		mv.addObject("orderGoodsQty" , orderGoodsQty);
		
		return mv;
		
	}
	@PostMapping("/orderGoods")
	public ResponseEntity<Object> orderGoods(OrderDTO orderDTO , @RequestParam("point") int point ,  HttpServletRequest request) throws Exception{
		
		orderService.addOrder(orderDTO , point);
		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt(orderDTO.getMemberId()));
		
		String jsScript= "<script>";
				jsScript += " alert('상품을 주문하였습니다.');";
				jsScript +=" location.href='" + request.getContextPath() + "/';";
				jsScript +="</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	@GetMapping("/orderCartGoods")
	public ModelAndView orderCartGoods(@RequestParam("productCdList") String productCds , 
									   @RequestParam("orderGoodsQtyList") String orderGoodsQtyList , 
									   @RequestParam("cartCdList") String cartCdList ,
									   HttpServletRequest request) throws Exception{
		
		String[] temp = productCds.split(",");
		int[] productCdList = new int[temp.length];
		
		for (int i = 0; i < productCdList.length; i++) {
			productCdList[i] = Integer.parseInt(temp[i]);
		}
		
		ModelAndView mv = new ModelAndView();  			
		mv.setViewName("/order/orderCartGoods");
		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt((String)session.getAttribute("memberId")));
		session.setAttribute("myCartCnt" , memberService.getMyCartCnt((String)session.getAttribute("memberId")));
		
		
		mv.addObject("orderer"           , orderService.getOrdererDetail((String)session.getAttribute("memberId")));
		mv.addObject("goodsList"         , orderService.getGoodsListByCart(productCdList));
		mv.addObject("orderGoodsQtyList" , orderGoodsQtyList);
		mv.addObject("productCdList"       , productCds);
		mv.addObject("cartCdList"        , cartCdList);
		mv.addObject("cartList"			,  myPageService.getMyCartList((String)session.getAttribute("memberId")));
		
		return mv;
		
	}
	@PostMapping("/orderCartGoods")
	public ResponseEntity<Object> orderCartGoods(@RequestParam Map<String, String> orderListMap , HttpServletRequest request) throws Exception{
		
		orderService.addOrderByCart(orderListMap);
		
		HttpSession session = request.getSession();
		session.setAttribute("myOrderCnt" , memberService.getMyOrderCnt(orderListMap.get("memberId")));
		session.setAttribute("myCartCnt"  , memberService.getMyCartCnt(orderListMap.get("memberId")));

		
		String jsScript = "<script>";
			   jsScript += "alert('상품을 주문하였습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/myPage/myOrderList'";
			   jsScript +="</script>";
		
		
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
		 return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
}
