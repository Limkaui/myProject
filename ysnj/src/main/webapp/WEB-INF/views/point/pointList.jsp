<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-main-style">
	<h2 id="h_2">포인트 관리</h2>
	<c:if test="${count == 0 }">
	<div class="align-center">포인트내역이 없습니다.</div>
	</c:if>

	<c:if test="${count > 0}">
	<table>
		<tr class="align-center">
			<th>관리번호</th>
			<th>회원ID</th>
			<th>구분</th>
			<th>금액</th>
			<th>적립/차감 내용</th>
			<th>적립/차감 날짜</th>
		</tr>
		<c:forEach var="point" items="${list}">
		<tr class="align-center">
			<td>${point.poi_num}</td>
			<td>${point.mem_id}</td>
			<td><c:if test="${point.poi_add != 0}">
							<strong style="color: blue;">적립</strong>
				</c:if>
				<c:if test="${point.poi_minus != 0}">
							<strong style="color: red;">차감</strong>
				</c:if>
			</td>
			<td><c:if test="${point.poi_add != 0}">
							<strong style="color: blue;">+${point.poi_add}</strong>P
				</c:if>
				<c:if test="${point.poi_minus != 0}">
							<strong style="color: red;">-${point.poi_minus}</strong>P
				</c:if>
			</td>
			<td><c:if test="${point.poi_add != 0}">
							<strong style="color: blue;">${point.poi_detail}</strong>
				</c:if>
				<c:if test="${point.poi_minus != 0}">
							<strong style="color: red;">${point.poi_detail}</strong>
				</c:if>
			</td>
			<td>${point.poi_date}</td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="align-center">${pagingHtml}</div>
	</c:if> 
	
	<div class="align-center">
			<input type="button" value="관리" onclick="location.href='point.do'" style="color: white;	font-family: sans-serif; background: #fd7792;border:none;font-size:15px;cursor:pointer;">
		</div>
	
</div>