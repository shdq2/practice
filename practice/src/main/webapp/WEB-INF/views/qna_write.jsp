<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<html>

	<jsp:include page="adminmenu.jsp"></jsp:include>

<div class="row text-center">
<div class="col-md-12 dashhead">

<h1> QnA 등록</h1>
</div>
<hr />
			<form:form action="qna_write.do" method="post" modelAttribute="qvo">
				<table class="table" style="margin:0px auto;padding-top:10px;">					
					<tr>
						<td style="width:20%;"><label style="text-align:center;">제목</label><form:input path="qna_no" type="hidden"/></td>
						<td ><form:input type="text" class="form-control" path="qna_title"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">내용</label></td>
						<td ><form:textarea rows="6" style="width:100%;resize:none;" class="form-control" path="qna_content"></form:textarea></td>
					</tr>
					
				</table>
					<input type="submit" value="QnA 등록" class="form-control"/>
			</form:form>
		</div>
		
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script>
		$(function(){
			$('#collapse3').addClass("in");
			
		})
	</script>
</body>
</html>
