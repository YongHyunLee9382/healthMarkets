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

	$().ready(function() {
	
		$("#btnOverlapped").click(function(){
			
		    var memberId = $("#memberId").val();
		   
		    if (memberId == ''){
		   		alert("ID를 입력하세요");
		   		return;
		    }
		   
		    $.ajax({
		       type : "get",
		       url  : "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
		       success : function (data){
		          if (data == "duplicate"){
					  alert("사용할 수 있는 ID입니다.");
		          }
		          else {
		          	  alert("사용할 수 없는 ID입니다.");
		          }
		       }
		    });
		    
		 });	
		
		var isFirst = true;
		$("#passwd").blur(function(){
			var passwd = $("#passwd").val().length;

			if (passwd < 8 && isFirst) {
				$("#target").append("<p><span style='color:red;'>비밀번호는 8자리 이상으로 입력하세요.</span></p>");
				isFirst = false;
			} 
			
			if (passwd >= 8 && !isFirst) {
				$("#target").empty();
				isFirst = true;
			}
		});
		
		var isCheck = true;
		$("#confirmPasswd").blur(function(){
			var confirmPasswd = $("#confirmPasswd").val();
			if(($("#passwd").val() == $("#confirmPasswd").val() ) && isCheck){
				$("#target2").append("<p><span style='color:green;'>비밀번호가 일치합니다.</span></p>");
				isCheck = false;
				
			}
		});
		
		
		$("form").submit(function(){
			
			var birthDt = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='birthDt']").val(birthDt);
			
			if ($("#smsstsYn").val() != "Y") {
				$(this).val("N");
			}
			if ($("#emailstsYn").val() != "Y") {
				$(this).val("N")
			}
			
			if ($("#passwd").val() != $("#confirmPasswd").val()) {
				alert("비밀번호를 확인하세요.");
				$("#passwd").focus();
				return false;
			}
			
			
			var memberId = document.form.memberId;
	        if (memberId.value == "") {
	            alert("아이디를 입력하세요.");
	            memberId.focus();
	            return false;
	        }
	        var memberNm = document.form.memberNm;
	        if (memberNm.value == "") {
	            alert("이름을 입력하세요.");
	            memberNm.focus();
	            return false;
	        }
	        var sex = document.form.sex;
	        if (sex.value == "") {
	            alert("성별을 선택하세요.");
	            sex.focus();
	            return false;
	        }
	        var hp = document.form.hp;
	        if (hp.value == "") {
	            alert("연락처를 입력하세요.");
	            hp.focus();
	            return false;
	        }
	        var email = document.form.email;
	        if (email.value == "") {
	            alert("이메일을 입력하세요.");
	            email.focus();
	            return false;
	        }
			
		});
		
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
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Client</a>
                        <span>Register</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <form action="${contextPath }/member/register" method="post" class="checkout__form" name="form">
                <div class="row">
                    <div class="col-lg-8">
                        <h5>회원가입</h5>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>아이디 <span>*</span></p>
                                    <input type="text" id="memberId" name="memberId" style="width: 60%;" placeholder="아이디를 입력하세요.">
                                    <input type="button" id="btnOverlapped" value="중복확인"  style="width: 20%; padding-left: 0">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>비밀번호 <span>*</span></p>
                                    <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요.">
                                    <span id="target"></span>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>비밀번호 확인 <span>*</span></p>
                                    <input type="password" id="confirmPasswd" placeholder="비밀번호를 확인하세요.">
                                    <span id="target2"></span>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>이름 <span>*</span></p>
                                    <input type="text" name="memberNm" placeholder="이름을 입력하세요.">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                               <div class="checkout__order__widget">
                                    <p>성별 <span style="color:red;">*</span></p>
                                    남 &nbsp;<input type="radio" name="sex" value="m"> &emsp;
                                    여 &nbsp;<input type="radio" name="sex" value="f">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="checkout__order__widget">
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
                                    <input type="hidden" name="birthDt"/>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                            </div>
                            <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>연락처 <span>*</span></p>
                                    <input type="text" name="hp" placeholder="-를 포함해서 입력하세요.">
                                    <div class="checkout__order__widget">
	                                    <label for="smsstsYn">
	                                        HMMS에서 발송하는 SMS 소식을 수신합니다.
	                                        <input type="checkbox" id="smsstsYn" name="smsstsYn" value="Y">
	                                        <span class="checkmark"></span>
	                                    </label>
                                    </div>
                                </div>
                            </div>
                             <div class="col-sm-12">
                                <div class="checkout__form__input">
                                    <p>이메일 <span>*</span></p>
                                    <input type="text" name="email" placeholder="이메일을 입력하세요.">
                                    <div class="checkout__order__widget">
                                    <label for="emailstsYn">
                                        HMMS에서 발송하는 E-mail을 수신합니다.
                                        <input type="checkbox" id="emailstsYn" name="emailstsYn" value="Y">
                                        <span class="checkmark"></span>
                                    </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__input">
                                    <p>우편번호 <span>*</span></p>
                                    <input type="text" id="zipcode" name="zipcode" style="width: 20%;">
                                    <input type="button" value="검색" onclick="execDaumPostcode();" style="width: 10%; padding-left: 0">
                                </div>
                                <div class="checkout__form__input">
                                    <p>도로명 주소 <span>*</span></p>
                                    <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요.">
                                </div>
                                <div class="checkout__form__input">
                                    <p>지번 주소 <span>*</span></p>
                                    <input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요.">
                                </div>
                                <div class="checkout__form__input">
                                    <p>나머지 주소 <span>*</span></p>
                                    <input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요.">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="checkout__form__checkbox">
                                </div>
                            </div>
                        </div>
                        <div align="right">
                        	<button type="submit" class="site-btn"><span class="icon_plus"></span> 가입</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->
</body>
</html>