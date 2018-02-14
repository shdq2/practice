<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
		<div class="body">
			<table class="table">
				<tr>
					<th><input type="checkbox" id="checkboxall"/></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>단가</th>
					<th>합계</th>
					<th>주문</th>
				</tr>
				
				<c:forEach var="i" items="${list}">
					<tr>
						<td><input type="checkbox" class="chk[]"/></td>
						<td><img src="resources/img/default.jpg" style="width:70px; height:70px" /></td>
						<td>${i.name}</td>
						<td>
						<select class="qty">
							<c:forEach var="j" begin="1" end="${i.qty }">
								<option <c:if test="${j eq i.qty }">selected</c:if>>${j}</option>
							</c:forEach>	
						</select>
						
						</td>
						<td><label class="price">${i.price }</label> 원</td>
						<td><label class="total">${i.price * i.qty }</label> 원</td>
						<td>test</td>
					</tr>				
				</c:forEach>
			</table>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){			
			$('.qty').click(function(){
				var idx = $(this).index('.qty');
				var price = $('.price').eq(idx).text();
				var qty=$('.qty').eq(idx).val();
				var total = price*qty;
				$('.total').eq(idx).text(total);
			})
		});
		
	</script>
</body>
</html>
