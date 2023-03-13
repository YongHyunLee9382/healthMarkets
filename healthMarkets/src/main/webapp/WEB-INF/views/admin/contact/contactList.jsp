<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">
<script>

	function removeContact() {
		
		
		var contactCdList = "";
		if (confirm("정말로 삭제하시겠습니까?")) {
			
			$("[name='contactCd']:checked").each(function(){
				contactCdList += $(this).val() + ",";
			});
			
			if (contactCdList == "") {
				alert("삭제할 내역이 없습니다.");
				return;
			}
			
			location.href = "${contextPath}/admin/contact/removeContact?contactCdList="+contactCdList;
		}
		
	}
	
	function selectAllContact() {
		if ($("#changeAllChoice").prop("checked")) {
			$("[name='contactCd']").prop("checked" , true);
		}
		else {
			$("[name='contactCd']").prop("checked" , false);
		}
	}	
	$().ready(function(){
		
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#searchKeyword").val("${searchKeyword}");
		
	});
	
	function getContactList() {
		
		var url = "${contextPath }/admin/contact/contactList"
		    url += "?searchKeyword=" +  $("#searchKeyword").val();
		    url += "&searchWord=" + $("#searchWord").val() 
		    url += "&onePageViewCnt=" + $("#onePageViewCnt").val();
		
		location.href = url;
	
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
                        <a href="${contextPath }/"><i class="fa fa-home"></i> Admin</a>
                        <span>Contact List</span>
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
                    	<h6><input type="checkbox" id="changeAllChoice" onchange="selectAllContact()"> &nbsp;전체선택</h6>
                    	<br>
                        <table>
                            <thead>
                            	<tr>
									<td> 
										조회 : <span style="color:red">${allContactCnt}</span>개
									</td>
									<td colspan="4" align="right" >
										<select id="onePageViewCnt" onchange="getContactList()" >
											<option value="total">전체</option>
											<option>5</option>
											<option>7</option>
											<option>10</option>
										</select>
									</td>
								</tr>
                                <tr>
                                    <th width="5%"></th>
                                    <th width="40%">제목</th>
                                    <th width="20%">작성자</th>
                                    <th width="20%">메일</th>
                                    <th width="15%">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
                            		<c:when test="${empty contactList}">
                            			<tr>
                            				<td colspan="5" align="center"><h6>컨텍트 신청이 없습니다.</h6></td>
                            			</tr>
                            		</c:when>
                            		<c:otherwise>
		                            	<c:forEach var="contactDTO" items="${contactList }">
		                            		 <tr>
		                            		 	<td><input type="checkbox" name="contactCd" value="${contactDTO.contactCd }"></td>
                                    			<td class="cart__product__item">
		                                            <h6><a href="${contextPath }/admin/contact/contactDetail?contactCd=${contactDTO.contactCd}">${contactDTO.subject }</a></h6>
			                                    </td>
			                                    <td>${contactDTO.name }</td>
			                                    <td>${contactDTO.email }</td>
			                                    <td class="cart__total"><fmt:formatDate value="${contactDTO.regDt }" pattern="yyyy-MM-dd"/> </td>
			                                </tr>
		                            	</c:forEach>
                            		</c:otherwise>
                            	</c:choose>
                            	<tr>
									<td colspan="5" align="center">			
										<select id="searchKeyword">
											<option value="total">전체검색</option>
											<option value="subject">제목</option>
										</select>
										<input type="text" id="searchWord" name="searchWord" value="${searchWord }">
										<input type="button" value="검색" onclick="getContactList()">
									</td>
								</tr>
                            </tbody>
                        </table>
                        <div style="display: table; margin-left: auto; margin-right: auto">
							<c:if test="${startPage > 3}">
								<a href="${contextPath }/admin/contact/contactList?currentPageNumber=${startPage - 3}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}" >이전 </a> 
							</c:if>
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<a href="${contextPath }/admin/contact/contactList?currentPageNumber=${i }&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}">${i } &nbsp;</a>
							</c:forEach>
							<c:if test="${endPage != allPageCnt && endPage >= 3}">
								<a href="${contextPath }/admin/contact/contactList?currentPageNumber=${startPage + 3}&onePageViewCnt=${onePageViewCnt  }&searchKeyword=${searchKeyword }&searchWord=${searchWord}"> 다음 </a>
							</c:if>
						</div>
                    </div>
                </div>
            </div>
			<div class="cart__btn update__btn" align="right">
				<a href="javascript:removeContact();"><span class="icon_close"></span>컨텍트 삭제</a>
			</div>
        </div>
	</section>
    <!-- Shop Cart Section End -->
</body>
</html>