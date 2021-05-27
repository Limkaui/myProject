<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#category').change(function(){
			var category = $("#category option:selected").val();
			if(category > 0){
				location.href='acc_list.do?cate='+category; 
			}else{
				location.href='acc_list.do';
			}
			
		});
		
		$('#pr').change(function(){
			var room_price = $("#pr option:selected").val();
			if(room_price > 0) {
				location.href = 'acc_list.do?pr='+ room_price;
			}else{
				location.href = 'acc_list.do';
			}
		});
				
	});
</script>
<!-- 중앙 컨텐츠 시작 -->
<div class="page-main-style">
	<h2>소비자 숙소 조회</h2>
	
		<!-- 검색기능 -->
		<form name="searchForm" method="get" action="acc_list.do" id="search_form">
			<select name="keyfield">
				<option value="acc_name" 
					<c:if test="${map.keyfield == 'acc_name'}">selected</c:if>
						>숙소이름</option>
				<option value="acc_address" 
					<c:if test="${map.keyfield == 'acc_address'}">selected</c:if>
					>주소</option>
			</select>
			<input type="text" name="keyword" value="${map.keyword}">
			<input type="submit" value="검색">
		</form>
		<!-- 카테고리 -->
		<select name="category" id="category">
						<option value="0" 
							<c:if test="${cate == 0}">selected</c:if>
						>전체</option>
						<option value="1"
							<c:if test="${cate == 1}">selected</c:if>
						>호텔</option>
						<option value="2"
							<c:if test="${cate == 2}">selected</c:if>
						>모텔</option>
						<option value="3"
							<c:if test="${cate == 3}">selected</c:if>
						>게스트하우스</option>
			</select>
			<!-- 가격순 -->
			<select name="pr" id="pr">
					<option value="0"
						<c:if test="${pr == 0}">selected</c:if>
					>가격</option>
					<option value="1"
						<c:if test="${pr == 1}">selected</c:if>
					>최저가격순</option>
					<option value="2"
						<c:if test="${pr == 2}">selected</c:if>
					>최고가격순</option>
			</select>
			<hr>
	<!-- table -->
	<div id="wrap">
		<ul>
			<c:forEach var="accommdation" items="${acclist}">
				<li class="item">
						<div class="align-center">
							<a href="acc_list/detail.do?acc_num=${accommdation.acc_num}"><img src="../accommdation/imageView.do?acc_num=${accommdation.acc_num}&acc_idx=1" style="max-width:100px"></a>
						</div>
					<div class="align-center">
						<c:if test="${accommdation.acc_category == 1}">
							호텔
						</c:if>
						<c:if test="${accommdation.acc_category == 2}">
							모텔
						</c:if>
						<c:if test="${accommdation.acc_category == 3}">
							게스트하우스
						</c:if>
					</div>
					<div class="align-center"><a href="acc_list/detail.do?acc_num=${accommdation.acc_num}">${accommdation.acc_name}</a></div>
					<div class="align-center">${accommdation.acc_rowprice}</div>
					<div class="align-center">${accommdation.acc_address}</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="align-center">${pagingHtml}</div>
	
	
</div>


<!-- 중앙 컨텐츠 종료 -->