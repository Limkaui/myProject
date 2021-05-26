<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		</c:if>
		<li>계좌번호 : ${member.mem_account}</li>
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
</div>
<!-- 중앙 컨텐츠 끝 -->