<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="body" >
			<table class="table" style="min-height:200px; border:1px solid #ddd !important">
				<tr style="height:40px">
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>단가</th>
					<th>합계</th>
					<th>주문상태</th>
				</tr>
				
				<c:forEach var="i" items="${list}">
					<tr>
						<td><img src="resources/img/default.jpg" style="width:70px; height:70px" /></td>
						
						<td>${i.name}<br />${i.content}</td>
						<td>${i.qty }</td>
						<td><label class="price"><fmt:formatNumber value="${i.price }" pattern="#,###"/></label> 원</td>
						<td><label class="total"><fmt:formatNumber value="${i.price * i.qty }" pattern="#,###"/></label> 원</td>
						
						<td align="center">
							주문완료
							
						</td>
					</tr>				
				</c:forEach>
			</table>
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
