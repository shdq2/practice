<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
		<div id="jrolling" style="border:1px solid #ccc"></div>
	<div style="margin-top:20px;">
		 <h2 class="text-center" style="width:100%">할인상품</h2> 
		<div class="w3-row-padding">
		<c:forEach var="i" items="${list }" varStatus="j">
		<div class="w3-third" style="margin-top:10px;">
				<form:form action="cart.do" method="post" modelAttribute="cvo" class="form">
						
						<div class="jrolling1_${j.index}" style="width:100%;height:20%">
						
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
									<label>${i.name } <c:if test="${i.sales != 0 }"><label style="color:red"> ${i.sales } % 세일!!</label> </c:if></label>
									<form:input type="hidden" path = "item_no" value="${i.no }" class="item_no"/>
									<c:if test="${i.sales == 0 }">
										<h5><fmt:formatNumber value="${i.price }" pattern="#,###"/> 원</h5>
									</c:if>
									<c:if test="${i.sales != 0 }">
										<h5><label  style="text-decoration:line-through"><fmt:formatNumber value="${i.price }" pattern="#,###"/> 원</label>  ==> 
										<fmt:formatNumber value="${i.sales_price }" pattern="#,###"/> 원</h5>
									</c:if>
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
		</c:forEach>
	</div>
	
</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.syaku.rolling.js"></script>
<script>
$(function(){
	$('#jrolling').jrolling({
	    'items': ['이벤트1','이벤트2','이벤트3'],
	    'width': '600px',
	    'height': '150px',
	    'move': 'left',
	    'auto': true,
	    'frame':1300
	});
	
	var i=0
	$('.form').each(function(){
		var idx=$(this).index('.form');
		$('.jrolling1_'+i).jrolling({
			'items': '.jrolling1_'+i+' img',
			'width' :'217px',
			'height' : '100%',
		    'move': 'left',
		    'auto': true,
		    'frame':1300
		});
		i=i+1;
	})
	$('._menu').click(function(){
		var idx=$('._menu').index(this);
		var value= $('._menu').eq(idx).val();
		window.location.href="shop.do?frame="+value;
	});
	$('#search').keyup(function(data){
		if(data.which == 13){
			var search_data = $(this).val();
			window.location.href="boardListSearch.do?data="+search_data;
		}
	})
	
	$('.btn_cart').click(function(){
				var idx = $(this).index('.btn_cart');
				$('.form').eq(idx).submit();
			})
})
	
</script>
</body>
</html>
