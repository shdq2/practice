<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<div class="header">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
		<div id="jrolling" style="border:1px solid #ccc"></div>

</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.syaku.rolling.js"></script>
<script>
$(function(){
	$('#jrolling').jrolling({
	    'items': ['이벤트1','이벤트2','이벤트3'],
	    'width': '600px',
	    'height': '150px',
	    'move': 'left',
	    'auto': false,
	    'frame':1300
	});
	$('._menu').click(function(){
		var idx=$('._menu').index(this);
		var value= $('._menu').eq(idx).val();
		window.location.href="shop.do?frame="+value;
	})
})
	
</script>
</body>
</html>
