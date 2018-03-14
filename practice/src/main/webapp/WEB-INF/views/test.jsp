<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" href="resources/css/menu.css" />
	<link rel="stylesheet" href="resources/css/item.css" /> 
</head>
<body>
		<div style="border:1px solid;height:25px;background-color:black;text-align:right;width:100%">
			<div class="container">
				<a href="#" ><span style="color:white;font-family:sans-serif;font-weight:bold">로그인&nbsp;&nbsp;</span></a>
				<a href="#" ><span style="color:white;font-family:sans-serif;font-weight:bold">회원가입&nbsp;&nbsp;</span></a>
				<a href="#" ><span style="color:white;font-family:sans-serif;font-weight:bold">마이페이지&nbsp;&nbsp;</span></a>
				<a href="#" ><span style="color:white;font-family:sans-serif;font-weight:bold">고객센터&nbsp;</span></a>
			</div>			
		</div><div class="container">
	<nav>
		
			<div class="logo">
				<img src="https://www.dragoninfosec.com/wp-content/uploads/2016/05/cropped-Dragon_IT_Security1-1.png">
			</div>
	
			<ul>
				<li><a href="#" class="active">Home</a></li>
				<c:forEach var="i" items="${clist }">
				<li><a href="#">${i.name_code }</a></li>
				</c:forEach>
				<li><a href="#">Contact</a></li>
			</ul>
		
	</nav>
	
	<section class="sec1"></section>
	<section class="content">
	<div class="row">
		<c:forEach var="i" items="${list }">
		<form:form action="cart.do" method="post" modelAttribute="cvo" class="form">
		<div class="col-md-4" style="margin-top:15px;">
           <div class="card">
                <div class="card-img" style="height:300px" >                    
                    <c:set var="sitem" value="${fn:split(index,',') }" ></c:set>
							<c:if test="${i.tot >0 }">
								<c:forEach var="x" items="${sitem}" end="0">
									<img class="img-responsive" src="shop_img.do?code=${i.no }&img=${x}" style="width:100%; height: 300px"/>
								</c:forEach>
							</c:if>
							<c:if test="${i.tot ==0 }">
								<img class="img-responsive" src="resources/img/default.jpg" style="width:100%;height: 300px"/>
							</c:if>
                </div>
                <div class="card-block">
                <div class="card-title">
                    <h4><a href="shopdetail.do?no=${i.no }">${i.name }</a> <c:if test="${i.sales != 0 }"><label style="color:red"> ${i.sales } % 세일!!</label> </c:if> </h4>
                </div>
                <div class="card-text">
                    <p>
                    <c:set var="leng" value="${fn:length(i.content) }" />
                    <c:if test="${leng ge 40}">${fn:substring(i.content,0,20) }...</c:if>
                    <c:if test="${leng lt 40}">${i.content}</c:if>
                    </p>
                </div>
                <div class="card-icons">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                </div>
                <hr>
            <div class="card-footer">
                <ul class="list-inline">
					<li><a href="#"><i class="fa fa-map-marker"><form:input type="hidden" path = "no" value="${cvo.no }" class="no"/>
					<form:input type="hidden" path = "item_no" value="${i.no }" class="item_no"/>
					</i>
					
					<c:if test="${i.sales == 0 }">
					<h5>
					<fmt:formatNumber value="${i.price }" pattern="#,###" />원
					</h5>
					</c:if> <c:if test="${i.sales != 0 }">
					<h5>
					<label style="text-decoration: line-through">
					<fmt:formatNumber value="${i.price }" pattern="#,###" /> 원</label> ==>
					<fmt:formatNumber value="${i.sales_price }"	pattern="#,###" /> 원
					</h5>
					</c:if></a></li>
					<li class="pull-right out-border"><a href="#" class="btn_cart"><i
					class="fa fa-heart"></i> Add to Wishlist</a></li>
					</ul>
            </div>
                </div>
            </div>
        </div>
        </form:form>
        </c:forEach>
        </div>
	</section>
	</div>
	<section class="sec2"></section>
	<section class="content">
		<h1>Where does it come from?</h1>
		<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

		The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>
	</section>
	<section class="sec3"></section>
	<section class="content">
	<div>
		<h1>Where does it come from?</h1>
		<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

		The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>
		</div>
	</section>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(window).on('scroll', function(){
			if($(window).scrollTop()){
				$('nav').addClass('black');
			}
			else
			{
				$('nav').removeClass('black');	
			}
		});
	</script>
</body>
</html>
