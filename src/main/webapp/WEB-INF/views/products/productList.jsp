<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.product-wrapper {
	display: block;
	width: 100%;
	float: left;
	transition: width .2s;
}

@media only screen and (min-width: 450px) {
	.product-wrapper {
		width: 50%;
	}
}

@media only screen and (min-width: 768px) {
	.product-wrapper {
		width: 33.333%;
	}
}

@media only screen and (min-width: 1000px) {
	.product-wrapper {
		width: 25%;
	}
}

.product {
	display: block;
	
	border-radius: 3px;
	position: relative;
	background: #fff;
	margin: 0 20px 20px 0;
	text-decoration: none;
	color: #474747;
	z-index: 0;
	height: 450px;
}
.product-photo {
	position: relative;
	padding-bottom: 100%;
	overflow: hidden;
}

.product-photo img {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	max-width: 100%;
	max-height: 100%;
	margin: auto;
	transition: transform .4s ease-out;
}
.product:hover .product-photo img {
	transform: scale(1.05);
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
color: gray;
}
h4.title{
margin: 30px;
}
</style>


</head>
<body>



	
	

<c:if test="${!empty products}">
<c:forEach items="${products}" var="product">

		
	
	<li class="product-wrapper">
					<div href="" class="product">
						<div class="product-photo">
							<img alt="sample" src="data:image/jpg;base64,${product.smallImage}" >
						</div>
						<h2 align="center" class ="price">${product.price} ₽</h2>
						<h4 align="center" class ="title"><a  href="product/${product.productId}" target="_blank">${product.title}</a></h4>
						
						
						<button onclick="dialogData('${product.title}', ${product.productId})" class="button button1">В корзину</button>
					</a>
					
				</div>
			
</c:forEach>
</c:if>





</body>
</html>