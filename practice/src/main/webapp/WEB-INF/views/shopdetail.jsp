<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<div class="preview col-md-12">
						
						<div class="preview-pic tab-content" style="width:100%;height:50%" >
						<c:set var="item" value="${fn:split(index,',') }"></c:set>
						<c:if test="${vo.tot >0 }">
						<c:forEach var ="i" items="${item }" varStatus="j">
							<c:if test="${j.index == 0}">
								<div class="tab-pane active" id="pic-${j.count }" ><img src="shop_img.do?code=${param.no }&img=${i}" style="width:100%;height:100%"/></div>
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
					<div class="details col-md-12">
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
						<p class="product-description" id="text" >${vo.content }</p>
						<h4 class="price">가격: <span>$ 
						<c:if test="${vo.sales == 0 }">
							<fmt:formatNumber value="${vo.price }" pattern="#,###"/>
						</c:if>
						<c:if test="${vo.sales != 0 }">
							<label style="text-decoration: line-through"><fmt:formatNumber value="${vo.price }" pattern="#,###"/></label>  = <span style="color:red">${ vo.sales }% 할인!</span>  =>
							<fmt:formatNumber value="${vo.sales_price }" pattern="#,###"/>
						</c:if>
						</span></h4>
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
		<hr />
				<label id="cnt">리뷰 (${cnt })</label>
			
			
			
			
			<c:if test="${cnt <= 5 }">
				<input type="button" class="btn btn-xs btn-info" value="리뷰 전체보기" disabled/>
			</c:if>
			<c:if test="${cnt > 5 }">
				<input type="button" class="btn btn-xs btn-info" value="리뷰 전체보기" id="rep_all"/>
			</c:if>			
			<table id="table" class="table">
			
			<tbody>
				<c:if test="${empty rlist }">
					<label>리뷰가 존재하지 않습니다</label>		
				</c:if>
				<c:if test="${!empty rlist }">
					<c:forEach var="i" items="${rlist }" end="4">
						
							<tr>
								<td>${i.rep_count }</td>
								<td>${i.writer_name }</td>
								<td class="test" style="width:60%">
									<input type="hidden" value="${i.rep_no }" class="rep_no" />
									<input type="hidden" class="content" value="${i.rep_content }"/>
									<input type="hidden" class="writer" value="${i.rep_writer}"/>
									<a class="detail">${fn:substring(i.rep_content,0,40) }<c:if test="${fn:length(i.rep_content)>40 }">...</c:if></a>
								</td>
								<td>${i.rep_date }</td>
								<td>
									<c:if test="${sessionScope._mvo.email eq i.rep_writer }">
										<a class="btn btn-danger rep_delete">삭제</a>
									</c:if>
								</td>
									
							</tr>
						
					</c:forEach>
				</c:if>
				</tbody>
			</table>
			
			
		<hr />
			<input type="button" value="리뷰 등록하기" id="rep_btn" class="btn btn-info"/>
			<div style="display:none;" id="rep_div">
				<c:if test="${sessionScope._mvo != null }">
					<textarea rows="5" id="content" class="form-control" style="resize:none;"></textarea>
					<input type="hidden" value="${param.no }" id="item_no" />
					<input type="hidden" value="${sessionScope._mvo.email }" id="writer" />
					<div class="form-inline">			
						<input	type="button" id="btn_reply" class="btn btn-primary" value="글쓰기" />
					</div>
				</c:if>
				<c:if test="${sessionScope._mvo == null }">
					<textarea rows="1" id="content" class="form-control" style="resize:none;" disabled>회원 로그인을 하셔야 리뷰작성이 가능합니다</textarea>
					<div class="form-inline">			
						<input	type="button" id="btn_reply" class="btn btn-primary" value="글쓰기" disabled/>
					</div>
				</c:if>
			</div>
	</div>
	
