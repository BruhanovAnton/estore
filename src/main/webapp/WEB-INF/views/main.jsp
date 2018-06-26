<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
  float: left;
  color: white;
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
</style>
<title>Insert title here</title>
</head>
<body>
  
      
    


  <div class="header">
 <a href="#default" class="logo"><img
				src="resources/img/store logo.png" alt="sample logo" width="200"
				height="85"></a>
				
  <div class="header-right">
  
  
    <a class="active" href="#home">Домой</a>
    <a href="#contact">Контакты</a>
    <a href="#about">О нас</a>
    <input type="search" class = "search">
    <a class="sch" href="#serch"><img
				src="resources/img/search.png" alt="sample logo" width="25"
				height="25"></a>
   
  </div>
</div>

<div class="container">
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="resources/img/mainPageSlideShow/samsung.png"  width ="50%" height = "50%">
        <div class="carousel-caption">
          <h3>SAMSUNG</h3>
          <h2>Скидки до 50%</h2>
        </div>
      </div>

      <div class="item">
        <img src="resources/img/mainPageSlideShow/acer.png" alt="Chicago" width ="50%" height = "50%">
        <div class="carousel-caption">
          <h3>ACER</h3>
          <h2>Скидки до 50%</h2>
        </div>
      </div>
    
      <div class="item">
        <img src="resources/img/mainPageSlideShow/dell.png" alt="New York" width ="50%" height = "50%">
        <div class="carousel-caption">
          <h3>DELL</h3>
          <h2>Скидки до 50%</h2>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>





</body>
</html>
