<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>안내</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
<style type="text/css">

.one-page #h_2{
	color: #fd7792;
	text-align:center
}

.one-page #bts{
	color: white;
	font-family: sans-serif;
	background: #fd7792;
	border:none;
	font-size:15px;
	cursor:pointer;
}
</style>

</head>
<body>
<div class="one-page">
	<h2 id="h_2">안내</h2>
	<div class="result-display">
		잘못된 접속입니다.<br><br><br>
		<input type="button" id="bts" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
	</div>
</div>
</body>
</html>