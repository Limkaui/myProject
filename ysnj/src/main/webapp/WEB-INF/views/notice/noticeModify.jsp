<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.ck-editor__editable_inline {
		min-width:600px;
   		min-height: 250px;
}
	.page-main-style{
		width: 80%;
		padding: 30px;
	}
</style>
<!-- include ckeditor js -->
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>공지사항 수정</h2>
	<form:form action="update.do" commandName="noticeVO" enctype="multipart/form-data" style="width:750px">
	<form:hidden path="not_num"/>
	<form:errors element="div"/>
		<ul>
			<li>
				<label for="not_title">제목</label>
				<form:input path="not_title"/>
				<form:errors path="not_title" clssClass="error-color"/>
			</li>
			<li>
				<label for="not_time">기간</label>
				<form:input path="not_time"/>
				<form:errors path="not_time" cssClass="error_color"/>
			</li>
			<li>
				<label for="not_upload">이미지 업로드</label>
				<input type="file" name="not_upload" id="not_upload">
				<c:if test="${!empty noticeVO.not_uploadfile}">
				<br>
				<span>(${noticeVO.not_filename})파일이 등록되어 있습니다.
				다시 업로드하면 기존 파일은 삭제 됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="not_content">내용</label>
				<form:textarea path="not_content"/>
				<form:errors path="not_content" cssClass="error-color"/>
				<script>
				function MyCustomUploadAdapterPlugin(editor){
					editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						return new UploadAdapter(loader);
					}
				}
				
				ClassicEditor
					.create( document.querySelector( '#not_content' ), {
						extraPlugins : [MyCustomUploadAdapterPlugin]
					})
					.then( editor => {
						window.editor = editor;
					})
					.catch( error => {
						console.error( error );
					});
				</script>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" id="bts" value="수정">
			<input type="button" id="bts" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>