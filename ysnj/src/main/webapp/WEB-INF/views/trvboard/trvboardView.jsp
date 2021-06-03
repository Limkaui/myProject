<%@ page language="java" contentType="text/html; charset=UTF-8"	
    pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<!-- 중앙 컨텐츠 시작 -->	
<script type="text/javascript">	
	window.onload=function(){	
		var delete_btn = document.getElementById('delete_btn');	
		//이벤트 연결	
		delete_btn.onclick=function(){	
			var choice = window.confirm('삭제하시겠습니까?');		
			if(choice){	
				location.replace('delete.do?trv_num=${trv_board.trv_num}');	
			}
		};
	};
</script>
<div class="page-main-style">
	<div class="align-center">
		<br>
		<h2>[${trv_board.trv_title}]</h2>
		<c:if test="${trv_board.prev > 0}">
		<span><a href="detail.do?board_num=${trv_board.prev}"><b><img src="${pageContext.request.contextPath}/resources/trv_image/left.png" style="max-width:60px"></b></a></span>
		</c:if>
		<span>작성자   ${trv_board.mem_num} |  수정일 | ${trv_board.trv_date}</span>
		<c:if test="${trv_board.next > 0}">
		<span><a href="detail.do?board_num=${trv_board.next}"><b><img src="${pageContext.request.contextPath}/resources/trv_image/arrow.png" style="max-width:60px"></b></a></span>
		<a href="http://localhost:8080/ysnj/travel/list.do"><img src="${pageContext.request.contextPath}/resources/trv_image/home.png" style="max-width:40px" align="left"></a>	
		</c:if>
	</div>
	
	<br>
	<hr size="1" width="100%">	
	<c:if test="${!empty trv_board.trv_filename1}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=1" style="max-width:800px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename2}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=2" style="max-width:800px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename3}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=3" style="max-width:800px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename4}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=4" style="max-width:800px">
	</div>
	</c:if>
	<c:if test="${!empty trv_board.trv_filename5}">
	<div class="align-center">
		<img src="imageView.do?trv_num=${trv_board.trv_num}&trv_idx=5" style="max-width:800px">
	</div>
	</c:if>
	<br>
	<ul>
		<li><p><img src="${pageContext.request.contextPath}/resources/trv_image/cate.png" style="max-width:40px">분류 : ${trv_board.trv_title}</p></li>
		<li><p><img src="${pageContext.request.contextPath}/resources/trv_image/local.png" style="max-width:40px">지역 : ${trv_board.trv_local}</p></li>	
		<li><p><img src="${pageContext.request.contextPath}/resources/trv_image/place.png" style="max-width:40px">주소 : ${trv_board.trv_place}</p></li>	
		<li><p><img src="${pageContext.request.contextPath}/resources/trv_image/call.png" style="max-width:40px">문의전화 : ${trv_board.trv_call}</p></li>	
	</ul>
	<br>
	<div class="align-center">
	<h2>소개글</h2>
	${trv_board.trv_intro}
	</div>
	<hr size="1" width="100%">
	<div class="align-right">
		 <c:if test="${!empty user_num && user_num == trvboard.mem_num}"> 
		<input type="button" value="수정" onclick="location.href='update.do?trv_num=${trv_board.trv_num}'">
		<input type="button" value="삭제" id="delete_btn">
		</c:if>
		<input type="button" value="목록으로" onclick="location.href='list.do'">
	</div>
	<br>
</div>

<!-- 중앙 컨텐츠 끝 -->