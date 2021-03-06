<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true" %>
<html>
<head>
	<title>장바구니</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	
		<div class="header">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
		<div class="body" >
		<form action="selectcartdel.do" method="post" id="form">
		
		<section class="sec1"></section>
		<section class="content">
		<div style="height:80px;"></div>
		<div class="container">
			<table class="table" style="min-height:200px; border:1px solid #ddd !important">
				<tr style="height:40px">
					<th><input type="checkbox" id="checkall" checked="checked"/></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>가격</th>
					<th>합계</th>
					<th>주문</th>
				</tr>
				
				<c:forEach var="i" items="${list}">
					
						<tr>
							<td><input type="checkbox" class="chk" value="${i.no}" name="chks" checked="checked"/></td>
							<td>
								<c:set var="sitem" value="${fn:split(index,',') }"/>
								<c:forEach var="img" items="${sitem }" varStatus="idx">
									<c:if test="${idx.first }">
										<img src="shop_img.do?code=${i.item_no }&img=${img}" style="width:80px;height:80px;"/>
									</c:if>
								</c:forEach>
							</td>
							
							<td><input type="hidden" value="${i.item_no}" name="item_no" class="item_no"/>${i.name}</td>
							<td>
							
							<select class="qty form-control" style="width:80%" name="qty">
								<c:forEach var="j" begin="1" end="${i.tq}">
									<option <c:if test="${j eq i.qty }">selected</c:if> value="${j}">${j}</option>
								</c:forEach>	
							</select>
							
							</td>
							<td>
								<c:if test="${i.sales == 0 }">
									<label class="price">
									<input type="hidden" name="price" value="${i.sales_price }" />
										<fmt:formatNumber value="${i.price }" pattern="#,###"/>
									</label> 원
								</c:if>
								<c:if test="${i.sales != 0 }">
									<label style="text-decoration:line-through"><fmt:formatNumber value="${i.price }" pattern="#,###"/></label><br />
									<label class="price">
									<input type="hidden" name="price" value="${i.sales_price }" />
									<fmt:formatNumber value="${i.sales_price }" pattern="#,###"/></label> 원
								</c:if>
							</td>
							<td>
							<c:if test="${i.sales==0 }">
								<label class="total"><fmt:formatNumber value="${i.price * i.qty }" pattern="#,###"/></label> 원</td>
							</c:if>
							<c:if test="${i.sales!=0 }">
								<label class="total"><fmt:formatNumber value="${i.sales_price * i.qty }" pattern="#,###"/></label> 원</td>
							</c:if>
							<td align="center">
								<a href="#" class="btn btn-primary btn-xs qtyupdate">수량변경</a><br />
								<a href="selectcartdel.do?no=${i.no}" class="btn btn-warning btn-xs" style="margin-top:3px">삭제</a><br />
								<a href="#" class="btn btn-success btn-xs" style="margin-top:3px">주문하기</a>
								
							</td>
						</tr>	
				</c:forEach>
			</table>
			
			<div style="text-align:right" class="form-inline">
				<div style="float:left">
					<input type="button" value="선택삭제" class="form-control" id="select_del"/>
					<a href="#" class="form-control" id="all_del" style="margin-left:5px">전체삭제 </a>
				</div>
				<h2><label>총 금액 : </label><label id="total">0</label> 원</h2>
				<input type="button" value="주문하기" id="order" class="btn btn-primary btn-lg"/>
			</div>
			
		</div>
		</section>
		</form>
		
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
	<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="resources/js/login.js"></script>
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
	var total_price = function(){
		var total = 0;
		var chk = 0;
		$('.chk').each(function(data){
			var idx = $(this).index('.chk');
			if($('.chk').eq(idx).is(':checked')){				
				total += parseInt($('.total').eq(idx).text().replace(/[^0-9]/g,""));	
				$('#total').text(numberformat(total));
				chk += 1;
			}else{
				$('#total').text(numberformat(total));
				chk-=1;
			}
			 if(chk == ${size}) $('#checkall').prop('checked',true);
			else $('#checkall').prop('checked',false); 
		});
	}
		$(function(){

			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$('nav').addClass('black');
				} else {
					$('nav').removeClass('black');
				}
			});
			total_price();		
			$('#checkall').click(function(){
				if($('#checkall').is(':checked')){
					$('.chk').prop('checked',true);
					total_price();
				}else{
					$('.chk').prop('checked',false);
					$('#total').text("0");
				}
			})
			$('.chk').click(function(){
				total_price();
			})
			$('.qty').change(function(){
				var idx = $(this).index('.qty');
				var price = $('.price').eq(idx).text().replace(/[^0-9]/g,"");
				var qty=$('.qty').eq(idx).val();
				var total = price*qty;
				$('.total').eq(idx).text(numberformat(total));
				total_price();
			})
			$('#all_del').click(function(){
					swal({
						  title: "전체 삭제",
						  icon: "warning",
						  text:"정말 삭제하시겠습니까?",
						  buttons: true,
						  dangerMode: true
						}).then((data) => {
							if(data)
								window.location.href="cartalldelete.do";					
						});
			})
			$('.qtyupdate').click(function(){
				var idx = $(this).index('.qtyupdate');
				var qty = $('.qty').eq(idx).val();
				var no = $('.chk').eq(idx).val();
				$.get('json_qtyupdate.do?no='+no+'&qty='+qty,function(data){
					swal({
						  title: "성공적으로 변경되었습니다",
						  icon: "success",
						  button: "확인"
						})
				})
			})
			$('#order').click(function(){
				var leng = $('.chk:checked').length;
				if(leng>0){
				swal({
					title:"주문확인",
					text:"주문하시겠습니까?",
					icon:"info",
					buttons:true,
					dangerMode:true
				}).then((value)=>{
					if(value){
						$('#form').attr("action","order.do");
						$('#form').submit();
					}
				});
				}
				else{
					swal({
						title:"삭제실패",
						text:"체크가 선택된 항목이 없습니다.",
						icon:"info",
						button:"확인",			
					})	
				}
			});
			
			$('#select_del').click(function(){
				var leng = $('.chk:checked').length;
				if(leng>0){
				swal({
					title:"삭제확인",
					text:"삭제하시겠습니까?",
					icon:"info",
					buttons:true,
					dangerMode:true
				}).then((value)=>{
					if(value){
						$('#form').submit();
					}
				});
				}
				else{
					swal({
						title:"삭제실패",
						text:"체크가 선택된 항목이 없습니다.",
						icon:"info",
						button:"확인",			
					})	
				}
			})
		});
		
	</script>
</body>
</html>
