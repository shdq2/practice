<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<!-- Topper w/ logo -->
		<div class="row hidden-xs topper" style="margin-top:5px;margin-bottom:5px">
			<div class="col-xs-7 col-sm-7">
				<a href="/practice/"><img width="300px" am-TopLogo alt="SECUREVIEW"  src="http://blog.convertify.io/assets/images/logo--hero.png" class="img-responsive"></a>
			</div>
			<div class="col-xs-5 col-xs-offset-1 col-sm-7 col-sm-offset-0 text-right" >
				<c:if test="${sessionScope._mvo == null }">
					<p am-CallNow><a href="login.do" id="login" class="w3-btn">로그인</a> <a href="join.do" class="w3-btn">회원가입</a></p>
				</c:if>
				<c:if test="${sessionScope._mvo != null }">
					<a href="logout.do" class="w3-btn">로그아웃</a>
					<c:if test="${sessionScope._mvo.code == 2}">
						<div style="float:right;" class="w3-dropdown-hover">
							<button class="w3-btn">판매자 페이지 </button>
							<div class="w3-dropdown-content w3-bar-block">
								<a href="edit.do" class="w3-bar-item w3-button" style="margin-top:0px">회원정보수정</a>
								<a href="changepw.do" class="w3-bar-item w3-button" style="margin-top:0px">비밀번호 변경</a>
								<a href="cart.do" class="w3-bar-item w3-button" style="margin-top:0px">장바구니</a>
								<a href="orderlist.do" class="w3-bar-item w3-button" style="margin-top:0px">주문목록</a>
								<a href="insert_item.do" class="w3-bar-item w3-button" style="margin-top:0px">물품등록</a>
								<a href="my_item.do" class="w3-bar-item w3-button" style="margin-top:0px">내 물품</a>
								<a href="sales.do" class="w3-bar-item w3-button" style="margin-top:0px">판매현황</a>
							</div>						
						</div>
					</c:if>
					<c:if test="${sessionScope._mvo.code == 1}">
						<div style="float:right;" class="w3-dropdown-hover">
							<button class="w3-btn">마이 페이지 </button>
							<div class="w3-dropdown-content w3-bar-block">
								<a href="edit.do" class="w3-bar-item w3-button" style="margin-top:0px">회원정보수정</a>
								<a href="changepw.do" class="w3-bar-item w3-button" style="margin-top:0px">비밀번호 변경</a>
								<a href="cart.do" class="w3-bar-item w3-button" style="margin-top:0px">장바구니</a>
								<a href="orderlist.do" class="w3-bar-item w3-button" style="margin-top:0px">주문목록</a>
								
							</div>						
						</div>
					</c:if>
					<c:if test="${sessionScope._mvo.code == 999}">
						<div style="float:right;" class="w3-dropdown-hover">
							<button class="w3-btn">관리자 페이지 </button>
							<div class="w3-dropdown-content w3-bar-block">
								<a href="admin_member.do" class="w3-bar-item w3-button" style="margin-top:0px">회원관리</a>
								<a href="admin_item.do" class="w3-bar-item w3-button" style="margin-top:0px">물품관리</a>
								<a href="admin_order.do" class="w3-bar-item w3-button" style="margin-top:0px">주문관리</a>
							
								
							</div>						
						</div>
					</c:if>
				</c:if>
			</div>
			
		</div> <!-- End Topper -->
		
	<div class="row">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand visible-xs-inline-block nav-logo" href="/"><img src="/images/logo-dark-inset.png" class="img-responsive" alt=""></a>
					</div>
				
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<ul class="nav navbar-nav js-nav-add-active-class">
							<li><a href="/practice/">Home</a></li>
							
							<li class="dropdown">
							    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Markets <b class="caret"></b></a>
							    <ul class="dropdown-menu" role="menu" id="menu">
									<li><a href="shop.do?frame=1">shirts</a></li>
									<li><a href="shop.do?frame=2">pants</a></li>
									<li><a href="shop.do?frame=3">shoes</a></li>
							    </ul>
							</li>
							
							<li><a href="board.do">QnA</a></li>
							<li class="visible-xs-block"><a href="https://susteen7.zendesk.com/hc/en-us">Support</a></li>
							<li class="dropdown">
							    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Company <b class="caret"></b></a>
							    <ul class="dropdown-menu" role="menu">
									<li><a href="about.html">About Us</a></li>
									<li><a href="careers.html">Careers</a></li>
									<li><a href="press-release.html">Press Release</a></li>
							    </ul>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right hidden-xs form-inline">
							<input type="text"class="form-control" style="margin-top:7px" id="search" placeholder="검색">
						</ul>
					</div><!-- /.navbar-collapse -->
				</div>
			</nav>
		</div>