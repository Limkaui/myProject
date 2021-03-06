<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<style type ="text/css">
	th,td{
		text-align:center;
	}
	#td_title{
		text-align:left;
	}
	.page-main-style{
		width: 80%;
		padding: 30px;
	}
</style> 
<div class="page-main-style">
	<h2 id="h_2">공 지 사 항</h2>
	<div class="align-left">
	<input type="button" id="bts" name="button" value="전체" onclick="location.href='list.do'">
		<input type="button" id="bts" name="button" value="이벤트공지" onclick="location.href='list.do?not_type=1'">
		<input type="button" id="bts" name="button" value="이벤트발표" onclick="location.href='list.do?not_type=2'">
		<input type="button" id="bts" name="button" value="점검" onclick="location.href='list.do?not_type=3'">
		<input type="button" id="bts" name="button" value="고객공지" onclick="location.href='list.do?not_type=4'">
		<c:if test="${user_type == 4}">
		<input type="button" id="bts" value="글쓰기" onclick="location.href='write.do'" style="float: right;">
		</c:if>
	</div>
	<c:if test="${count == 0}">
	<div>등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th width="80">번호</th>
			<th>분류</th>
			<th width="820">제목</th>
			<th width="150">등록일</th>
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