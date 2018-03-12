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
	<div class="container">
		<div class="header">
			<jsp:include page="menu.jsp"></jsp:include>
			<h1>1:1 문의하기</h1>
		</div>
		
		<div class="body" >
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
			</table>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script>
		$(function(){
			$('#collapse2').addClass("in");
		})
	</script>
</body>
</html>


