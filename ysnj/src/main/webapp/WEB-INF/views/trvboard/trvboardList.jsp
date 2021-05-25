<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>여행지 추천 글 목록</h2>
	<div class="align-right">
		<%-- <c:if test="${!empty user_num}"> --%>
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
		<%-- </c:if> --%>
	</div>
	<c:if test="${count==0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th width="400">소개글</th>
			<th>지역</th>
			<th>수정일</th>
			<th>작성자</th>
		</tr>
		<c:forEach var="trvboard" items="${list}">
		<tr>
			<td>${trvboard.trv_num}</td>
			<td><a href="detail.do?board_num=${trvboard.trv_num}">${trvboard.trv_title}</a></td>
			<td>${trvboard.trv_intro}</td>
			<td>${trvboard.trv_local}</td>
			<td>${trvboard.trv_date}</td>
			<td>${trvboard.mem_num}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>

<!-- 중앙 컨텐츠 끝 -->