<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>공지사항 등록</h2>
	<form:form action="write.do" commandName="noticeVO" enctype="multipart/form-data">
		<ul>
			<li>
			    <label for="not_type">분류</label>
				<form:select path="not_type">
					<form:option value="1">이벤트공지</form:option>
					<form:option value="2">이벤트발표</form:option>
					<form:option value="3">점검</form:option>
					<form:option value="4">고객공지</form:option>
				</form:select>
			</li>
			<li>
				<label for="not_title">제목</label>
				<form:input path="not_title"/>
				<form:errors path="not_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="not_upload">이미지 업로드</label>
				<input type="file" name="not_upload" id="not_upload" accept="image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for="not_content">내용</label>
				<form:textarea path="not_content"/>
				<form:errors path="not_content" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>	