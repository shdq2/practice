<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
			<th>구매현황</th>
			<td>${vo.sell_cnt }</td>
		</tr>
	</table>
	<div style="float:left">
		<input type="button" value="구매현황 세부내용" id="detail_btn"/>
	</div>
	<div class="sell_detail" style="display:none;">
		test
	</div>
</div>
</div>

  </div><!-- /#wrapper -->
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	
	<script>
		$(function(){
			$('#detail_btn').click(function(){
				if($('#sell_detail').css("display")=="none")
					$('#sell_detail').show();
				else
					$('#sell_detail').hide();
			})
		});
	</script>
</body>
</html>
