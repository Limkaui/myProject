<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript">
window.onload = function(){
	var point_form = document.getElementById('point_form');
	//이벤트 연결
	$('#point_form').submit(function(){
		if($('#mem_num').val().trim() == ''){
			alert('회원번호를 입력하세요');
			mem_num.value='';
			mem_num.focus();
			return false;
		}
		
		if($('#poi_add').val().trim() == '' || $('#poi_minus').val().trim() == ''){
			alert('적립하거나 차감할 포인트 입력하세요');
			return false;
		}
	
		if($('#poi_detail').val().trim() == ''){
			alert('사유를 입력하세요');
			poi_detail.value='';
			poi_detail.focus();
			return false;
		}
	
	});
	
	$(document).ready(function(){
		$('#poi_kind').change(function(){
			if($('#poi_kind').val() == "1"){
				$('#add').css('display','');
				$('#minu').css('display','none');
			}
			if($('#poi_kind').val() == "2"){
				$('#add').css('display','none');
				$('#minu').css('display','');
			}
		});
	});
	
	
}


</script>
<div class="page-main-style">
	<h2>포인트 적립</h2>
	<div class="align-center">
		구분 선택 : 
		<select id="poi_kind" style="height: 30px; margin-bottom: 10px;">
			<option value="1">포인트 적립</option>
			<option value="2">포인트 차감</option>
		</select>
	</div>
	<form:form action="point.do" id="point_form" commandName="pointVO" enctype="multipart/form-data">
		<ul>
			<li>
				<label for="mem_num">회원번호</label>
				<form:input path="mem_num"/>
			</li>
			<li id="add">
				<label for="poi_add">적립할 포인트</label>
				<form:input path="poi_add"/>
			</li>
			<li id="minu" style="display: none;">
				<label for="poi_minus">차감할 포인트</label>
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