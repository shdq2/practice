<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<jsp:include page="adminmenu.jsp"></jsp:include>

<div class="container-fluid">
	<div class="row text-center" >
		
		<div class="col col-md-5">
		<div style="height:30px;"></div>
			<table style="width:100%">
				<tr>
					<td style="width:30%"></td>
					<td style="width:30%" align="center"><h4>회원 현황 </h4></td>
					<td style="width:30%" align="right"> <a href="admin_member.do" class="btn btn-xs btn-info">자세히 보기</a></td>
				</tr>
			</table>
			
			어제 가입자 수<span class="pull-right strong"> ${yesterday } 명</span>
			<div class="progress">
				<div class="progress-bar <c:if test="${chk2 == 1 }"> progress-bar-success</c:if> <c:if test="${chk2 == 2 }"> progress-bar-danger</c:if>" role="progressbar"
					aria-valuenow="${yesterdayinsert}" aria-valuemin="0" aria-valuemax="100"
					style="width: <c:if test="${yesterdayinsert >= 100 }">100</c:if><c:if test="${yesterdayinsert < 100 }">${yesterdayinsert}</c:if>%">${yesterdayinsert}%</div>
			</div>

			오늘 가입자 수<span class="pull-right strong"> ${today} 명</span>
			<div class="progress">
				<div class="progress-bar <c:if test="${chk1 == 1 }"> progress-bar-success</c:if> <c:if test="${chk1 == 2 }"> progress-bar-danger</c:if>" role="progressbar"
					aria-valuenow="${todayinsert}" aria-valuemin="0" aria-valuemax="100"
					style="width: <c:if test="${todayinsert >= 100 }">100</c:if><c:if test="${todayinsert < 100 }">${todayinsert}</c:if>%">${todayinsert}%</div>
			</div>
			<hr />
		</div>
		
		<div class="col col-md-5">
		<div style="height:30px;"></div>
			<table style="width:100%">
				<tr>
					<td style="width:30%"></td>
					<td style="width:30%" align="center"><h4>지난달 회원 현황 </h4></td>
					<td style="width:30%" align="right"> <a href="" class="btn btn-xs btn-info">자세히 보기</a></td>
				</tr>
			</table>
			지난달 가입자 수<span class="pull-right strong">${pre_month } 명</span>
			<div class="progress">
				<div class="progress-bar <c:if test="${chk4 == 1 }"> progress-bar-success</c:if> <c:if test="${chk4 == 2 }"> progress-bar-danger</c:if>" role="progressbar"
					aria-valuenow="${i_pre_month }" aria-valuemin="0" aria-valuemax="100"
					style="width: <c:if test="${i_pre_month>= 100 }">100</c:if><c:if test="${i_pre_month < 100 }">${i_pre_month}</c:if>%">${i_pre_month}%</div>
			</div>

			이번달 가입자 수<span class="pull-right strong"> ${this_month } 명</span>
			<div class="progress">
				<div class="progress-bar <c:if test="${chk3 == 1 }"> progress-bar-success</c:if> <c:if test="${chk3 == 2 }"> progress-bar-danger</c:if>" role="progressbar"
					aria-valuenow="${i_this_month }" aria-valuemin="0" aria-valuemax="100"
					style="width: <c:if test="${i_this_month>= 100 }">100</c:if><c:if test="${i_this_month < 100 }">${i_this_month}</c:if>%">${i_this_month}%</div>
			</div>
			<hr />
		</div>
		
		<div class="col col-md-5">
		<div style="height:30px;"></div>
			<table style="width:100%">
				<tr>
					<td style="width:30%"></td>
					<td style="width:30%" align="center"><h4>판매 물품 현황 </h4></td>
					<td style="width:30%" align="right"> <a href="admin_item.do" class="btn btn-xs btn-info">자세히 보기</a></td>
				</tr>
			</table>
			총 판매 물품<span class="pull-right strong"> ${all_count } 개</span>
			<div class="progress">
				<div class="progress-bar" role="progressbar"
					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">100%</div>
			</div>

			미판매 물품<span class="pull-right strong">${i_count } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-danger" role="progressbar"
					aria-valuenow="${i_state }" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_state}%">${i_state }%</div>
			</div>

			주문횟수<span class="pull-right strong">${ocount } 개</span>
			<div class="progress">
				<div class="progress-bar" role="progressbar"
					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">100%</div>
			</div>
			
			주문 완료<span class="pull-right strong"> ${state1 } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="${i_state1}" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_state1}%">${i_state1}%</div>
			</div>
			
			결제중<span class="pull-right strong"> ${state2 } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="${i_state2}" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_state2}%">${i_state2}%</div>
			</div>
			결제완료<span class="pull-right strong"> ${state3 } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="${i_state3}" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_state3}%">${i_state3}%</div>
			</div>
			배송준비중<span class="pull-right strong"> ${state4 } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="${i_state4}" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_state4}%">${i_state4}%</div>
			</div>
			배송중<span class="pull-right strong"> ${state5 } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="${i_state5}" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_state5}%">${i_state5}%</div>
			</div>
			배송완료<span class="pull-right strong"> ${state6 } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-warning" role="progressbar"
					aria-valuenow="${i_state6}" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_state6}%">${i_state6}%</div>
			</div>
			<hr />
		</div>
		
		<div class="col col-md-5">
		<div style="height:30px;"></div>
			<table style="width:100%">
				<tr>
					<td style="width:30%"></td>
					<td style="width:30%" align="center"><h4>1:1 문의 현황 </h4></td>
					<td style="width:30%" align="right"> <a href="admin_onetoone.do" class="btn btn-xs btn-info">자세히 보기</a></td>
				</tr>
			</table>
			1:1 문의 목록<span class="pull-right strong">${q_count } 개</span>
			<div class="progress">
				<div class="progress-bar" role="progressbar"
					aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
					style="width: 100%">100%</div>
			</div>

			답변 미완료<span class="pull-right strong">${n_count } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-danger" role="progressbar"
					aria-valuenow="${i_ncount }" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_ncount }%">${i_ncount }%</div>
			</div>

			답변 완료<span class="pull-right strong">${a_count } 개</span>
			<div class="progress">
				<div class="progress-bar progress-bar-success" role="progressbar"
					aria-valuenow="${i_acount }" aria-valuemin="0" aria-valuemax="100"
					style="width: ${i_acount }%">${i_acount }%</div>
			</div>
			<hr />
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
