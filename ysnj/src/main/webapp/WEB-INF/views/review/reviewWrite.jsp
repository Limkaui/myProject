<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>리뷰 작성</h2>
	<form:form action="write.do" commandName="reviewVO"  enctype="multipart/form-data">
		<input type="hidden" name="acc_num" value="1">
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
				<label for="upload">이미지 파일 업로드</label>
				<input type="file" name="upload" id="upload"
				                  accept="image/gif,image/png,image/jpeg">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록"
			               onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->