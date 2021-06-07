<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style" style="width: 80%;padding: 30px;">
	<h2>질문하기</h2>
	<form:form action="write.do" commandName="qnaVO">
		<ul>
			<li>
				<label for="qna_status">공개여부</label>
				<input type="radio" name="qna_status" value="1" checked="checked">공개
				<input type="radio" name="qna_status" value="2">비공개
				<form:errors path="qna_status"/>
			</li>			
			<li>
				<label for="qna_cate">유형선택</label>
				<select name="qna_cate">
					<option value="1" selected="selected">숙소</option>
					<option value="2">결제</option>
					<option value="3">기타</option>
				</select>  
				<form:errors path="qna_cate"/>
			</li>
			<li>
				<label for="qna_title">제목</label>
				<form:input path="qna_title"/>
				<form:errors path="qna_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="qna_question">질문</label><br>
				<form:textarea path="qna_question" cols="70" rows="7"/>
				<form:errors path="qna_question" cssClass="error-color"/>
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