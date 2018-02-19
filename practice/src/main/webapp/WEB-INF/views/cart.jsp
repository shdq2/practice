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
		<div class="body">
			<table class="table">
				<tr>
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
						<td><input type="checkbox" class="chk" checked="checked"/></td>
						<td><img src="resources/img/default.jpg" style="width:70px; height:70px" /></td>
						<td>${i.name}</td>
						<td>
						<select class="qty form-control" style="width:60%">
							<c:forEach var="j" begin="1" end="${i.tq}">
								<option <c:if test="${j eq i.qty }">selected</c:if>>${j}</option>
							</c:forEach>	
						</select>
						
						</td>
						<td><label class="price"><fmt:formatNumber value="${i.price }" pattern="#,###"/></label> 원</td>
						<td><label class="total"><fmt:formatNumber value="${i.price * i.qty }" pattern="#,###"/></label> 원</td>
						<td>test</td>
					</tr>				
				</c:forEach>
			</table>
			<div style="text-align:right" class="form-inline">
				<div style="float:left">
					<input type="button" value="선택삭제" class="form-control" id="select_del"/>
					<input type="button"value="전체삭제" class="form-control" id="all_del" style="margin-left:5px"/>
				</div>
				<h2><label>총 금액 : </label><label id="total">0</label> 원</h2>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
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
		var total = 0
		$('.chk').each(function(data){
			if($(this).is(':checked')){
				var idx = $(this).index('.chk');
				total += parseInt($('.total').eq(idx).text().replace(/[^0-9]/g,""));	
				$('#total').text(numberformat(total));
			}
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
			$('.qty').change(function(){
				var idx = $(this).index('.qty');
				var price = $('.price').eq(idx).text().replace(/[^0-9]/g,"");
				var qty=$('.qty').eq(idx).val();
				var total = price*qty;
				$('.total').eq(idx).text(numberformat(total));
				total_price();
			})
		});
		
	</script>
</body>
</html>
