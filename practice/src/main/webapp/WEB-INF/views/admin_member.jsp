<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
	<jsp:include page="adminmenu.jsp"></jsp:include>
	<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead" style="border:1px solid">
<h1> 회원관리 페이지</h1>
</div>
	<div style="margin:0px auto;margin-top:10px;margin-bottom: 10px;">
		<div class="form-inline" style="float:right">
		<select id="search_type" class="form-control">
			<option value="${1 }">아이디</option>
			<option value="${2 }">이름</option>
		</select>
		<input type="text" class="form-control" id="search_txt"/>
		<input type="button" class="btn" value="검색" id="search_btn"/>
	</div>
	
		<table class="table" id="table">
			<thead>
			<tr>
				<th>차단여부</th>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>구매건수</th>
				<th>회원가입일</th>
				<th>비고</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="i" items="${list}" varStatus="j">
			<tr>
				<td>
					<input type="radio" name="block_${j.index }" value="1" <c:if test="${i.block == 1 }">checked</c:if> class="block_rad" />해제
					<input type="radio" name="block_${j.index }" value="0" <c:if test="${i.block == 0 }">checked</c:if> class="block_rad" />차단
				</td>
				<td>
					<label class="email">${i.email }</label>
				</td>
				<td>
					${i.name }
				</td>
				<td>
					${i.sell_cnt }
				</td>
				<td>
					${i.date1 }
				</td>
				<td>
					<a href="admin_member_detail.do?email=${i.email }" class="btn btn-info">자세히보기</a>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<div></div>
		
	</div>

</div>

  </div><!-- /#wrapper -->
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	
	<script>
		$(function(){
			$('#collapse1').addClass("in");
			$(document).on('click', '.block_rad', function(){
				var idx = $('.block_rad').index(this);
				var block = $('.block_rad').eq(idx).val();
				if(idx%2 == 1){
					idx = (idx-1)/2;
				}else{
					idx=idx/2;
				}
				var email = $('.email').eq(idx).text();
				$.get('json_member_block.do?email='+email+'&block='+block,function(data){
					if(data == 1){
						console.log('정상적으로 수정되었습니다');
					}else{
						console.log('정상적으로 수정되지 않았습니다');
					}
				});
			})
			$('#search_btn').click(function(){
				var type=$('#search_type').val();
				var txt=$('#search_txt').val();
				$.get('json_member_search.do?type='+type+'&txt='+txt,function(data){
					$('#table tbody').empty();
					var leng = data.length;
					for(var i=0;i<leng;i++){
						if(data[i].block == 1){
						$('#table tbody').append(
							'<tr>'+
								'<td><input type="radio" name="block_'+i+'" value="1" checked class="block_rad" />해제'+
									'<input type="radio" name="block_'+i+'" value="0" class="block_rad" />차단'+
								'</td>'+
								'<td>'+
									'<label class="email">'+data[i].email+'</label>'+
								'</td>'+
								'<td>'+
									data[i].name+
								'</td>'+
								'<td>'+
									data[i].sell_cnt+
								'</td>'+
								'<td>'+
									data[i].date1+
								'</td>'+
								'<td>'+
									'<a href="admin_member_detail.do?email='+data[i].email+'" class="btn btn-info">자세히보기</a>'+
								'</td>'+
							'</tr>'
						);
						}else{
							$('#table tbody').append(
									'<tr>'+
										'<td><input type="radio" name="block_'+i+'" value="1" class="block_rad" />해제'+
											'<input type="radio" name="block_'+i+'" value="0" checked class="block_rad" />차단'+
										'</td>'+
										'<td>'+
											'<label class="email">'+data[i].email+'</label>'+
										'</td>'+
										'<td>'+
											data[i].name+
										'</td>'+
										'<td>'+
											data[i].sell_cnt+
										'</td>'+
										'<td>'+
											data[i].date1+
										'</td>'+
										'<td>'+
											'<a href="admin_member_detail.do?email='+data[i].email+'" class="btn btn-info">자세히보기</a>'+
										'</td>'+
									'</tr>'
							);
						}
						
					}
				});
			})
		})
	</script>
</body>
</html>
