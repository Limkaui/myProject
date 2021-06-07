<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2 id="h_2">회원 로그인</h2>
	<form:form action="login.do" commandName="memberVO">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<label for="mem_id">아이디</label>
				<form:input path="mem_id"/>
				<form:errors path="mem_id" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_pw">비밀번호</label>
				<form:password path="mem_pw"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center" id="bts_view">
			<input type="submit" value="로그인">
			<input type="button" value="홈으로"
						onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			<input type="button" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/registerUser.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->