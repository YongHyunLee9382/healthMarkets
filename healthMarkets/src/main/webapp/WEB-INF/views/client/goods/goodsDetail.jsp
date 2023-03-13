<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	function processToCart(productCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			
			$.ajax({
				url : "${contextPath }/myPage/addCart",
				method : "get",
				data : {"productCd" : productCd , "cartGoodsQty" : $("#orderGoodsQty").val()},
				success : function(result) {
					
					if (result == "duple") {
						alert("이미 추가된 품목입니다.");
					}
					else {
						alert("장바구니에 추가되었습니다.");
					}
					
				}
			})
			
		}
	}
	
	function processToOrder(productCd) {
		
		if ("${sessionId == null}" == "true") {
			alert("로그인을 진행해주세요.");
			location.href = "${contextPath }/member/login";
		}
		else {
			location.href = "${contextPath }/order/orderGoods?productCd="+productCd+"&orderGoodsQty=" + $("#orderGoodsQty").val();	
		}
		
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
                        <a href="${contextPath }/"><i class="fa fa-home"></i>${goodsDTO.sort }</a>
                        <span>${goodsDTO.productNm }</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__left product__thumb nice-scroll">
                            <a class="pt active" href="#product-1">
                                <img src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                            </a>
                            <a class="pt" href="#product-2">
                                <img src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                            </a>
                            <a class="pt" href="#product-3">
                                <img src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                            </a>
                            <a class="pt" href="#product-4">
                                <img src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                            </a>
                        </div>
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
                                <img data-hash="product-1" class="product__big__img" src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                                <img data-hash="product-2" class="product__big__img" src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                                <img data-hash="product-3" class="product__big__img" src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                                <img data-hash="product-4" class="product__big__img" src="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName }" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>${goodsDTO.productNm }</h3>
                        <div class="product__details__price"><fmt:formatNumber value="${goodsDTO.price - (goodsDTO.price * goodsDTO.discountRt / 100)}" /><span><fmt:formatNumber value="${goodsDTO.price }"/></span></div>
                        <div class="product__details__button">
                            <c:choose>
                            	<c:when test="${sessionScope.role ne 'admin' }">
                            <div class="quantity">
                                <span>수량 : </span>
                                <div class="pro-qty">
                                    <input type="number" id="orderGoodsQty" name="orderGoodsQty" value="1"> &emsp;&emsp;
                                </div>
                            </div>
                            
                            	
                            		<a href="javascript:processToCart(${goodsDTO.productCd });" class="cart-btn"><span class="icon_cart_alt"></span> 장바구니</a>
                            		<a href="javascript:processToOrder(${goodsDTO.productCd });" class="cart-btn"><span class="icon_bag_alt"></span> 주문하기</a>
                            	</c:when>
                            </c:choose>
                        </div>
                        <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>등록일 : </span>
                                    <p><fmt:formatDate value="${goodsDTO.enrollDt }" pattern="yyyy-MM-dd"/></p>
                                </li>
                                <li>
                                    <span>포인트 : </span>
                                    <p>${goodsDTO.point }P</p>
                                </li>
                                <li>
                                    <span>할인률 : </span>
                                    <p>${goodsDTO.discountRt }%</p>
                                </li>
                                <li>
                                    <span>배송비 : </span>
                                    <p>${goodsDTO.deliveryPrice }원</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                           <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상품소개</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                        	<div class="tab-pane active" id="tabs-1" role="tabpanel">
                                ${goodsDTO.intro}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="related__title">
                        <h5>RELATED PRODUCTS</h5>
                    </div>
                </div>
                <c:forEach var="relatedGoods" items="${relatedGoodsList }">
	                <div class="col-lg-3 col-md-4 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName=${relatedGoods.productFileName}">
	                            <ul class="product__hover">
                                     <li><a href="${contextPath }/thumbnails?productFileName=${relatedGoods.productFileName}" class="image-popup"><span class="arrow_expand"></span></a></li>
                                     <li><a href="javascript:processToCart(${relatedGoods.productCd})"><span class="icon_cart_alt"></span></a></li>
                                     <li><a href="javascript:processToOrder(${relatedGoods.productCd})"><span class="icon_bag_alt"></span></a></li>
                                </ul>
	                        </div>
	                        <div class="product__item__text">
	                           <h6>
                               	<a href="${contextPath }/goods/goodsDetail?productCd=${relatedGoods.productCd}">${relatedGoods.productNm }<br>
                                	
                               	</a>
                               </h6>
                               <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${relatedGoods.price }"/>원 (${relatedGoods.discountRt}%)</div>
                               <div class="product__price"><fmt:formatNumber value="${relatedGoods.price - relatedGoods.price * relatedGoods.discountRt / 100 }"/>원</div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
</body>
</html>