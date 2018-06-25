<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/index.css" />" rel="stylesheet">
<title>Spring MVC submit form AJAX JQuery</title>



<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  

<script type="text/javascript">




// $(document).ready(function() {

// 	$('#submitForm').submit(function(e) {
// 		var frm = $('#submitForm');
// 		e.preventDefault();

// 	    var data = {}
// 	    var Form = this;

// 	    //Gather Data also remove undefined keys(buttons)
// 	    $.each(this, function(i, v){
// 	            var input = $(v);
// 	        data[input.attr("name")] = input.val();
// 	        delete data["undefined"];
// 	    });
//     $.ajax({
//         contentType : 'application/json; charset=utf-8',
//         type: frm.attr('method'),
//         url: frm.attr('action'),
//         dataType : 'json',
//         data : JSON.stringify(data),
//         success : function(callback){
//         	alert("Response: Name: "+callback.name+"  DOB: "+callback.dob+"  Email: "+callback.email+"  Phone: "+callback.phone);
//             $(this).html("Success!");
//         },
//         error : function(){
//             $(this).html("Error!");
//         },
//         complete: function(){ 
//         	   document.location.reload(); 
//         	 }
//     });
// 	});
// });
















	
	$(document).ready(function() {

		$('#form').submit(function(e) {
			
			e.preventDefault();
						

			var formID = $(this).attr('id'); // Получение ID формы
            var frm = $('#' + formID);
						
		    var data = {}

		    //Gather Data also remove undefined keys(buttons)
		    $.each(this, function(i, v){
		            var input = $(v);
		        data[input.attr("name")] = input.val();
		        delete data["undefined"];
		    });
        $.ajax({
            contentType : 'application/json; charset=utf-8',
            type: frm.attr('method'),
            url: frm.attr('action'),
            dataType : 'json',
            data : JSON.stringify(data),
           
        });
		});
	});
	

	
	
	
	

	function showDialog() { 
				
		var x = document.getElementById("myDialog");
		 x.show();
		 
		    
	    
	    setTimeout(function () { x.close();}, 1500);
	} 
	
	
	
	$( function() {
		
		
	    $( "#dialog" ).dialog({
	      autoOpen: false,
	      show: {
	        effect: "fade",
	        duration: 1000
	      },
	      hide: {
	        effect: "fade",
	        duration: 1000
	      }
	    });
	 
	    $( "#opener" ).on( "click", function() {
	      $( "#dialog" ).dialog( "open" );
	    });
	  } );

	
</script>

</head>
<body>

<div id="dialog" title="Basic dialog">
  <p>This is an animated dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
</div>
 
<!-- <button id="opener">Open Dialog</button> -->

 
<!-- <button id="opener"  onClick="createDialog('Confirm deletion!', 'Do you really want to delete this package?')">Open Dialog</button> -->


<div id="mainWrapper">
  <header> 
    <!-- This is the header content. It contains Logo and links -->
    <div id="logo"> 
		<img src="resources/img/shop logo.png" alt="sample logo" width="200" height="73">
      <!-- Company Logo text --> 
      </div>
    <div id="headerLinks"><a href="#" title="Login/Register">Войти/Регистрация</a><a href="cart2" target="_blank"
    title="Cart"><img src="resources/img/shoping cart.png" alt="sample logo" width="35" height="35" ></a></div>
  </header>
  <section id="offer"> 
    <!-- The offer section displays a banner text for promotions -->
    <h2>Скидки до 50%</h2>
    <p>САМАЯ БОЛЬШАЯ РАСПРОДАЖА ТОЛЬКО В ЭТОМ МЕСЯЦЕ</p>
  </section>
  <div id="content">
    <section class="sidebar"> 
      <!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->
      <form:form modelAttribute="book" action="search" id = "submitForm" method="post"> 
      <form:input type="text" path = "title" id="search" value="Поиск"/>
      <input  type="submit" value="Найти"   >	
     </form:form>
     
<!--     Форма отправки параметров фильтра -->
      <form:form modelAttribute="book" action="filter" method="post" >
      <div id="menubar">
        <nav class="menu">
          <h2><!-- Title for menuset 1 -->Бренд </h2>
          <hr>
          <ul>
            <!-- List of links under menuset 1 -->
            
           
   <input type="checkbox" name="option1" value="a1" checked>Huawei<Br>
   <input type="checkbox" name="option2" value="a2">Apple<Br>
   <input type="checkbox" name="option3" value="a3">Samsung<Br> 
   <input type="checkbox" name="option4" value="a4">Sony<Br> 
   <input type="checkbox" name="option5" value="a5">Xiaomi</p>
          </ul>
        </nav>
        <nav class="menu">
          <h2>Цена </h2>
          <!-- Title for menuset 2 -->
          <hr>
          <ul>
            <!--List of links under menuset 2 -->
            
            <input type="text" size="4" value ="0">
            
            <input type="text" size="4" value ="100000">
            
          </ul>
        </nav>
        </form:form>
      </div>
    </section>
    <section class="mainContent">
      <div class="productRow"><!-- Each product row contains info of 3 elements -->
      






  
        
        
        
        
       
        
        
        
        
        
        
        
         <c:if test="${!empty books}">
    
        
        <c:forEach items="${books}" var="book">
        <article class="productInfo">
           <div><img alt="sample" src="https://grozny.poiskhome.ru/Content/img/products/1000000/300000/60000/8000/300/30/0257222/Main/200X200.jpg"></div>
          <p class="price">$${book.price}</p>
          <p class="productContent">Content holder </p>
         
         <div id='alrt' style="fontWeight = 'bold'">
          <form:form modelAttribute="book" action="submit" method="post" id="form" onSubmit="showDialog()"> 	                
	                <form:input path="id" type="hidden"  value = "${book.id}"/></p>	
	                
	               
	                
	                
	               	<dialog id="myDialog">Вы добавили товар в корзину</dialog>
	               	
	               	
	               	
	               	
			<input  type="submit" value="Купить" class="buyButton"  >		
	</form:form> 
          
          </div>
               </article>
        </c:forEach>
     
</c:if>
          
        
        
        
         
    </section>
  </div>
  <footer> 
    <!-- This is the footer with default 3 divs -->
    <div>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam varius sem neque. Integer ornare.</p>
    </div>
    <div>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam varius sem neque. Integer ornare.</p>
    </div>
    <div class="footerlinks">
      <p><a href="#" title="Link">Link 1 </a></p>
      <p><a href="#" title="Link">Link 2</a></p>
      <p><a href="#" title="Link">Link 3</a></p>
    </div>
  </footer>
</div>  
        
        
        
</body>
</html>