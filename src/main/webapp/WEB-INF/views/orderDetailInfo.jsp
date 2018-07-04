<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<c:if test="${!empty items}">
 <table id="customers">
 <tr><th>№ товара</th><th>количество</th></tr>
<c:forEach items="${items}" var="item">
<tr><td>${item.productId}</td><td>${item.quantity}</td></tr>

				
</c:forEach>
</table>
</c:if>

</body>
</html>