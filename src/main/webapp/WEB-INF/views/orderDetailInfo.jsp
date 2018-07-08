<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
$('#me').hide();
function chageOrderStatus(link, status) {
	
    $.ajax({
    	
        url : link,
        success: function(response){
        	
        	if(status == 'completed'){
        		$('#me').show();
        		$("#me").css({"background-color": "yellow", "color" : "black"});
        		$('#me').html('Статус изменен на "ВЫПОЛНЕНО"');
        	}else{
        		$('#me').show();
        		$("#me").css({"background-color": "red", "color" : "white"});
        		$('#me').html('Статус изменен на "ОТМЕНЕН"');
        	}
        	
		},
		error: function(){						
			$('#me').html('Error while request..');
			$('#me').show();
		}
    });
}
</script>
<style>

button{

    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
button.cancel{
background-color: red;
}
button.do{
background-color: green;
float: right;
}



</style>
</head>
<body>


<c:if test="${!empty items}">
 <table id="customers">
 <tr><th>Изображение</th><th>№ товара</th><th>количество</th><th>Цена</th><th>Название</th><th>Бренд</th></tr>
<c:forEach items="${items}" var="item">
<tr><td><img src="data:image/jpg;base64,${item.smallImage}"
			width="60" height="60" /></td><td>${item.productId}</td><td>${item.quantity}</td><td>${item.price}</td><td>${item.title}</td><td>${item.brand}</td></tr>

				
</c:forEach>
</table>
 <button onclick ="chageOrderStatus('chageOrderStatusTocCancel' + ${orderId}, 'cancel')" class ="cancel">Отменить</button><button onclick ="chageOrderStatus('chageOrderStatusTocCompleted' + ${orderId}, 'completed')" class ="do">Выпонить</button>
</c:if>

<div class ="message" id="me"></div>
</body>
</html>