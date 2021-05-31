<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload = function(){
		var writeForm = document.getElementById('writeForm');
		//이벤트 연결
		writeForm.onsubmit = function(){
			
			//카테고리 라디오 버튼 유효성 체크
			var acc_cate = document.getElementsByClassName('acc-cate');
			var check = false;
			for(var i=0;i<acc_cate.length;i++){
				check = acc_cate[i].checked;
				if(check) break;
			}
			if(!check){
				alert('카테고리를 선택하세요');
				return false;
			}
			
			var acc_name = document.getElementById('acc_name');
			if(acc_name.value.trim() == ''){
				alert('숙소명을 입력하세요');
				acc_name.value='';
				acc_name.focus();
				return false;
			}
			var acc_tel = document.getElementById('acc_tel')
			if(acc_tel.value.trim() == ''){
				alert('전화번호를 입력하세요');
				acc_tel.value='';
				acc_tel.focus();
				return false;
			}
			var acc_address = document.getElementById('acc_address')
			if(acc_address.value.trim() == ''){
				alert('주소를 입력하세요');
				acc_address.value='';
				acc_address.focus();
				return false;
			}
			
			//이용가능여부 라디오버튼 유효성 체크
			var acc_statu = document.getElementsByClassName('acc-sta');
			check = false;
			for(var i=0; i<acc_statu.length; i++){
				check = acc_statu[i].checked;
				if(check) break;
			}
			if(!check){
				alert('이용가능여부를 선택하세요');
				return false;
			}
			
			var acc_guide = document.getElementById('acc_guide')
			if(acc_guide.value.trim() ==''){
				alert('설명을 입력하세요');
				acc_guide.value='';
				acc_guide.focus();
				return false;
			}
			
				
			
		}
		
		
	}

</script>



<div class="page-main-style">
	<h2>숙소 정보 등록</h2>
	<form:form id="writeForm" action="write.do" commandName="accommdationVO" enctype="multipart/form-data">
		<ul>
		
			<li>
				<label for="acc_category">카테고리</label>
				<form:radiobutton path="acc_category" value="1" cssClass="acc-cate"/>호텔
				<form:radiobutton path="acc_category" value="2" cssClass="acc-cate"/>모텔
				<form:radiobutton path="acc_category" value="3" cssClass="acc-cate"/>게스트하우스
			</li>
			<li>		
				<label for="acc_name">이름</label> 
				<form:input path="acc_name"/>
				<form:errors path="acc_name" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_tel">전화번호</label>
				<form:input path="acc_tel"/>
				<form:errors path="acc_tel" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_checkin">입실시간</label>
				<form:input path="acc_checkin"/>
				<form:errors path="acc_checkin" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_checkout">퇴실시간</label>
				<form:input path="acc_checkout"/>
				<form:errors path="acc_checkout" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_address">주소</label>
				<form:input path="acc_address"/>
				<form:errors path="acc_address" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_status">이용 가능 여부</label>
				<form:radiobutton path="acc_status" value="1" cssClass="acc-sta"/>가능
				<form:radiobutton path="acc_status" value="2" cssClass="acc-sta"/>불가능
				<form:errors path="acc_status" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_guide">설명</label>
				<form:textarea path="acc_guide"/>
				<form:errors path="acc_guide" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_amenity">편의시설</label>
				<form:checkbox path="acc_amenity" value="wifi"/>wifi
				<form:checkbox path="acc_amenity" value="주차"/>주차
				<form:checkbox path="acc_amenity" value="식당"/>식당
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
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝-->

    