<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$(":file").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader();
				reader.onload = imageIsLoaded;
				reader.readAsDataURL(this.files[0]);
			}
		});
	});

	function imageIsLoaded(e) {
		$('#myImg').attr('src', e.target.result);
	};
</script>

<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}





input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}



</style>


</head>
<body>

<h2 align="center" font-family: "Times New Roman", Times, serif;">Панель управления магазином</h2>

<h3>Действия над товарами</h3>
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'add')">Добавить</button>
  
  <button class="tablinks" onclick="openCity(event, 'change')">Изменить</button>
  <button class="tablinks" onclick="openCity(event, 'delete')">Удалить</button>
</div>

<h3>Заказы</h3>
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'orders')">Список</button>
 
</div>

<div id="add" class="tabcontent">
 
  <form:form modelAttribute="product" action="addProduct" method="post" enctype="multipart/form-data">

		<table>
			
			<tr>
				<td> <input type='file' name="file" id="imgInp" />
					</td>
					<td>
					<img id="myImg" src="#"  with = "50%" height = "50%"/></td>
			</tr>
			
			<tr>
				<td><p>Название товара</p></td> <td> <form:input type="text" path="title" /></td>
			</tr>

			<tr>
				<td><p>Бренд</p></td> <td> <form:input type="text" path="brand"  /></td>
			</tr>
			<tr>
				<td><p>Описание товара</p></td> <td><form:input type="text" path="description"  /></td>
			</tr>
			<tr>
				<td><p>Цена товара</p></td> <td><form:input type="text" path="price" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Добавить товар"></td>
			</tr>
		</table>


	</form:form>
</div>

<div id="change" class="tabcontent">

  
  <form:form modelAttribute="product" action="changeDataProduct" method="post" enctype="multipart/form-data">

		<table>
			<tr>
				<td><p>Индификатор товара</p></td> <td><form:input type="text" path="productId"  /></td>
			</tr>
			<tr>
				<td> <input type='file' name="file" id="imgInp" />
					</td>
					<td>
					<img id="myImg" src="#"  with = "50%" height = "50%"/></td>
			</tr>
			
			<tr>
				<td><p>Название товара</p></td> <td> <form:input type="text" path="title" /></td>
			</tr>

			<tr>
				<td><p>Бренд</p></td> <td> <form:input type="text" path="brand"  /></td>
			</tr>
			<tr>
				<td><p>Описание товара</p></td> <td><form:input type="text" path="description"  /></td>
			</tr>
			<tr>
				<td><p>Цена товара</p></td> <td><form:input type="text" path="price" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Изменить товар"></td>
			</tr>
		</table>


	</form:form>
</div>

<div id="delete" class="tabcontent">
  
 <form:form modelAttribute="product" action="deleteProduct" method="post">

		<table>
			<tr>
				<td><p>Индификатор товара</p></td> <td><form:input type="text" path="productId"  /></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="Удалить товар"></td>
			</tr>
		</table>


	</form:form>
</div>


<div id="orders" class="tabcontent">
  
 <c:if test="${!empty orders}">
<c:forEach items="${orders}" var="order">

<p>Order ID: ${order.orderId}  Customer ID: ${order.customerId}  TotalCost: ${order.totalCost} Order Date: ${order.orderDate} </p>
				
</c:forEach>
</c:if>
</div>


<h2>${message}</h2>

	


 

</body>
</html>