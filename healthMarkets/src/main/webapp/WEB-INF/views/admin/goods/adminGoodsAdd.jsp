<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
	<script type="text/javascript">
	function formValidationCheck() {

        var productFileName = document.addGoods.productFileName;
        if (productFileName.value == "") {
            alert("이미지를 선택하세요.");
            productFileName.focus();
            return false;
        }
        
        var productNm = document.addGoods.productNm;
        if (productNm.value == "") {
            alert("상품이름을 등록하세요.");
            productNm.focus();
            return false;
        }
        
        var price = document.addGoods.price;
        if (price.value == "") {
            alert("상품가격을 등록하세요.");
            price.focus();
            return false;
        }
        var discountRt = document.addGoods.discountRt;
        if (discountRt.value == "") {
            alert("상품할인율을 등록하세요.");
            discountRt.focus();
            return false;
        }
        var sort = document.addGoods.sort;
        if (sort.value == "") {
            alert("상품분류를 선택하세요.");
            sort.focus();
            return false;
        }
        var point = document.addGoods.point;
        if (point.value == "") {
            alert("상품 포인트를 등록하세요.");
            point.focus();
            return false;
        }
        var deliveryPrice = document.addGoods.deliveryPrice;
        if (deliveryPrice.value == "") {
            alert("상품 배송비를 등록하세요.");
            deliveryPrice.focus();
            return false;
        }
        var part = document.addGoods.part;
        if (part.value == "") {
            alert("상품 분야를 선택하세요.");
            part.focus();
            return false;
        }
        var intro = document.addGoods.intro;
        if (intro.value == "") {
            alert("상품 소개를 입력하세요.");
            intro.focus();
            return false;
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
                        <a href="${contextPath }/"><i class="fa fa-home"></i>Admin</a>
                        <span>add Goods</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <form action="${contextPath }/admin/goods/adminGoodsAdd" method="post" enctype="multipart/form-data" class="checkout__form" onsubmit=" return formValidationCheck()" name="addGoods">
                <div class="row">
                    <div class="col-lg-8">
                        <h5>상품등록</h5>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품이미지<span>*</span> <span class="icon_upload"></span> </p>
                                    <input type="file" name="productFileName">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>상품명 <span>*</span></p>
                                    <input type="text" name="productNm" placeholder="상품명을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>가격 <span>*</span></p>
                                    <input type="text" name="price" placeholder="가격을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>할인률 <span>*</span></p>
                                    <input type="text" name="discountRt" placeholder="할인률을 입력하세요.">
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
                                    <input type="text" name="point" placeholder="적립 포인트(P)를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>배송비 <span>*</span></p>
                                    <input type="text" name="deliveryPrice" placeholder="배송비를 입력하세요.">
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
                                    <textarea rows="5" cols="100" name="intro" placeholder="상품소개를 입력하세요."></textarea> 
                                </div>
                            </div>
                        </div>
                        <br>
		                <div align="right">
		                	<button type="submit" class="site-btn"><span class="icon_plus"></span> 등록</button>
		                </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

</body>
 