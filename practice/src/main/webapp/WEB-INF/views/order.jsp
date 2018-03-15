<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true" %>
<html>
<head>
	<title>주문</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	
		<div class="header">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
		<div class="body" >
		<section class="sec1"></section>
		<section class="content">
		<div class="container">
		<div style="height:80px;"></div>
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
							<td><label class="price"><fmt:formatNumber value="${i.order_price }" pattern="#,###"/></label> 원</td>
							<td><label class="total"><fmt:formatNumber value="${i.order_price * i.qty }" pattern="#,###"/></label> 원</td>
						
						<td align="center">
							${i.state_title }
							
						</td>
					</tr>				
				</c:forEach>
			</table>
			</div>
			</section>
		</div>
	<footer class="container-fluid text-center bg-lightgray">

        <div class="copyrights" style="margin-top:25px;">
            <p>Mossy City © 2016, All Rights Reserved
                <br>
                <span>Web Design By: Mike Clark</span></p>
            <p><a href="https://www.linkedin.com/in/michael-clark-webdeveloper" target="_blank">Linkedin <i class="fa fa-linkedin-square" aria-hidden="true"></i> </a></p>
        </div>
</footer>
	
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

			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$('nav').addClass('black');
				} else {
					$('nav').removeClass('black');
				}
			});
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