</div>

	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="resources/js/jquery.syaku.rolling.js"></script>
	<script>
	function replylist(data,leng){
		var s_email = '${sessionScope._mvo.email}';
		var txt = null;
		console.log(data);
		console.log(leng);
		for(var i=0;i<leng;i++){
			
			if(data[i].rep_content.length > 40){
				txt= data[i].rep_content.substring(0,40)+"...";
			}else{
				txt=data[i].rep_content;
			}
			if(leng = 0){
				$('#table tbody').append('<label>리뷰가 존재하지 않습니다</label>');
			}
			else{
				if(s_email == data[i].rep_writer){
					
					$('#table tbody').append(
						'<tr>'+
							'<td>'+data[i].rep_count+'</td>'+
							'<td>'+data[i].writer_name+'</td>'+
							'<td class="test" style="width:60%">'+
							'<input type="hidden" class="rep_no" value="'+data[i].rep_no+'" />'+
							'<input type="hidden" class="writer" value="'+data[i].rep_writer+'"/>'+
							'<input type="hidden" class="content" value="'+data[i].rep_content+'"/>'+
							'<a class="detail">'+txt+'</a></td>'+
							'<td>'+data[i].rep_date+'</td>'+
							'<td><a class="btn btn-danger rep_delete">삭제</a></td>'+
						'</tr>'
					);
				}
						
				else{
					$('#table tbody').append(
						'<tr>'+
							'<td>'+data[i].rep_count+'</td>'+
							'<td>'+data[i].writer_name+'</td>'+
							'<td class="test" style="width:60%">'+
							'<input type="hidden" class="rep_no" value="'+data[i].rep_no+'" />'+
							'<input type="hidden" class="writer" value="'+data[i].rep_writer+'"/>'+
							'<input type="hidden" class="content" value="'+data[i].rep_content+'"/>'+
							'<a class="detail">'+txt+'</a></td>'+
							'<td>'+data[i].rep_date+'</td>'+
							'<td></td>'+
						'</tr>'
					);
				}
			}
			
		}
	}
		$(function() {
			var pre_idx=null;
			var content2 = null;
			var content3=null;
			var text = $('#text').text();
			var leng = text.length;
			var result =null;
			if(leng>100){
				for(var i=0;i<leng/100;i++){
					if(i == 0) result = text.substring(i*100,100*(i+1))+"\n\n"
					else result += text.substring(i*100,100*(i+1))+"\n\n"					
				}
				$('#text').text(result);
			}
			
			$(document).on('click', '.rep_delete', function(){
				var idx = $(this).index('.rep_delete');
				var no = $('.rep_no').eq(idx).val();
				
				swal({
					  title: "전체 삭제",
					  icon: "warning",
					  text:"정말 삭제하시겠습니까?",
					  buttons: true,
					  dangerMode: true
					}).then((data1) => {
						if(data1)
							$.get('json_reply_delete.do?rep_no='+no+'&item_no=${param.no}',function(ret){
								var data=ret.data;
								$('#table tbody').empty();
								var leng = data.length;
								replylist(data,leng);
								swal({
									title:"삭제되었습니다",
									icon:"info",
									button:"확인"	
								});
								$('#cnt').text("리뷰 ("+ret.cnt+")");
							});					
					});
				
			})			
			$(document).on('click', '.detail', function(){
				var idx=$(this).index('.detail');
				var content = $('.content').eq(idx).val();
				$('.test').eq(idx).empty();
				
				if(pre_idx!=null){
					$('.test').eq(pre_idx).empty();
					$('.test').eq(pre_idx).append(
							'<input type="hidden" class="content" value="'+content2+'"/>'+
							'<a class="detail">'+content3+'</a>'		
						);
				}
				$('.test').eq(idx).append(
						'<input type="hidden" class="content" value="'+content2+'"/>'+
						'<a class="detail"></a><textarea row="10" class="form-control content2" disabled style="height:250px;width:100%;resize:none;">'+content+'</textarea>'		
					);	
				
				content2 = $('.content2').text();
				content3 = $('.content2').text();
				if(content2.length > 40){
					content3 = content2.substring(0,40)+"...";
				}
				pre_idx=idx;
				
			})
			
			$('#rep_btn').click(function(){
				if($('#rep_div').css("display")=="none"){
					$('#rep_div').css("display","block");
				}else{
					$('#rep_div').css("display","none");
				}
			})
			
			$('#rep_all').click(function(){
				var s_email = '${sessionScope._mvo.email}';
				$.get('json_rep_all.do?item_no=${param.no}',function(data){
					$('#table tbody').empty();
					var leng = data.length;
					var txt=null;
					replylist(data,leng);
				},'json');
			});
			
			$('#btn_reply').click(function(){
				var content = $('#content').val();
				var item_no = $('#item_no').val();
				var writer = $('#writer').val();
				var s_email = '${sessionScope._mvo.email}';
				$.post('json_rep.do',{content:content,item_no:item_no,writer:writer},function(ret){
					var data = ret.data;
					console.log(data);
					$('#rep_div').css("display","none");
					$('#table tbody').empty();
					var leng = data.length;
					replylist(data,leng);
					$('#cnt').text("리뷰 ("+ret.cnt+")");
				},'json');
				 $('#content').val("");
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
