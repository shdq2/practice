<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>

	<jsp:include page="adminmenu.jsp"></jsp:include>
	
	<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead" style="border:1px solid">
<h1> ${vo.name } 회원 상세화면</h1>
</div>
	<table class="table">
		<tr>
			<th>아이디</th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${vo.email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${vo.addr1 }</td>
		</tr>
		<tr>
			<th>세부주소</th>
			<td>${vo.addr2 }</td>
		</tr>
		<tr>
			<th>구매횟수</th>
			<td><fmt:formatNumber value="${vo.sell_cnt }" pattern="#,###" /> 회</td>
		</tr>
		<tr>
			<th>총구매 금액</th>
			<td><fmt:formatNumber value="${totalprice }" pattern="#,###" /> 원</td>
		</tr>
	</table>
	<div style="float:left">
		<input type="button" value="구매현황 세부내용" id="detail_btn"/>
	</div>
	<div id="sell_detail" style="display:none; width:100%">
		<div style="clear: both">
			<input type="button" value="그래프으로 보기" id="period_btn"/>
			<input type="button" value="주문목록으로 보기" id="order_list_btn"/>
			
			<div id="order_list" style="margin-top:10px; display:none; style="width:100%"">
				
					<table class="table" id="table">
						<thead>
							<tr>
								<th>주문 번호</th>
								<th>아이템 이름</th>
								<th>주문 갯수</th>
								<th>단위 가격</th>
								<th>총금액</th>
								<th>주문일자</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<ul id="pagination" class="pagination-sm"></ul>
				</div>
				<div id="period" style="margin-top:10px; display:none; width:100%;height:50%;">
					<label style="margin-top:10px;">가격 기준</label>
					<div id="graph" style="width:500px;height:300px;margin:0px auto;"></div>
					<label style="margin-top:20px">갯수 기준</label>
					<div id="graph2" style="width:500px;height:300px;margin:0px auto;"></div>
					
				</div>
		</div>
	</div>
</div>
</div>

  </div><!-- /#wrapper -->
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.twbsPagination-1.3.1.js"></script>
	<script type="text/javascript" src="resources/js/morris.js"></script>
	<script type="text/javascript" src="resources/js/raphael-min.js"></script>
	<script>
		$(function(){
			$('#detail').attr("class","active");
				$.get('json_graph.do?email=${param.email}',function(data){
					//var day_data =JSON.parse(data);
					//console.log(day_data);
					Morris.Line({
						 element: 'graph',
						  data: data,
						  xkey: 'date1',
						  ykeys: ['price'],
						  labels: ['price']
						});
					Morris.Line({
						 element: 'graph2',
						  data: data,
						  xkey: 'date1',
						  ykeys: ['qty'],
						  labels: ['qty']
						});

				})				
			$('#detail_btn').click(function(){
				if($('#sell_detail').css("display")=="none"){
					$('#sell_detail').css("display","block");
				}
					
				else{
					$('#sell_detail').css("display","none");
				}
			});
			$('#period_btn').click(function(){
				$('#order_list').css("display","none");
				$('#period').css("display","block");
			});
			$('#order_list_btn').click(function(){
				$('#order_list').css("display","block");
				$('#period').css("display","none");
			});
			 $('#pagination').twbsPagination({
			      totalPages:${tot},
			      visiblePages: 7,
			      onPageClick: function (event, page) {
					$.get('json_paging.do?email=${param.email}&page='+page,function(data){
						$('#table tbody').empty();
						var leng = data.length;
						for(var i=0;i<leng;i++){
							
							var total = data[i].price * data[i].qty;
							$('#table tbody').append(
								'<tr>'+
									'<td>'+data[i].no+'</td>'+
									'<td>'+data[i].name+'</td>'+
									'<td>'+data[i].qty+'</td>'+
									'<td>'+numberformat(data[i].price)+' 원</td>'+
									'<td>'+numberformat(total)+' 원</td>'+
									'<td>'+data[i].date1+'</td>'+
								'</tr>'
							);
						}
					},'json');
			      }
		   });
			
		});
		
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
	</script>
</body>
</html>
