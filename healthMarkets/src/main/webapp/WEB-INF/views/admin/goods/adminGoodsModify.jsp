<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script>
	$().ready(function(){
		
		$("[name='part']").val("${goodsDTO.part}");
		$("[name='sort']").val("${goodsDTO.sort}");
		
	});

</script>
</head>
<body>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i>Admin</a>
                        <span>modify Goods</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <form action="${contextPath }/admin/goods/adminGoodsModify" method="post" enctype="multipart/form-data" class="checkout__form" >
                <input type="hidden" name="productCd" value="${goodsDTO.productCd }">
                <div class="row">
                    <div class="col-lg-8">
                        <h5>상품수정</h5>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품이미지<span>*</span></p>
                                    <input type="file" name="productFileName" value="${goodsDTO.productFileName }">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품명 <span>*</span></p>
                                    <input type="text" name="productNm" value="${goodsDTO.productNm }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>가격 <span>*</span></p>
                                    <input type="text" name="price" value="${goodsDTO.price }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>할인률 <span>*</span></p>
                                    <input type="text" name="discountRt" value="${goodsDTO.discountRt }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>분류 <span>*</span></p>
                                      <select name="sort">
                                    	<option value="aerobic">유산소</option>
                                    	<option value="weight">웨이트</option>
                                    	<option value="freeWeight">프리웨이트</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>적립포인트(P) <span>*</span></p>
                                    <input type="text" name="point" value="${goodsDTO.point }">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>배송비 <span>*</span></p>
                                    <input type="text" name="deliveryPrice" value="${goodsDTO.deliveryPrice }">
                                </div>
                            </div>
                           <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>분야<span>*</span></p>
                                    <select name="part">
                                    	<option value="shoulder">Shoulder</option>
                                    	<option value="leg">Leg</option>
                                    	<option value="chest">Chest</option>
                                    	<option value="back">Back</option>
                                    	<option value="multi">Multi</option>
                                    	<option value="running">Running</option>
                                    	<option value="cycle">Cycle</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품소개<span>*</span></p>
                                    <textarea rows="5" cols="100" name="intro">${goodsDTO.intro }</textarea> 
                                	<script>CKEDITOR.replace("intro");</script>
                                </div>
                            </div>
                        </div>
                    <br>
	                <div align="right">
	                	<button type="submit" class="site-btn"><span class="icon_pencil-edit"></span> 수정</button>
	                </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

</body>
 