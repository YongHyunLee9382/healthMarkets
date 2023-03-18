<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
	function gerateMemberExcelExport() {
		location.href = "${contextPath}/admin/member/memberExcelExport";
	}
	
	$().ready(function(){
		
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#searchKeyword").val("${searchKeyword}");
		
	});
	
	function getMemberList() {
		
		var url = "${contextPath }/admin/member/adminMemberList"
		    url += "?searchKeyword=" +  $("#searchKeyword").val();
		    url += "&searchWord=" + $("#searchWord").val() 
		    url += "&onePageViewCnt=" + $("#onePageViewCnt").val();
		
		location.href = url;
	
	}
</script>
</head>
<body>
	<body>
	<!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Admin</a>
                        <span>Member List</span>
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
                	<div class="cart__btn update__btn" align="right">
						<a href="javascript:gerateMemberExcelExport();"><span class="icon_folder_download"></span>Excel</a>
					</div>
                    <div class="shop__cart__table">
                        <table>
                            <thead>
	                            <tr>
									<td> 
										조회 : <span style="color:red">${allMemberCnt}</span>개
									</td>
									<td colspan="4" align="right" >
										<select id="onePageViewCnt" onchange="getGoodsList()" >
											<option value="total">전체</option>
											<option>5</option>
											<option>7</option>
											<option>10</option>
										</select>
									</td>
								</tr>
                                <tr>
                                    <th width="10%">번호</th>
                                    <th width="30%">회원아이디</th>
                                    <th width="25%">회원이름</th>
                                    <th width="15%">포인트</th>
                                    <th width="5%">성별</th>
                                    <th width="15%">가입일자</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty memberList}">
                            			<tr>
                            				<td colspan="6"><h3>가입된 회원이 없습니다.</h3></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="memberDTO" items="${memberList }" varStatus="i">
		                            		 <tr>
		                            		 	<td>
		                            		 		<h6>${i.count }</h6>
			                                    </td>
                                    			<td class="cart__product__item">
			                                        <h6><a href="${contextPath }/myPage/myInfo?memberId=${memberDTO.memberId}">${memberDTO.memberId} </a></h6>
			                                    </td>
			                                	<td class="cart__product__item__title"><strong>${memberDTO.memberNm }</strong></td>
			                                	<td class="cart__total"><fmt:formatNumber value="${memberDTO.point }"/> P</td>
			                                    <td>${memberDTO.sex }</td>
			                                    <td><fmt:formatDate value="${memberDTO.joinDt }" pattern="yyyy-MM-dd"/> </td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            	<tr>
									<td colspan="5" align="center">			
										<select id="searchKeyword">
											<option value="total">전체검색</option>
											<option value="memberNm">회원명</option>
											<option value="memberId">회원아이디</option>
										</select>
										<input type="text" id="searchWord" name="searchWord" value="${searchWord }">
										<input type="button" value="검색" onclick="getMemberList()">
									</td>
								</tr>
                            </tbody>
                        </table>
                        <div style="display: table; margin-left: auto; margin-right: auto">
							<c:if test="${startPage > 3}">
								<a href="${contextPath }/admin/member/adminMemberList?currentPageNumber=${startPage - 3}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}" >이전 </a> 
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<a href="${contextPath }/admin/member/adminMemberList?currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}">${i } &nbsp;</a>
							</c:forEach>
							<c:if test="${endPage != allPageCnt && endPage >= 3}">
								<a href="${contextPath }/admin/member/adminMemberList?currentPageNumber=${startPage + 3}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}"> 다음 </a>
							</c:if>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Cart Section End -->
</body>
</html>