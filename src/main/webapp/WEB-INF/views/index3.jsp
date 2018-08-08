<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<title>Spring MVC submit form AJAX JQuery</title>



<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<script type="text/javascript">

function send(){

// var name=$("#name").val();
// var email=$("#email").val();

var name='test';
var email='test';

var obj = 'name='+name+'&email'+email;
  $.ajax({
   url:"simple.form",
   type:"GET",
   data:obj,
   contentType:"application/json",
   success:function(response){
  alert(response +' work');
  },
  error:function(error){
  alert(error + ' not work');
  }
});
}
</script>

</head>
<body>

	<form >
	<input id="name" type = "text" value ="test">
	<input id="email" type = "text" value ="test">
	<input type ="submit" value = "submit" onclick="send()" >
	</form>

	



</body>
</html>