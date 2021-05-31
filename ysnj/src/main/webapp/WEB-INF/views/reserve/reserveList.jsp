<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-main-style">
	<h2>예약 내역</h2>
	<c:if test="${count == 0 }">
	<div class="align-center">예약내역이 없습니다.</div>
	</c:if>

	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>예약번호</th>
			<th width="400">숙소이름</th>
			<th>예약날짜</th>
			<th>예약상태</th>
		</tr>
		<c:forEach var="reserve" items="${list}">
		<tr>
			<td>${reserve.rsv_num}</td>
			<td><a href="detail.do?rsv_num=${reserve.rsv_num}">${reserve.acc_name}</a></td>
			<td>${reserve.rsv_date}</td>
			<td> <c:if test="${reserve.rsv_state == 1}">
							예약대기
				 </c:if>
				<c:if test="${reserve.rsv_state == 2}">
							예약확정
				 </c:if>
				<c:if test="${reserve.rsv_state == 3}">
							예약취소
				 </c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if> 
	
	
</div>