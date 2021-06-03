<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2 class="align-center">Q&A 목록</h2>
	<div class="align-right">
		<c:if test="${!empty user_num}">
		<input type="button" value="글쓰기" onclick="location.href='write.do'">
		</c:if>
	</div>
	<c:if test="${count == 0}">
	<div class="align-center">등록된 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>번호</th>
			<th>유형</th>
			<th>공개여부</th>
			<th width="400">제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="qna" items="${list}">
		<tr>
			<td>${qna.qna_num}</td>
			<td>
				<c:if test="${qna.qna_cate == 1}">숙소</c:if>
				<c:if test="${qna.qna_cate == 2}">결제</c:if>
				<c:if test="${qna.qna_cate == 3}">기타</c:if>
			</td>
			<td>
				<c:if test="${qna.qna_status == 1}">공개</c:if>
				<c:if test="${qna.qna_status == 2}">비공개</c:if>
			</td>
			<td>
				<c:if test="${empty user_num && qna.qna_status == 1}">
					<a href="detail.do?qna_num=${qna.qna_num}">${qna.qna_title}</a>
				</c:if>
				<c:if test="${empty user_num && qna.qna_status == 2}">
					${qna.qna_title}
				</c:if>
				<c:if test="${!empty user_num && qna.qna_status == 1}">
					<a href="detail.do?qna_num=${qna.qna_num}">${qna.qna_title}</a>
				</c:if>
				<c:if test="${!empty user_num && qna.qna_status == 2 && qna.mem_qnum == user_num}">
					<a href="detail.do?qna_num=${qna.qna_num}">${qna.qna_title}</a>
				</c:if>
				<c:if test="${!empty user_num && qna.qna_status == 2 && qna.mem_qnum != user_num}">
					${qna.qna_title}
				</c:if>
			</td>
			<td>${qna.mem_id}</td>
			<td>${qna.qna_qdate}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
	
</div>
<!-- 중앙 컨텐츠 끝 -->


