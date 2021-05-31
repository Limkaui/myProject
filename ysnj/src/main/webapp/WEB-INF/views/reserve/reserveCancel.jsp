<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>${acc.acc_name} 예약 취소</h2>
	<form:form action="cancel.do" commandName="reserveVO" enctype="multipart/form-data">
		<form:hidden path="rsv_num" value="${reserve.rsv_num}"/>
		<form:hidden path="rsv_state" value="3"/>
		<ul>
			<li>예약번호 : ${reserve.rsv_num}</li>
			<li>객실이름 : ${room.roo_name}</li>
			<li>입실자 : ${reserve.rsv_iname}</li>
			<li>전화번호 : ${reserve.rsv_iphone}</li>
		</ul>
		<hr size="1" width="100%">
		<div class="align-center">
			<input type="submit" value="예약 취소">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>			
	</form:form>

</div>



<!--중앙 컨텐츠 종료 -->