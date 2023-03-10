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
				data : {"productCd" : productCd , "cartGoodsQty" : 1},
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
			location.href = "${contextPath }/order/orderGoods?productCd="+productCd+"&orderGoodsQty=1";	
		}
		
	}
	
	function getGoodsListByPrice(){
		location.href = "${contextPath }/goods/searchGoods?method=price&min="+$("#minamount").val() + "&max=" + $("#maxamount").val();
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
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="shop__sidebar">
                        <div class="sidebar__categories">
                            <div class="section-title">
                                <h4>Categories</h4>
                            </div>
                            <div class="categories__accordion">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-heading active">
                                            <a data-toggle="collapse" data-target="#collapseOne">AEROBIC</a>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=aerobic&part=running">Running</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=aerobic&part=cycle">Cycle</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseTwo">WEIGHT</a>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=weight&part=shoulder">Shoulder</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=weight&part=chest">Chest</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=weight&part=back">Back</a></li>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=weight&part=leg">Leg</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-heading">
                                            <a data-toggle="collapse" data-target="#collapseThree">FREE WEIGHT</a>
                                        </div>
                                        <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                            <div class="card-body">
                                                <ul>
                                                    <li><a href="${contextPath }/goods/goodsList?sort=freeWeight&part=multi">Multi</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                        
                        <div class="sidebar__sizes">
                            <div class="section-title">
                                <h4>Shop by Category</span></h4>
                            </div>
                            <div class="size__list">
                                <p><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=highPrice">높은가격순</a></p>
                                <p><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=lowPrice">낮은가격순</a></p>
                                <p><a href="${contextPath }/goods/searchGoods?method=keyword&keyword=discountRt">할인률이 높은순</a></p>
                            </div>
                        </div>
                        <div class="sidebar__color">
                            <div class="section-title">
                                <h4>Shop by Search</h4>
                            </div>
                            <div class="checkout__form__input">
                            	<form action="${contextPath }/goods/searchGoods" method="get">
	                            	<input type="text" name="word">
	                            	<input type="hidden" name="method" value="search">
	                            	<input type="submit" value="검색">
                            	</form>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="row">
                    	<c:choose>
                    		<c:when test="${empty goodsList}">
	                            <div class="product__item">
	                    			<h3>등록된 상품이 없습니다.</h3>
	                            </div>
                    		</c:when>
                    		<c:otherwise>
		                    	<c:forEach var="goodsDTO" items="${goodsList }">
			                        <div class="col-lg-4 col-md-6">
			                            <div class="product__item">
			                                <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName}">
			                                    <c:choose>
			                                    	<c:when test="${goodsDTO.sort eq 'aerobic' }"> <div class="label new">Aerobic</div></c:when>
			                                    	<c:when test="${goodsDTO.sort eq 'weight' }">  <div class="label sale">Weight</div></c:when>
			                                    	<c:when test="${goodsDTO.sort eq 'freeWeight' }"> <div class="label stockout stockblue">Free Weight</div></c:when>
			                                    </c:choose>
			                                    <ul class="product__hover">
			                                        <li><a href="${contextPath }/thumbnails?productFileName=${goodsDTO.productFileName}" class="image-popup"><span class="arrow_expand"></span></a></li>
			                                        <li><a href="javascript:processToCart(${goodsDTO.productCd})"><span class="icon_cart_alt"></span></a></li>
			                                        <li><a href="javascript:processToOrder(${goodsDTO.productCd})"><span class="icon_bag_alt"></span></a></li>
			                                    </ul>
			                                </div>
			                                <div class="product__item__text">
			                                    <h6>
			                                    	<a href="${contextPath }/goods/goodsDetail?productCd=${goodsDTO.productCd}">${goodsDTO.productNm }<br>
			                                    	</a>
			                                    </h6>
			                                    <div class="product__price" style="text-decoration: line-through; color: gray"><fmt:formatNumber value="${goodsDTO.price }"/>원 (${goodsDTO.discountRt}%)</div>
			                                    <div class="product__price"><fmt:formatNumber value="${goodsDTO.price - goodsDTO.price * goodsDTO.discountRt / 100 }"/>원</div>
			                                </div>
			                            </div>
			                        </div>
		                    	</c:forEach>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

</body>
</html>