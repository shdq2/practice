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
					<td>${vo.qna_no }</td>					
				</tr>
				<tr>
					<th>글 제목</th>
					<td>${vo.qna_title }</td>					
				</tr>
				<tr>
					<th>글내용</th>
					<td>${vo.qna_content }</td>					
				</tr>
				<tr>
					<th>작성일</th>
					<td>${vo.qna_date }</td>
				</tr>
			</table>
			<div style="float:left">
				<c:if test="${max != 0 }">
					<a href="qna_detail.do?no=${max }" class="btn btn-info"><</a>
				</c:if>
				<c:if test="${max == 0 }">
					<a href="#" class="btn btn-info disabled"><</a>
				</c:if>
				
			</div>
			<div style="float:right">
				<a href="boardqna.do" class="btn btn-info">목록보기</a>
				
				<c:if test="${min != 0 }">
					<a href="qna_detail.do?no=${min }" class="btn btn-info">></a>
				</c:if>
				<c:if test="${min == 0 }">
					<a href="#" class="btn btn-info disabled">></a>
				</c:if>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	
</body>
</html>
