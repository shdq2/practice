<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html>
<head>
<title>마켓</title>
<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
			<div class="header">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
		<section class="sec1"></section>
		<section class="content">
			<div class="container">
				<div class="row">
				<h3 style="height:10px;"></h3>
				<c:if test="${!empty list }">
					<c:forEach var="i" items="${list }" varStatus="c">
						<c:if test="${i.qty > 0 }">
							<form:form action="cart.do" method="post" modelAttribute="cvo"
								class="form">
								<div class="col-xs-12 col-sm-6 col-md-4" style="margin-top:15px;">
									<div class="card">
										<div class="card-img" style="height: 300px">
											<c:set var="sitem" value="${fn:split(index,',') }"></c:set>
											<c:if test="${i.tot >0 }">
												<c:forEach var="x" items="${sitem}" end="0">
													<img class="img-responsive"
														src="shop_img.do?code=${i.no }&img=${x}"
														style="width: 100%; height: 300px" />
												</c:forEach>
											</c:if>
											<c:if test="${i.tot ==0 }">
												<img class="img-responsive" src="resources/img/default.jpg"
													style="width: 100%; height: 300px" />
											</c:if>
										</div>
										<div class="card-block">
											<div class="card-title">
												<h4>
													<label><a href="shopdetail.do?no=${i.no }">${i.name }</a></label>
													<c:if test="${i.sales != 0 }">
														<label style="color: red"> ${i.sales } % 세일!!</label>
													</c:if>
												</h4>
											</div>
											<div class="card-text" style="height:60px;">
												<p>
													<c:set var="leng" value="${fn:length(i.content) }" />
													<c:if test="${leng ge 40}">${fn:substring(i.content,0,20) }...</c:if>
													<c:if test="${leng lt 40}">${i.content}</c:if>
												</p>
												수량 : <form:select class="w3-select cnt" path="qty"
															style="width:100px;">
															<c:forEach var="j" begin="1" end="${i.qty }">
																<option value="${j}">${j }</option>
															</c:forEach>
														</form:select> 
											</div>
											
											<hr>
											<div class="card-footer" style="">
												<ul class="list-inline">
													<li style="width:100%"><a href="#"><form:input
																	type="hidden" path="no" value="${cvo.no }" class="no" />
																<form:input type="hidden" path="item_no"
																	value="${i.no }" class="item_no" /> <c:if
																test="${i.sales == 0 }">
																<h5>
																	<label>
																	<fmt:formatNumber value="${i.price }" pattern="#,###" />
																	원
																	</label>
																	<label style="float:right"><a href="#" class="pull-right out-border btn_cart">장바구니에 추가하기</a></label>
																</h5>
															</c:if> <c:if test="${i.sales != 0 }">
																<h5>
																	<label style="text-decoration: line-through"> <fmt:formatNumber
																			value="${i.price }" pattern="#,###" /> 원
																	</label> ==>
																	<fmt:formatNumber value="${i.sales_price }"
																		pattern="#,###" />
																	원
																	<label style="float:right"><a href="#" class="pull-right out-border btn_cart">장바구니에 추가하기</a></label>
																</h5>
															</c:if></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</form:form>
						</c:if>
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<label style="width:100%;text-align: center">판매중인 물품이 없습니다</label>
					</c:if>
				</div>
			</div>
		</section>

<footer class="container-fluid text-center bg-lightgray">

        <div class="copyrights" style="margin-top:25px;">
            <p>Mossy City © 2016, All Rights Reserved
                <br>
                <span>Web Design By: Mike Clark</span></p>
            <p><a href="https://www.linkedin.com/in/michael-clark-webdeveloper" target="_blank">Linkedin <i class="fa fa-linkedin-square" aria-hidden="true"></i> </a></p>
        </div>
</footer>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript"
		src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="resources/js/jquery.syaku.rolling.js"></script>
		<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="resources/js/login.js"></script>
	<script>
		$(function() {
			var size = ${size};
			console.log(size);
			for(var i=1;i<=size;i++){
				if(${param.code} == i){
					$('#menu_'+i).addClass("active");
				}else{
					$('#menu_'+i).removeClass("active");
				}
			}
			
			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$('nav').addClass('black');
				} else {
					$('nav').removeClass('black');
				}
			});
			var i = 0
			$('.form').each(function() {
				var idx = $(this).index('.form');
				$('.jrolling_' + i).jrolling({
					'items' : '.jrolling_' + i + ' img',
					'width' : '217px',
					'height' : '100%',
					'move' : 'left',
					'auto' : true,
					'frame' : 1300
				});
				i = i + 1;
			})
			$('#search').keyup(
					function(data) {
						if (data.which == 13) {
							var search_data = $(this).val();
							window.location.href = "boardListSearch.do?data="
									+ search_data;
						}
					});

			$('.btn_cart').click(function() {
				var idx = $(this).index('.btn_cart');
				$('.form').eq(idx).submit();
			})
		})
	</script>
</body>
</html>
