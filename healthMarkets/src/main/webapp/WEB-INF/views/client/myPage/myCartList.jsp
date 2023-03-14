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
	
		getTotalPrice();
		
		$("[name='cartCd']").change(function(){
			getTotalPrice();
		});
		
	});
	
	
	function getTotalPrice () {
		var totalPrice = 0;
		$("[name='cartCd']:checked").each(function(){
			var tempCartCd = $(this).val();
			totalPrice += Number($("#price" + tempCartCd).val()) * Number($("#orderGoodsQty" + tempCartCd).val());
		});
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#totalPrice").html(totalPrice);
	}
	
	
	function removeCart() {
			
		var cartCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("input[name='cartCd']:checked").each(function(){
				cartCdList += $(this).val() + ",";
			});
			location.href = "${contextPath}/myPage/removeCart?cartCdList=" + cartCdList;
		}
		
	}
	
	
	function modifyOrderGoodsQty(cartCd){
		$.ajax({
			type : "get",
			url : "${contextPath}/myPage/modifyOrderGoodsQty",
			data : {
				"cartCd"   : cartCd,
				"orderGoodsQty" : $("#orderGoodsQty" + cartCd).val()
			},
			success:function(){
				getTotalPrice();
			}
		});
		
	}
	
	
	function processOrderCart() {
	
		var productCdList = "";
		var orderGoodsQtyList = "";
		var cartCdList = ""
		
		$("[name='cartCd']:checked").each(function(){
			
			var cartCd = $(this).val();
			var productCd =  $("#productCd" + cartCd).val();
			var orderGoodsQty = $("#orderGoodsQty" + cartCd).val();
			
			productCdList += productCd + ",";
			orderGoodsQtyList += orderGoodsQty +",";
			cartCdList += cartCd + ",";
			
		});
		
		if (productCdList == "") {
			alert("주문 목록이 없습니다.");
			return false;
		}
		
		var url = "${contextPath}/order/orderCartGoods";
		    url += "?productCdList=" + productCdList;
		    url += "&orderGoodsQtyList=" + orderGoodsQtyList;
		    url += "&cartCdList=" + cartCdList;
		
		location.href = url;
		
		
	}
	
	
	function selectAllCart() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='cartCd']").prop("checked" , true);
		}
		else {
			$("[name='cartCd']").prop("checked" , false);
		}
		getTotalPrice();
	}	
	

</script>
</head>
<body>

	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Home</a>
                        <span>myCartList</span>
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
                    <div class="shop__cart__table">
                    	<h6><input type="checkbox" id="changeAllChoice" onchange="selectAllCart()"> &nbsp;전체선택</h6>
                    	<br>
                        <table>
                            <thead>
                                <tr>
                                    <th width="3%"></th>
                                    <th>상품명</th>
                                    <th width="13%">상품가격</th>
                                    <th width="13%">주문수량</th>
                                    <th width="13%">등록일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty myCartList}">
                            			<tr align="center">
                            				<td colspan="5"><h5>조회된 상품이 없습니다.</h5></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="myCart" items="${myCartList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="cartCd" value="${myCart.cartCd }" checked></td>
                                    			<td class="cart__product__item">
			                                        <div class="cart__product__item__title">
			                                        	<img src="${contextPath }/thumbnails?productFileName=${myCart.productFileName }" width="50" height="50">
			                                            <h6>
			                                            	<a href="${contextPath }/goods/goodsDetail?productCd=${myCart.productCd}">${myCart.productNm }</a>
			                                            	<input type="hidden" id="productCd${myCart.cartCd }" value="${myCart.productCd }"/>
			                                            </h6>
			                                        </div>
			                                    </td>
			                                    <td class="cart__price">
			                                    	<div class="product__price" >
			                                    		<span style="text-decoration: line-through; color: gray" ><fmt:formatNumber value="${myCart.price }"/></span><br>
				                                    	<fmt:formatNumber value="${myCart.price -  myCart.price * (myCart.discountRt / 100)}"/>
														<input type="hidden" id="price${myCart.cartCd }" value="${myCart.price -  myCart.price * (myCart.discountRt / 100)}">			                                    
			                                    	</div>
			                                    </td>
			                                    <td class="cart__quantity">
			                                        <div class="pro-qty" onmouseleave="modifyOrderGoodsQty(${myCart.cartCd })">
			                                            <input type="text" id="orderGoodsQty${myCart.cartCd }" value="${myCart.orderGoodsQty }" />
			                                        </div>
			                                    </td>
			                                    <td><h6><fmt:formatDate value="${myCart.enrollDt }" pattern="yyyy-MM-dd"/></h6></td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="cart__btn update__btn" align="right">
                        <a href="javascript:removeCart();"><span class="icon_trash"></span>삭제</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="discount__content">
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-2">
                    <div class="cart__total__procced">
                        <a href="javascript:processOrderCart()" class="primary-btn"><span class="icon_check"></span> 주문하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->
</body>
</html>