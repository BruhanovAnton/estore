<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/cart.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Корзина</title>


<style>
input[type=number], select {
	width: 10%;
	height: 5px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	float: right;
}

input[type=submit] {
	font-size: 110%; /
	width: 20%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	background-color: white;
}

select {
	font-size: 90%;
	height: 15%;
	width: 70px;
	background-color: lightgray;
	color: black; */
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	
	float: right;
}

a.link {
	font-size: 90%;
	height: 15%;
	width: 50px;
	background-color: red;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-align: center;
	float: right;
}

input.a[type=submit]:hover {
	background-color: black;
}

td.titleInTable{

	width: 40%;
}

p.anount{
font-size: 135%;
background-color: lightgray;
}
a { 
    text-decoration: none; /* Отменяем подчеркивание у ссылки */
   } 


</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<script>
	$(document).ready(function() {
		
	
		var value = '';
		$("select").on("change", function() {

			
			
			var i = 0;			
			var sum = 0;

		//iterate through each select and multiply the values
		$("select").each(function() {
		thisID = $(this).attr("id").replace("qty", "price");

		sum = sum + (parseInt($(this).val()) * parseInt($("#"+ thisID).val()));
		
		
		
		
	});

				
		
		
		
//.toFixed() method will roundoff the final sum to 2 decimal places
$("#sum").html(sum.toFixed(2));



$("#totalCost").val(sum.toFixed(2));
		});
		


	
				
     
	
		    
		
});
</script>




</head>
<body>












	<div id="mainWrapper">
		<header> <!-- This is the header content. It contains Logo and links -->
		<div id="logo">
			<img src="resources/img/shop logo.png" alt="sample logo" width="200"
				height="73">
			<!-- Company Logo text -->
		</div>
		<div id="headerLinks">
			<a href="#" title="Login/Register">Войти/Регистрация</a><a href="#"
				title="Cart"><img src="resources/img/shoping cart.png"
				alt="sample logo" width="40" height="40"></a>
		</div>
		</header>

		<div id="content">




		



			



<form:form modelAttribute="cart" action="addOrder" method="post" id = "orderForm">


			<c:if test="${!empty products}">


				<c:forEach items="${products}" var="product">

					<hr>
					<table width="300px" border="1">



						
							<tr>
								<td><img src="data:image/jpg;base64,${product.smallImage}"
									width="150" height="150" /></td>
								<td class = "titleInTable"><p>${product.title}</p></td>
								<td><input type="hidden" id="${product.productId}price" class="txt"
									value="${product.price}"></td>
								<td><select id="${product.productId}qty" class="txt" path="lineItems" name="lineItems[${product.productId}]">
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
								</select></td>
								<td>${product.price}Руб</td>
								<td><input path="productId" type="hidden"
										value="${product.productId}" /><a class = "link" href="/webstore/cartDeleteItem/${product.productId}" >Удалить</a></td>
							</tr>

						

					</table>
					<hr>
				</c:forEach>
			</c:if>




			<c:if test="${!empty products}">
<p class="anount">
						Сумма покупки: <span id="sum">0</span> Руб
						<form:input type = "hidden" path = "totalCost" id="totalCost"/>
						<form:input type = "text" path = "userId" />
					</p>
				
<c:forEach items="${products}" var="product">
					
<%-- 					<input  type = "text" name="lineItems[${product.productId}]"   path="lineItems" id = "${product.productId}amount"/> --%>
					
															
					
					</c:forEach>
					<input type="submit" value="Оформить заказ">
					
					
					
					
				
			</c:if>
			
			</form:form>
			
			</body>
</html>
