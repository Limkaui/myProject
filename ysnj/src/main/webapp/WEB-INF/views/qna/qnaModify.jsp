<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style" style="width: 80%;padding: 30px;">
	<h2 id="h_2">QNA 수정</h2>
	<form:form action="update.do" commandName="qnaVO">
		<form:hidden path="qna_num"/>
		<ul>
			<li>
				<label for="qna_title">제목</label>
				<form:input path="qna_title"/>
				<form:errors path="qna_title"/>
			</li>
			<li>
				<label for="qna_question">질문</label>
				<form:textarea path="qna_question"/>
				<form:errors path="qna_question"/>
			</li>
		</ul>    
		<div class="align-center">
			<input id="bts" type="submit" value="전송">
			<input id="bts" type="button" value="목록"
			                     onclick="location.href='list.do'">
		</div>                            
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->




