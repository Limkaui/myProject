<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="title_trv_board" value="여행지 추천" scope="request"/>
<!-- 상단 시작 -->
<div class="wrap">
			<div class="container">
				<div class="row justify-content-between">
						<div class="col d-flex align-items-center">
							<p class="mb-0 phone"><span class="mailus">Phone no:</span> <a href="#">02-1234-5678</a> or <span class="mailus">email us:</span> <a href="#">YSNJ@email.com</a></p>
						</div>
						<div class="col d-flex justify-content-end">
							<div class="social-media">
				    		<p class="mb-0 d-flex">
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
				    		</p>
			        </div>
						</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	<a class="navbar-brand" href="${pageContext.request.contextPath}/main/main.do">여기서<span>놀자!!</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/main/main.do" class="nav-link">Home</a></li>
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/accommdation/acc_list.do" class="nav-link">숙소보기</a></li>
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/review/list.do" class="nav-link">숙소리뷰</a></li>
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/notice/list.do" class="nav-link">공지사항</a></li>
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/qna/list.do" class="nav-link">Q&A</a></li>
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/travel/list.do" class="nav-link">여행지추천</a></li>
	          <c:if test="${!empty user_num and user_type>=3 and user_type<=4}">
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/accommdation/list.do" class="nav-link">숙소관리</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/point/list.do" class="nav-link">포인트관리</a></li>
			 </c:if>
			 <c:if test="${!empty user_num}">
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/logout.do" class="nav-link">[<span class="user_name">${user_id}</span>]로그아웃</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/myPage.do" class="nav-link">MyPage</a></li>
			 </c:if>
	          <c:if test="${empty user_num}">
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/registerUser.do" class="nav-link">회원가입</a></li>
	          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/login.do" class="nav-link">로그인</a></li>
			 </c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
<!-- 상단 끝 -->
  



