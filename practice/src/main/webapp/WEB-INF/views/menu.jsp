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
					<p am-CallNow><a href="login.do" id="login">로그인</a> / <a href="join.do">회원가입</a></p>
				</c:if>
				<c:if test="${sessionScope._mvo != null }">
					<p am-CallNow><a href="logout.do">로그아웃</a> / <a href="edit.do">회원정보수정</a> /<a href="cart.do">장바구니</a></p>
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