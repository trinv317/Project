<%-- 
    Document   : register
    Created on : Jun 12, 2024, 2:02:41 AM
    Author     : lienm
--%>

<%@page import="User.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTER Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>
    <body>
        <%
            UserError userError = (UserError) session.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
        %>
        <div class="form-container">
            <nav class="nav justify-content-center fixed-top">
                <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                <a class="nav-link" href="#">Shop</a>
                <a class="nav-link" href="#">About</a>
                <a class="nav-link " href="#">Support</a>
            </nav>

            <form action="mainController" method="post" >
                <h3>register now</h3>
                <input type="text" name="userID" placeholder="Enter userID" class="box" required>
                <input type="text" name="fullName" placeholder="Enter Full Name" class="box" required>
                <input type="text" name="roleID" placeholder="Enter RoleID" class="box" value="US" readonly="">
                <input type="text" name="Phone" placeholder="Enter Number Phone(+84):" class="box" required="">
                <input type="text" name="Gmail" placeholder="Enter Gmail (example@gmail.com)" class="box" required>
                <input type="text" name="Address" placeholder="Enter Address" class="box" required>
                <input type="password" name="Password" placeholder="Enter Password" class="box" required>
                <input type="password" name="Confirm" placeholder="Confirm Password" class="box" required>
                <input type="submit" name="action" value="Register" class="btn">
                <%
                    String message = (String) session.getAttribute("MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%>  
                <p>Already have an account? <a href="login.jsp">Login now</a></p>
            </form>

        </div>
    </body>
</html>
