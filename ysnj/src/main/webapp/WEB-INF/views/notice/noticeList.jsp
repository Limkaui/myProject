<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<style type ="text/css">
	td{
		text-align:center;
	}
	#td_title{
		text-align:left;
	}
</style>
<div class="page-main-style">
	<h2>공 지 사 항</h2>
	<div class="align-left">
		<input type="button" id="button" name="button" value="이벤트공지">
		<input type="button" id="button" name="button" value="이벤트발표">
		<input type="button" id="button" name="button" value="점검">
		<input type="button" id="button" name="button" value="고객공지">
		<%-- <c:if test="${mem_type == 4}"> --%>
		<input type="button" value="글쓰기" onclick="location.href='write.do'" style="float: right;">
		<%-- </c:if> --%>
	</div>
	<c:if test="${count == 0}">
	<div>등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th width="500">제목</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="notice" items="${list}">
		<tr>
			<td>${notice.not_num}</td>
			<td>
			<c:if test="${notice.not_type == 1}">이벤트공지</c:if>
			<c:if test="${notice.not_type == 2}">이벤트발표</c:if>
			<c:if test="${notice.not_type == 3}">점검</c:if>
			<c:if test="${notice.not_type == 4}">고객공지</c:if>
			</td>
			<td id="td_title"><a href="detail.do?not_num=${notice.not_num}">${notice.not_title}</a></td>
			<td>${notice.not_date}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>
<!-- 중앙 컨텐츠 시작 -->