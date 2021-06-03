<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<br>
	<div class="align-right">
			<a href="http://localhost:8080/ysnj/main/main.do"><img src="${pageContext.request.contextPath}/resources/trv_image/home.png" style="max-width:40px" align="left"></a>	
			<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/trv_image/facebook.png" style="max-width:40px"></a>
			<a href="https://www.instagram.com/accounts/login/"><img src="${pageContext.request.contextPath}/resources/trv_image/instagram.png" style="max-width:40px"></a>
			<a href="https://accounts.kakao.com/login?continue=https%3A%2F%2Faccounts.kakao.com%2Fweblogin%2Faccount%2Finfo"><img src="${pageContext.request.contextPath}/resources/trv_image/kakao.png" style="max-width:40px"></a>
	</div>
	<hr>
	<br>
	<br>
	<div class="align-center">
	<h2 class="align-center">여행지 추천 글 목록</h2>
	<span>관광지, 음식점, 박물관 등 여행지를 골라 보세요</span>
	</div>
	
	
	<br>
	<div class="align-right">
	    <form action="list.do" method="get" id="search_form">
	    <a>Page ${pagingHtml}</a>
			<select name="keyfield" id="trv_cate">
				<option value="1">제목</option>
				<option value="2">소개글</option>
				<option value="3">전체</option>
			</select>
	        <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
	        <input type="submit" value="검색">
        </form>
	</div>
	<hr>
	<div>
		<button onclick="location.href='list.do?trv_cate=1'" <c:if test="${trv_cate == 1}">disabled="disabled"</c:if>>관광지</button>
		<button onclick="location.href='list.do?trv_cate=2'" <c:if test="${trv_cate == 2}">disabled="disabled"</c:if>>맛집</button>
		<button onclick="location.href='list.do?trv_cate=3'" <c:if test="${trv_cate == 3}">disabled="disabled"</c:if>>박물관</button>
	</div>
	<div class="align-right">
		<%-- <c:if test="${!empty user_num}"> --%>
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
		<%-- </c:if> --%>
	</div>
	<c:if test="${count==0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<div id="wrap">
		<ul>
		    <c:forEach var="trvboard" items="${list}">
			<li class="item">
				<c:if test="${!empty trvboard.trv_filename1}">
					<div class="align-center">
						<a href="detail.do?board_num=${trvboard.trv_num}"><img src="imageView.do?trv_num=${trvboard.trv_num}&trv_idx=1" style="width:260px;max-height:150px"></a>
					</div>
					<br>
				</c:if>
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}">[${trvboard.trv_title}]</a></div><br>
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}">
				<c:if test="${fn:length(trvboard.trv_intro)>40}">
					${fn:substring(trvboard.trv_intro,0,40)}...
				</c:if>
				<c:if test="${fn:length(trvboard.trv_intro)<=40}">
					${trvboard.trv_intro}
				</c:if>
				</a></div>
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}">지역 | ${trvboard.trv_local}</a></div>
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}">
				<c:if test="${trv_cate == 1}">관광지</c:if>
				<c:if test="${trv_cate == 2}">맛집</c:if>
		        <c:if test="${trv_cate == 3}">박물관</c:if>
				</a></div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div class="align-center">${pagingHtml}</div>
		<hr>
	</c:if>
</div>

<!-- 중앙 컨텐츠 끝 -->