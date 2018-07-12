<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

	
	
function showProductLit() {
	
    $.ajax({    	
        url : 'productList',
        success: function(response){
        $('#productsList').html(response);
        	      	
		},
		error: function(){						
			$('#productsList').html('Error while request..');
			
		}
    });
}

</script>
<style>
body {
    margin: 0;
}

div.filter {
border-radius: 6px;
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 20%;
    background-color: 	#f7fafa;
   position: fixed; 
    height: 100%;
/*     overflow: auto; */
   
    
}


</style>
<style> 
input[type=text] {
    width: 130px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;

    
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 100%;
}

input.range{
width: 30%;
text-align: left;
padding: 0px 0px 0px 0px;
margin: 10px 0px 5px 12px;

}
input.filterButton{
  margin: 30px;
  height:35px;
  width:50%;
  font-size: 90%;
}


</style>
</head>
<body onload="showProductLit()">

<div class ="filter" >
  <button onclick="showProductLit()">Load</button>
  <form>
  <input type="text" name="search" placeholder="Поиск..">
</form>
<h2>Бренд</h2>
<hr>
<form:form modelAttribute="filter" action="filterAct" method="post"
				id="submitForm">
<form:checkbox path="brand" value="Huawei"/>Huawei 
<Br>
<form:checkbox path="brand" value="Apple"/>Apple 
<Br>
<form:checkbox path="brand" value="Samsung"/>Samsung
<Br>
<form:checkbox path="brand" value="Sony"/>Sony
<Br>
<form:checkbox path="brand" value="Xiaomi"/>Xiaomi
<Br>


<h2>Цена</h2>					
<hr>
<ul>
	<form:input class = "range" type="text" path="minPrice" size="4" value="0" />

<form:input class = "range" type="text" path="maxPrice" size="4" value="100000" />
<br>
					

					<input class ="filterButton" type="submit" value="Фильтровать">
					
			</form:form>
</div>


<div style="margin-left:25%;padding:1px 16px;height:1000px;">

	<div id="productsList"></div>

</div>





</body>
</html>