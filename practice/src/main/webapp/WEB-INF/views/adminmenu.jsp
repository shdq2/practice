<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="resources/css/w3.css" />
	<link rel="stylesheet" href="resources/css/admin.css" />
		<link rel="stylesheet" href="resources/css/morris.css" />
	
</head>
<body>
    		<nav class="navbar navbar-default navbar-static-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="admin.do">
							<span style="color:black;">ADMIN</span>
						</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">			
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/practice/"><span style="color:black">Return back</span></a></li>
							<li class="dropdown ">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
									<span style="color:black;">Setting</span>
									<span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li class="dropdown-header"><span style="color:black;">Setting</span></li>
										<li class=""><a href="#"><span style="color:black;">Link</span></a></li>
										<li class="divider"></li>
										<li><a href="logout.do"><span style="color:black;">logout</span></a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</nav>
				<div class="container-fluid">
					<div class="col col-md-3">			
						<div class="panel-group" id="accordion">
						  <div class="panel panel-default">
							<div class="panel-heading">
							  <h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
								<span style="color:black;">회원 정보 관리</span></a>
							  </h4>
							</div>
							<div id="collapse1" class="panel-collapse collapse">
								<ul class="list-group">
									<li class="list-group-item"><span class="badge">${sessionScope._cnt}</span><a href="admin_member.do"><span style="color:black">회원관리</span></a></li>
									<!-- <li class="list-group-item"><span class="badge">253</span><a href="admin_member.do"><span style="color:black">회원삭제</span></a></li> -->
								</ul>
							</div>
						  </div>
						  <div class="panel panel-default">
							<div class="panel-heading">
							  <h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
								<span style="color:black;">판매물품관리</span></a>
							  </h4>
							</div>
							<div id="collapse2" class="panel-collapse collapse">
								<ul class="list-group">
									<li class="list-group-item"><a href="admin_insert_item.do"><span style="color:black">물품등록</span></a></li>
									<li class="list-group-item"><span class="badge">${sessionScope._icnt }</span><a href="admin_item.do"><span style="color:black">판매 물품 목록</span></a></li>
									<li class="list-group-item"><span class="badge">${sessionScope._icnt2 }</span><a href="admin_item_complete.do"><span style="color:black">판매 완료 물품 </span></a></li>
									<li class="list-group-item"><span class="badge">${sessionScope._ocnt }</span><a href="admin_order_list.do"><span style="color:black">제품별 주문 현황</span></a></li>
								</ul>
							</div>
						  </div>
							<div class="panel panel-default">
							<div class="panel-heading">
							  <h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
								<span style="color:black;">Settings</span></a>
							  </h4>
							</div>
							<div id="collapse3" class="panel-collapse collapse">
								<ul class="list-group">
									<li class="list-group-item"><span class="badge">1</span> Users Reported</li>
									<li class="list-group-item"><span class="badge">5</span> User Waiting Activation</li>
								</ul>
							</div>
						  </div>
						</div> 
					</div>
					<div class="col col-md-9">
						<div class="row">
						
