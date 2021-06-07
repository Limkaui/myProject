<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#payment_form').submit(function(){
		if($('#pay_money').val().trim() == '' && ('#pay_kind').val() == "3"){
			alert('포인트를 입력하세요');
			pay_money.value='';
			pay_money.focus();
			return false;
		}
		if($('#pay_money').val() != $('#totalpay').val() && ('#pay_kind').val() == "3"){
			alert('결제 금액과 동일하지 않습니다.');
			pay_money.value='';
			pay_money.focus();
			return false;
		}
		if($('#pay_money').val() > $('#point').val() && ('#pay_kind').val() == "3"){
			alert('보유 포인트를 초과해서 결제할 수 없습니다.');
			pay_money.value='';
			pay_money.focus();
			return false;
		}
		alert('결제가 완료되었습니다.');
	});
	
	$('#pay_kind').change(function(){
		if($('#pay_kind').val() == "1"){
			$('#pay_money').val($('#totalpay').val());
			$('#money_poi').css('display','none');
			$('#money_account').css('display','none');
			$('#money_kakao').css('display','');
			$('#payment_submit').css('display','none');
		}
		if($('#pay_kind').val() == "2"){
			$('#pay_money').val(0);
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
	
	$('#kaka').click(function click(){
	    IMP.init('imp74058866'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    var msg;
	    
	    IMP.request_pay({
	        pg : 'kakaopay',
	        pay_method : 'card',
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '여기서놀자  - '+$('#acc').val(),
	        amount : $('#totalpay').val(),
	        buyer_email : $('#buyer_email').val(),
	        buyer_name : $('#buyer_name').val(),
	        buyer_tel : $('#buyer_tel').val(),
	        buyer_addr : $('#buyer_addr').val(),
	        buyer_postcode : $('#buyer_postcode').val(),
	    }, function(rsp) {
	        if ( rsp.success ) {
	        	var msg = '결제가 완료되었습니다. 결제정보는 카카오톡으로 전송됩니다.';
		        alert(msg);
	            document.getElementById("payment_submit").click();
	            //document.$('#payment_submit').click(); 
	            //document.$('#payment_form').submit();
	        } else {
	            msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            alert(msg);
	        }
	       
	            
	    });
	});
});



</script>
	<div class="page-main-style">
		<h2 id="h_2" style="text-align: center;">결제하기</h2>
		<form:form action="payment.do" id="payment_form" commandName="paymentVO" cssStyle="width:400px;">
		<form:hidden path="rsv_num" value="${rsv_num}"/>
		<input type="hidden" id="totalpay" value="${totalpay}"/>
		<input type="hidden" id="point" value="${point}"/>
		<input type="hidden" id="buyer_email" value="${member.mem_email}"/>
		<input type="hidden" id="buyer_name" value="${member.mem_name}"/>
		<input type="hidden" id="buyer_tel" value="${member.mem_cell}"/>
		<input type="hidden" id="buyer_addr" value="${member.mem_address1} ${member.mem_address2}"/>
		<input type="hidden" id="buyer_postcode" value="${member.mem_zipcode}"/>
		<input type="hidden" id="acc" value="${acc.acc_name}"/>
				<ul>
				<li>
					<label for="price">결제금액</label>
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
						<label style="width: 100%; margin-top:10px;"></label><br>
						<input type="button" id="kaka" value="카카오페이 결제" style="margin-top:10px; color: white;font-family: sans-serif; background: #fd7792;border:none;font-size:15px;cursor:pointer;">
					</li>
				</ul>
				<!-- <hr width="100%" style="margin-top:10px;"> -->

	<div class="align-center">
		<button type="submit" form="payment_form" id="payment_submit" style="height: 40px; color: white;font-family: sans-serif; background: #fd7792;border:none;font-size:15px;cursor:pointer;">결제하기</button>
	</div>
	</form:form>
	<div style="clear: both;"></div>
</div>
