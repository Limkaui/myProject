<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="page-main-style">

	
	<h2>포인트 적립</h2>
	<form:form action="point.do" commandName="pointVO" enctype="multipart/form-data">
		<ul>
			<li>
				<label for="mem_num">회원번호</label>
				<form:input path="mem_num"/>
			</li>
			<li>
				<label for="poi_add">포인트 적립</label>
				<form:input path="poi_add"/>
			</li>
			<li>
				<label for="poi_minus">포인트 차감</label>
				<form:input path="poi_minus"/>
			</li>
			<li>
				<label for="poi_detail">적립/차감 이유</label>
				<form:input path="poi_detail"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>