<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
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