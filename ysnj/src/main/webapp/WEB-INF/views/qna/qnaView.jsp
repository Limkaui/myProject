<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload=function(){
		var delete_btn = document.getElementById('delete_btn');
		//이벤트 연결
		delete_btn.onclick=function(){
			var choice = window.confirm('삭제하시겠습니까?');
			if(choice){
				location.replace('delete.do?qna_num=${qna.qna_num}');
			}
		};
	};
</script>
<div class="page-main-style" style="width: 80%;padding: 30px;">
	<h2>${qna.qna_title}</h2>
	<ul>
		<li>번호 : ${qna.qna_num}</li>
		<li>아이디 : ${qna.mem_id}</li>
		<li>질문 : ${qna.qna_question}</li>
		<li>작성일 : ${qna.qna_qdate}</li>
	</ul>
	<c:if test="${!empty qna.qna_answer}">
		<hr size="1" width="100%">
		<h2>관리자 답변</h2>
		<ul>
			<li><p class="align-center">${qna.qna_answer}</p></li>
			<li>작성일 : ${qna.qna_adate}</li>
		</ul>
	</c:if>
	<c:if test="${empty qna.qna_answer}">
		<hr size="1" width="100%">
		<div class="align-center">관리자의 답변이 없습니다.</div>
	</c:if>
		<hr size="1" width="100%">
		<div class="align-right">
	<c:if test="${!empty user_num && user_num == qna.mem_num}">
		<input id="bts" type="button" value="수정"
		 onclick="location.href='update.do?qna_num=${qna.qna_num}'">
		<input id="delete_btn" type="button" style="color: white;
							          		 font-family: sans-serif;
								      		 background: #fd7792;
									  		 border:none;
									  		 font-size:15px;
									  		 cursor:pointer;" value="삭제">
	</c:if>
		<input id="bts" type="button" value="목록"
		                        onclick="location.href='list.do'">
	</div>
	<c:if test="${!empty user_num && user_type == 4 && empty qna.qna_answer}">
		<hr size="1" width="100%">
		<div><h2>관리자 답변</h2></div>
		<form:form action="answer.do" commandName="qnaVO">
	    <input type="hidden" name="qna_num" value="${qna.qna_num}"/>
	    <input type="hidden" name="mem_anum" value="${user_num}"/>
		<ul>
			<li>
				<label for="qna_answer">답변</label><br>
				<form:textarea path="qna_answer" cols="67" rows="10"/>
				<form:errors path="qna_answer"/>
			</li>
		</ul>
		<div class="align-center">
			<input id="bts" type="submit" value="전송">
		</div>
	</form:form>
	</c:if>

</div>
<!-- 중앙 컨텐츠 끝 -->