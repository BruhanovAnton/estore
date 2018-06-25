<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/cart.css" />" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="mainWrapper">
  <header> 
    <!-- This is the header content. It contains Logo and links -->
    <div id="logo"> 
		<img src="eCommerceAssets/images/shop logo.png" alt="sample logo" width="200" height="73">
      <!-- Company Logo text --> 
    </div>
    <div id="headerLinks"><a href="#" title="Login/Register">Войти/Регистрация</a><a href="#" title="Cart"><img src="eCommerceAssets/images/shoping cart.png" alt="sample logo" width="40" height="40"></a></div>
  </header>
  
  <div id="content">
    
   
      
    


   <c:if test="${!empty ebook}">
    
        
        <c:forEach items="${ebook}" var="book">
       
        <div class="box">
		
       </table>
		<hr>
		
		
		<table width="200" border="1">
  <tbody>
    <tr>
      <td><img src="http://topmobiletrends.com/wp-content/uploads/2017/09/apple-iphone-x-1024x768.png" width="150" height="150" alt=""/></td>
      <td><p>Apple iPad 9,7" Wi-Fi + Cellular 128 ГБ, золотой</p></td>
      <td><button>-</button><input type="text"><button>+</button></td>
      <td>$${book.price}</td>
      <td><img src="../Delete_Icon.png" width="35" height="29" alt=""/></td>
    </tr>
  </tbody>
</table>
		<hr>
       
       </div>
       
       
        </c:forEach>
     
</c:if>





</body>
</html>
