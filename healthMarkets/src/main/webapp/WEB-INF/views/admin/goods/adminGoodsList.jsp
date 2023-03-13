<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script>
	$().ready(function(){
		
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#searchKeyword").val("${searchKeyword}");
		
	});
	
	function getGoodsList() {
		
		var url = "${contextPath }/admin/goods/adminGoodsList"
		    url += "?searchKeyword=" +  $("#searchKeyword").val();
		    url += "&searchWord=" + $("#searchWord").val() 
		    url += "&onePageViewCnt=" + $("#onePageViewCnt").val();
		
		location.href = url;
	
	}
	
	function adminGoodsRemove(productCd) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href = "${contextPath}/admin/goods/adminGoodsRemove?productCd="+productCd;
		}
	}
	
	function gerateGoodsExcelExport() {
		location.href = "${contextPath}/admin/goods/goodsExcelExport";
	}

</script>
</head>
<body>
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPat }/"><i class="fa fa-home"></i> Admin</a>
                        <span>Goods List</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Cart Section Begin -->
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">	
                <div class="col-lg-12">
	            	<div class="cart__btn update__btn" align="right">
						<a href="javascript:gerateGoodsExcelExport();"><span class="icon_folder_download"></span>Excel</a>
					</div>
                    <div class="shop__cart__table">
                        <table>
                            <thead>
	                            <tr>
									<td> 
										조회 : <span style="color:red">${allGoodsCnt}</span>개
									</td>
									<td colspan="4" align="right" >
										<select id="onePageViewCnt" onchange="getGoodsList()" >
											<option value="total">전체</option>
											<option>5</option>
											<option>7</option>
											<option>10</option>
										</select>
									</td>
								</tr>
                                <tr>
                                    <th width="5%">코드</th>
                                    <th width="75%">상품정보</th>
                                    <th width="10%">등록날짜</th>
                                    <th width="10%">수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty goodsList}">
                            			<tr>
		                                    <td colspan="4" align="center"><h6>조회된 상품이 없습니다.</h6></td>
		                                </tr>	
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="goodsDTO" items="${goodsList }" varStatus="i">
		                            		 <tr>
		                            		 	<td class="cart__product__item" align="center">
		                            		 		<h6>${goodsDTO.productCd }</h6>
			                                    </td>
                                    			<td class="cart__product__item">
			                                        <img src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" width="100" height="100">
			                                        <div class="cart__product__item__title">
			                                            <h6><a href="${contextPath }/goods/goodsDetail?productCd=${goodsDTO.productCd}">${goodsDTO.productNm }</a></h6>
			                                        	<p><fmt:formatNumber value="${goodsDTO.price }"/>원</p>
			                                        </div>
			                                    </td>
			                                    <td class="cart__total"><fmt:formatDate value="${goodsDTO.enrollDt }" pattern="yyyy-MM-dd"/> </td>
			                                	<td class="cart__close">
			                                		<a href="${contextPath }/admin/goods/adminGoodsModify?productCd=${goodsDTO.productCd}"><span class="icon_pencil-edit"></span></a>
			                                		<a href="javascript:adminGoodsRemove(${goodsDTO.productCd });"><span class="icon_trash_alt"></span></a>
			                                	</td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            	<tr>
									<td colspan="5" align="center">			
										<select id="searchKeyword">
											<option value="total">전체검색</option>
											<option value="productNm">상품명</option>
										</select>
										<input type="text" id="searchWord" name="searchWord" value="${searchWord }">
										<input type="button" value="검색" onclick="getGoodsList()">
									</td>
								</tr>
                            </tbody>
                        </table>
                        <div style="display: table; margin-left: auto; margin-right: auto">
							<c:if test="${startPage > 3}">
								<a href="${contextPath }/admin/goods/adminGoodsList?currentPageNumber=${startPage - 3}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}" >이전 </a> 
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<a href="${contextPath }/admin/goods/adminGoodsList?currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}">${i } &nbsp;</a>
							</c:forEach>
							<c:if test="${endPage != allPageCnt && endPage >= 3}">
								<a href="${contextPath }/admin/goods/adminGoodsList?currentPageNumber=${startPage + 3}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}"> 다음 </a>
							</c:if>
						</div>
                    </div>
	            <div align="right">
	                <button type="button" onclick="javascript:location.href='${contextPath}/admin/goods/adminGoodsAdd'" class="site-btn"><span class="icon_plus"></span> 등록</button>
	            </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->
</body>
</html>