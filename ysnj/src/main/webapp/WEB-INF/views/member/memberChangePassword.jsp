<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2 id="h_2">비밀번호 변경</h2>
	<form:form action="changePassword.do" commandName="memberVO">
		<ul>
			<li>
				<label for="now_passwd">현재 비밀번호</label>
				<form:password path="now_passwd"/>
				<form:errors path="now_passwd" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_pw">변경할 비밀번호</label>
				<form:password path="mem_pw"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center" id="bts_view">
			<input type="submit" value="전송">
			<input type="button" value="MyPage"
			                onclick="location.href='myPage.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->