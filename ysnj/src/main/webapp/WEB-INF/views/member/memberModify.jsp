<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>회원 정보 수정</h2>
	<form:form action="update.do" commandName="memberVO">
		<ul>
			<li>
				<label for="mem_name">이름</label>
				<form:input path="mem_name"/>
				<form:errors path="mem_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_cell">전화번호</label>
				<form:input path="mem_cell"/>
				<form:errors path="mem_cell" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_email">이메일</label>
				<form:input path="mem_email"/>
				<form:errors path="mem_email" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_zipcode">우편번호</label>
				<form:input path="mem_zipcode"/>
				<form:errors path="mem_zipcode" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_address1">주소</label>
				<form:input path="mem_address1"/>
				<form:errors path="mem_address1" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_address2">상세주소</label>
				<form:input path="mem_address2"/>
				<form:errors path="mem_address2" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="MyPage"
			                 onclick="location.href='myPage.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->