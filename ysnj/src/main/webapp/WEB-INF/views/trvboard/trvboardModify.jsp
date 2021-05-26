<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->

<div class="page-main-style">
	<h2>글 수정</h2>
	<form:form action="update.do" commandName="trvBoardVO" enctype="multipart/form-data">
	<form:hidden path="trv_num"/>
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
				<c:if test="${!empty trvBoardVO.trv_filename1}">
				<br>
				<span>(${trvBoardVO.trv_filename1})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload2">이미지 파일2</label>
				<input type="file" name="upload2" id="upload2" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty trvBoardVO.trv_filename2}">
				<br>
				<span>(${trvBoardVO.trv_filename2})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload3">이미지 파일3</label>
				<input type="file" name="upload3" id="upload3" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty trvBoardVO.trv_filename3}">
				<br>
				<span>(${trvBoardVO.trv_filename3})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload4">이미지 파일4</label>
				<input type="file" name="upload4" id="upload4" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty trvBoardVO.trv_filename4}">
				<br>
				<span>(${trvBoardVO.trv_filename4})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
			</li>
			<li>
				<label for="upload5">이미지 파일5</label>
				<input type="file" name="upload5" id="upload5" accept="image/gif,image/png,image/jpeg">
				<c:if test="${!empty trvBoardVO.trv_filename5}">
				<br>
				<span>(${trvBoardVO.trv_filename5})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if>
				<%-- <c:if test="${!empty TrvImage.tri_num}">
				<br>
				<span>(${TrvImage.tri_num})파일이 등록되어 있습니다.
						다시 업로드 하면 기존파일은 삭제됩니다.</span>
				</c:if> --%>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정하기">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->