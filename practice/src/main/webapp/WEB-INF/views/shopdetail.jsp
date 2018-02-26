<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
<jsp:include page="css.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/detail.css" />
</head>
<body>
	<div class="container">
		<div class="header">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
	<div class="body" style="margin-bottom:50px;">

		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content" style="width:100%;height:50%" >
						<c:set var="item" value="${fn:split(index,',') }"></c:set>
						<c:if test="${vo.tot >0 }">
						<c:forEach var ="i" items="${item }" varStatus="j">
							<c:if test="${j.index == 0}">
								<div class="tab-pane active" id="pic-${j.count }"><img src="shop_img.do?code=${param.no }&img=${i}" style="width:100%;height:100%"/></div>
							</c:if>
							<c:if test="${j.index != 0 }">
								<div class="tab-pane" id="pic-${j.count}"><img src="shop_img.do?code=${vo.no }&img=${i}" style="width:100%;height:100%"/></div>
							</c:if>
						</c:forEach>
						</c:if>
						<c:if test="${vo.tot == 0 }">
							<div class="tab-pane active" id="pic-${j.count}"><img src="resources/img/default.jpg" style="width:100%;height:100%"/></div>
						</c:if>
						  
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						<c:if test="${vo.tot > 0 }">
							<c:forEach var="i" items="${item }" varStatus="j">
								<li><a data-target="#pic-${j.count }" data-toggle="tab"><img src="shop_img.do?code=${vo.no }&img=${i}" /></a></li>
							</c:forEach>
						</c:if>
						</ul>
						
					</div>
					<form:form action="cart.do" method="post" modelAttribute="cvo">
					<div class="details col-md-6">
						<h3 class="product-title">${vo.name }</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description">${vo.content }</p>
						<h4 class="price">가격: <span>$${vo.price }</span></h4>
								<form:input type="hidden" path="no"/>
								<form:input type="hidden" path="item_no" value="${param.no }"/>
								<div class="form-inline">
								<h4 class="qty">
									갯수:
									<form:select class="form-control cnt" path="qty">
										<c:forEach var="j" begin="1" end="${vo.qty }">
											<option value="${j}">${j }</option>
										</c:forEach>
									</form:select>
									</h4>
									</div>
								
								<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<!-- <h5 class="sizes">sizes:
							<span class="size" data-toggle="tooltip" title="small">s</span>
							<span class="size" data-toggle="tooltip" title="medium">m</span>
							<span class="size" data-toggle="tooltip" title="large">l</span>
							<span class="size" data-toggle="tooltip" title="xtra large">xl</span>
						</h5>
						<h5 class="colors">colors:
							<span class="color orange not-available" data-toggle="tooltip" title="Not In store"></span>
							<span class="color green"></span>
							<span class="color blue"></span>
						</h5> -->
						<div class="action">
							<button class="add-to-cart btn btn-default" type="submit">장바구니에 담기</button>
						</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="resources/js/jquery.syaku.rolling.js"></script>
	<script>
		$(function() {
				$('.jrolling').jrolling({
					'items': '.jrolling div',
					'width' :'100%',
					'height' : '100%',
				    'move': 'left',
				    'auto': true,
				    'frame':1300
				});
			
			$('#search').keyup(
					function(data) {
						if (data.which == 13) {
							var search_data = $(this).val();
							window.location.href = "boardListSearch.do?data="
									+ search_data;
						}
					});

			$('.btn_cart').click(function() {
				var idx = $(this).index('.form');
				$('.form').eq(idx).submit();
			})
			$("ul.menu-items > li").on("click", function() {
				$("ul.menu-items > li").removeClass("active");
				$(this).addClass("active");
			})

			$(".attr,.attr2").on("click", function() {
				var clase = $(this).attr("class");

				$("." + clase).removeClass("active");
				$(this).addClass("active");
			})

			 var quantity = 1;

	        $('.quantity-right-plus').click(function(e){
	            e.preventDefault();
	            var quantity = parseInt($('#quantity').val());
	            $('#quantity').val(quantity + 1);
	        });

	        $('.quantity-left-minus').click(function(e){
	            e.preventDefault();
	            var quantity = parseInt($('#quantity').val());
	            if(quantity > 1){
	                $('#quantity').val(quantity - 1);
	            }
	        });
		})
	</script>
</body>
</html>
