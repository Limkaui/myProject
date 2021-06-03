<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	window.onload=function(){
		var delete_btn = document.getElementById('delete_btn');
		delete_btn.onclick=function(){
			var choice = window.confirm('취소하시겠습니까?');
			if (choice) {
				//location.replace('delete.do?board_num=${board.board_num}');
			}
		}
	}

</script>
<div class="page-main-style">
	<h2>${acc.acc_name} 예약정보</h2>
	<hr size="1" width="100%">
	<div class="align-center">
		<ul style="text-align: left;">
			<li>예약번호 : ${reserve.rsv_num}</li>
			<li>숙소이름 : ${acc.acc_name}</li>
			<li>객실이름 : ${room.roo_name}</li>
			<li>입실자 : ${reserve.rsv_iname}</li>
			<li>전화번호 : ${reserve.rsv_iphone}</li>
			<li>입실일 : ${reserve.rsv_start}</li>
			<li>가격 : ${reserve.pay_money}</li>
			<li>예약상태 : 
				<c:if test="${reserve.rsv_state == 1}">
					예약대기
				</c:if>
				<c:if test="${reserve.rsv_state == 2}">
					예약확정
				</c:if>
				<c:if test="${reserve.rsv_state == 3}">
					예약취소
				</c:if>
			</li>
		</ul>
	</div>
	<hr size="1" width="100%">
	<div class="align-center">
		<c:if test="${!empty user_num && user_num==reserve.mem_num && reserve.rsv_state!=3}">
			<input type="button" value="예약취소" onclick="location.href='cancel.do?rsv_num=${reserve.rsv_num}'">
		</c:if>
			<input type="button" value="목록" onclick="location.href='/ysnj/member/myPage.do'">
	</div>
</div>