<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true" %>

<html>
<head>
	<title>회원가입</title>
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
		<div class="row">
		<div style="height:80px;"></div>
		<div class="col-md-12">
		<form:form action="join.do" method="post" modelAttribute="vo" id="form">
			<h1 style="width:100%;">회원가입</h1>
			<br />
			<h3>이용약관 동의</h3>
 <textarea
     rows="6" cols="150" class="form-control" style="resize: none"> 가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
만14세 미만 아동 회원가입 
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입 
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다. 
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집
   </textarea>
   <div class="form-inline">
   개인정보 수집 및 이용에 동의합니다. <input type="checkbox" name="req" class="form-control"> 
   </div>
    <br />
			<table class="table table-bordered">
				<tr>
					<th style="width:120px;background-color: #F3F3F3;text-align:center;vertical-align: middle">아이디</th>
					<td><form:input type="text" id="id" path="email" placeholder="userId@email.com" class="form-control" style="width:150px"/></td>
				</tr>
				<tr>
					<th style="background-color: #F3F3F3;text-align:center;vertical-align: middle">비밀번호 입력</th>
					<td><form:input type="password" id="pw" name="pw" path="pw" placeholder="비밀번호 입력" class="form-control" style="width:200px"/></td>
				</tr>
				<tr>
					<th style="background-color: #F3F3F3;text-align:center;vertical-align: middle">비밀번호 확인</th>
					<td><input type="password" id="pw1" name="pw1"placeholder="비밀번호 확인" class="form-control" style="width:200px"/></td>
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
			<br />
			
			<input type="submit" value="회원등록" class="btn btn-primary"/>
		</form:form>
		</div>
		</div>
	</div>
	</section>
</div>
<br />
<br />
<br />
<br />
<br />
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
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="resources/js/localization/messages_ko.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
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
					email:{
						/*
						required : 비어있는지 확인여부  - true/false
						minlength: 최소길이 - 숫자
						digits : 숫자 - true(숫자만가능)/false
						email: 이메일 입력 -true/false
						*/
						required :true,
						email:true,
						minlength:5,
						remote:'idcheck.do' // 아이디 중복확인
					},
					pw:{
						required:true,
						minlength:5
					},
					pw1:{
						required:true,
						minlength:5,
						equalTo :pw
					},
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
					},
					req:"required"
					
				},
				messages:{
					email:{
						required:'내용이 없습니다',
						email:'유효하지 않은 형식입니다',
						minlength:'5자이상 입력하세요',
						remote:'사용중인 아이디 입니다'
					},
					pw:{
						required:'암호를 입력하세요',
						minlength:'5자이상 입력하세요'
					},
					pw1:{
						required:'암호를 입력하세요',
						minlength:'5자이상 입력하세요',
						equalTo:'암호가 일치하지 않습니다'
					},
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
					},
					req:"약관에 동의해주세요"
					
				}
			});
		})
	</script>
</body>
</html>
