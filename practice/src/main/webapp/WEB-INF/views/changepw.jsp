<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" %>

<html>
<head>
	<title>회원가입</title>
	<jsp:include page="css.jsp"></jsp:include> 
</head>
<body>
<div class="container">
	<div class="header ">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	<div class="body">
		<form:form action="changepw.do" method="post" modelAttribute="vo" id="form">
		<form:input path="email" type="hidden"/>
			<h1>비밀번호 변경</h1>
			<hr />
			<c:if test="${sessionScope._changecode == 0 }">
			비밀번호 변경을 위해 현재 비밀번호를 입력해주세요
				
			<div class="form-inline" style="margin-top:10px;">
				<label style="width:100px;">비밀번호 입력</label>	
				<form:input type="password" id="pw" name="pw" path="pw" placeholder="비밀번호 입력" class="form-control"/>
			</div>
			
			<input type="submit" value="확인" class="btn btn-primary"/>
			</c:if>
			<c:if test="${sessionScope._changecode == 1 }">
				<div class="form-inline" style="margin-top:10px;">
				<label style="width:130px;">비밀번호 입력</label>	
				<form:input type="password" id="pw" name="pw" path="pw" placeholder="비밀번호 입력" class="form-control"/>
				</div>
				<div class="form-inline" style="margin-top:10px;">
				<label style="width:130px;">비밀번호 재입력</label>	
				<input type="password" id="pw1" name="pw1"placeholder="비밀번호 재입력" class="form-control"/>
				</div>
			
				<input type="submit" value="확인" class="btn btn-primary"/>
			</c:if>
		</form:form>
	</div>
</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="resources/js/localization/messages_ko.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<script>
		$(function(){			
			$('#form').validate({
				submitHandler:function(){
					return true;
				},
				rules:{
					pw:{
						required:true
					},
					pw1:{
						required:true,
						equalTo:pw
					}
				},
				messages:{
					pw:{
						required:'암호를 입력하세요'
					},
					pw1:{
						required:'암호를 입력하세요',
						equalTo:'비밀번호가 일치하지 않습니다.'
					}
				}
			});
		})
	</script>
</body>
</html>
