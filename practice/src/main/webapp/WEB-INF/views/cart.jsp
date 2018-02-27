<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
		<form action="selectcartdel.do" method="post" id="form">
		<div class="body" >
			<table class="table" style="min-height:200px; border:1px solid #ddd !important">
				<tr style="height:40px">
					<th><input type="checkbox" id="checkall" checked="checked"/></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>단가</th>
					<th>합계</th>
					<th>주문</th>
				</tr>
				
				<c:forEach var="i" items="${list}">
					<tr>
						<td><input type="checkbox" class="chk" value="${i.no}" name="chks" checked="checked"/></td>
						<td><img src="resources/img/default.jpg" style="width:70px; height:70px" /></td>
						
						<td><input type="hidden" value="${i.item_no}" name="item_no" class="item_no"/>${i.name}</td>
						<td>
						
						<select class="qty form-control" style="width:80%" name="qty">
							<c:forEach var="j" begin="1" end="${i.tq}">
								<option <c:if test="${j eq i.qty }">selected</c:if>>${j}</option>
							</c:forEach>	
						</select>
						
						</td>
						<td><label class="price"><fmt:formatNumber value="${i.price }" pattern="#,###"/></label> 원</td>
						<td><label class="total"><fmt:formatNumber value="${i.price * i.qty }" pattern="#,###"/></label> 원</td>
						
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
		</form>
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
						console.log($('#form').attr("action"));
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
