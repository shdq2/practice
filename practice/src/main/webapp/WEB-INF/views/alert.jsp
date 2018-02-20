<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css" />
</head>
<body>


	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script>
		$(function(){
			var ret = "${ret}";
			if(ret == "n"){
				swal({
					  title: "${msg}",
					  icon: "warning",
					  button: "돌아가기",
					  dangerMode: true
					}).then((data) => {
						window.location.href="${url}";					
					});
			}
			else{
				swal({
				 title: "${msg}",
				  icon: "success",
				  button: "확인"
				}).then((data) => {
					window.location.href="${url}";					
				});
			}
		});
	</script>
</body>
</html>
