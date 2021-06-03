<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>${review.rev_title}</h2>
	<ul>
		<li>번호 : ${review.rev_num}</li>
		<li>작성자 : ${review.mem_id}</li>
		<li>조회수 : ${review.rev_hits}</li>
		<li>작성일 : ${review.rev_date}</li>
	</ul>
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(review.rev_filename,'.jpg') ||
	              fn:endsWith(review.rev_filename,'.JPG') ||
	              fn:endsWith(review.rev_filename,'.gif') ||
	              fn:endsWith(review.rev_filename,'.GIF') ||
	              fn:endsWith(review.rev_filename,'.png') ||
	              fn:endsWith(review.rev_filename,'.PNG') ||
	              fn:endsWith(review.rev_filename,'.jfif') ||
	              fn:endsWith(review.rev_filename,'.JFIF')}">
	<div class="align-center">
		<img src="imageView.do?rev_num=${review.rev_num}" style="max-width:500px">
	</div>
	</c:if>
	<p>
		${review.rev_content}
	</p>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${!empty user_num && user_num == review.mem_num}">
		<input type="button" value="수정"
			   onclick="location.href='update.do?rev_num=${review.rev_num}'">
		<input type="button" value="삭제"
			   onclick="location.href='delete.do?rev_num=${review.rev_num}'">
		</c:if>
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->