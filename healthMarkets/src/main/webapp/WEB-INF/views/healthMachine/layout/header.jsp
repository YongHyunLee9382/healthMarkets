<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-3 col-lg-2">
                    <div class="header__logo">
                    	<c:choose>
                        	<c:when test="${sessionScope.role eq 'admin'}">
                        		<a href="${contextPath}/admin/member/adminMain"><img src="${contextPath }/resources/healthMachine/logo.png"  alt=""></a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href="${contextPath}/"><img src="${contextPath }/resources/healthMachine/logo.png"  alt=""></a>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-7">
                    <nav class="header__menu">
                        <ul>
                        <c:choose>
                        	<c:when test="${sessionScope.role eq 'admin'}">
                        		<li class="active"><a href="${contextPath}/admin/member/adminMain">Home</a></li>
                        	</c:when>
                        	<c:otherwise>
                        		<li class="active"><a href="${contextPath}/">Home</a></li>
                        	</c:otherwise>
                        </c:choose>
                            <c:choose>
                            	<c:when test="${sessionScope.role eq 'admin'}">
                            	<li><a href="#"><span class="icon_menu"></span> Management</a>
                            		<ul class="dropdown">
                            			<li><a href="${contextPath }/admin/goods/adminGoodsList">Goods Management</a></li>
	                        			 <li><a href="${contextPath }/admin/member/adminMemberList">User Management</a></li>
	                        			 <li><a href="${contextPath }/admin/order/adminOrderList">Order Management</a></li>
	                        			 <li><a href="${contextPath }/admin/contact/contactList">Contact Management</a></li>
                            		</ul>
                            	</li>	
                            	</c:when>
                            	<c:otherwise>
                            		<li><a href="${contextPath }/goods/goodsList?sort=all&part=all">Shop</a></li>
                            		<li><a href="#">Pages</a>
                                	<ul class="dropdown">
                                    	<li><a href="#">Shop Cart</a></li>
                                    	<li><a href="${contextPath}/myPage/myInfo?memberId=${sessionScope.memberId}">MyPage</a></li>
                                	</ul>
                            		</li>
                            <c:choose>
                            	<c:when test="${sessionScope.memberId ne null}">
                            		<li><a href="#">Contact</a>
                            		<ul class="dropdown">
                            			<li><a href="${contextPath}/contact/addContact ">AddContact</a></li>
                            			<li><a href="${contextPath}/contact/contactList?memberId=${sessionScope.memberId}">Contact List</a></li>
                            		</ul>
                           			</li>
                           		</c:when>
                           	</c:choose>	 
                            	</c:otherwise>
                            </c:choose>
                            
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__right">
                        <c:choose>
                        	<c:when test="${sessionScope.memberId eq null }">
                        		<div class="header__right__auth">
                        			<a href="${contextPath}/member/login">Login</a>
                           			<a href="${contextPath}/member/register">Register</a>
                        		</div>
                        	</c:when>
                        	<c:when test="${sessionScope.memberId eq 'admin' }">
                        		<div class="header__right__auth">
                        			<a href="${contextPath}/admin/member/adminLogout">관리자 로그아웃</a>
                        		</div>
                        	</c:when>
                        	<c:otherwise>
                        		<div class="header__right__auth">
                        			<a href="${contextPath}/member/logout">Logout</a>
                        		</div>
                        	</c:otherwise>
                        </c:choose>
                        <ul class="header__right__widget">	
                            <li><span class="icon_search search-switch"></span></li>
                            <li><a href="#"><span class="icon_heart_alt"></span>
                        		<c:choose>
                                	<c:when test="${sessionScope.role == 'client'}">
		                                <div class="tip">${sessionScope.myCartCnt }</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="tip">0</div>
                                	</c:otherwise>
                                </c:choose>	
                        	</a></li>
                             <li><a href="${contextPath }/myPage/myOrderList"><span class="icon_bag_alt"></span>
                                 <c:choose>
                                	<c:when test="${sessionScope.role == 'client' }">
		                                <div class="tip">${sessionScope.myOrderCnt }</div>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="tip">0</div>
                                	</c:otherwise>
                                </c:choose>
                            </a></li>
                        </ul>
                        <c:choose>
                        	<c:when test="${sessionScope.memberId eq null }">
                       		 	<div class="header__right__auth">
                       		 	<p><a href="${contextPath}/admin/member/adminLogin">관리자 로그인</a></p>
                       		 	</div>
                       		 </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
            <div class="canvas__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
</body>
</html>