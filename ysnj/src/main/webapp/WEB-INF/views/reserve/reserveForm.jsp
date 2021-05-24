<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){ 
	/* 	 $('#checkall').click( function() {
	          $('#check_1').prop('checked', this.checked);
	          $('#check_2').prop('checked', this.checked);
	          $('#check_3').prop('checked', this.checked);
	        } 
		 ); */
		 $('.checkbox_group').on('click', '#checkall', function () {
			    $(this).parents('.checkbox_group').find('input').prop('checked', $(this).is(':checked'));
			});
		
		 $('.checkbox_group').on('click', '.normal', function() {
		     var is_checked = true;

		     $('.checkbox_group .normal').each(function(){
		         is_checked = is_checked && $(this).is(':checked');
		     });

		     $('#checkall').prop('checked', is_checked);
		 });
		 
		
	})
</script>
	<div class="rsv-main-style">
		<div class="reselve-display">
			<form:form action="reserve.do" id="reserve_form" commandName="reserveVO" cssStyle="width:80%; border:none;">
				<h3>예약자 정보</h3>
				<ul>
					<li>
						<label for="rsv_iname">예약자 이름</label><br>
						<form:input path="rsv_iname" cssStyle="width:100%; margin-top:10px;"/>
					</li>
			
					<li>
						<label for="rsv_iphone">휴대폰 번호</label><br>
						<form:input path="rsv_iphone" cssStyle="width:100%; margin-top:10px;"/>
					</li>
					<li>
						<label for="rsv_visitnum">방문인원</label><br>
						<form:input path="rsv_visitnum" cssStyle="width:100%; margin-top:10px;"/>
					</li>
						<form:hidden path="mem_num" value="0"/>
						<form:hidden path="roo_num" value="0"/>
						<form:hidden path="rsv_state" value="1"/>
						<form:hidden path="rsv_start" value="시작작"/>
						<form:hidden path="rsv_end" value="끝"/>
				</ul>
				<hr width="100%" style="margin-top:5px;">
				<h3>할인 수단 선택</h3>
				<ul>
					<li>
						<label for="price">구매총액</label><br>
						<p><strong><%-- ${rsv.price} --%>60000원</strong></p>
					</li>
					<li>
						<label style="width: 100%;">포인트 사용(보유 포인트 <%-- ${rsv.point} --%> P)</label><br>
						<%-- <form:input path="rsv_iphone" cssStyle="width:100%; margin-top:10px;"/> --%>
					</li>
				</ul>
				<hr width="100%" style="margin-top:5px;">
				<h3>결제 수단 선택</h3>
				<select name="payment">
					<option value="card">카카오페이</option>
					<option value="account">무통장입금</option>
				</select>
				<hr width="100%" style="margin-top:10px;">
				<div class="checkbox_group">
					<ul>
						<li>
							<input type="checkbox" id="checkall" class="checkall">
							전체동의
						</li>
						<li>
							<input type="checkbox" id="check_1" class="normal">
							숙소이용규칙 및 취소/환불규정 동의(필수)
						</li>
						<li>
							<input type="checkbox" id="check_2" class="normal">
							개인정보 수집 및 이용 동의(필수)
						</li>
						<li>
							<input type="checkbox" id="check_3" class="normal">
							개인정보 제 3자 제공동의(필수)
						</li>
					</ul>
				</div>
			</form:form>
		</div>
	
	<div class="reselve-display2" style="float:right; background-color: #FAFAFA;">
		<h3>예약 정보</h3>
		<ul>
			<li>
				<label style="color: #b2b2b2;">숙소이름</label> <br>
				<p><strong>이젠팬션<%-- ${acc.name} --%></strong></p>
			</li>
			<li>
				<label style="color: #b2b2b2;">객실타입/기간</label> <br>
				<p><strong>강의실1/1박<%-- ${acc.name} --%></strong></p>
			</li>
			<li>
				<label style="color: #b2b2b2;">체크인</label> <br>
				<p><strong>05.17 월 15:00<%-- ${acc.name} --%></strong></p>
			</li>
			<li>
				<label style="color: #b2b2b2;">체크아웃</label> <br>
				<p><strong>05.18 화 15:00<%-- ${acc.name} --%></strong></p>
			</li>
			
		</ul>
		<hr width="100%">
				<label style="color: #b2b2b2;">총 결제 금액(VAT 포함)</label> <br>
				<h3>60,000원<%-- ${acc.name} --%></h3>
		
	</div>
	<div class="reselve-display2" style=" float: right;">
		<button type="submit" form="reserve_form" style="width: 100%; height: 40px;">결제하기</button>
	</div>
</div>
