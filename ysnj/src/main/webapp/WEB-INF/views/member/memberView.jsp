<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2 id="h_2">회원 상세 정보</h2>
	<ul>
		<li>이름 : ${member.mem_name}</li>
		<c:if test="${member.mem_type == 2}">
		<li>생년월일 : ${member.mem_birth}</li>
		</c:if>
		<c:if test="${member.mem_type == 3}">
		<li>사업자 등록번호 : ${member.mem_conum}</li>
		<li>계좌번호 : ${member.mem_account}</li>
		</c:if>
		<li>전화번호 : ${member.mem_cell}</li>
		<li>이메일 : ${member.mem_email}</li>
		<li>우편번호 : ${member.mem_zipcode}</li>
		<li>주소 : ${member.mem_address1} ${member.mem_address2}</li>
		<li>가입 날짜 : ${member.mem_date}</li>
	</ul>
	<hr size="1" width="100%">
	<p class="align-right" id="bts_view">
		<input type="button" value="수정"
			onclick="location.href='update.do'">
		<input type="button" value="비밀번호 변경"
			onclick="location.href='changePassword.do'">
		<input type="button" value="회원탈퇴"
			onclick="location.href='delete.do'">
	</p>	
	
	<hr size="1" width="100%">
	<!-- 포인트 관리 목록 -->
	<h3>포인트 적립/차감 내역</h3>
	<h4>보유 포인트 : ${totalpoi}P</h4>
	<table>
		<tr class="align-center">
			<th>구분</th>
			<th>금액</th>
			<th>적립/차감 내용</th>
			<th>적립/차감 날짜</th>
		</tr>
		<c:forEach var="point" items="${poi_list}">
		<tr class="align-center">
			<td><c:if test="${point.poi_add != 0}">
							<strong style="color: blue;">적립</strong>
				</c:if>
				<c:if test="${point.poi_minus != 0}">
							<strong style="color: red;">차감</strong>
				</c:if>
			</td>
			<td><c:if test="${point.poi_add != 0}">
							<strong style="color: blue;">+${point.poi_add}</strong>P
				</c:if>
				<c:if test="${point.poi_minus != 0}">
							<strong style="color: red;">-${point.poi_minus}</strong>P
				</c:if>
			</td>
			<td><c:if test="${point.poi_add != 0}">
							<strong style="color: blue;">${point.poi_detail}</strong>
				</c:if>
				<c:if test="${point.poi_minus != 0}">
							<strong style="color: red;">${point.poi_detail}</strong>
				</c:if>
			</td>
			<td>${point.poi_date}</td>
		</tr>
		</c:forEach>
	</table>
	
	<hr size="1" width="100%">
	<!-- 숙소 찜 목록 -->
	<h3>내가 찜한 목록</h3>
	<table class="align-center">
		<tr>
			<th>숙소명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>찜 등록일</th> 
		</tr>
		
		<c:forEach var="member" items="${acf_list}">
			<tr>
				<td><a href="../accommdation/acc_list/detail.do?acc_num=${member.acc_num}">${member.acc_name}</a></td>
				<td>${member.acc_tel}</td>
				<td>${member.acc_address}</td>
				<td>${member.acf_date}</td>
			</tr>
		</c:forEach> 
	</table>
	
	<hr size="1" width="100%">
	<!-- 예약 관리 목록 -->
	<h3>예약 목록</h3> 
	<table>
		<tr class="align-center">
			<th>숙소명</th>
			<th>예약날짜</th>
			<th>예약상태</th>
		</tr>
		
		<c:forEach var="reserve_list" items="${rsv_list}">
		<tr class="align-center">
			<td><a href="../reserve/detail.do?rsv_num=${reserve_list.rsv_num}">${reserve_list.acc_name}</a></td>
			<td>${reserve_list.rsv_date}</td>
			<td> <c:if test="${reserve_list.rsv_state == 1}">
							예약대기
				 </c:if>
				<c:if test="${reserve_list.rsv_state == 2}">
							<strong style="color: blue;">예약확정</strong>
				 </c:if>
				<c:if test="${reserve_list.rsv_state == 3}">
							<strong style="color: red;">예약취소</strong>
				 </c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<hr size="1" width="100%">
	<!-- 결제 목록 -->
	<h3>결제 목록</h3>
	<table>
		<tr class="align-center">
			<th>예약숙소</th>
			<th>결제금액</th>
			<th>결제수단</th>
			<th>결제상태</th>
			<th>결제일</th>
		</tr>
		
		<c:forEach var="pay_list" items="${pay_list}">
		<tr class="align-center">
			<td><a href="../reserve/detail.do?rsv_num=${pay_list.rsv_num}">${pay_list.acc_name}</a></td>
			<td>${pay_list.pay_money}</td>
			<td> <c:if test="${pay_list.pay_kind == 1}">
							카카오페이
				 </c:if>
				<c:if test="${pay_list.pay_kind == 2}">
							무통장입금
				 </c:if>
				<c:if test="${pay_list.pay_kind == 3}">
							포인트결제
				 </c:if>
			</td>
			<td> <c:if test="${pay_list.pay_state == 0}">
							입금대기
				 </c:if>
				<c:if test="${pay_list.pay_state == 1}">
							<strong style="color: blue;">결제완료</strong>
				 </c:if>
				<c:if test="${pay_list.pay_state == 2}">
							<strong style="color: red;">결제취소</strong>
				 </c:if>
			</td>
			<td>${pay_list.pay_date}</td>
		</tr>
		</c:forEach>
	</table>
	
</div>
<!-- 중앙 컨텐츠 끝 -->
