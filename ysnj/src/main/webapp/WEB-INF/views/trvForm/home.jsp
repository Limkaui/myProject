<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행지 추천소</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/travel.css" type="text/css">
</head>
<body>
<div class="top_wrap clearfix">
	<h2><a onclick="location.href='main.do'">여기서 놀자</a></h2>
	<div class="top_right_box">
		<img src="${pageContext.request.contextPath}/resources/image/menu.JPG">
	</div>
</div>
<div class="visu_wrap visusub_02"></div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<div class="nav_wrap" id="nav_wrap">
	<div class="guide">
		<ul class="navigation">
		<hr>
			<li><a><img src="${pageContext.request.contextPath}/resources/image/home.JPG" width="20px" height="20px" onclick="location.href='main.do'"></a></li>		
		</ul>
		<ul>
			<li><a title="페이스북 공유 새창열기" href="#a" onclick="SnsShare.fbShare(document.location.href); return false;"><img src="${pageContext.request.contextPath}/resources/image/facebook.JPG" alt="페이스북 공유"></a></li>
			<li><a title="트위터 공유 새창열기" href="#a" onclick="SnsShare.twShare(document.location.href); return false;"><img src="${pageContext.request.contextPath}/resources/image/twitter.JPG" alt="트위터 공유"></a></li>
			<li><a title="카카오스토리 공유 새창열기" href="#a" onclick="SnsShare.storyShare(document.location.href); return false;"><img src="${pageContext.request.contextPath}/resources/image/kakaostory.JPG" alt="카카오스토리 공유"></a></li>
		</ul>
	</div>
</div>
<hr>
<div class="sub_tit">
	<h2><a href="장소명"></a></h2>
</div>
</body>
</html>