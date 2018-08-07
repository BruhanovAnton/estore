<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>>
<script >
function dialogData(product, id){

	
	
	$('#myDialog').html('Вы добавили '+product+' в корзину!');
	
	var x = document.getElementById("myDialog");
	x.show();
	setTimeout(function() {
		x.close();
	}, 2000);
	
	
	
	
	
	$.ajax({
    	type: "get",
		url: '/webstore/addToCart'+id
    });
		
};




</script>
<style>

.myDialog {
/* height: 100px; */
 border-radius: 6px; 
background: lightyellow;
  position: fixed;
    top: 50%;
    left: 25%;
  transform: translate(-50%, -50%);
  z-index:99999999;
}


   .layer {
    overflow: scroll; /* Добавляем полосы прокрутки */
    width: 100%; /* Ширина блока */
    height: 250px; /* Высота блока */
    padding: 5px; /* Поля вокруг текста */
    border: solid 1px white; /* Параметры рамки */
   } 
   
   td.leftColumn{
   width: 40%;
   }
   
   
   .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1 {
    background-color: lightgreen; 
    color: white; 

    display: block;
    margin-left: auto;
    margin-right: auto;
    border-radius: 4px;
}

.button1:hover {
    background-color: #4CAF50;
    color: white;
}
   h2.price{
  
    text-align: right;

   
   }
  </style>

</head>
<body>
   <dialog id="myDialog" class = "myDialog"></dialog>
<table class = "content">
<tr>
<td class = "leftColumn">
<img  src="data:image/jpg;base64,${product.smallImage}" alt="">
</td>
<td class = "rightColumn">
<h2 style="color: darkblue" >${product.title} </h2>
<h2 style="color: gray"  class = "price" >${product.price} Р</h2>
<hr>


<h2 >Описание:</h2>
<div class="layer">
   <h5 style="color: gray">${product.description}</h5>
  </div>
  <hr>
  <div id = "result"></div>
  <button onclick="dialogData('${product.title}',${product.productId})" class="button button1">В корзину</button>
</td>
</tr>
   </table> 
</body>
</html>