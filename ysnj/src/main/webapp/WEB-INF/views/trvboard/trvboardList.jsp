<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<br>
	<br>
	<div class="align-center">
	<h2 class="align-center" id="h_2">여행지 추천</h2><br>
	<span>관광지, 음식점, 박물관 등 여행지를 골라 보세요</span>
	</div>
	
	
	<br>
	<div class="align-right">
	    <form action="list.do" method="get">
	    <a>Page ${pagingHtml}</a>
			<select name="keyfield" id="trv_cate">
				<option value="1">제목</option>
				<option value="2">소개글</option>
				<option value="3">전체</option>
			</select>
	        <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요." style="color: #fd7792;">
	        <span id="bts_view"><input type="submit" value="검색"></span>
        </form>
	</div>
	<hr>
	<div id="bts">
		<button onclick="location.href='list.do?trv_cate=1'" <c:if test="${trv_cate == 1}">disabled="disabled"</c:if>>관광지</button>
		<button onclick="location.href='list.do?trv_cate=2'" <c:if test="${trv_cate == 2}">disabled="disabled"</c:if>>박물관</button>
		<button onclick="location.href='list.do?trv_cate=3'" <c:if test="${trv_cate == 3}">disabled="disabled"</c:if>>맛집</button>
		<span style="text-align:right;">
		<c:if test="${!empty user_num}">
			<input type="button" value="글쓰기" onclick="location.href='write.do'">
		</c:if>
		</span>
	</div><br>
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
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}"><span style="font-weight:bold">[${trvboard.trv_title}]</span></a></div>
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}">
				<c:if test="${fn:length(trvboard.trv_intro)>40}">
					<span style="color:gray;">${fn:substring(trvboard.trv_intro,0,40)}...</span>
				</c:if>
				<c:if test="${fn:length(trvboard.trv_intro)<=40}">
					<span style="color:gray;">${trvboard.trv_intro}</span>
				</c:if>
				</a></div>
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}"><span style="color:gray;">지역 | </span><span style="color: #fd7792;">${trvboard.trv_local}</span></a></div>
				<div class="align-left"><a href="detail.do?board_num=${trvboard.trv_num}">
				<c:if test="${trvboard.trv_cate == 1}"><span style="color:gray;">종류 | </span><span style="color: #fd7792;">관광지</span></c:if>
				<c:if test="${trvboard.trv_cate == 2}"><span style="color:gray;">종류 | </span><span style="color: #fd7792;">박물관</span></c:if>
		        <c:if test="${trvboard.trv_cate == 3}"><span style="color:gray;">종류 | </span><span style="color: #fd7792;">맛집</span></c:if>
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