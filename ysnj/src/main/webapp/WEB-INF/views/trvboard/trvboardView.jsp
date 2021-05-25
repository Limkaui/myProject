<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload=function(){
		var delete_btn = document.getElementById('delete_btn');
		//이벤트 연결
		delete_btn.onclick=function(){
			var choice = window.confirm('삭제하시겠습니까?');
			if(choice){
				location.replace('delete.do?trv_num=${trv_board.trv_num}');
			}
		};
	};	
</script>	
<div class="page-main-style">	
	<h2>${trv_board.trv_title}</h2>	
	<span>지역  | ${trv_board.trv_local}</span>	
	<hr>	
	<ul>	
		<li>회원번호: ${trv_board.trv_num}</li>	
		<li>작성자 : ${trv_board.mem_num}</li>	
		<li>분류 : ${trv_board.trv_title}</li>	
		<li>지역 : ${trv_board.trv_local}</li>	
		<li>주소 : ${trv_board.trv_place}</li>	
		<li>문의전화 : ${trv_board.trv_call}</li>
		<li>최근수정일 : ${trv_board.trv_date}</li>	
	</ul>	
	<hr size="1" width="100%">	
	<c:if test="${!empty trv_board.trv_filename1}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=1" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename2}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=2" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename3}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=3" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename4}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=4" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename5}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=5" style="max-width:500px">
	</div>
	</c:if>
	<p>
		${trv_board.trv_intro}
	</p>
	<hr size="1" width="100%">
	<div class="align-right">
		<%-- <c:if test="${!empty trv_num && user_num == trvboard.mem_num}"> --%>
		<input type="button" value="수정" onclick="location.href='update.do?trv_num=${trv_board.trv_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<%-- </c:if> --%>
		<input type="button" value="목록으로" onclick="location.href='list.do'">
	</div>
</div>

<!-- 중앙 컨텐츠 끝 -->