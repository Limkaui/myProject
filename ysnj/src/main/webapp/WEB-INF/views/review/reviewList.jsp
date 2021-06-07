<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<style>
/*=====별점 스타일=======*/
.rating{
	/*현재 디자인에서만 필요하고 다른 디자인일 경우는 필요하지 않음*/
	display:inline-block;
	width:500px;	
}
.rating .rate-check {
	display:none;
	
}
.rating .rate-check + label {
    width: 20px;
    height: 20px;
    background-image: url('${pageContext.request.contextPath}/resources/image/star.png');
    background-repeat: no-repeat;
    background-size: 20px 20px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate-check:checked + label {
    background-color: #eb7a34;
}
.rec-star {
	width: 15px;
    height: 15px;
    background-color: #eb7a34;
}
</style>
<script type="text/javascript">
	window.onload=function(){
		var search_form = document.getElementById('search_form');
		search_form.onsubmit=function(){
			var keyword = document.getElementById('keyword');
			if(keyword.value.trim()==''){
				alert('검색어를 입력하세요');
				keyword.value = '';
				keyword.focus();
				return false;
			}
		};
	};
</script>
<div class="page-main-style">
	<h2>리뷰 목록</h2>
	<div class="align-right">
		<c:if test="${!empty user_num}">
		<input type="button" value="글쓰기" onclick="location.href='write.do'">
		</c:if>
	</div>
	<hr>
	<c:if test="${count == 0 && empty param.keyword}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count == 0 && !empty param.keyword}">
	<div class="align-center">검색된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>번호</th>
			<th>별점</th>
			<th width="400">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="review" items="${list}">
		<tr>
			<td>${review.rev_num}</td>
			<td><c:forEach var="i" begin="1" end="${review.rev_star}">
				<img src="${pageContext.request.contextPath}/resources/image/star.png" class="rec-star">
				</c:forEach></td>
			<td><a href="detail.do?rev_num=${review.rev_num}">${review.rev_title}</a></td>
			<td>${review.mem_id}</td>
			<td>${review.rev_date}</td>
			<td>${review.rev_hits}</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
	<hr>
	<div class="align-center">${pagingHtml}
	<!-- 검색기능 -->
	<form name="searchForm" method="get" action="list.do" id="search_form">
		<select name="keyfield">
			<option value="rev_title" <c:if test="${map.keyfield == 'rev_title'}">selected</c:if>>제목</option>
			<option value="mem_id" <c:if test="${map.keyfield == 'mem_id'}">selected</c:if>>작성자</option>
		</select>
	        <input type="text" name="keyword" id="keyword" value="${map.keyword}" placeholder="검색어를 입력하세요.">
	        <input type="submit" value="검색">
        </form>
        </div>
</div>
<!-- 중앙 컨텐츠 끝 -->
