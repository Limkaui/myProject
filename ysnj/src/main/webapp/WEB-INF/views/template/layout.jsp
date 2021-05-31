<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Vacation Rental - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/jquery.timepicker.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template_res/css/style.css">
  	
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/layout.css">
  </head>
  <body>
	<tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="header_content"/>
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
    
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/template_res/js/main.js"></script>

  </body>
</html>