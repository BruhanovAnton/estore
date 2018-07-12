<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>

function slideShow() {
	
    $.ajax({    	
        url : 'slideShow',
        success: function(response){
        $('#generalContent').html(response);
        	      	
		},
		error: function(){						
			$('#generalContent').html('Error while request..');
			
		}
    });
}

function showContent(link) {
	
    $.ajax({    	
        url : link,
        success: function(response){
        $('#generalContent').html(response);
        	      	
		},
		error: function(){						
			$('#generalContent').html('Error while request..');
			
		}
    });
    
  
}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header input {
margin:0px 0px 0px 30px;
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 22px;
  border-radius: 4px;
  
}


.header a.logo {
  font-size: 25px;
  font-weight: bold;
  width: 200px;
  height:85px;
  padding: 0px;
 
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
}

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  .header-right {
    float: none;
  }
}

div.generalContent{
 margin: 60px; 
 background-color: yellow; 
}
</style>
<title>Insert title here</title>
</head>
<body onload="slideShow()">
  
      
    


  <div class="header">
 <a href="#default" class="logo"><img
				src="resources/img/store logo.png" alt="sample logo" width="200"
				height="85"></a>
				
  <div class="header-right">
  
  
    <a class="active" href="#home">Домой</a>
    <a href="#contact">Контакты</a>
    <a href="#about">О нас</a>
    <a onclick="showContent('catalog')">Каталог</a>
    <input type="search" class = "search">
    <a class="sch" href="#serch"><img
				src="resources/img/search.png" alt="sample logo" width="25"
				height="25"></a>
   
  </div>
  
</div>


<div id="generalContent"></div>




</body>
</html>
