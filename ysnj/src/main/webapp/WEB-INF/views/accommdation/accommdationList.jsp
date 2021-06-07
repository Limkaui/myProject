<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2 id="h_2">숙소 목록</h2>
	<div class="align-right">
			<input type="button" value="숙소등록" onclick="location.href='write.do'"  id="bts">
	</div>
		<table class="align-center">
			<tr>
				<th>번호</th>
				<th width="400">이름</th>
				<th>현재 상태</th>
				<th>등록일</th>
				<th>객실정보</th>
			</tr>
		   	<c:forEach var="accommdation" items="${acc_list}"> 
				<tr>
					<td>${accommdation.acc_num}</td>
					<td><a href="detail.do?acc_num=${accommdation.acc_num}">${accommdation.acc_name}</a></td>
					<td>
						<c:if test="${accommdation.acc_status == 1}">
							예약 가능
						</c:if>
						<c:if test="${accommdation.acc_status == 2}">
							예약 불가능
						</c:if>
					</td>
					<td>${accommdation.acc_date}</td>
					<td><a href="room/list.do?acc_num=${accommdation.acc_num}&acc_name=${accommdation.acc_name}">객실정보</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>
	<%-- </c:if> --%>
</div>
<!-- 중앙 컨텐츠 끝 -->