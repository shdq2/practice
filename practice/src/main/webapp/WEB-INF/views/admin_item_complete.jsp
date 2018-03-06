<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	<link rel="stylesheet" href="resources/css/admin.css" />
	<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead" style="border:1px solid">
<h1> 판매 완료 물품</h1>
</div>

<div style="margin-top:10px;">

	<div class="form-inline" style="float:right">
		<select id="search_type" class="form-control">
			<option value="${1 }">물품번호</option>
			<option value="${2 }">제목+내용</option>
		</select>
		<input type="text" class="form-control" id="search_txt"/>
		<input type="button" class="btn" value="검색" id="search_btn"/>
	</div>
	
	<table id="table" class="table">
		<thead>

			<tr>
				<th>물품번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>총 판매 갯수</th>
				<th>가격</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${ilist }" end="4">
				<tr>
					<td>${i.no}</td>
					<td>
						<c:set var="sitem" value="${fn:split(index,',') }"/>
						<c:forEach var="img" items="${sitem }" varStatus="idx">
							<c:if test="${idx.first }">
								<img src="shop_img.do?code=${i.no }&img=${img}" style="width:80px;height:80px;"/>
							</c:if>
						</c:forEach>
					</td>
					<td>${i.name}</td>
					<td>${i.qty}</td>
					<td><fmt:formatNumber value="${i.price }" pattern="#,###"/> 원</td>
					<td align="center"><fmt:formatNumber value="${i.price * i.qty}" pattern="#,###"/> 원</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="6">
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
				$.get('json_search_complete.do?txt='+txt+'&type='+code,function(data){
					var ret = data.ret;
					var leng = ret.length;
					var first = data.idx;
					$('#table tbody').empty();
					for(var i=0;i<leng;i++){
						$('#table tbody').append(
							'<tr>'+
								'<td>'+ret[i].no + '</td>'+
								'<td><img src="shop_img.do?code='+ret[i].no+'&img='+first+'" style="width:80px;height:80px"/></td>'+
								'<td>'+ret[i].name + '</td>'+
								'<td>'+ret[i].qty + '</td>'+
								'<td>'+numberformat(ret[i].price) + ' 원</td>'+
								'<td align="center">'+numberformat(ret[i].price*ret[i].qty)+'</td>'+
							'</tr>'	
						);
					}
				});
			})
			$('#collapse2').addClass("in");
		
			$('#other').click(function(){
				var code = $('#item_list').val();
				$.get('json_item.do?code='+code,function(data){
					var ret = data.ret;
					var leng = ret.length;
					var first = data.idx;
					if(count+5 > leng){
						count = leng;
						$('#other').attr('disabled',true);
					}											
					else count += 5;
					
				$('#table tbody').empty();
				for(var i=0;i<count;i++){						
					$('#table tbody').append(
							'<tr>'+
								'<td>'+ret[i].no + '</td>'+
								'<td><img src="shop_img.do?code='+ret[i].no+'&img='+first+'" style="width:80px;height:80px"/></td>'+
								'<td>'+ret[i].name + '</td>'+
								'<td>'+ret[i].qty + '</td>'+
								'<td>'+numberformat(ret[i].price) + ' 원</td>'+
								'<td align="center">'+
								numberformat(ret[i].price*ret[i].qty)+
								'</td>'+
							'</tr>'
						);	
					}
				},'json');
			})
		})
	</script>
</body>
</html>
