<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload = function(){
		var delete_btn = document.getElementById('delete_btn');
		//이벤트 연결
		delete_btn.onclick=function(){
			var choice = window.confirm('삭제하시겠습니까?');
			if(choice){
				location.replace('delete.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}&roo_num=${roo_num}');
			}
		};
	};
</script>
<div class="page-main-style">
	<h2> 정보 조회</h2>
		<input type="hidden" name="acc_num" value="${param.acc_num}">
		<input type="hidden" name="acc_name" value="${param.acc_name}">
	<ul>
		<li>번호 : ${room.roo_num}</li>
		<li>이름 : ${room.roo_name}</li>
		<li>가격 : ${room.roo_price}</li>
		<li>상태 : <c:if test="${room.roo_status == 1}">
							예약 가능
				 </c:if>
				 <c:if test="${room.roo_status == 2}">
							예약 불가능
				 </c:if>
		</li>
		<li>설명 : ${room.roo_guide}</li>
		<li>최대 인원: ${room.roo_capacity}</li>
	</ul>
	<!-- 이미지 조회 삽입 -->
	<hr size="1" width="100%">	
	<c:if test="${!empty room.roo_filename1}">
	<div class="align-center">
		<img src="imageView.do?roo_num=${room.roo_num}&roo_idx=1" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty room.roo_filename2}">
	<div class="align-center">
		<img src="imageView.do?roo_num=${room.roo_num}&roo_idx=2" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty room.roo_filename3}">
	<div class="align-center">
		<img src="imageView.do?roo_num=${room.roo_num}&roo_idx=3" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty room.roo_filename4}">
	<div class="align-center">
		<img src="imageView.do?roo_num=${room.roo_num}&roo_idx=4" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty room.roo_filename5}">
	<div class="align-center">
		<img src="imageView.do?roo_num=${room.roo_num}&roo_idx=5" style="max-width:500px">
	</div>
	</c:if>
	<c:if test="${!empty room.roo_filename6}">
	<div class="align-center">
		<img src="imageView.do?roo_num=${room.roo_num}&roo_idx=6" style="max-width:500px">
	</div>
	</c:if>

	<div class="align-center">
		<input type="button" value="수정" onclick="location.href='update.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}&roo_num=${room.roo_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<input type="button" value="목록" onclick="location.href='list.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}'">
	</div>
</div>


<!-- 중앙 컨텐츠 종료 -->