<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" %>

<html>
<head>
	<title>회원정보수정</title>
	<jsp:include page="css.jsp"></jsp:include> 
</head>
<body>

	<div class="header ">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	<div class="body">
	<section class="sec1"></section>
	<section class="content">
	<div class="container">
	<div style="height:80px;"></div>
		<form:form action="edit.do" method="post" modelAttribute="vo" id="form">
			<h1>회원정보수정</h1>
			<hr />
			
			<table class="table table-bordered">
				<tr>
					<th style="width:120px;background-color: #F3F3F3;text-align:center;vertical-align: middle">아이디</th>
					<td><form:input type="text" id="id" path="email" placeholder="userId@email.com" class="form-control" style="width:150px"/></td>
				</tr>
				<tr>
					<th style="background-color: #F3F3F3;text-align:center;vertical-align: middle">이름 입력</th>
					<td ><form:input type="text" id="name" name="name" path="name" placeholder="이름입력" class="form-control" style="width:200px"/></td>
				</tr>
				<tr>
					<th style="vertical-align: middle;background-color: #F3F3F3;text-align:center;" rowspan="3">주소 입력</th>
					<td style="border-bottom: 0px">
					<div class="form-inline">
						<form:input type="text" id="postcode" name="postcode" path="postcode" placeholder="00012" class="form-control" readonly="true" style="width:100px"/>
						<input type="button" id="search_addr" class="btn" value="주소찾기"/>
					</div>
				</td>
				</tr>
				<tr>
					<td style="border:0px"><form:input type="text" id="addr1" name="addr1" path="addr1" class="form-control" readonly="true" style="width:300px"/></td>
				</tr>
				<tr>
					
					<td style="border:0px"><form:input type="text" id="addr2" name="addr2" path="addr2" placeholder="세부주소 입력" class="form-control" style="width:300px"/></td>
				</tr>
			</table>
			<div style="margin-top:10px">
				<input type="submit" value="회원정보 수정" class="btn btn-primary" />
				<a href="memberdelete.do" id="memberdelete" class="btn btn-warning">회원 탈퇴</a>
			</div>
		</form:form>
			
	</div>
	</section>
</div>
<footer class="container-fluid text-center bg-lightgray">

        <div class="copyrights" style="margin-top:25px;">
            <p>Mossy City © 2016, All Rights Reserved
                <br>
                <span>Web Design By: Mike Clark</span></p>
            <p><a href="https://www.linkedin.com/in/michael-clark-webdeveloper" target="_blank">Linkedin <i class="fa fa-linkedin-square" aria-hidden="true"></i> </a></p>
        </div>
</footer>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="resources/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="resources/js/localization/messages_ko.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="resources/js/login.js"></script>
	<script>
		$(function(){

			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$('nav').addClass('black');
				} else {
					$('nav').removeClass('black');
				}
			});
			$('#search_addr').click(function(){
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var fullAddr = ''; // 최종 주소 변수
				                var extraAddr = ''; // 조합형 주소 변수

				                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    fullAddr = data.roadAddress;

				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    fullAddr = data.jibunAddress;
				                }

				                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				                if(data.userSelectedType === 'R'){
				                    //법정동명이 있을 경우 추가한다.
				                    if(data.bname !== ''){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있을 경우 추가한다.
				                    if(data.buildingName !== ''){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				                }

				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
				                document.getElementById('addr1').value = fullAddr;

				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById('addr2').focus();
				            }
				        }).open();
			});
			
			$('#form').validate({
				submitHandler:function(){
					return true;
				},
				rules:{
					name:{
						required:true
					},
					postcode:{
						required:true
					},
					addr1:{
						required:true
					},
					addr2:{
						required:true
					}
					
				},
				messages:{
					name:{
						required:'이름을 입력하세요'
					},
					postcode:{
						required:'내용이 없습니다'
					},
					addr1:{
						required:'내용이 없습니다'
					},
					addr2:{
						required:'내용이 없습니다'
					}
				}
			});
			
		})
	</script>
</body>
</html>
