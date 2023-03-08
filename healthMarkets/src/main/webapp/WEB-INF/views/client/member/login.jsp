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
function register(){
	
	location.href = "${contextPath}/member/register";
	
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
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
        	<form action="${contextPath }/member/login" method="post" class="checkout__form">
               <div class="col-lg-8">
                   <h5>로그인</h5>
                   <div class="row">
                       <div class="col-lg-12">
                           <div class="checkout__form__input">
                               <p>아이디 <span>*</span></p>
                               <input type="text" name="memberId">
                           </div>
                           <div class="checkout__form__input">
                               <p>비밀번호 <span>*</span></p>
                               <input type="password" name="passwd">
                           </div>
                           		<input type="button" value="회원가입" class="site-btn" onclick="register();"/>
	                            <button type="submit" class="site-btn">로그인</button>
	                          	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	                          	<input type="button" value="아이디 찾기" class="site-btn" onclick="findMemberId();"/>
	                          	<input type="button" value="비밀번호 찾기" class="site-btn" onclick="findMemberPasswd();"/>
                       </div>
                   </div>
               </div>
            </form>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
</html>