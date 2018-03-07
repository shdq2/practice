<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<h1>1:1 문의하기</h1>
		</div>
		
		<div class="body" >
			<table class="table" style="min-height:200px;">
				<tr style="height:40px">
					<th>글번호</th>
					<th>제목</th>
					<th>문의일</th>
					<th>답변여부</th>
				</tr>
				<c:forEach var="i" items="${list }">
					<tr>
						<td>${i.one_no }</td>
						<td><a href="onetooneanswer.do?no=${i.one_no}">${i.one_title }</a></td>
						<td>${i.one_date1 }</td>
						<td>
							<c:if test="${i.one_ret eq 0}" >답변 미완료</c:if>
							<c:if test="${i.one_ret eq 1}" >답변 완료</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<a href="onetoonew.do" class="btn btn-success">글쓰기</a>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script>
	var numberformat = function(num){
		var str;
		
		num = num+"";
		var len = num.length;
		var idx = num.length%3;
		str = num.substring(0,idx);
		while(idx<len){
			if(str != ""){
				str+=",";
			}
			str+= num.substring(idx,idx+3);
			idx+=3;
		}
		return str;
	}

		$(function(){
			
		});
		
	</script>
</body>
</html>
