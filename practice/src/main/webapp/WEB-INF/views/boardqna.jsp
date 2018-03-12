<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>QnA</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="header">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
	
		<div class="body">
			<table id="table" class="table">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				
				<c:forEach var="i" items="${qlist }">
					<tr>
						<td>${i.qna_no }</td>
						<td style="width:70%"><a href="qna_detail.do?no=${i.qna_no}">${i.qna_title }</a></td>
						<td>${i.qna_date }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	
</body>
</html>
