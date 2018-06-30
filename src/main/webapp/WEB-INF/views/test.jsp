<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
    function doAjax() {
      $.ajax({
        url: 'checkStrength',
        data: ({password : $('#password').val()}),
        success: function(data) {
          $('#strengthValue').html(data);
        }
      });
    }
  </script>


</head>

<body>





	<form:form method="POST" modelAttribute="user" action="check-user"
		class="box login">


		<fieldset class="boxBody">

			<span style="float: right"> 
				<a href="?lang=en">en</a> 
				<a href="?lang=ru">ru</a>
			</span>



			<form:label path="name">
				<spring:message code="username" />
			</form:label>
			<form:input path="name" />
			<form:errors path="name" cssClass="error" />


		

			<form:label path="password">
				<spring:message code="password" />
			</form:label>
			
	
			
			<form:password path="password" onkeyup="doAjax()"/>
			<form:errors path="password" cssClass="error" />
				<span style="float: right" id="strengthValue"> 
			</span>

		</fieldset>

		<footer>  
		
				<form:checkbox path="admin" class="checkAdmin"/>
		
		<form:label
			path="admin">
			<spring:message code="admin" />
		</form:label> 
		

		
		<input type="submit" class="btnLogin"
			value="<spring:message code="login"/>"> 
			
			
			</footer>


	</form:form>


</body>
</html>