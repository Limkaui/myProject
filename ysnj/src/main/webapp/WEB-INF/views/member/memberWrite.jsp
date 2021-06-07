<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<div class="page-main-style">
	<h2 id="h_2">회원가입</h2>
	<form:form action="registerChoice.do" id="register_choice" commandName="memberVO">
		<div class="align-center" id="bts_view">
		<input type="button" value="개인 회원가입"
					onclick="location.href='${pageContext.request.contextPath}/member/memberCustomer.do'">
		<input type="button" value="사업자 회원가입"
					onclick="location.href='${pageContext.request.contextPath}/member/memberSeller.do'">
		</div>
	</form:form>
</div>