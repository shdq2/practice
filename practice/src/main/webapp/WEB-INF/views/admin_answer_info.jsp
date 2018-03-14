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
<h1> 1:1문의 답변하기</h1>
</div>
<hr />
<div style="margin-top:10px;">
			<table class="table" style="margin: 0px auto; padding-top: 10px;">
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">제목</label></td>
					<td>${ovo.one_title }</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">내용</label></td>
					<td>${ovo.one_content}</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">작성자</label></td>
					<td>${ovo.writer_name }</td>
				</tr>
				<tr>
					<td style="width: 20%;"><label style="text-align: center;">첨부이미지</label></td>
					<td><img src="onetoone_img.do?code=${ovo.one_no }&img=1" style="width:150px;height:150px;"/></td>
				</tr>
			</table>
			<br />
			<hr />
			<br /> 
			<c:if test = "${ovo.one_ret ==0 }">
				<label style="text-align: center;">아직 답변이 달리지 않았습니다</label><br />
				<a href="admin_answer.do?no=${param.no }" class="btn btn-success">답변하기</a>
			</c:if>
			<c:if test = "${ovo.one_ret !=0 }">
				<table class="table">
	
					<tr>
						<th style="width: 20%;"><label style="text-align: center;">제목</label></th>
						<th>${ovo.answer_title }</th>
					</tr>
					<tr>
						<td style="width: 20%;"><label style="text-align: center;">답변
							내용</label></td>
						<td>${ovo.answer_content }</td>
					</tr>
					<tr>
						<td style="width: 20%;"><label style="text-align: center;">답변일</label></td>
						<td>${ovo.answer_date }</td>
					</tr>
				</table>
			</c:if>
				
				<a href="admin_onetoone.do" class="btn btn-info">돌아가기</a>
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
								'<td>'+numberformat(data[i].price*data[i].qty)+' 원</td>'+
								'<td align="center">'+data[i].state_name+'</td>	'+
							'</tr>'	
						);
					}
				});
			})
			$('#collapse3').addClass("in");
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
										'<td>'+numberformat(data[i].price*data[i].qty)+' 원</td>'+
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
											'<td>'+numberformat(data[i].price*data[i].qty)+' 원</td>'+
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
								'<td>'+numberformat(data[i].price*data[i].qty)+' 원</td>'+
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
