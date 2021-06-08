<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var checkId = 0;
		
		//아이디 중복 체크
		$('#confirmId').click(function(){
			if($('#mem_id').val().trim()==''){
				$('#message_id').css('color','red').text('아이디를 입력하세요!');
				$('#id').focus();
				return;
			}
			
			//메시지 초기화
			$('#message_id').text('');
			
			//AJAX 통신
			$.ajax({
				url:'confirmId.do',
				type:'post',
				data:{id:$('#mem_id').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'idNotFound'){//아이디 미중복
						$('#message_id').css('color','#000').text('등록 가능 ID');
						checkId = 1;
					}else if(param.result == 'idDuplicated'){//아이디 중복
						$('#message_id').css('color','red').text('중복된 ID');
						$('#id').val('').focus();
						checkId = 0;
					}else if(param.result == 'notMatchPattern'){
						$('#message_id').css('color','red')
						                .text('영문,숫자 4자이상 12자이하 입력!');
						$('#id').val('').focus();
						checkId = 0;
					}else{
						checkId = 0;
						alert('ID중복체크 오류');
					}
				},
				error:function(){
					checkId = 0;
					alert('네트워크 오류 발생');
				}
			});
		});
		
		//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#id').keydown(function(){
			checkId=0;
			$('#message_id').text('');
		});
		
		//submit 이벤트 발생시 아이디 중복 체크 여부 확인
		$('#register_form').submit(function(){
			if(checkId==0){
				$('#message_id').css('color','red').text('아이디 중복 체크 필수!');
				if($('#id').val().trim()==''){
					$('#id').focus();
				}
				return false;
			}
		});
		
	});
</script>
<div class="page-main-style">
	<h2 id="h_2">판매자 회원가입</h2>
	<form:form action="memberRegister.do" id="register_form"
										commandName="memberVO">
		<input type="hidden" name="mem_type" value="3">	
		<ul>
			<li>
				<label for="mem_id">아이디</label>
				<form:input path="mem_id"/>  
				<input type="button" id="confirmId" value="ID중복체크"
				style="color: white;font-family: sans-serif;background: #fd7792;
				border:none;font-size:15px;margin:1px;cursor:pointer;">
				<span id="message_id"></span>
				<form:errors path="mem_id" cssClass="error-color"/>
			</li> 
			<li>
				<label for="mem_pw">비밀번호</label>
				<form:password path="mem_pw"/>
				<form:errors path="mem_pw" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_name">이름</label>
				<form:input path="mem_name"/>
				<form:errors path="mem_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_cell">전화번호</label>
				<form:input path="mem_cell"/>
				<form:errors path="mem_cell" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_conum">사업자 번호</label>
				<form:input path="mem_conum"/>
				<form:errors path="mem_conum" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_account">계좌</label>
				<form:input path="mem_account"/>
				<form:errors path="mem_account" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_email">이메일</label>
				<form:input path="mem_email"/>
				<form:errors path="mem_email" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_zipcode">우편번호</label>
				<form:input path="mem_zipcode"/>
				<form:errors path="mem_zipcode" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_address1">주소</label>
				<form:input path="mem_address1"/>
				<form:errors path="mem_address1" cssClass="error-color"/>
			</li>
			<li>
				<label for="mem_address2">상세주소</label>
				<form:input path="mem_address2"/>
				<form:errors path="mem_address2" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center" id="bts_view">
			<input type="submit" value="전송">
			<input type="button" value="홈으로"
			onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->