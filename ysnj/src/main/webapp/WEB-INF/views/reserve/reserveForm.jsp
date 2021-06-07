<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
window.onload = function(){
	var reserve_form = document.getElementById('reserve_form');
	//이벤트 연결
	reserve_form.onsubmit = function(){
		
		//정보제공동의 체크박스 여부
		var normal = document.getElementsByClassName('normal');
		var check = false;
		var where = 0;
		for(var i=0;i<normal.length-1;i++){
			check = normal[i].checked;
			where = i;
			if(!check) break;
		}
		if(!check && where==0){
			alert('숙소이용규칙 및 취소/환불규정에 동의해주세요');
			return false;
		}
		if(!check && where==1){
			alert('개인정보 수집 및 이용에 동의해주세요');
			return false;
		}
		
		var rsv_iname = document.getElementById('rsv_iname');
		if(rsv_iname.value.trim() == ''){
			alert('입실자 이름을 입력하세요');
			rsv_iname.value='';
			rsv_iname.focus();
			return false;
		}
		
		var rsv_iphone = document.getElementById('rsv_iphone');
		if(rsv_iphone.value.trim() == ''){
			alert('입실자 전화번호를 입력하세요');
			rsv_iphone.value='';
			rsv_iphone.focus();
			return false;
		}
		
		var rsv_visitnum = document.getElementById('rsv_visitnum');
		if(rsv_visitnum.value.trim() == ''){
			alert('방문인원을 입력하세요');
			rsv_visitnum.value='';
			rsv_visitnum.focus();
			return false;
		}
	}
	//체크박스 전체선택
	$(document).ready(function(){ 
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
}
</script>
	<div class="page-main-style">
			<form:form action="reserve.do" id="reserve_form" commandName="reserveVO" cssStyle="width:80%; border:none;">
		<div class="reselve-display" style="width: 50%;	padding: 10px; margin: 5px;	float: left;">
				<h3 id="h_2">예약자 정보</h3>
				<ul>
					<li>
						<label for="rsv_iname" style="float: left;">입실자 이름</label><br>
						<form:input path="rsv_iname" cssStyle="width:100%; margin-top:10px;"/>
					</li>
						<br>
					<li>
						<label for="rsv_iphone">입실자 전화번호</label><br>
						<form:input path="rsv_iphone" cssStyle="width:100%; margin-top:10px;"/>
					</li>
						<br>
					<li>
						<label for="rsv_visitnum">방문인원</label><br>
						<form:input path="rsv_visitnum" cssStyle="width:100%; margin-top:10px;"/>
					</li>
						<form:hidden path="roo_num" value="${param.roo_num}"/>
						<form:hidden path="rsv_state" value="1"/>
						<form:hidden path="rsv_start" value="${param.checkin}"/>
						<form:hidden path="rsv_end" value="${param.checkout}"/>
				</ul>
				<hr width="100%" style="margin-top:10px;">
				<%-- <h3>할인 수단 선택</h3>
				<ul>
					<li>
						<label for="price">구매총액</label><br>
						<p><strong>${totalpay} 원</strong></p>
					</li>
					<li>
						<label style="width: 100%;">포인트 사용(보유 포인트 ${point} P)</label><br>
						<form:input path="rsv_iphone" cssStyle="width:100%; margin-top:10px;"/>
					</li>
				</ul>
				<hr width="100%" style="margin-top:5px;">
				<h3>결제 수단 선택</h3>
					<select name="payment">
						<option value="card">카카오페이</option>
						<option value="account">무통장입금</option>
					</select> --%>
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
							개인정보 제 3자 제공동의(선택)
						</li>
					</ul>
				</div>
				<hr width="100%" style="margin-top:10px;">
		<button type="submit" form="reserve_form" style="width: 100%; height: 40px; color: white;	font-family: sans-serif; background: #fd7792;border:none;font-size:15px;cursor:pointer;">결제하기</button>
		</div>
	
	<div class="reselve-display2" style="float:right; background-color: #FAFAFA; width: 40%; padding: 10px;	margin: 5px;">
		<h3 id="h_2">예약 정보</h3>
		<ul>
			<li>
				<label style="color: #b2b2b2;">숙소이름</label> <br>
				<p><strong>${accinfo.acc_name}</strong></p>
			</li>
			<li>
				<label style="color: #b2b2b2;">객실타입</label> <br>
				<p><strong>${roominfo.roo_name}</strong></p>
			</li>
			<li>
				<label style="color: #b2b2b2;">체크인</label> <br>
				<p><strong>${param.checkin}</strong></p>
			</li>
			<li>
				<label style="color: #b2b2b2;">체크아웃</label> <br>
				<p><strong>${param.checkout}</strong></p>
			</li>
			
		</ul>
		<hr width="100%">
				<label style="color: #b2b2b2; width: 100%; text-align: center;">총 결제 금액(VAT 포함)</label> <br>
				<h3 style="text-align: center;">${totalpay}원</h3>
		
	</div>

			</form:form>
	<div style="clear: both;"></div>
</div>
