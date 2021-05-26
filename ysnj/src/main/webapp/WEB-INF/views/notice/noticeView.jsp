<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload=function(){
		var delete_btn = document.getElementById('delete_btn');
		//이벤트 연결
		delete_btn.onclick=function(){
			var choice = window.confirm('삭제하시겠습니까?');
			if(choice){
				location.replace('delete.do?not_num=${notice.not_num}');
			}
		};
		
		
	};
</script>
<div class="page-main-style">
	<h2>${notice.not_title}</h2>
	<ul>
		<li>번호 : ${notice.not_num}</li>
		<li>작성자 : 관리자</li>
		<li>작성일 : ${notice.not_date}</li>
	</ul>
	<hr size="1" width="100%">
	<c:if test="${fn:endsWith(notice.not_filename,'.jpg') ||
				  fn:endsWith(notice.not_filename,'.JPG') ||
				  fn:endsWith(notice.not_filename,'.gif') ||
				  fn:endsWith(notice.not_filename,'.GIF') ||
				  fn:endsWith(notice.not_filename,'.png') ||
				  fn:endsWith(notice.not_filename,'.PNG')}">
	<div class="align-center">
		<img src="imageView.do?not_num=${notice.not_num}" style="max-width:500px">
	</div>
	</c:if>
	<p>
		${notice.not_content}
	</p>
	<div class="align-right">
		<input type="button" value="수정" onclick="location.href='update.do?not_num=${notice.not_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
</div>