<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/accommdation.fav.js"></script>
<script type="text/javascript">
	$(function(){
		$('#roomSelect').change(function(){
			  var selected_room = $("#roomSelect option:selected").val();
			  $.ajax({
	               url : "roomdetail.do",
	               type : "post",
	               dataType : 'json',
	               data : {
	                  roo_num: selected_room
	               },
	               success : function(param) {
	            	   console.log(param);
	            	   console.log(param.result1);
	            	   var reserv_id = '#reserv_r'+selected_room;
	            	   if(param.result1 == 1){
	            		   $('#status').css('color','blue').html('예약가능');
	            		   $(reserv_id).attr('disabled',false);
	            	   } else if(param.result1 == 2){
	            		   $('#status').css('color', 'red').html('예약불가능');
	            		   $(reserv_id).attr('disabled',true);
	            	   }
	            	   $('#capacity').html(param.result2);
	            	   $('#price').html(param.result3);
	               },
	               
	               error : function(xhr,status,error) {
	                  console.log(error);
	                  console.log(xhr);
	                  console.log(status);
	               }
	            });
			
		});
				
	});
	
	$(document).ready(function(){
		new Swiper('.swiper-container', {
			loop:true,
			navigation : {
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
		
		
		//숙소 예약 처리
		$('.reserv-btn').click(function(){
			var roo_num = $(this).attr('data-num');
			$('#roo_num').val(roo_num);
			$('#reserv_form').submit();
		});
		
	});

</script>

<style type="text/css">
	.swiper-container {
		width:600px;
		height:300px;
		border:5px solid silver;
		border-radius:7px;
	}
	.swiper-slide {
		text-align:center;
		display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
		align-items:center; /* 위아래 기준 중앙정렬 */
		justify-content:center; /* 좌우 기준 중앙정렬 */
	}
	.swiper-slide img {
		box-shadow:0 0 5px #555;
	}
	.guide{
		margin:0 auto;
	}
</style>

<!-- 중앙컨텐츠 시작 -->
<div class="page-main-style">
	<h2 id="h_2">${accommdation.acc_name}의 객실 정보 조회</h2>
		<input type="hidden" name="acc_num" value="${param.acc_num}">
		<br><br><br>
		<!-- 숙소 사진 -->
		<c:if test="${!empty accommdation.acc_filename1}">
		<div class="swiper-container">
			<div class="swiper-wrapper">
					<div class="swiper-slide">
						<img src="../imageView.do?acc_num=${accommdation.acc_num}&acc_idx=1" style="max-width:500px">
					</div>
				<c:if test="${!empty accommdation.acc_filename2}">
					<div class="swiper-slide">
						<img src="../imageView.do?acc_num=${accommdation.acc_num}&acc_idx=2"  style="max-width:500px">
					</div>
				</c:if>
				<c:if test="${!empty accommdation.acc_filename3}">
					<div class="swiper-slide">
						<img src="../imageView.do?acc_num=${accommdation.acc_num}&acc_idx=3" style="max-width:500px">
					</div>
				</c:if>
				<c:if test="${!empty accommdation.acc_filename4}">
					<div class="swiper-slide">
						<img src="../imageView.do?acc_num=${accommdation.acc_num}&acc_idx=4" style="max-width:500px">
					</div>
				</c:if>
				<c:if test="${!empty accommdation.acc_filename5}">
					<div class="swiper-slide">
						<img src="../imageView.do?acc_num=${accommdation.acc_num}&acc_idx=5" style="max-width:500px">
					</div>
				</c:if>
				<c:if test="${!empty accommdation.acc_filename6}">
					<div class="swiper-slide">
						<img src="../imageView.do?acc_num=${accommdation.acc_num}&acc_idx=6" style="max-width:500px">
					</div>
				</c:if>
			</div>
			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
		</c:if>
		<div class="align-center" style="margin-top:5px">숙소 사진</div>
		<div class="align-right">
			<span id="acc_num" data-num="${accommdation.acc_num}">찜</span> <img id="output_fav" src="${pageContext.request.contextPath}/resources/image/heart01.png">
			<span id="output_fcount"></span> <span id="output_rcount"></span>
		</div>
		<hr>
		<div class="align-center">
		<table style="width:500px">
			<tr>
				<td>카테고리</td>
				<td> <c:if test="${accommdation.acc_category == 1}">
								호텔
							</c:if>
							<c:if test="${accommdation.acc_category == 2}">
								모텔
							</c:if>
							<c:if test="${accommdation.acc_category == 3}">
								게스트하우스
							</c:if> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td> ${accommdation.acc_name}</td>
			</tr>
			<tr>
				<td>위치</td>
				<td>${accommdation.acc_address}</td>			
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${accommdation.acc_tel}</td>
			</tr>
			<tr>
				<td>입실시간</td>
				<td>${accommdation.acc_checkin}</td>			
			</tr>
			<tr>
				<td>퇴실시간</td>
				<td>${accommdation.acc_checkout}</td>			
			</tr>
		
		</table>
		</div>
		<div align="right">
		<form id="reserv_form" method="get" action="${pageContext.request.contextPath}/reserve/reserve.do" style="border:none;width:750px;">
			<input type="hidden" name="roo_num" id="roo_num">
			체크인 날짜 <input type="date" name="checkin" id="checkin_date"><br>
			체크아웃 날짜<input type="date" name="checkout" id="checkout_date"><br>
		</form>	  
			객실 선택	
			<select id="roomSelect" name="roomSelect">
				<option value="" selected disabled>==객실선택==</option>
				<c:forEach var="room" items="${room}">
					<option value="${room.roo_num}">${room.roo_name}</option>
				</c:forEach>
			</select><br><br>
		</div>	
		<hr>
		<ul>
			<li>상태 : <span id="status"></span></li>
			<li>숙박 최대 인원 : <span id="capacity"></span></li>
			<li>가격 : <span id="price"></span> </li>
		</ul>
		
		<br>
		<div class="align-right">
			별점 : OOOO <input type="button" value="리뷰보러가기" onclick="location.href='#'" id="bts">
		</div>
		<hr>
		
		<div class="align-center">
			<h5>[숙소 설명]</h5>
			<!-- <div style="padding-right:100px; padding-left:100px;"> -->
			<pre>
			${accommdation.acc_guide}
			</pre>
			<!-- </div> --><br><br>
			
			<h5>[숙박 편의시설]</h5>
			<div>
			${accommdation.acc_amenity}
			</div>
			<br><br>
			
			<h5>[객실설명]</h5><br>
			
			<table>
			<c:forEach var="room" items="${room}">	
				<tr>
					<td>
						<!-- 객실 사진 -->
						<div class="swiper-container">
							<div class="swiper-wrapper">
							
									<c:if test="${!empty room.roo_filename1}">
									<div class="swiper-slide">
									
										<img src="../room/imageView.do?roo_num=${room.roo_num}&roo_idx=1" style="max-width:400px">
									</div>
									</c:if>
								
								<c:if test="${!empty room.roo_filename2}">
									<div class="swiper-slide">
										<img src="../room/imageView.do?roo_num=${room.roo_num}&roo_idx=2" style="max-width:400px">
									</div>
								</c:if>
								<c:if test="${!empty room.roo_filename3}">
									<div class="swiper-slide">
										<img src="../room/imageView.do?roo_num=${room.roo_num}&roo_idx=3" style="max-width:400px">
									</div>
								</c:if>
								<c:if test="${!empty room.roo_filename4}">
									<div class="swiper-slide">
										<img src="../room/imageView.do?roo_num=${room.roo_num}&roo_idx=4" style="max-width:400px">
									</div>
								</c:if>
								<c:if test="${!empty room.roo_filename5}">
									<div class="swiper-slide">
										<img src="../room/imageView.do?roo_num=${room.roo_num}&roo_idx=5" style="max-width:400px">
									</div>
								</c:if>
								<c:if test="${!empty room.roo_filename6}">
									<div class="swiper-slide">
									<img src="../room/imageView.do?roo_num=${room.roo_num}&roo_idx=6" style="max-width:400px">
									</div>
								</c:if>
							</div>
							<!-- 네비게이션 -->
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
						<div class="align-center" style="margin-top:5px">객실 사진</div>
					</td>
					<td width="50%" style="padding-left:50px">
						<ul>
							<li><h2><b>${room.roo_name}</b></h2> </li>
							<li><h5>최대 인원 : ${room.roo_capacity}</h5> </li>
							<li>객실 설명 : ${room.roo_guide}</li>
							<li style="color:blue"><h4>예약가 : ${room.roo_price}</h4></li>
						</ul>
						<div class="align-right" style="padding-right:80px" id="bts_view">
							<input type="button" value="객실 예약하기" class="reserv-btn" id="reserv_r${room.roo_num}" data-num="${room.roo_num}">
						</div>
					</td>
				</tr>
			</c:forEach>
			</table>
		</div>
</div>



<!-- 중앙 컨텐츠 종료 -->