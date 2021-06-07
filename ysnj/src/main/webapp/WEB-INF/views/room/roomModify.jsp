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
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>객실 정보 수정</h2>
	<form:form action="update.do" commandName="roomVO" enctype="multipart/form-data">
		<form:hidden path="roo_num"/>
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
				<form:radiobutton path="roo_status" value="1"/>가능
				<form:radiobutton path="roo_status" value="2"/>불가능
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
				<c:if test="${!empty roomVO.roo_filename1}">
				<br>
				<span>(${roomVO.roo_filename1})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload2">이미지 파일2</label>
				<input type="file" name="upload2" id="upload2" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty roomVO.roo_filename2}">
				<br>
				<span>(${roomVO.roo_filename2})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload3">이미지 파일3</label>
				<input type="file" name="upload3" id="upload3" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty roomVO.roo_filename3}">
				<br>
				<span>(${roomVO.roo_filename3})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload1">이미지 파일4</label>
				<input type="file" name="upload4" id="upload4" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty roomVO.roo_filename4}">
				<br>
				<span>(${roomVO.roo_filename4})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload5">이미지 파일5</label>
				<input type="file" name="upload5" id="upload5" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty roomVO.roo_filename5}">
				<br>
				<span>(${roomVO.roo_filename5})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload6">이미지 파일6</label>
				<input type="file" name="upload6" id="upload6" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty roomVO.roo_filename6}">
				<br>
				<span>(${roomVO.roo_filename6})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			
		</ul>
		<div class="align-right" id="bts_view">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='list.do?acc_num=${param.acc_num}&acc_name=${param.acc_name}'">
			
		</div>
		
		
	</form:form>

</div>

<!-- 중앙 컨텐츠 종료 -->