<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	<link rel="stylesheet" href="resources/css/admin.css" />
	<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead">
<h1> 제품별 주문 현황</h1>
</div>
<hr />
<div style="margin-top:10px;">
	<div class="form-inline" style="float:left">
	분류: <select id="item_list" class="form-control">
		<c:forEach var="c" items="${clist }">
			<option value="${c.item_code }">${c.name_code}</option>
		</c:forEach>
	</select>
	</div>
	<div class="form-inline" style="float:right">
		<select id="search_type" class="form-control">
			<option value="${1 }">물품번호</option>
			<option value="${2 }">제목+내용</option>
			<option value="${3 }">구매자</option>
		</select>
		<input type="text" class="form-control" id="search_txt"/>
		<input type="button" class="btn" value="검색" id="search_btn"/>
	</div>
	<c:set var="listleng" value="${fn:length(ilist) }"/>
	<table id="table" class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>구매자</th>
				<th>제품이름</th>
				<th>주문갯수</th>
				<th>원가</th>
				<th>할인율</th>
				<th>할인금액</th>
				<th>총 금액</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${ilist }" end="4">
				<tr>
					<td>${i.no}</td>
					<td>${i.member_name }</td>
					<td>${i.name}</td>
					<td>${i.qty}</td>
					<td><fmt:formatNumber value="${i.price }" pattern="#,###"/> 원</td>
					<td>${i.sales }%</td>
					<td><fmt:formatNumber value="${i.order_price }" pattern="#,###"/> 원
					<td><fmt:formatNumber value="${i.order_price *i.qty}" pattern="#,###"/> 원</td>
					<td align="center">${i.state_name }</td>						
					<%-- <select class="form-control">
							<c:forEach var="s" items="${slist }">
								<option value="${s.state }" <c:if test="${s.state == i.state}">selected</c:if>>${s.state_name }</option>
							</c:forEach>
						</select> --%>
					
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="9">
			<c:if test="${listleng <= 5 }">
				<input type="button" value="더보기" id="other" class="form-control" disabled="disabled"/>
			</c:if>
			<c:if test="${listleng > 5 }">
				<input type="button" value="더보기" id="other" class="form-control"/>
			</c:if>
			</td>
			
		</tr>
		</tfoot>
	</table>
</div>

</div>
</div>

  </div><!-- /#wrapper -->
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
		$(function(){
			var count = 5;
			$('#search_btn').click(function(){
				var txt = $('#search_txt').val();
				var code = $('#search_type').val();
				$('#other').attr('disabled',true);
				if(txt == ""){
					alert("값을 입력하세요");
					return false;
				}
				$.get('json_order_search.do?txt='+txt+'&type='+code,function(data){
					var leng = data.length;
					$('#table tbody').empty();
					for(var i=0;i<leng;i++){
						$('#table tbody').append(
							'<tr>'+
								'<td>'+data[i].no+'</td>'+
								'<td>'+data[i].member_name+'</td>'+
								'<td>'+data[i].name+'</td>'+
								'<td>'+numberformat(data[i].qty)+'</td>'+
								'<td>'+numberformat(data[i].price)+' 원</td>'+
								'<td>'+data[i].sales+' %</td>'+
								'<td>'+numberformat(data[i].order_price)+' 원</td>'+
								'<td>'+numberformat(data[i].order_price*data[i].qty)+' 원</td>'+
								'<td align="center">'+data[i].state_name+'</td>	'+
							'</tr>'	
						);
					}
				});
			})
			$('#collapse2').addClass("in");
			$('#item_list').change(function(){
				var code = $('#item_list').val();
				$.get('json_order.do?code='+code,function(data){
					var leng = data.length;
					$('#table tbody').empty();
						if(leng<5){
						for(var i=0;i<leng;i++){
							$('#other').attr('disabled',true);
							$('#table tbody').append(
									'<tr>'+
										'<td>'+data[i].no+'</td>'+
										'<td>'+data[i].member_name+'</td>'+
										'<td>'+data[i].name+'</td>'+
										'<td>'+numberformat(data[i].qty)+'</td>'+
										'<td>'+numberformat(data[i].price)+' 원</td>'+
										'<td>'+data[i].sales+' %</td>'+
										'<td>'+numberformat(data[i].order_price)+' 원</td>'+
										'<td>'+numberformat(data[i].order_price*data[i].qty)+' 원</td>'+
										'<td align="center">'+data[i].state_name+'</td>	'+
									'</tr>'
								);	
							}	
						}else{
							$('#other').attr('disabled',false);
							for(var i=0;i<5;i++){						
								$('#table tbody').append(
										'<tr>'+
											'<td>'+data[i].no+'</td>'+
											'<td>'+data[i].member_name+'</td>'+
											'<td>'+data[i].name+'</td>'+
											'<td>'+numberformat(data[i].qty)+'</td>'+
											'<td>'+numberformat(data[i].price)+' 원</td>'+
											'<td>'+data[i].sales+' %</td>'+
											'<td>'+numberformat(data[i].order_price)+' 원</td>'+
											'<td>'+numberformat(data[i].order_price*data[i].qty)+' 원</td>'+
											'<td align="center">'+data[i].state_name+'</td>	'+
										'</tr>'
									);	
								}
						}			
				},'json');
			})
			
			$('#other').click(function(){
				var code = $('#item_list').val();
				$.get('json_order.do?code='+code,function(data){
					
					if(count+5 > data.length){
						count = data.length;
						$('#other').attr('disabled',true);
					}											
					else count += 5;
					
				$('#table tbody').empty();
				for(var i=0;i<count;i++){						
					$('#table tbody').append(
							'<tr>'+							
								'<td>'+data[i].no+'</td>'+
								'<td>'+data[i].member_name+'</td>'+
								'<td>'+data[i].name+'</td>'+
								'<td>'+numberformat(data[i].qty)+'</td>'+
								'<td>'+numberformat(data[i].price)+' 원</td>'+
								'<td>'+data[i].sales+' %</td>'+
								'<td>'+numberformat(data[i].order_price)+' 원</td>'+
								'<td>'+numberformat(data[i].order_price*data[i].qty)+' 원</td>'+
								'<td align="center">'+data[i].state_name+'</td>	'+
							'</tr>'
						);	
					}
				},'json');
			})
		})
	</script>
</body>
</html>
