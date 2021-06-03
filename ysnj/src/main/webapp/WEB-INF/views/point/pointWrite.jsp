<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
window.onload = function(){
	var point_form = document.getElementById('point_form');
	//이벤트 연결
	point_form.onsubmit = function(){
		var mem_num = document.getElementById('mem_num');
		if(mem_num.value.trim() == ''){
			alert('회원번호를 입력하세요');
			mem_num.value='';
			mem_num.focus();
			return false;
		}
		
		var poi_add = document.getElementById('poi_add');
		var poi_minus = document.getElementById('poi_minus');
		if(poi_add.value.trim() == '' || poi_minus.value.trim() == ''){
			alert('적립하거나 차감할 포인트 입력하세요');
			poi_add.focus();
			return false;
		}
		
		var poi_detail = document.getElementById('poi_detail');
		if(poi_detail.value.trim() == ''){
			alert('사유를 입력하세요');
			poi_detail.value='';
			poi_detail.focus();
			return false;
		}
	}
}
</script>
<div class="page-main-style">
	<h2>포인트 적립</h2>
	<form:form action="point.do" id="point_form" commandName="pointVO" enctype="multipart/form-data">
		<ul>
			<li>
				<label for="mem_num">회원번호</label>
				<form:input path="mem_num"/>
			</li>
			<li>
				<label for="poi_add">포인트 적립</label>
				<form:input path="poi_add"/>
			</li>
			<li>
				<label for="poi_minus">포인트 차감</label>
				<form:input path="poi_minus"/>
			</li>
			<li>
				<label for="poi_detail">적립/차감 이유</label>
				<form:input path="poi_detail"/>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form:form>
</div>