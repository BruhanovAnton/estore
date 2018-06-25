<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="<c:url value="/resources/css/productStyle.css" />" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>
$(document).ready(function() {

	  $('.color-choose input').on('click', function() {
	      var headphonesColor = $(this).attr('data-image');

	      $('.active').removeClass('active');
	      $('.left-column img[data-image = ' + headphonesColor + ']').addClass('active');
	      $(this).addClass('active');
	  });

	});

</script>
<title>Insert title here</title>
</head>
<body>
    <main class="container">

      <!-- Left Column / Headphones Image -->
      <div class="left-column">
        <img data-image="black" src="data:image/jpg;base64,${product.smallImage}" alt="">
        <img data-image="blue" src="data:image/jpg;base64,${product.smallImage}" alt="">
        <img data-image="red" class="active" src="data:image/jpg;base64,${product.smallImage}" alt="">
      </div>


      <!-- Right Column -->
      <div class="right-column">

        <!-- Product Description -->
        <div class="product-description">
          
          <h1>${product.title}</h1>
          
           <!-- Product Pricing -->
          <div class="product-price">
          <span>${product.price} Руб</span>
          <a href="#" class="cart-btn">В корзину</a>
          
        </div>
        <p>          </p>
        </div>

        <!-- Product Configuration -->
        <div class="product-configuration">

          <!-- Product Color -->
          <div class="product-color">
            <span>Color</span>

            <div class="color-choose">
              <div>
                <input data-image="red" type="radio" id="red" name="color" value="red" checked>
                <label for="red"><span></span></label>
              </div>
              <div>
                <input data-image="blue" type="radio" id="blue" name="color" value="blue">
                <label for="blue"><span></span></label>
              </div>
              <div>
                <input data-image="black" type="radio" id="black" name="color" value="black">
                <label for="black"><span></span></label>
              </div>
            </div>

          </div>

          <!-- Cable Configuration -->
          <div class="cable-config">
            <span>Cable configuration</span>

           

            
          </div>
        </div>

       
        
      </div>
    </main>

    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" charset="utf-8"></script>
    <script src="script.js" charset="utf-8"></script>

</body>
</html>