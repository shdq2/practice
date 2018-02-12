<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	<div class="container">
    <div class="row">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Login via site</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form:form accept-charset="UTF-8" role="form" modelAttribute="vo">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <form:input class="form-control" placeholder="yourmail@example.com" name="email" path="email" type="text"/>
			    		</div>
			    		<div class="form-group">
			    			<form:input class="form-control" placeholder="Password" name="password" type="password" path="pw" value=""/>
			    		</div>
			    			<input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
			    	</fieldset>
			      	</form:form>
			    </div>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript" src="resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>

</body>
</html>
