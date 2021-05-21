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
				location.replace('delete.do?acc_num=${accommdation.acc_num}');
			}
		};
	};
</script>
<div class="page-main-style">
	<h2>${accommdation.acc_name} 정보 조회</h2>
	<ul>
		<li>번호 : ${accommdation.acc_num}</li>
		<li>카테고리 :
			<c:choose>
				<c:when test="${accommdation.acc_category eq 1}">
					호텔
				</c:when>
				<c:when test="${accommdation.acc_category eq 2}">
					모텔
				</c:when>
				<c:when test="${accommdation.acc_category eq 3}">
					게스트하우스
				</c:when>
			</c:choose> 
		</li>
		<li>숙소명 : ${accommdation.acc_name }</li>
		<li>전화번호 : ${accommdation.acc_tel}</li>
		<li>체크인 : ${accommdation.acc_checkin}</li>
		<li>체크아웃 : ${accommdation.acc_checkout}</li>
		<li>주소 : ${accommdation.acc_address}</li>
		<li>예약 가능 여부 :
			<c:if test="${accommdation.acc_status == 1}">
				예약 가능
			</c:if>
			<c:if test="${accommdation.acc_status == 2}">
				예약 불가능
			</c:if>
		</li>
		<li>설명 : ${accommdation.acc_guide}</li>
		<li>편의시설 : ${accommdation.acc_amenity}</li>	
	</ul>
	<!-- 이미지 조회 삽입 -->
	
	
	<!-- 수정& 삭제 버튼 -->
	<div class="align-center">
		<input type="button" value="수정" onclick="location.href='update.do?acc_num=${accommdation.acc_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->


