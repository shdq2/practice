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
	
		<div class="w3-row-padding">
			<c:forEach var="i" items="${list}">
				
					<div class="w3-third" style="margin-top:10px;">
					<form:form action="cart.do" method="post" modelAttribute="cvo" id="form">
						<img src="resources/img/default.jpg" style="width:100%; height:20%" />
							<div style="border:1px solid #cccccc;padding:10px">
								<form:input type="hidden" path = "no" value="${cvo.no }"/>
								<h5>${i.name }</h5>
								<form:input type="hidden" path = "item_no" value="${i.no }"/>
								<p>${i.price } 원</p>
								<form:input type="hidden" path = "member_email" value="${sessionScope._mvo.email }"/>
								<p>
									<form:select class="w3-select cnt" path="qty">
										<c:forEach var="j" begin="1" end="${i.qty }">
											<option value="${j}" >${j }</option>
										</c:forEach>
									</form:select>
								</p>
								<div align="center">
										<a href="#" id="cart" class="w3-button w3-black w3-tiny btn_cart" >장바구니</a>
										<a href="#" id="order" class="w3-button w3-black w3-tiny item_order">주문하기</a>
							</div>
						</div>
						</form:form>
					</div>
				
			</c:forEach>
		</div>
		
	</div>
</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){
			$('#search').keyup(function(data){
				if(data.which == 13){
					var search_data = $(this).val();
					window.location.href="boardListSearch.do?data="+search_data;
				}
			});
			
			$('#cart').click(function(){
				$('#form').submit();
			})
		})
	</script>
</body>
</html>
