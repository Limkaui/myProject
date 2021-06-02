<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	textarea{
		width:350px; 
		height:100px; 
	}
</style>
<!-- 중앙컨텐츠 시작 -->
<script type="text/javascript">
   window.onload = function(){
	   var writeFrom = document.getElementById('writeForm');
	   //이벤트 연결
	   writeForm.onsubmit = function(){
		   
		   
		   var roo_name = document.getElementById('roo_name');
		   if(roo_name.value.trim() == ''){
			   alert('객실 이름을 입력하세요');
			   roo_name.value='';
			   roo_name.focus();
			   return false;
		   }
		   var roo_price = document.getElementById('roo_price');
		   if(roo_price.value.trim() == ''){
			   alert('객실 가격을 입력하세요');
			   roo_price.value='';
			   roo_price.focus();
			   return false;
		   }

		   //객실 숙박 가능 여부 유효성 체크
		   var roo_statu = document.getElementsByClassName('roo-sta');
		   var check = false;
		   for(var i=0; i<roo_statu.length; i++){
			   check = roo_statu[i].checked;
			   if(check) break;
		   }
		   if(!check){
			   alert('숙박 가능 여부를 선택하세요');
			   return false;
		   }
		   
		   var roo_guide = document.geteElementById('roo_guide');
		   if(roo_guide.value.trim() == ''){
			   alert('객실 설명을 입력하세요');
			   roo_guide.value ='';
			   roo_guide.focus();
			   return false;
		   }
		   var roo_capacity = document.getElementById('roo_capacity')
		   if(roo_capacity.value.trim() == ''){
			   alert('최대인원을 입력하세요');
			   roo_capacity.value='';
			   roo_capacity.focus();
			   return false;
		   }
	   }
   }
   
</script>
<div class="page-main-style">
	<h2>객실 정보 등록</h2>
	
	<h5>${param.acc_name}의 객실 정보</h5>
	<form:form id="writeForm" action="write.do" commandName="roomVO" enctype="multipart/form-data">
		<input type="hidden" name="acc_num" value="${param.acc_num}">
		<input type="hidden" name="acc_name" value="${param.acc_name}">
		<ul>		
			<li>
				<label for="roo_name">객실 이름</label>
				<form:input path="roo_name"/>
				<form:errors path="roo_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="roo_price">객실 가격</label>
				<form:input path="roo_price"/>
				<form:errors path="roo_price" cssClass="error-color"/>
			</li>
			<li>
				<label for="roo_status">객실 숙박 가능 여부</label>
				<form:radiobutton path="roo_status" value="1" cssClass="roo-sta"/>가능
				<form:radiobutton path="roo_status" value="2" cssClass="roo-sta"/>불가능
			</li>
			<li>
				<label for="roo_guide">객실 설명</label>
				<form:textarea path="roo_guide"/>
				<form:errors path="roo_guide" cssClass="error-color"/>
			</li>
			<li>
				<label for="roo_capacity">객실 최대 수용 인원</label>
				<form:input path="roo_capacity"/>
				<form:errors path="roo_capacity" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload1">이미지 파일1</label>
				<input type="file" name="upload1" id="upload1" accept="image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for="upload2">이미지 파일2</label>
				<input type="file" name="upload2" id="upload2" accept="image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for="upload3">이미지 파일3</label>
				<input type="file" name="upload3" id="upload3" accept="image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for="upload4">이미지 파일4</label>
				<input type="file" name="upload4" id="upload4" accept="image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for="upload5">이미지 파일5</label>
				<input type="file" name="upload5" id="upload5" accept="image/gif,image/png,image/jpeg">
			</li>
			<li>
				<label for="upload6">이미지 파일6</label>
				<input type="file" name="upload6" id="upload6" accept="image/gif,image/png,image/jpeg">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='list.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}'"> 		
		</div>
	</form:form>
</div>


<!-- 중앙 컨텐츠 종료 -->