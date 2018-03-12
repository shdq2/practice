<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" %>

<html>
<head>
	<title>회원탈퇴</title>
	<jsp:include page="css.jsp"></jsp:include> 
</head>
<body>
<div class="container">
	<div class="header ">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	<div class="body">
		<form:form action="memberdelete.do" method="post" modelAttribute="vo" id="form">
			<h1>회원 탈퇴</h1>
			<hr />
			<form:input type="hidden" path="email" />
			회원 탈퇴를 하시려면 비밀번호를 입력하세요
			
			<div class="form-inline" style="margin-top:10px;">
				<label style="width:100px;">비밀번호 입력</label>
				<form:input type="password" id="pw" name="pw" path="pw" placeholder="비밀번호 입력" class="form-control" value=""/>
			</div>
			
			<input type="button" value="회원탈퇴" class="btn btn-primary" id="delete"/>
		</form:form>
	</div>
</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){
			$('#delete').click(function(){
				var pw = $('#pw').val();
				$.get('json_delete.do?pw='+pw,function(data){
					console.log(data.ret);
					if(data.ret == 1){
						swal({			
							title:"회원 탈퇴",
							text:"회원을 탈퇴하고 나면 복구할 수 없습니다. 회원을 탈퇴하시려면 지금 삭제를 입력하세요",
							content:{
								element:"input",
								attributes:{
									placeholder:"지금삭제 입력",
									type:"text",
								},
							},
							button:{
								text:"확인"
							}
						})
						.then((value) => {
							if(value=="지금삭제"){
								$('#form').submit();
							}else{
								swal("입력 문자가 옳지 않습니다");
							}
						})
					}else{
						swal("비밀번호가 옳지 않습니다");
					}
				})				
			})
		})
	</script>
</body>
</html>
