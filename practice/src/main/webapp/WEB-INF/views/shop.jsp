<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div class="body">
	
		<div class="w3-row-padding">
			<c:forEach var="i" items="${list}" varStatus="j">
				<c:if test="${i.qty >0 }">
				<div class="w3-third" style="margin-top:10px;">
					<form:form action="cart.do" method="post" modelAttribute="cvo" class="form">
					
					<div class="jrolling_${j.index}" style="width:100%;height:20%">
					
						<c:set var="sitem" value="${fn:split(index,',') }" ></c:set>
						<c:if test="${i.tot >0 }">
							<c:forEach var="x" items="${sitem}">
								<img src="shop_img.do?code=${i.no }&img=${x}" style="width:100%;height:100%"/>
							</c:forEach>
						</c:if>
						<c:if test="${i.tot ==0 }">
							<img src="resources/img/default.jpg" style="width:100%;height:100%"/>
						</c:if>
						
					</div>
						
							<div style="border:1px solid #cccccc;padding:10px;width:217px;">
								<form:input type="hidden" path = "no" value="${cvo.no }" class="no"/>
								<label>${i.name }</label>
								<form:input type="hidden" path = "item_no" value="${i.no }" class="item_no"/>
								<h5><fmt:formatNumber value="${i.price }" pattern="#,###"/> 원</h5>
								<p>
									<form:select class="w3-select cnt" path="qty">
										<c:forEach var="j" begin="1" end="${i.qty }">
											<option value="${j}" >${j }</option>
										</c:forEach>
									</form:select>
								</p>
								<div align="center">
									<a href="#" id="cart" class="w3-button w3-black w3-tiny btn_cart" >장바구니</a>
									<a href="shopdetail.do?no=${i.no }" class="w3-button w3-black w3-tiny" >자세히보기</a>
							</div>
						</div>
						</form:form>
					</div>
					</c:if>
					<c:if test="${i.qty == 0 }">
					<div class="w3-third" style="margin-top:10px;">
					<form:form action="cart.do" method="post" modelAttribute="cvo" class="form">
					
					<div class="jrolling_${j.index}" style="width:100%;height:20%">
					
						<c:set var="sitem" value="${fn:split(index,',') }" ></c:set>
						<c:if test="${i.tot >0 }">
							<c:forEach var="x" items="${sitem}">
								<img src="shop_img.do?code=${i.no }&img=${x}" style="width:100%;height:100%"/>
							</c:forEach>
						</c:if>
						<c:if test="${i.tot ==0 }">
							<img src="resources/img/default.jpg" style="width:100%;height:100%"/>
						</c:if>
						
					</div>
						
							<div style="border:1px solid #cccccc;padding:10px;width:217px">
								<form:input type="hidden" path = "no" value="${cvo.no }" class="no"/>
								<label style="text-decoration:line-through">${i.name }</label> 판매완료 
								<form:input type="hidden" path = "item_no" value="${i.no }" class="item_no"/>
								<h5 style="text-decoration:line-through"><fmt:formatNumber value="${i.price }" pattern="#,###"/> 원</h5>
								
								<p>
									<form:select class="w3-select cnt" path="qty" disabled="true">
										<c:forEach var="j" begin="1" end="${i.qty }">
											<option value="${j}" >${j }</option>
										</c:forEach>
									</form:select>
								</p>
								<div align="center">
									<a href="#" id="cart" class="w3-button w3-black w3-tiny btn_cart w3-disabled" >장바구니</a>
									<a href="shopdetail.do?no=${i.no }" class="w3-button w3-black w3-tiny w3-disabled" >자세히보기</a>
							</div>
						</div>
						</form:form>
					</div>
					</c:if>
			</c:forEach>
		</div>
		
	</div>
</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.syaku.rolling.js"></script>
	<script>
		$(function(){
			var i=0
			$('.form').each(function(){
				var idx=$(this).index('.form');
				$('.jrolling_'+i).jrolling({
					'items': '.jrolling_'+i+' img',
					'width' :'217px',
					'height' : '100%',
				    'move': 'left',
				    'auto': true,
				    'frame':1300
				});
				i=i+1;
			})
			$('#search').keyup(function(data){
				if(data.which == 13){
					var search_data = $(this).val();
					window.location.href="boardListSearch.do?data="+search_data;
				}
			});
			
			$('.btn_cart').click(function(){
				var idx = $(this).index('.btn_cart');
				$('.form').eq(idx).submit();
			})
		})
	</script>
</body>
</html>
