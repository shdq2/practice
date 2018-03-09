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
		</div>
		<div class="body" >
			<table class="table" style="min-height:200px; border:1px solid #ddd !important">
				<tr style="height:40px">
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>가격</th>
					<th>합계</th>
					<th>주문상태</th>
				</tr>
				
				<c:forEach var="i" items="${list}">
					<tr>
						<td>
							<c:set var="sitem" value="${fn:split(index,',') }"/>
							<c:forEach var="img" items="${sitem }" varStatus="idx">
								<c:if test="${idx.first }">
									<img src="shop_img.do?code=${i.item_no }&img=${img}" style="width:80px;height:80px;"/>
								</c:if>
							</c:forEach>
						</td>
						
						<td><h4>${i.name} <c:if test="${i.sales != 0 }"><br /> <label style="color:red">!! ${i.sales }% 할인 상품 !!</label></c:if></h4><label class="text">${i.content}</label></td>
						<td>${i.qty }</td>
						
						<c:if test="${i.sales == 0 }">
							<td><label class="price"><fmt:formatNumber value="${i.price }" pattern="#,###"/></label> 원</td>
							<td><label class="total"><fmt:formatNumber value="${i.price * i.qty }" pattern="#,###"/></label> 원</td>
						</c:if>
						<c:if test="${i.sales != 0 }">
							<td>
								<label style="text-decoration: line-through"><fmt:formatNumber value="${i.price }" pattern="#,###"/></label>원 <br />
								<label class="price"><fmt:formatNumber value="${i.sales_price }" pattern="#,###"/></label> 원
							</td>
							<td><label class="total"><fmt:formatNumber value="${i.sales_price * i.qty }" pattern="#,###"/></label> 원</td>
						</c:if>
						<td align="center">
							${i.state_title }
							
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
			var i =0;
			$('.text').each(function(){
				var txt = $('.text').eq(i).text();
				if(txt.length >17){
					$('.text').eq(i).text(txt.substring(0,17)+"...");
				}
				i++;
			})
			
		});
		
	</script>
</body>
</html>
