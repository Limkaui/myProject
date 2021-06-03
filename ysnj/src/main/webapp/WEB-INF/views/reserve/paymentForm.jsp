<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#payment_form').submit(function(){
		if($('#pay_money').val().trim() == ''){
			alert('포인트를 입력하세요');
			pay_money.value='';
			pay_money.focus();
			return false;
		}
		if($('#pay_money').val() != $('#totalpay').val()){
			alert('결제 금액과 동일하지 않습니다.');
			pay_money.value='';
			pay_money.focus();
			return false;
		}
		if($('#pay_money').val() >= $('#point').val()){
			alert('보유 포인트를 초과해서 결제할 수 없습니다.');
			pay_money.value='';
			pay_money.focus();
			return false;
		}
	});
	
	
	$('#pay_kind').change(function(){
		if($('#pay_kind').val() == "1"){
			$('#money_poi').css('display','none');
			$('#money_account').css('display','none');
			$('#money_kakao').css('display','');
			$('#payment_submit').css('display','none');
		}
		if($('#pay_kind').val() == "2"){
			$('#money_poi').css('display','none');
			$('#money_kakao').css('display','none');
			$('#money_account').css('display','');
			$('#payment_submit').css('display','');
		}
		if($('#pay_kind').val() == "3"){
			$('#money_poi').css('display','');
			$('#money_account').css('display','none');
			$('#money_kakao').css('display','none');
			$('#payment_submit').css('display','');
		}
	});
});

</script>
	<div class="page-main-style">
		<form:form action="payment.do" id="payment_form" commandName="paymentVO" cssStyle="width:80%; border:none;">
		<form:hidden path="rsv_num" value="${rsv_num}"/>
		<input type="hidden" id="totalpay" value="${totalpay}"/>
		<input type="hidden" id="point" value="${point}"/>
		<div class="align-center">
				<h3>결제 수단 선택</h3>
				<ul>
				<li>
					<label for="price">결제금액</label><br>
					<p><strong>${totalpay} 원</strong></p>
					</li>
					<li>
					<form:select path="pay_kind" id="pay_kind">
						<form:option value="3">포인트</form:option>
						<form:option value="1">카카오페이</form:option>
						<form:option value="2">무통장입금</form:option>
					</form:select>
					</li>
					<li id="money_poi">
						<label style="width: 100%; margin-top:10px;">포인트 사용(보유 포인트 ${point} P)</label><br>
						<input type="text" name="pay_money" id="pay_money" style="margin-top:10px;"/>
					</li>
					<li id="money_account" style="display: none;">
						<label style="width: 100%; margin-top:10px;">무통장입금(${mem_account})</label><br>
						<input type="text" name="pay_name" id="pay_name" style="margin-top:10px;" placeholder="입금자명 입력"/>
					</li>
					<li id="money_kakao" style="display: none;">
						<label style="width: 100%; margin-top:10px;">카카오페이</label><br>
						<span style="margin-top:10px;">카카오페이 결제창으로 이동합니다.</span>
					</li>
				</ul>
		</div>
				<hr width="100%" style="margin-top:10px;">

	<div class="align-center">
		<button type="submit" form="payment_form" id="payment_submit" style="height: 40px;">결제하기</button>
	</div>
			</form:form>
	<div style="clear: both;"></div>
</div>
