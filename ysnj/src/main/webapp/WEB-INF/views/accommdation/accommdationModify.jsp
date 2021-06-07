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
	<h2>${accommdation.acc_name} 숙소 정보 수정</h2>
	<form:form action="update.do" commandName="accommdationVO" enctype="multipart/form-data">
		<form:hidden path="acc_num"/>
		<ul>
		
			<li>
				<label for="acc_category">카테고리</label>
				<form:radiobutton path="acc_category" value="1"/>호텔
				<form:radiobutton path="acc_category" value="2"/>모텔
				<form:radiobutton path="acc_category" value="3"/>게스트하우스
			</li>
			<li>		
				<label for="acc_name">이름</label> 
				<form:input path="acc_name"/>
				<form:errors paht="acc_name" cssClass="error-color"/>
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
				<form:radiobutton path="acc_status" value="1"/>가능
				<form:radiobutton path="acc_status" value="2"/>불가능
				<form:errors path="acc_status" cssClass="error-color"/>
			</li>
			<li>
				<label for="acc_guide">설명</label>
				<form:textarea path="acc_guide"/>
				<form:errors path="acc_guide" cssClass="error-color"/>
			</li>
			<li>
				<label>편의시설</label>
				<form:checkbox path="facc_amenity" value="wifi"/>wifi
				<form:checkbox path="facc_amenity" value="주차"/>주차
				<form:checkbox path="facc_amenity" value="식당"/>식당
			</li>
			<li>
				<label for="upload1">이미지 파일1</label>
				<input type="file" name="upload1" id="upload1" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty accommdationVO.acc_filename1}">
				<br>
				<span>(${accommdationVO.acc_filename1})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload2">이미지 파일2</label>
				<input type="file" name="upload2" id="upload2" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty accommdationVO.acc_filename2}">
				<br>
				<span>(${accommdationVO.acc_filename2})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload3">이미지 파일3</label>
				<input type="file" name="upload3" id="upload3" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty accommdationVO.acc_filename3}">
				<br>
				<span>(${accommdationVO.acc_filename3})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload4">이미지 파일4</label>
				<input type="file" name="upload4" id="upload4" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty accommdationVO.acc_filename4}">
				<br>
				<span>(${accommdationVO.acc_filename4})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload5">이미지 파일5</label>
				<input type="file" name="upload5" id="upload5" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty accommdationVO.acc_filename5}">
				<br>
				<span>(${accommdationVO.acc_filename5})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload6">이미지 파일6</label>
				<input type="file" name="upload6" id="upload6" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty accommdationVO.acc_filename6}">
				<br>
				<span>(${accommdationVO.acc_filename6})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			
			
		</ul>
		<div class="align-center">
			<input type="submit" value="수정"  id="bts">
			<input type="button" value="목록" onclick="location.href='list.do'"  id="bts">
		</div>			
	</form:form>

</div>



<!--중앙 컨텐츠 종료 -->