<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>회원 상세 정보</h2>
	<ul>
		<li>이름 : ${member.mem_name}</li>
		<c:if test="${member.mem_type == 2}">
		<li>생년월일 : ${member.mem_birth}</li>
		</c:if>
		<c:if test="${member.mem_type == 3}">
		<li>사업자 등록번호 : ${member.mem_conum}</li>
		<li>계좌번호 : ${member.mem_account}</li>
		</c:if>
		<li>전화번호 : ${memeber.mem_cell}</li>
		<li>이메일 : ${member.mem_email}</li>
		<li>우편번호 : ${member.mem_zipcode}</li>
		<li>주소 : ${member.mem_address1} ${member.mem_address2}</li>
		<li>가입 날짜 : ${member.mem_date}</li>
		<li>정보 수정 날짜 : ${member.mem_modify}</li>
	</ul>
	<hr size="1" width="100%">
	<p class="align-right">
		<input type="button" value="수정"
			onclick="location.href='update.do'">
		<input type="button" value="비밀번호 변경"
			onclick="location.href='changePassword.do'">
		<input type="button" value="회원탈퇴"
			onclick="location.href='delete.do'">
	</p>	
	<hr size="1" width="100%">
	<!-- 숙소 찜 목록 -->
	<h3>내가 찜한 목록</h3>
	<table>
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
	<!-- 예약 관리 목록 -->
	<h3>예약 목록</h3>
	<table>
		<tr>
			<th>예약번호</th>
			<th width="400">숙소이름</th>
			<th>예약날짜</th>
			<th>예약상태</th>
		</tr>
		
		<c:forEach var="reserve_list" items="${rsv_list}">
		<tr>
			<td>${reserve_list.rsv_num}</td>
			<td><a href="../reserve/detail.do?rsv_num=${reserve_list.rsv_num}">${reserve_list.acc_name}</a></td>
			<td>${reserve_list.rsv_date}</td>
			<td> <c:if test="${reserve_list.rsv_state == 1}">
							예약대기
				 </c:if>
				<c:if test="${reserve_list.rsv_state == 2}">
							예약확정
				 </c:if>
				<c:if test="${reserve_list.rsv_state == 3}">
							예약취소
				 </c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
<!-- 중앙 컨텐츠 끝 -->