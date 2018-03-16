<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
		<div class="header ">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	<div class="body">
	<section class="sec1"></section>
	<section class="content">
	<div class="container">
		<div class="row">
		<div style="height:80px;"></div>
		<div class="container"> 
    <hr class="prettyline">
    <br>
    <center>
    <h1><b>죄송합니다</b></h1>
    <h4 style="color:red">로그인이 필요한 서비스 입니다</h4>
    <br>
  <button class="btn btn-primary btn-lg" href="#signup" data-toggle="modal" data-target=".bs-modal-sm">로그인</button>

  	 <a href="join.do" class="btn btn-info btn-lg" >회원가입</a>
  </center>
  <br>
    <hr class="prettyline">
 </div>
 

	</section>
</div>

<footer class="container-fluid text-center bg-lightgray">
        <div class="copyrights" style="margin-top:25px;">
            <p>Mossy City © 2016, All Rights Reserved
                <br>
                <span>Web Design By: Mike Clark</span></p>
            <p><a href="https://www.linkedin.com/in/michael-clark-webdeveloper" target="_blank">Linkedin <i class="fa fa-linkedin-square" aria-hidden="true"></i> </a></p>
        </div>
</footer>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="resources/js/login.js"></script>
	<script>
	$(window).on('scroll', function() {
		if ($(window).scrollTop()) {
			$('nav').addClass('black');
		} else {
			$('nav').removeClass('black');
		}
	});
		$('#userid').focus();
	</script>
</body>
</html>
