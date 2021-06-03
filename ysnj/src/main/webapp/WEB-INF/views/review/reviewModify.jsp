<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>리뷰 수정</h2>
	<form:form action="update.do" commandName="reviewVO" enctype="multipart/form-data">
		<form:hidden path="rev_num"/>
		<ul>
			<li>
			<label for="rev_title">제목</label>
			<form:input path="rev_title"/>
			<form:errors path="rev_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="rev_content">내용</label>
				<form:textarea path="rev_content"/>
				<form:errors path="rev_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="rev_upload">파일 업로드</label>
				<input type="file" name="upload" id="upload">
				<c:if test="${!empty reviewVO.rev_filename}">
				<br>
				<span>(${reviewVO.rev_filename})파일이 등록되어 있습니다.
				다시 업로드하면 기존 파일은 삭제됩니다.</span>
				</c:if>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->