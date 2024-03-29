<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath }/resources/ashion-master/js/jquery-3.3.1.min.js"></script>
<script>

	$().ready(function(){
		
		var birthDt = $("[name='birthDt']").val().split("-");
		$("#birthY").val(birthDt[0]);
		$("#birthM").val(birthDt[1]);
		$("#birthD").val(birthDt[2]);
		
		$("form").submit(function(){
			var birthDt = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='birthDt']").val(birthDt);
		});
		
	});
	
	function removeMember(){
		if (confirm("정말로 탈퇴하시겠습니까?")) {
			location.href = "${contextPath}/myPage/removeMember?memberId=" + $("#memberId").val();
		}
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
                        <span>MyInfo</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="cart__btn update__btn" align="right">
                    <a href="javascript:removeMember();"><span class="icon_trash_alt"></span>탈퇴</a>
                </div>
            </div>
            <form action="${contextPath }/myPage/modifyInfo" method="post" class="checkout__form">
                    <div class="col-lg-12">
                        <h5>내 가입 정보</h5>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>아이디 <span>*</span></p>
                                    <input type="text" id="memberId" name="memberId" value="${memberDTO.memberId }" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>이름 <span>*</span></p>
                                    <input type="text" name="memberNm" value="${memberDTO.memberNm }">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>비밀번호 <span>*</span></p>
                                    <input type="password" name="passwd" value="${memberDTO.passwd }" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>포인트 <span>*</span></p>
                                    <input type="text" name="point" value="${memberDTO.point }" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                               <div class="checkout__form__checkbox">
                                    <p>성별 <span style="color:red;">*</span></p>
                                    남 &nbsp;<input type="radio" name="sex" value="m" <c:if test="${memberDTO.sex eq 'm'}">checked</c:if>> &emsp;
                                    여 &nbsp;<input type="radio" name="sex" value="f" <c:if test="${memberDTO.sex eq 'f'}">checked</c:if>>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="checkout__form__input">
                                    <p>생년월일 <span>*</span></p>
                                    <select id="birthY">
                                    	<c:forEach var="i" begin="0" end="2023" >
                                    		<option>${2023 - i}</option>
                                    	</c:forEach>
                                    </select>년 
                                    <select id="birthM">
                                    	<c:forEach var="i" begin="1" end="12" >
                                    		<c:choose>
	                                    		<c:when test="${i < 10 }">
		                                    		<option>0${i}</option>
	                                    		</c:when>
	                                    		<c:otherwise>
		                                    		<option>${i}</option>
	                                    		</c:otherwise>
                                    		</c:choose>
                                    	</c:forEach>
                                    </select>월 
                                    <select id="birthD">
                                    	<c:forEach var="i" begin="1" end="31" >
                                    		<c:choose>
	                                    		<c:when test="${i < 10 }">
		                                    		<option>0${i}</option>
	                                    		</c:when>
	                                    		<c:otherwise>
		                                    		<option>${i}</option>
	                                    		</c:otherwise>
                                    		</c:choose>
                                    	</c:forEach>
                                    </select>일	
                                    <input type="hidden" name="birthDt" value="${memberDTO.birthDt }"/>
                                </div>
                            </div>
                             <div class="col-sm-12" style="margin-bottom: 20">
                            </div>
                             <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>연락처 <span>*</span></p>
                                    <input type="text" name="hp" value="${memberDTO.hp }">
                                    <div class="checkout__order__widget">
	                                    <label for="smsstsYn">
	                                        BMS에서 발송하는 SMS 소식을 수신합니다.
	                                        <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y" <c:if test="${memberDTO.smsstsYn eq 'Y'}">checked</c:if>>
	                                        <span class="checkmark"></span>
	                                    </label>
                                    </div>
                                </div>
                            </div>
                             <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__form__input">
                                    <p>이메일 <span>*</span></p>
                                    <input type="text" name="email" value="${memberDTO.email }">
                                    <div class="checkout__order__widget">
                                    <label for="emailstsYn">
                                        BMS에서 발송하는 E-mail을 수신합니다.
                                        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y" <c:if test="${memberDTO.emailstsYn eq 'Y'}">checked</c:if>>
                                        <span class="checkmark"></span>
                                    </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>우편번호 <span>*</span></p>
                                    <input type="text" id="zipcode" name="zipcode" value="${memberDTO.zipcode }" style="width: 20%;">
                                    <input type="button" value="주소 검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0">
                                </div>
                                <div class="checkout__form__input">
                                    <p>도로명 주소 <span>*</span></p>
                                    <input type="text" id="roadAddress" name="roadAddress" value="${memberDTO.roadAddress }">
                                </div>
                                <div class="checkout__form__input">
                                    <p>지번 주소 <span>*</span></p>
                                    <input type="text" id="jibunAddress" name="jibunAddress" value="${memberDTO.jibunAddress }">
                                </div>
                                <div class="checkout__form__input">
                                    <p>나머지 주소 <span>*</span></p>
                                    <input type="text" id="namujiAddress" name="namujiAddress" value="${memberDTO.namujiAddress }">
                                </div>
                                
                                <c:choose>
                      				<c:when test="${sessionScope.role eq 'admin'}">
                        				<p>Contact권한 <span>*</span></p>
                                    	Yes<input type="radio" id="authorityWt" name="authorityWt" value="Y">
                                    	No<input type="radio" id="authorityWt" name="authorityWt" value="N">
                        			</c:when>
                        		</c:choose>
                                    
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__checkbox" align="right">
                               	 	<button type="submit" class="site-btn"><span class="icon_pencil-edit"></span> 수정</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->
</body>
</html>