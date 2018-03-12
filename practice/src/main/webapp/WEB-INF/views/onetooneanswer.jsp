<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
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

		<div class="body">

			<table class="table" style="margin: 0px auto; padding-top: 10px;">
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">제목</label></td>
					<td>${ovo.one_title }</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">내용</label></td>
					<td>${ovo.one_content}</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">작성자</label></td>
					<td>${ovo.writer_name }</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">첨부이미지</label></td>
					<td><img src="onetoone_img.do?code=${ovo.one_no }&img=1" style="width:150px;height:150px;"/></td>
				</tr>
			</table>
			<br />
			<hr />
			<br /> 
			<c:if test = "${ovo.one_ret ==0 }">
				<label style="text-align: center;">아직 답변이 달리지 않았습니다</label>
			</c:if>
			<c:if test = "${ovo.one_ret !=0 }">
				<table class="table">
	
					<tr>
						<th style="width: 20%;"><label style="text-align: center;">제목</label></th>
						<th>${ovo.answer_title }</th>
					</tr>
					<tr>
						<td style="width: 20%;"><label style="text-align: center;">답변
							내용</label></td>
						<td>${ovo.answer_content }</td>
					</tr>
					<tr>
						<td style="width: 20%;"><label style="text-align: center;">답변일</label></td>
						<td>${ovo.answer_date }</td>
					</tr>
				</table>
			</c:if>
			<a href="onetoone.do?email=${sessionScope._mvo.email }" class="btn btn-info">뒤로가기</a>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script>
	$(function() {
			
		})
</script>
</body>
</html>