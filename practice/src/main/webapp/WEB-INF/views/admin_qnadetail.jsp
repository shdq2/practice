<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	<link rel="stylesheet" href="resources/css/admin.css" />
	<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead">
<h1> QnA 목록</h1>
</div>
<hr />

		<div style="margin-top:10px;">
			<table id="table" class="table">
				<tr>
					<th>글번호</th>
					<td>${qvo.qna_no }</td>					
				</tr>
				<tr>
					<th>글 제목</th>
					<td>${qvo.qna_title }</td>					
				</tr>
				<tr>
					<th>글내용</th>
					<td>${qvo.qna_content }</td>					
				</tr>
				<tr>
					<th>작성일</th>
					<td>${qvo.qna_date }</td>
				</tr>
			</table>
			<div style="float:left">
				<a href="admin_qna.do" class="btn btn-info">목록보기</a>
				<a href="qna_edit.do?no=${qvo.qna_no }" class="btn btn-info">수정하기</a>				
			</div>
	</div>
</div>
</div>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
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
