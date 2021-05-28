<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<img src="${pageContext.request.contextPath}/resources/trv_image/trv_home.JPG" style="max-width:800px">
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2 class="align-center">여행지 추천 글 목록</h2>
	
	
	<div class="align-right">
			<a href="http://localhost:8080/ysnj/main/main.do"><img src="${pageContext.request.contextPath}/resources/trv_image/home.JPG" style="max-width:40px" align="left"></a>	
			<a href="https://www.facebook.com/"><img src="${pageContext.request.contextPath}/resources/trv_image/fb.png" style="max-width:35px"></a>
			<a href="https://www.instagram.com/accounts/login/"><img src="${pageContext.request.contextPath}/resources/trv_image/ig.png" style="max-width:40px"></a>
			<a href="https://accounts.google.com/ServiceLogin"><img src="${pageContext.request.contextPath}/resources/trv_image/yt.png" style="max-width:42px"></a>
	</div>
	<hr>
	<br>
	<a>Page ${pagingHtml}</a>
	<div class="align-right">
	    <form action="list.do" method="get" id="search_form">
			<select name="keyfield" id="trv_cate">
				<option value="1">관광지</option>
				<option value="2">박물관</option>
				<option value="3">맛집</option>
			</select>
	        <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
	        <input type="submit" value="검색">
        </form>
	</div>
	<hr>
	<div>
		<span><a href="">오래된순</a> |</span><span><a href=""> 가나다순</a></span>
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
						<a href="detail.do?board_num=${trvboard.trv_num}"><img src="imageView.do?trv_num=${trvboard.trv_num}&trv_idx=1" style="max-width:180px;max-height:100px"></a>
					</div>
				</c:if>
				<div class="align-center"><a href="detail.do?board_num=${trvboard.trv_num}">${trvboard.trv_title}</a></div>
				<div class="align-center"><a href="detail.do?board_num=${trvboard.trv_num}">${trvboard.trv_intro}</a></div>
				<div class="align-center"><a href="detail.do?board_num=${trvboard.trv_num}">${trvboard.trv_local}</a></div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div class="align-center">${pagingHtml}</div>
		<hr>
	</c:if>
</div>

<!-- 중앙 컨텐츠 끝 -->