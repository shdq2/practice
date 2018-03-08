<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<jsp:include page="adminmenu.jsp"></jsp:include>

<div class="container-fluid">
	<div class="row text-center">
		<div class="col col-md-5">
		<br />
			<h4>회원 현황</h4>
			방문자 수<span class="pull-right strong"> () 명</span>
			<div class="progress">
				<div class="progress-bar progress-bar-danger" role="progressbar"
					aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"
					style="width: 15%">15%</div>
			</div>

			가입자 수<span class="pull-right strong"> ${today} 명</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="${todayinsert}" aria-valuemin="0" aria-valuemax="100"
					style="width: ${todayinsert}%">${todayinsert}%</div>
			</div>

		</div>
		<br />
		<div class="col col-md-5">
			<h4>지난달 회원 현황</h4>
			지난달 방문자 수<span class="pull-right strong">- 15%</span>
			<div class="progress">
				<div class="progress-bar progress-bar-danger" role="progressbar"
					aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"
					style="width: 15%">15%</div>
			</div>

			지난달 가입자 수<span class="pull-right strong"> 30%</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
					style="width: 30%">30%</div>
			</div>
		</div>
		<br />
		<div class="col col-md-5">
			<h4>판매 현황</h4>
			총 판매 물품<span class="pull-right strong"> () 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">100%</div>
			</div>

			미판매 물품<span class="pull-right strong">() 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
					style="width: 30%">30%</div>
			</div>

			주문 완료<span class="pull-right strong"> () 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="8" aria-valuemin="0" aria-valuemax="100"
					style="width: 8%">8%</div>
			</div>
			
			결제중<span class="pull-right strong"> () 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="8" aria-valuemin="0" aria-valuemax="100"
					style="width: 8%">8%</div>
			</div>
			결제완료<span class="pull-right strong"> () 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="8" aria-valuemin="0" aria-valuemax="100"
					style="width: 8%">8%</div>
			</div>
			배송준비중<span class="pull-right strong"> () 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="8" aria-valuemin="0" aria-valuemax="100"
					style="width: 8%">8%</div>
			</div>
			배송중<span class="pull-right strong"> () 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="8" aria-valuemin="0" aria-valuemax="100"
					style="width: 8%">8%</div>
			</div>
			배송완료<span class="pull-right strong"> () 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="8" aria-valuemin="0" aria-valuemax="100"
					style="width: 8%">8%</div>
			</div>
		</div>
		<br />
		<div class="col col-md-5">
			<h4>QnA 현황</h4>
			QnA 글 목록<span class="pull-right strong">+ 45%</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">100%</div>
			</div>

			답변 미완료<span class="pull-right strong">+ 57%</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="57" aria-valuemin="0" aria-valuemax="100"
					style="width: 57%">57%</div>
			</div>

			답변 완료<span class="pull-right strong">+ 25%</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"
					style="width: 25%">25%</div>
			</div>
		</div>
	</div>
</div>

</div>
<!-- /#wrapper -->
<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>

<script>
		$(function(){
			
		})
	</script>
</body>
</html>
