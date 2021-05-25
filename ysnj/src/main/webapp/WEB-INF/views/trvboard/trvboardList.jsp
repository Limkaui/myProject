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
	<div id="wrap">
		<ul>
		    <c:forEach var="trvboard" items="${list}">
			<li class="item">
				<c:if test="${!empty trvboard.trv_filename1}">
					<div class="align-center">
						<a href="detail.do?board_num=${trvboard.trv_num}"><img src="imageView.do?trv_num=${trvboard.trv_num}&trv_idx=1" style="max-width:180px"></a>
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
	</c:if>
</div>

<!-- 중앙 컨텐츠 끝 -->