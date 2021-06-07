<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/review.reply.js"></script>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload=function(){
		var delete_btn = document.getElementById('delete_btn');
		//이벤트 연결
		delete_btn.onclick=function(){
			var choice = window.confirm('삭제하시겠습니까?');
			if(choice){
				location.replace('delete.do?rev_num=${review.rev_num}');
			}
		};
	}
</script>
<div class="page-main-style">
	<h2>${review.rev_title}</h2>
	<ul>
		<li>번호 : ${review.rev_num}</li>
		<li>작성자 : ${review.mem_id}</li>
		<li>조회수 : ${review.rev_hits}</li>
		<li>작성일 : ${review.rev_date}</li>
		<li>별점 :
		<c:forEach var="i" begin="1" end="${review.rev_star}">
		<img src="${pageContext.request.contextPath}/resources/image/star.png" class="rec-star">
		</c:forEach>
		</li>
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
	<div>
		<span id="output_fcount"></span> <span id="output_rcount"></span>
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		<c:if test="${!empty user_num && user_num == review.mem_num}">
		<input type="button" value="수정"
			   onclick="location.href='update.do?rev_num=${review.rev_num}'">
		<input type="button" value="삭제" id="delete_btn">
		</c:if>
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
	<hr size="1" width="100%">
	<div id="reply_div">
		<span class="reply-title">댓글 달기</span>
		<form id="re_form">
			<input type="hidden" name="rev_num"
			       value="${review.rev_num}" id="rev_num">
			<input type="hidden" name="mem_num"
			       value="${user_num}" id="mem_num">
			<textarea rows="3" cols="50"
			  name="re_content" id="re_content"
			  class="rep-content"
			  <c:if test="${empty user_num}">disabled="disabled"</c:if>
			  ><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>              
			<c:if test="${!empty user_num}">
			<div id="re_first">
				<span class="letter-count">300/300</span>
			</div>
			<div id="re_second" class="align-right">
				<input type="submit" value="입력">
			</div>
			</c:if>
		</form>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="output"></div>
	<div class="paging-button" style="display:none;">
		<input type="button" value="다음글 보기">
	</div>
	<div id="loading" style="display:none;">
		<img src="${pageContext.request.contextPath}/resources/images/ajax-loader.gif">
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->