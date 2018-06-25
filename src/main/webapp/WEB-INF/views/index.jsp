<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Spring  4 MVC - File Upload Example</title>
        
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1>Spring 4 MVC - File Upload Example</h1>
                    <form:form method="post" modelAttribute = "product" action='upload' enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="file1">File Input 1</label>
                            <input type="file" name="file" id="file1">
                        </div>
                        <div class="form-group">
                        <form:input type="text" path = "title"/>
                        </div>
                        <div class="form-group">
                            <label for="file2">File Input 2</label>
                            <input type="file" name="file" id="file2">
                        </div>
                        <button type="submit" class="btn btn-success">Submit</button>
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>