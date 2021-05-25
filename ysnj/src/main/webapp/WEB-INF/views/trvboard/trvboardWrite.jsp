<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload=function(){
		var writeForm = document.getElementById('writeForm');
		//이벤트 연결
		writeForm.onsubmit=function(){
			var trv_title = document.getElementById('trv_title');
			if(trv_title.value.trim()==''){
				alert('제목을 입력하세요');
				trv_title.value = '';
				trv_title.focus();
				return false;
			}
			var trv_local = document.getElementById('trv_local');
			if(trv_local.value.trim()==''){
				alert('지역을 입력하세요');
				trv_local.value = '';
				trv_local.focus();
				return false;
			}
			var trv_place = document.getElementById('trv_place');
			if(trv_place.value.trim()==''){
				alert('주소을 입력하세요');
				trv_place.value = '';
				trv_place.focus();
				return false;
			}
			var trv_intro = document.getElementById('trv_intro');
			if(trv_intro.value.trim()==''){
				alert('소개글을 입력하세요');
				trv_intro.value = '';
				trv_intro.focus();
				return false;
			}
		};
	};
</script>
<div class="page-main-style">
	<h2>글쓰기</h2>
	<form:form id="writeForm" action="write.do" commandName="trvBoardVO" enctype="multipart/form-data">
		<ul>
			<li>
				<label for="trv_cate">분류</label>
				<form:select path="trv_cate">
					<form:option value="1">관광지</form:option>
					<form:option value="2">박물관</form:option>
					<form:option value="3">음식점</form:option>
				</form:select>
				<form:errors path="trv_cate" cssClass="error-color"/>
			</li>
			<li>
				<label for="trv_title">제목</label>
				<form:input path="trv_title"/>
				<form:errors path="trv_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="trv_local">지역</label>
				<form:input path="trv_local"/>
				<form:errors path="trv_local" cssClass="error-color"/>
			</li>
			<li>
				<label for="trv_place">주소</label>
				<form:input path="trv_place"/>
				<form:errors path="trv_place" cssClass="error-color"/>
			</li>
			<li>
				<label for="trv_intro">소개글</label>
				<form:textarea path="trv_intro"/>
				<form:errors path="trv_intro" cssClass="error-color"/>
			</li>
			<li>
				<label for="trv_call">문의전화</label>
				<form:input path="trv_call"/>
				<form:errors path="trv_call" cssClass="error-color"/>
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
		</ul>
		<div class="align-center">
			<input type="submit" value="등록">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->