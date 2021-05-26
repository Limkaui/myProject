<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>약관 동의</h2>
	<form:form action="agreement.do" commanName="memberVO">
		<ul>
			<li>
				<label>필수 동의 항목</label>
				<form:checkbox path="" value="여기서 놀자 이용 약관"/>여기서 놀자 이용 약관
				<form:checkbox path="" value="전자금융거래 이용약관"/>전자금융거래 이용약관
				<form:checkbox path="" value="개인정보 수집동의서"/>개인정보 수집동의서
			</li>
			<li>
				<label>선택 동의 항목</label>
				<form:checkbox path="" value="마케팅 목적 개인정보 수집동의서"/>마케팅 목적 개인정보 수집동의서
				<form:checkbox path="" value="위치기반 서비스 이용약관"/>위치기반 서비스 이용약관
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="다음으로" onClick="location.href='${pageContext.request.contextPath}/member/memberRegisterCustomer.do'" >
			<input type="button" value="홈으로" onclick="location.href='main.do'">
		</div>
	</form:form>
</div>