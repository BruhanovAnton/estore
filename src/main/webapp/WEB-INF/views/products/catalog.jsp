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

$( document ).ready(function() {
	showProductLit();
});
</script>
<script >
function dialogData(product, id){

	
	
	$('#myDialog').html('Вы добавили '+product+' в корзину!');
	
	var x = document.getElementById("myDialog");
	x.show();
	setTimeout(function() {
		x.close();
	}, 2000);
	
	
	$.ajax({    	
        url : 'addToCart'+id
        
    });
		
};



$(document).ready(function() {
	
	
	

	
	
	
	 
	$('#submitForm').submit(function(e) {
		var frm = $('#submitForm');
		e.preventDefault();

	    var data = {}
	    var Form = this;

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
        dataType : 'html',
        data : JSON.stringify(data),
        success: function(response){
            $('#productsList').html(response);
            	      	
    		},
    		error: function(){						
    			$('#productsList').html('Error while request..');
    			
    		}
       
    });   
    
	});
	
	
	$('#submitForm2').submit(function(e) {
		var frm = $('#submitForm2');
		e.preventDefault();

	    var data = {}

	    
	    data['maxPrice'] = $('#max').val();
	    data['brand'] = $('#brand').val() + ' ' + $('#brand2').val()+ ' ' + $('#brand3').val()+
	    ' ' + $('#brand4').val() + ' ' + $('#brand5').val();
	   
delete data["undefined"];
	    
    $.ajax({
        contentType : 'application/json; charset=utf-8',
        type: frm.attr('method'),
        url: frm.attr('action'),
        dataType : 'html',
        data : JSON.stringify(data),
        success: function(response){
            $('#productsList').html(response);
            	      	
    		},
    		error: function(){						
    			$('#productsList').html('Error while request..');
    			
    		}
       
    });  
    

 
    
	});
	
	
	
	
	
	
});




</script>





<style>
body {
    margin: 5;
}

div.filter {
border-radius: 6px;
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 20%;
    background-color: 	#f7fafa;
 position: absolute; 
    height: 100%;
 overflow: auto; 
   
    
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
input.srch{
margin-top: 15px;
}
h3{
color: gray;

}
</style>

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
</style>
</head>
<body>
<dialog id="myDialog" class = "myDialog"></dialog>
<div class ="filter" >

  <form:form modelAttribute="filter" action="search" method="post"
				id="submitForm">
  <form:input class ="srch" type="text" path="search" name="search" placeholder="Поиск.." />
</form:form>
<h3 >Бренд</h3>
<hr>
<form:form modelAttribute="filter" action="filter" method="post"
				id="submitForm2">				
				



<input id="brand" type="checkbox" value="Huawei" >Huawei
<Br>
<input id="brand2" type="checkbox" value="Apple" >Apple
<Br>
<input id="brand3" type="checkbox" value="Samsung" >Samsung
<Br>
<input id="brand4" type="checkbox" value="Sony" >Sony
<Br>
<input id="brand5" type="checkbox" value="Xiaomi" >Xiaomi
<Br>




<h3>Цена</h3>					
<hr>
<ul>



	<form:input class = "range" type="text" path="minPrice" size="4" value="0" />

<form:input   id = "max" class = "range" type="text" path="maxPrice" size="4" value="100000" />
<br>
					

					<input class ="filterButton"  type="submit" value="Фильтровать">
					
			</form:form>
</div>


<div style="margin-left:25%;padding:1px 16px;height:auto;margin-top:25">

<div  id="productsList"></div>	

</div>





</body>
</html>