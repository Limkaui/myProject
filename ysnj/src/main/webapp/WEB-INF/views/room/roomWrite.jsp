<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!-- 중앙컨텐츠 시작 -->

<div class="page-main-style">
	<h2>객실 정보 등록</h2>
	
	<h5>${param.acc_name}의 객실 정보</h5>
	<form:form action="write.do" commandName="roomVO" enctype="multipart/form-data">
		<input type="hidden" name="acc_num" value="${param.acc_num}">
		<input type="hidden" name="acc_name" value="${param.acc_name}">
		<ul>		
			<li>
				<label for="roo_name">객실 이름</label>
				<form:input path="roo_name"/>
				<form:errors path="roo_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="roo_price">객실 가격</label>
				<form:input path="roo_price"/>
				<form:errors path="roo_price" cssClass="error-color"/>
			</li>
			<li>
				<label for="roo_status">객실 숙박 가능 여부</label>
				<form:radiobutton path="roo_status" value="1"/>가능
				<form:radiobutton path="roo_status" value="2"/>불가능
			</li>
			<li>
				<label for="roo_guide">객실 설명</label>
				<form:textarea path="roo_guide"/>
				<form:errors path="roo_guide" cssClass="error-color"/>
			</li>
			<li>
				<label for="roo_capacity">객실 최대 수용 인원</label>
				<form:input path="roo_capacity"/>
				<form:errors path="roo_capacity" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='list.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}'"> 		
		</div>
	</form:form>
</div>


<!-- 중앙 컨텐츠 종료 -->