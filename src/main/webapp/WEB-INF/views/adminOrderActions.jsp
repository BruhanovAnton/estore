<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: white;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}


</style>
</head>
<body>
 <div id= "ordersList">
 <c:if test="${!empty orders}">
 <table id="customers">
 <tr><th>Order ID</th><th>Customer ID</th><th>TotalCost</th><th>Order Date</th><th></th><th></th></tr>
<c:forEach items="${orders}" var="order">
<tr><td>${order.orderId}</td><td>${order.customerId}</td><td>${order.totalCost}</td><td>${order.orderDate}</td><td>Подтвердить заказ</td><td>Отменить заказ</td></tr>

				
</c:forEach>
</table>
</c:if>
</div>
</body>
</html>