<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function login(){
	
	location.href = "${contextPath}/member/login";
	
}

function findMemberId(){
	
	location.href = "${contextPath}/member/findMemberId";
	
}
function findMemberPasswd(){
	
	location.href = "${contextPath}/member/findMemberPasswd";
	
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
                        <span>아이디 찾기</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
        	<form action="${contextPath }/member/findMemberId" method="post" class="checkout__form">
               <div class="col-lg-8">
                   <h5>아이디 찾기</h5>
                   <div class="row">
                       <div class="col-lg-12">
                           <div class="checkout__form__input">
                               <p>이메일 <span>*</span></p>
                               <input type="text" name="email">
                           </div>
                           <div class="checkout__form__input">
                               <p>생년월일 <span>*</span></p>
                               <input type="text" name="birthDt" placeholder="-를 포함해서 작성해주세요. (0000-00-00)">
                           </div>
	                            <button type="submit" class="site-btn">찾기</button>
	                          	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                          	<input type="button" value="아이디 찾기" class="site-btn" onclick="findMemberId()"/>
	                          	<input type="button" value="비밀번호 찾기" class="site-btn" onclick="findMemberPasswd()"/>
                       </div>
                   </div>
               </div>
            </form>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>