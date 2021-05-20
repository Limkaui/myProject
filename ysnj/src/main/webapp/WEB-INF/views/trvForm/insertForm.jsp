<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css" type="text/css">
</head>
<body>
<div class="page-main-style">
	<h2>글쓰기</h2>
	<form:form action="insert.do" commandName="boardVO">
		<ul>
			<li>
				<label for="p_name">장소명</label>
				<form:input path="place"/>
				<form:errors path="place" cssClass="error-color"/>
			</li>
			<li>
				<label for="writer">작성자</label>
				<form:input path="writer"/>
				<form:errors path="writer" cssClass="error-color"/>
			</li>
			<li>
				<label for="catgegory">분류</label>
				<form:options path="catgegory"/>
				<form:errors path="catgegory" cssClass="error-color"/>
			</li>
			<li>
				<label for="image">이미지</label>
				<form:password path="image"/>
				<form:errors path="image" cssClass="error-color"/>
			</li>
			<li>
				<label for="area">지역</label>
				<form:textarea path="area"/>
				<form:errors path="area" cssClass="error-color"/>
			</li>
			<li>
				<label for="address1">주소</label>
				<form:textarea path="address1"/>
				<form:errors path="address1" cssClass="error-color"/>
			</li>
			<li>
				<label for="address2">상세주소</label>
				<form:textarea path="address2"/>
				<form:errors path="address2" cssClass="error-color"/>
			</li>
			<li>
				<label for="tell">문의전화</label>
				<form:textarea path="tell"/>
				<form:errors path="tell" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
</body>
</html>