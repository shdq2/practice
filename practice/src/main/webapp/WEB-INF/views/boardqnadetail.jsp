<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>QnA</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	<div style="height:50px"></div>
		
		
		<section class="sec1"></section>
		<section class="content">
		<div class="container">
			<table id="table" class="table">
				<tr>
					<th>글번호</th>
					<td>${vo.qna_no }</td>					
				</tr>
				<tr>
					<th>글 제목</th>
					<td>${vo.qna_title }</td>					
				</tr>
				<tr>
					<th>글내용</th>
					<td>${vo.qna_content }</td>					
				</tr>
				<tr>
					<th>작성일</th>
					<td>${vo.qna_date }</td>
				</tr>
			</table>
			<div style="float:left">
				<c:if test="${max != 0 }">
					<a href="qna_detail.do?no=${max }" class="btn btn-info"><</a>
				</c:if>
				<c:if test="${max == 0 }">
					<a href="#" class="btn btn-info disabled"><</a>
				</c:if>
				
			</div>
			<div style="float:right">
				<a href="boardqna.do" class="btn btn-info">목록보기</a>
				
				<c:if test="${min != 0 }">
					<a href="qna_detail.do?no=${min }" class="btn btn-info">></a>
				</c:if>
				<c:if test="${min == 0 }">
					<a href="#" class="btn btn-info disabled">></a>
				</c:if>
			</div>
		</div>
		</section>
		<div class="header">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
<footer class="container-fluid text-center bg-lightgray" >

        <div class="copyrights" style="margin-top:25px;border:1px solid">
            <p>Mossy City © 2016, All Rights Reserved
                <br>
                <span>Web Design By: Mike Clark</span></p>
            <p><a href="https://www.linkedin.com/in/michael-clark-webdeveloper" target="_blank">Linkedin <i class="fa fa-linkedin-square" aria-hidden="true"></i> </a></p>
        </div>
</footer>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script>
		$(function(){

			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$('nav').addClass('black');
				} else {
					$('nav').removeClass('black');
				}
			});
		})
	</script>
</body>
</html>
