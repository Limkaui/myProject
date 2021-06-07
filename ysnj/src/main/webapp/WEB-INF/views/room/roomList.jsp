<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->

<div class="page-main-style">
	<h2 id="h_2">객실 목록</h2>
	<h5 class="align-center">${param.acc_name}의 객실 정보</h5>
	<form:hidden path="acc_num"/>
	<div class="align-right">	
			<input type="button" value="객실등록" onclick="location.href='write.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}'" id="bts">
	
	</div>
		<table class="align-center">
			<tr>
				<th>번호</th>
				<th width="400">이름</th>
				<th>현재 상태</th>
				<th>등록일</th>
			</tr>
		   	<c:forEach var="room" items="${roo_list}"> 
				<tr>
					<td>${room.roo_num}</td>
					<td><a href="detail.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}&roo_num=${room.roo_num}">${room.roo_name}</a></td>
					<td>
						<c:if test="${room.roo_status == 1}">
							예약 가능
						</c:if>
						<c:if test="${room.roo_status == 2}">
							예약 불가능
						</c:if>
					</td>
					<td>${room.roo_date}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="align-center">${pagingHtml}</div>


</div>
<!-- 중앙 컨텐츠 종료 -->