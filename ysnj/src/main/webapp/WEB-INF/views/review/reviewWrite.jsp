<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 중앙 컨텐츠 시작 -->
<style>
/*=====별점 스타일=======*/
.rating{
	/*현재 디자인에서만 필요하고 다른 디자인일 경우는 필요하지 않음*/
	display:inline-block;
	width:500px;	
}
.rating .rate-check {
	display:none;
	
}
.rating .rate-check + label {
    width: 20px;
    height: 20px;
    background-image: url('${pageContext.request.contextPath}/resources/image/star.png');
    background-repeat: no-repeat;
    background-size: 20px 20px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate-check:checked + label {
    background-color: #eb7a34;
}
.rec-star {
	width: 15px;
    height: 15px;
    background-color: #eb7a34;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
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
<!-- 별점 스크립트 -->
<script>
$(document).ready(function(){
	$(document).on('click','.rating',function(e){
		let elem = e.target;
        if(elem.classList.contains('rate-check')){
        	$(this).find('.rate-check').each(function(index, item){
                if(index < elem.value){
                    item.checked = true;
                }else{
                    item.checked = false;
                }
            });
            $(this).find('.rate-star').val(elem.value);
        }
	});
});
</script>
<div class="page-main-style">
	<h2 id="h_2">리뷰 작성</h2>
	<form:form id="writeForm" action="write.do" commandName="reviewVO"  enctype="multipart/form-data">
		<input type="hidden" name="acc_num" value="1">
		<ul>
			<li>
                <div class="rating">
                <label style="padding-top:-10px;">별점</label>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
	            <input type="hidden" name="rev_star" class="rate-star">    
                <input type="checkbox" id="rating1" value="1" class="rate-check">
                <label for="rating1"></label>
                <input type="checkbox" id="rating2" value="2" class="rate-check">
                <label for="rating2"></label>
                <input type="checkbox" id="rating3" value="3" class="rate-check">
                <label for="rating3"></label>
                <input type="checkbox" id="rating4" value="4" class="rate-check">
                <label for="rating4"></label>
                <input type="checkbox" id="rating5" value="5" class="rate-check">
                <label for="rating5"></label>
                </div>
			</li>
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
			<input type="submit" value="전송" id="bts">
			<input type="button" value="목록"
			               onclick="location.href='list.do'" id="bts">
		</div>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->