<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!-- Topper w/ logo -->
				<div style="border:1px solid;height:25px;background-color:black;text-align:right;width:100%">
			<div class="container">
				<c:if test="${sessionScope._mvo == null }">
					<a href="login.do" ><span style="color:white;font-family:sans-serif;font-weight:bold">로그인&nbsp;&nbsp;</span></a>
					<a href="join.do" data-toggle="modal" data-target=".bs-modal-sm" ><span style="color:white;font-family:sans-serif;font-weight:bold">회원가입&nbsp;&nbsp;</span></a>
					
						
					
					
				</c:if>
				<c:if test="${sessionScope._mvo.code == 1 }">
					<a href="logout.do" ><span style="color:white;font-family:sans-serif;font-weight:bold">로그아웃&nbsp;&nbsp;</span>
				</c:if>
				<c:if test="${sessionScope._mvo.code == 999 }">
					<a href="logout.do" ><span style="color:white;font-family:sans-serif;font-weight:bold">로그아웃&nbsp;&nbsp;</span></a>
					<a href="admin.do" ><span style="color:white;font-family:sans-serif;font-weight:bold">관리자페이지&nbsp;&nbsp;</span></a>
					
				</c:if>
				<div class="w3-dropdown-hover">
						<a href="#" ><span style="color:white;font-family:sans-serif;font-weight:bold">마이페이지&nbsp;&nbsp;</span></a>
					<div class="w3-dropdown-content w3-bar-block">
							<a href="edit.do" class="w3-bar-item w3-button" style="margin-top:0px">회원정보수정</a>
							<a href="changepw.do" class="w3-bar-item w3-button" style="margin-top:0px">비밀번호 변경</a>
							<a href="cart.do" class="w3-bar-item w3-button" style="margin-top:0px">장바구니</a>
							<a href="order.do" class="w3-bar-item w3-button" style="margin-top:0px">주문목록</a>		
					</div>	
					</div>
				<div class="w3-dropdown-hover">
						<a href="#" ><span style="color:white;font-family:sans-serif;font-weight:bold">고객센터&nbsp;&nbsp;</span></a>
						<div class="w3-dropdown-content w3-bar-block">
							<a href="boardqna.do" class="w3-bar-item w3-button" style="margin-top:0px">QnA</a>
							<a href="onetoone.do" class="w3-bar-item w3-button" style="margin-top:0px">1:1문의</a>		
						</div>	
					</div>
			</div>			
		</div>
	<nav>
		<div class="container">
			<div class="logo">
				<img src="https://www.dragoninfosec.com/wp-content/uploads/2016/05/cropped-Dragon_IT_Security1-1.png">
			</div>
		
			<ul>
				<li><a href="/practice/" id="home_menu">Home</a></li>
				<c:forEach var="i" items="${clist }" varStatus="j">
				<li><a href="shop.do?code=${i.item_code }" id="menu_${j.count }">${i.name_code }</a></li>
				</c:forEach>
			</ul>
		
		</div>
	</nav>