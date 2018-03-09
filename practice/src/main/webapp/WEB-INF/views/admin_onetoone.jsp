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
<div class="col-md-12 dashhead" style="border:1px solid">
<h1> 1:1 문의 현황</h1>
</div>

<div style="margin-top:10px;">
	<div class="form-inline" style="float:left">
		분류: <select id="item_list" class="form-control">
					<option value="2">전체</option>
					<option value="0">미완료</option>
					<option value="1">완료</option>
			</select>
		</div>
	<div class="form-inline" style="float:right">
		<select id="search_type" class="form-control">
			<option value="${1 }">아이디</option>
			<option value="${2 }">제목+내용</option>
		</select>
		<input type="text" class="form-control" id="search_txt"/>
		<input type="button" class="btn" value="검색" id="search_btn"/>
	</div>
	<c:set var="listleng" value="${fn:length(olist) }"/>
	<table id="table" class="table">
		<thead>
			<tr>
				<th>문의번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>답변여부</th>
				<th>첨부파일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${olist}" end="4">
				<tr>
					<td>${i.one_no }</td>
					<td><a href="admin_answer_info.do?no=${i.one_no}&email=${i.one_writer}">${i.one_title }</a></td>
					<td>${i.writer_name }<input type="hidden" value="${i.one_writer }"></td>
					<td>
						<c:if test="${i.one_ret == 0}"><a href="admin_answer.do?no=${i.one_no }" class="form-control" style="width:90px" >답변하기</a></c:if>
						<c:if test="${i.one_ret == 1}">답변완료</c:if>
					</td>
					<td><img src="onetoone_img.do?code=${i.one_no }&img=1" style="width:80px;height:80px;" /></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="7">
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
				$.get('json_onetoone_search.do?txt='+txt+'&type='+code,function(data){
					var leng = data.length;
					$('#table tbody').empty();
						for(var i=0;i<leng;i++){
							if(data[i].one_ret == 0){
								$('#table tbody').append(
								'<tr>'+							
									'<td>'+data[i].one_no+'</td>'+
									'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
									'<td>'+data[i].writer_name+'</td>'+
									'<td><a href="admin_answer.do?no='+data[i].one_no+'" class="form-control" style="width:90px" >답변하기</a></td>'+
									'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
								'</tr>'
								);	
							}else{
								$('#table tbody').append(
									'<tr>'+							
										'<td>'+data[i].one_no+'</td>'+
										'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
										'<td>'+data[i].writer_name+'</td>'+
										'<td>답변완료</td>'+
										'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
									'</tr>'
								);	
							}
							
						}
					});
				})
				
			$('#collapse3').addClass("in");
			$('#item_list').change(function(){
				var code = $('#item_list').val();
				$.get('json_onetoone.do?code='+code,function(data){
					console.log(data);
					var leng = data.length;
					$('#table tbody').empty();
						if(leng<5){
							for(var i=0;i<leng;i++){
								if(data[i].one_ret == 0){
									$('#table tbody').append(
									'<tr>'+							
										'<td>'+data[i].one_no+'</td>'+
										'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
										'<td>'+data[i].writer_name+'</td>'+
										'<td><a href="admin_answer.do?no='+data[i].one_no+'" class="form-control" style="width:90px" >답변하기</a></td>'+
										'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
									'</tr>'
									);	
								}else{
									$('#table tbody').append(
										'<tr>'+							
											'<td>'+data[i].one_no+'</td>'+
											'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
											'<td>'+data[i].writer_name+'</td>'+
											'<td>답변완료</td>'+
											'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
										'</tr>'
									);	
								}
								
							}
						}else{
							for(var i=0;i<5;i++){
								if(data[i].one_ret == 0){
									$('#table tbody').append(
									'<tr>'+							
										'<td>'+data[i].one_no+'</td>'+
										'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
										'<td>'+data[i].writer_name+'</td>'+
										'<td><a href="admin_answer.do?no='+data[i].one_no+'" class="form-control" style="width:90px" >답변하기</a></td>'+
										'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
									'</tr>'
									);	
								}else{
									$('#table tbody').append(
										'<tr>'+							
											'<td>'+data[i].one_no+'</td>'+
											'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
											'<td>'+data[i].writer_name+'</td>'+
											'<td>답변완료</td>'+
											'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
										'</tr>'
									);	
								}
								
							}
						}
							
				},'json');
			})
			
			$('#other').click(function(){
				var code = $('#item_list').val();
				$.get('json_onetoone.do?code='+code,function(data){
					
					if(count+5 > data.length){
						count = data.length;
						$('#other').attr('disabled',true);
					}											
					else count += 5;
					
				$('#table tbody').empty();
				for(var i=0;i<count;i++){
					if(data[i].one_ret == 0){
						$('#table tbody').append(
						'<tr>'+							
							'<td>'+data[i].one_no+'</td>'+
							'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
							'<td>'+data[i].writer_name+'</td>'+
							'<td><a href="admin_answer.do?no='+data[i].one_no+'" class="form-control" style="width:90px" >답변하기</a></td>'+
							'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
						'</tr>'
						);	
					}else{
						$('#table tbody').append(
							'<tr>'+							
								'<td>'+data[i].one_no+'</td>'+
								'<td><a href="admin_answer_info.do?no='+data[i].one_no+'&email='+data[i].one_writer+'">'+data[i].one_title+'</a></td>'+
								'<td>'+data[i].writer_name+'</td>'+
								'<td>답변완료</td>'+
								'<td><img src="onetoone_img.do?code='+data[i].one_no+'&img=1" style="width:80px;height:80px;"/></td>'+
							'</tr>'
						);	
					}
				}
				},'json');
			})
		})
	</script>
</body>
</html>
