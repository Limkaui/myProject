<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>리뷰 목록</h2>
	<div class="align-right">
		<c:if test="${!empty user_num}">
		<input type="button" value="글쓰기" onclick="location.href='write.do'">
		</c:if>
	</div>
	<hr>
	<c:if test="${count == 0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>번호</th>
			<th width="400">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="review" items="${list}">
		<tr>
			<td>${review.rev_num}</td>
			<td><a href="detail.do?rev_num=${review.rev_num}">${review.rev_title}</a></td>
			<td>${review.mem_id}</td>
			<td>${review.rev_date}</td>
			<td>${review.rev_hits}</td>
		</tr>
		</c:forEach>
	</table>
	<hr>
	<div class="align-center">${pagingHtml}
	<form action="list.do" method="get" id="search_form">
		<select name="search_type" id="search_type">
			<option value="1">제목</option>
			<option value="2">작성자</option>
			<option value="3">전체</option>
		</select>
	        <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
	        <input type="submit" value="검색">
        </form>
        </div>
	</c:if>
</div>
<!-- 중앙 컨텐츠 끝 -->
