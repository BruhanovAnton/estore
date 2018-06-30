<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'orders')">Список</button>
 
</div>

<div id="orders" class="tabcontent">
  
 <c:if test="${!empty orders}">
<c:forEach items="${orders}" var="order">

<p>Order ID: ${order.orderId}  Customer ID: ${order.customerId}  TotalCost: ${order.totalCost} Order Date: ${order.orderDate} </p>
				
</c:forEach>
</c:if>
</div>
</body>
</html>