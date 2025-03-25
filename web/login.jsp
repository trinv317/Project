<%-- 
    Document   : login
    Created on : Jun 9, 2024, 4:00:14 PM
    Author     : lienm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>
    <body>  
        <div class="form-container">
            <nav class="nav justify-content-center fixed-top">
                <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                <a class="nav-link" href="#">Shop</a>
                <a class="nav-link" href="#">About</a>
                <a class="nav-link " href="#">Support</a>
            </nav>
            <form action="mainController" method="post">
                <h3>login</h3>
                <input type="text" name="userID" placeholder="Enter userID" class="box" required>
                <input type="password" name="Password" placeholder="Enter Password" class="box" required>
                <input type="submit" name="action" value="Login" class="btn">
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error == null) {
                        error = "";
                    }
                %>
                <h6><%= error%></h6>
                <p>Don't have an account? <a href="register.jsp">Regiser now</a></p>
            </form>
        </div>
    </body>
</html>
