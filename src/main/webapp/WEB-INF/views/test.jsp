<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
    background-image:
        url('https://cdn.crunchify.com/wp-content/uploads/2013/03/Crunchify.bg_.300.png');
}
</style>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
    function crunchifyAjax() {
        $.ajax({
            url : 'ajaxtest.html',
            success : function(data) {
                $('#result').html(data);
            }
        });
    }
    
    function doAjaxPost() {
        
        $.ajax({
            type:'GET',
//             dataType: 'json',
//           contentType: "application/json; charset=utf-8",
             url : 'subView',
             
				
            success : function(data) {
                $('#subViewDiv').html(data);
                $('#data').html(data);
            }
        });
    }
    
    
 function doAjaxPost2() {
        
        $.ajax({
        	type: "post",
    		url: "olist",
    		cache: false,				
    		
    		success: function(response){
    			alert(response);
    			$.each(pesponse, function(k,v){
    				
    				$('#data').html(k +" "+ v);
    				alert("work");
    			})
    			
    		},
    		error: function(){						
    			$('#result').html('Error while request..');
    		}
        });
    }
   

</script>
 <script>
    function loadDoc() {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          document.getElementById("demo").innerHTML = this.responseText;
        }
      };
      xhttp.open("GET", "ajaxtest.html", true);
      xhttp.send();
    }
    </script>
<script type="text/javascript">
//     var intervalId = 0;
//     intervalId = setInterval(crunchifyAjax, 1000);
</script>


</head>

<body>




<div align="center">
        <br> <br> ${message} <br> <br>
        <div id="result"></div>
        
        <br>
       <button id="getData" onclick="crunchifyAjax()">Get</button>
       
    </div>
    
    
    <input type="button" value="GO!" onclick="doAjaxPost()" />
<div  id="subViewDiv"></div>
<h3>
    User Access Details
</h3>

<p id = "data">
    ${user} accessed the system on ${time}
</p>



<h2>The XMLHttpRequest Object</h2>

<button type="button" onclick="loadDoc()">Request data</button>

<p id="demo"></p>
<input type="button" value="GO!" onclick="doAjaxPost2()" />
</body>
</html>