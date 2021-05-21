<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			<%-- <li>
				<label for="aci_uploadfile">이미지 파일 업로드</label>
				<input type="file" name="aci_uploadfile" id="aci_uploadfile" accept="image/gif, image/png, image/jpeg">
				<form:errors path="aci_uploadfile" cssClass="error-color"/>
			</li> --%>
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
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>			
	</form:form>

</div>



<!--중앙 컨텐츠 종료 -->