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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Корзина</title>


<style>

table {
    
   
    width: 90%;
   
}
th, td {
    border: 1px solid white;
}

td.td1{
width: 200px;
}
td.td2{
width: 40%;
}


td.td4{
width: 10%;
text-align: center;
}

td.td5{
width: 10%;
text-align: center;
}
td.td5{
width: 20%;
}
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

div.link {
	font-size: 90%;
	height: 15%;
	width: 90px;
	background-color: red;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-align: center;
	float: center;
}

input.a[type=submit]:hover {
	background-color: black;
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












	

	




		



			



<form:form modelAttribute="cart" action="addOrder" method="post" id = "orderForm">


			<c:if test="${!empty products}">


				<c:forEach items="${products}" var="product">

					<hr>
					<table width="300px" border="1" align="center">



						
							<tr>
								<td class ="td1"><img src="data:image/jpg;base64,${product.smallImage}"
									width="150" height="150" /></td>
								<td class ="td2"><p>${product.title}</p></td>
								<td class ="td3"><input type="hidden" id="${product.productId}price" class="txt"
									value="${product.price}"></td>
								<td class ="td4"><select id="${product.productId}qty" class="txt" path="lineItems" name="lineItems[${product.productId}]">
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
								</select></td>
								<td class ="td5">${product.price}Руб</td>
								<td class ="td6"><input path="productId" type="hidden"
										value="${product.productId}" /><div  class = "link" onclick ="deleteItemAndShowCart(${product.productId})"  >Удалить</div></td>
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
