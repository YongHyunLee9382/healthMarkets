package com.spring.healthMarkets.admin.goods.controller;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.healthMarkets.admin.goods.service.AdminGoodsService;
import com.spring.healthMarkets.goods.dto.GoodsDTO;
import com.spring.healthMarkets.goods.service.GoodsService;



@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {
	
	@Autowired
	private AdminGoodsService adminGoodsService;
	@Autowired
	private GoodsService goodsService;
	
	private final String PRODUCT_REPO_PATH = "C:\\file_repository\\";	
	
	@GetMapping("/adminGoodsList")
	public ModelAndView adminGoodsList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/goods/adminGoodsList");
		mv.addObject("goodsList", adminGoodsService.getGoodsList());
		
		return mv;
	}
	
	@GetMapping("/adminGoodsAdd")
	public ModelAndView adminGoodsAdd() throws Exception{
		return new ModelAndView("/admin/goods/adminGoodsAdd");
	}
	
	@PostMapping("/adminGoodsAdd")
	public ResponseEntity<Object>adminGoodsAdd(MultipartHttpServletRequest multipartRequest) throws Exception{
		
		multipartRequest.setCharacterEncoding("utf-8");

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		
		GoodsDTO goodsDTO = new GoodsDTO();
		goodsDTO.setProductNm(multipartRequest.getParameter("productNm"));
		goodsDTO.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		goodsDTO.setDiscountRt(Integer.parseInt(multipartRequest.getParameter("discountRt")));
		goodsDTO.setSort(multipartRequest.getParameter("sort"));
		goodsDTO.setPoint(Integer.parseInt(multipartRequest.getParameter("point")));
		goodsDTO.setDeliveryPrice(Integer.parseInt(multipartRequest.getParameter("deliveryPrice")));
		goodsDTO.setPart(multipartRequest.getParameter("part"));
		goodsDTO.setIntro(multipartRequest.getParameter("intro"));
		
		Iterator<String> file =  multipartRequest.getFileNames();
		if(file.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(file.next());
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(PRODUCT_REPO_PATH + uploadFileName);
				uploadFile.transferTo(f);
				goodsDTO.setProductFileName(uploadFileName);
			}
			
		}
		adminGoodsService.addNewGoods(goodsDTO);
		
		String jsScript= "<script>";
		   jsScript += " alert('상품을 등록하였습니다.');";
		   jsScript +=" location.href='adminGoodsList';";
		   jsScript +="</script>";
	
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	}
	
	@GetMapping("/adminGoodsRemove")
	public ResponseEntity<Object> adminGoodsRemove(@RequestParam("productCd") int productCd) throws Exception {
		
		new File(PRODUCT_REPO_PATH + goodsService.getGoodsDetail(productCd).getProductFileName()).delete();
		adminGoodsService.removeGoods(productCd);
		
		String jsScript= "<script>";
			   jsScript += " alert('등록된 상품을 삭제하였습니다.');";
			   jsScript +=" location.href='adminGoodsList';";
			   jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);

	}
	
	@GetMapping("/adminGoodsModify")
	public ModelAndView modifyGoods(@RequestParam("productCd") int productCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/goods/adminGoodsModify");
		mv.addObject("goodsDTO" , goodsService.getGoodsDetail(productCd));
		
		return mv;
		
	}
	@PostMapping("/adminGoodsModify")
	public ResponseEntity<Object> adminGoodsModify(MultipartHttpServletRequest multipartRequest) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		
		GoodsDTO goodsDTO = new GoodsDTO();
		goodsDTO.setProductCd(Integer.parseInt(multipartRequest.getParameter("productCd")));
		goodsDTO.setProductNm(multipartRequest.getParameter("productNm"));
		goodsDTO.setPrice(Integer.parseInt(multipartRequest.getParameter("price")));
		goodsDTO.setDiscountRt(Integer.parseInt(multipartRequest.getParameter("discountRt")));
		goodsDTO.setSort(multipartRequest.getParameter("sort"));
		goodsDTO.setPoint(Integer.parseInt(multipartRequest.getParameter("point")));
		goodsDTO.setDeliveryPrice(Integer.parseInt(multipartRequest.getParameter("deliveryPrice")));
		goodsDTO.setPart(multipartRequest.getParameter("part"));
		goodsDTO.setIntro(multipartRequest.getParameter("intro"));
		
		Iterator<String> file =  multipartRequest.getFileNames();
		if(file.hasNext()) {
			MultipartFile uploadFile = multipartRequest.getFile(file.next());
			if(!uploadFile.getOriginalFilename().isEmpty()) {
				String uploadFileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				File f = new File(PRODUCT_REPO_PATH + uploadFileName);
				uploadFile.transferTo(f);
				goodsDTO.setProductFileName(uploadFileName);
				
				new File(PRODUCT_REPO_PATH + goodsService.getGoodsDetail(Integer.parseInt(multipartRequest.getParameter("productCd"))).getProductFileName()).delete();
			}
			
		}
		adminGoodsService.modifyGoods(goodsDTO); 
		
		String jsScript= "<script>";
		jsScript += " alert('상품정보를 수정하였습니다.');";
		jsScript +=" location.href='adminGoodsList';";
		jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/goodsExcelExport")
	public void goodsExcelExport(HttpServletResponse response) throws Exception {
		  
		SimpleDateFormat fileSdf = new SimpleDateFormat("yyyy_MM_dd_hh_mm");
		SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd");
		String makeFileTime = fileSdf.format(new Date());
		String makeFileName = makeFileTime + "_goodsList.xls";
		
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("상품리스트");
	    Row row = null;
	    Cell cell = null;

	    int rowNo = 0;

	    CellStyle headStyle = wb.createCellStyle();
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	    
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    row = sheet.createRow(rowNo++);
	    cell = row.createCell(0);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상품가격");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("등록일자");

		for (GoodsDTO goodsDTO :  adminGoodsService.getGoodsList()) {
			row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDTO.getProductCd());
	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDTO.getProductNm());
	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(goodsDTO.getPrice());
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(dateSdf.format(goodsDTO.getEnrollDt()));
		} 

	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=" + makeFileName);

	    wb.write(response.getOutputStream());
	    wb.close();
		
	}
}
