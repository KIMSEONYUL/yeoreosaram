<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib2.jsp" %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%-- <title><spring:eval expression="@env['site.title']" /></title>
 --%>
 <head>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- Favicons -->
  <link href="/resources/images/favicon3.png" rel="icon">

  <!-- Google Fonts -->
  <!-- <link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet"> -->

  <!-- Vendor CSS Files -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="/resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/css/style.css" rel="stylesheet">
  	<!--font 수정 -->
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	</style>
  
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>

  <!-- ======= 달력 팝업 ======= -->
<script>
	function popup(){
	       var url = "/calendar/calendar.jsp";
	       var name = "popup test";
	       var option = "width = 500, height = 300, top = 100, left = 200, location = no"
	       window.open(url, name, option);
	  }
	$(document).ready(function() {
	    // console.log( "ready!" );
	});
</script>
</head>

<body>
  <!-- Vendor JS Files -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/vendor/php-email-form/validate.js"></script>
  <script src="/resources/vendor/aos/aos.js"></script>
  <script src="/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>

  
  <!— Template Main JS File —>
  <script src="/resources/js/main.js"></script>
</body>