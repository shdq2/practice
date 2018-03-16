<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<html>
<head>
	<title>1:1문의</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	
		<div class="header">
			<jsp:include page="menu.jsp"></jsp:include>
			<h1>1:1 문의하기</h1>
		</div>
		
		<div class="body" >
			<section class="sec1"></section>
			<section class="content">
			<div class="container">
			<form:form action="onetoonew.do" method="post" enctype="multipart/form-data" modelAttribute="ovo">
				<table class="table" style="margin:0px auto;padding-top:10px;">
					<tr>
						<td style="width:20%;"><label style="text-align:center;"><form:input type="hidden" path="one_no" />제목</label></td>
						<td ><form:input type="text" class="form-control" path="one_title"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">내용</label></td>
						<td ><form:textarea rows="6" style="width:100%;resize:none;" class="form-control" path="one_content"></form:textarea></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">작성자</label></td>
						<td >
							<form:input type="text" class="form-control" path="writer_name" readonly="true"/>
							<form:input type="hidden" class="form-control" path="one_writer" readonly="true"/>
						</td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">첨부이미지</label></td>
						<td ><input type="file" name="img"/></td>
					</tr>
					
				</table>
					<input type="submit" value="문의하기" class="btn btn-success"/>
			</form:form>
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
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="resources/js/login.js"></script>
	<script>
		$(function(){
			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$('nav').addClass('black');
				} else {
					$('nav').removeClass('black');
				}
			});
		})
	</script>
</body>
</html>


