<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function orderDetailInfo(link) {
	
    $.ajax({
    	
        url : link,
        success : function(data) {
            $('#orderDetails').html(data);
        }
    });
}

</script>

</script>
<style>
.modalDialog {
    position: fixed;
    font-family: Arial, Helvetica, sans-serif;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    z-index: 99999;
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.modalDialog:target {
    opacity:1;
    pointer-events: auto;
}
.modalDialog > div {
    width: 800px;
    position: relative;
    margin: 10% auto;
    padding: 5px 20px 13px 20px;
    border-radius: 10px;

}
.close {
    background: #606061;
    color: #FFFFFF;
    line-height: 25px;
    position: absolute;
    right: -12px;
    text-align: center;
    top: -10px;
    width: 24px;
    text-decoration: none;
    font-weight: bold;
    -webkit-border-radius: 12px;
    -moz-border-radius: 12px;
    border-radius: 12px;
    -moz-box-shadow: 1px 1px 3px #000;
    -webkit-box-shadow: 1px 1px 3px #000;
    box-shadow: 1px 1px 3px #000;
}
.close:hover {
    background: #00d9ff;
}


</style>
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
 <tr><th>№ заказа</th><th>Дата и время</th><th>Общая сумма </th><th>Детали</th></tr>
<c:forEach items="${orders}" var="order">
<tr><td>${order.orderId}</td><td>${order.orderDate}</td><td>${order.totalCost} (Руб)</td><td><a onclick ="orderDetailInfo('orderDetailInfo' + ${order.orderId})" href="#openModal">Подробнее</a></td></tr>

				
</c:forEach>
</table>
</c:if>
</div>




<div id="openModal" class="modalDialog">
    <div>	<a onclick ="loadPage('adminOrderActions')" href="#close" title="Close" class="close">X</a>
<div id="orderDetails"></div>
        	

           </div>
</div>
</body>
</html>