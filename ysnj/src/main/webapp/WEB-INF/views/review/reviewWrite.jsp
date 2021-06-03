<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<script type="text/javascript">
	window.onload=function(){
		var writeForm = document.getElementById('writeForm');
		//이벤트 연결
		writeForm.onsubmit=function(){
			var rev_title = document.getElementById('rev_title');
			if(rev_title.value.trim()==''){
				alert('제목을 입력하세요');
				rev_title.value = '';
				rev_title.focus();
				return false;
			}
			var rev_content = document.getElementById('rev_content');
			if(rev_content.value.trim()==''){
				alert('내용을 입력하세요');
				rev_content.value = '';
				rev_content.focus();
				return false;
			}
	};
	};
</script>
<div class="page-main-style">
	<h2>리뷰 작성</h2>
	<form:form id="writeForm" action="write.do" commandName="reviewVO"  enctype="multipart/form-data">
		<input type="hidden" name="acc_num" value="1">
		<ul>
			<li>
				<label for="rev_title">제목</label>
				<form:input path="rev_title"/>
				<form:errors path="rev_title" cssClass="error-color"/>
			</li>
			<li>
				<label for="rev_content">내용</label>
				<form:textarea path="rev_content"/>
				<form:errors path="rev_content" cssClass="error-color"/>
			</li>
			<li>
				<label for="upload">이미지 파일 업로드</label>
				<input type="file" name="upload" id="upload"
				                  accept="image/gif,image/png,image/jpeg">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록"
			               onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->