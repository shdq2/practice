<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css" />
	<link rel="stylesheet" href="resources/css/admin.css" />
</head>
<body>
<div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>

<div id="wrapper">

    <!-- Navigation -->
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars" aria-hidden="true" style="color: white;"></i>
            </button>
            <div class="navbar-brand">   
            </div>
        </div>

        <form action="" class="navbar-form navbar-left">
            <div class="input-group">
              <div class="input-group-btn">
                  <button class="btn  search-btn-ico n">
                   <i class="fa fa-search" aria-hidden="true"></i>                  
                  </button>
               </div>
                 
            </div>     
        </form>

        <!-- Top Menu Items -->
        <div class="items">
          <ul class="nav navbar-right top-nav">
            <li class="editpro">
              <i class="fasett fa-cog" aria-hidden="true" class="menu-button" id="menu-button"></i> 
              <h5 class="pull-left login-person-head">Welcome WaLiA SaAB</h5> 
            </li>
          </ul>
        </div>

        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse" style="background-color: #616060; border:1px solid #616060;">
            <ul class="nav navbar-nav side-nav">
              <a href="#"><img class="logostyle" src="https://vignette.wikia.nocookie.net/nationstates/images/2/29/WS_Logo.png/revision/latest?cb=20080507063620" alt="LOGO""></a>
                <li>
                   <a class="active" href="admin.do" data-toggle="collapse" data-target="#submenu-1"id="home_menu"><i class="fa fa-home" aria-hidden="true"></i>   <span style="color:white;">  Home </span></a>
                </li>
                <li>
                    <a class="#" href="admin_member.do" data-toggle="collapse" data-target="#submenu-1" id="member_menu"><i class="fa fa-user-o" aria-hidden="true"></i>   <span style="color:white;">  회원관리 </span></a>
                </li>
                <li>
                    <a class="#" href="#" data-toggle="collapse" data-target="#submenu-1" id="item_menu"><i class="fa fa-calendar" aria-hidden="true"></i>   <span style="color:white;"> 판매물품 관리 </span></a>
                </li>
                <li>
                    <a class="#" href="#" data-toggle="collapse" data-target="#submenu-1" id="qna_menu"><i class="fa fa-envelope" aria-hidden="true"></i>  <span style="color:white;"> qna관리 </span></a>
                </li>
                <li>
                    <a class="#" href="#" data-toggle="collapse" data-target="#submenu-1" id="setting_menu"><i class="fa fa-cogs" aria-hidden="true"></i>   <span style="color:white;"> 설정 </span></a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
  </nav>


<div class="container-fluid">
<div class="row text-center">
<div class="col-md-12 dashhead" style="border:1px solid">
<h1> 관리자 페이지</h1>
</div>
<!-- <div class="col-md-6" style="border:1px solid;height:40%;">
<div class="dashhead form-inline">
<h3> 회원관리</h3>
<input type="button" value="더보기" class="btn-xs" style="float:right"/>
</div>
<table class="table">
	<tr>
		<th>회원 아이디</th>
		<th>회원 이름</th>
		<th>회원 회원가입일</th>
		<th>비고</th>
	</tr>
</table>
</div>
<div class="col-md-6" style="border:1px solid;height:40%">test</div>
<div class="col-md-6" style="border:1px solid;height:40%">test</div>
<div class="col-md-6" style="border:1px solid;height:40%">test</div> -->
</div>
</div>

  </div><!-- /#wrapper -->