<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<html>

	<jsp:include page="adminmenu.jsp"></jsp:include>

<div class="row text-center">
<div class="col-md-12 dashhead" style="border:1px solid">
<h1> 제품 등록</h1>
</div>
			<form:form action="admin_insert_item.do" method="post" enctype="multipart/form-data" modelAttribute="vo">
				<table class="table" style="margin:0px auto;padding-top:10px;">
					<tr>
						<td style="width:20%;"><label style="text-align:center;">상품분류</label><form:input path="member_email" type="hidden"/></td>
						<td class="form-inline" >							
							<form:select path="code" class="form-control" id="code_type">
								<c:forEach var ="i" items="${clist }">
									<option value="${i.item_code }">${i.name_code }</option>									
								</c:forEach>
							</form:select>
							<input type="button" value="카테고리 추가" id="category" class="form-control" />
						</td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;"><form:input type="hidden" path="no" />제목</label></td>
						<td ><form:input type="text" class="form-control" path="name"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">상품설명</label></td>
						<td ><form:textarea rows="6" style="width:100%;resize:none;" class="form-control" path="content"></form:textarea></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">상품가격</label></td>
						<td ><form:input type="text" class="form-control" path="price"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">상품수량</label></td>
						<td ><form:input type="text" class="form-control" path="qty"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">이미지 등록</label></td>
						<td ><input type="file" name="img_1"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">이미지 등록</label></td>
						<td ><input type="file"name="img_2"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">이미지 등록</label></td>
						<td ><input type="file"name="img_3"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">이미지 등록</label></td>
						<td ><input type="file"name="img_4"/></td>
					</tr>
					<tr>
						<td style="width:20%;"><label style="text-align:center;">이미지 등록</label></td>
						<td ><input type="file"name="img_5"/></td>
					</tr>
				</table>
					<input type="submit" value="상품등록"/>
			</form:form>
		</div>
		
	</div>
	
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="resources/js/sweetalert.min.js"></script>
	<script>
		$(function(){
			$('#collapse2').addClass("in");
			$('#category').click(function(){
				swal({			
					title:"카테고리 추가",
					content:{
						element:"input",
						attributes:{
							placeholder:"새로운 카테고리을 입력하세요",
							type:"text",
						},
					},
					button:{
						text:"확인"
					}
				})
				.then((value) => {
					if(value){
						if(value!=""){
							console.log(value);
							return fetch('json_insert_category.do?txt='+value)
						}
						else{
							swal("항목을 입력하세요");
							return false;
						}
					}else{
						return true;
					}
				}).then(results =>{
					return results.json();
				})
				.then(json =>{
					var i = json.length;
					console.log(json[1].item_code);
					$('#code_type option').remove();
					for(var j=0;j<i;j++)
						
						$('#code_type').append(
							"<option value='"+json[j].item_code+"'>"+json[j].name_code+"</option>"		
						);
				});
			})
		})
	</script>
</body>
</html>
