package com.spring.healthMarkets.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.healthMarkets.goods.dto.GoodsDTO;
import com.spring.healthMarkets.goods.service.GoodsService;



@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/goodsDetail")
	public ModelAndView goodsDetail(@RequestParam("productCd") int productCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		GoodsDTO goodsDTO = goodsService.getGoodsDetail(productCd);
		
		mv.setViewName("/goods/goodsDetail");
		mv.addObject("goodsDTO" , goodsDTO);

		mv.addObject("relatedGoodsList" , goodsService.getRelatedGoodsList(goodsDTO));
		
		return mv;
		
	}
	
	
	@GetMapping("/goodsList")
	public ModelAndView goodsList(@ModelAttribute GoodsDTO goodsDTO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/goods/goodsList");
		
		mv.addObject("goodsList" , goodsService.getGoodsList(goodsDTO));
		
		return mv;
		
	}
}
