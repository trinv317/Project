<%-- 
    Document   : whistList
    Created on : Jun 27, 2024, 8:46:43 AM
    Author     : lienm
--%>

<%@page import="java.util.List"%>
<%@page import="Cart.WhistListDTO"%>
<%@page import="Cart.WhistListDAO"%>
<%@page import="User.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ESP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            .search{
                position: relative;
                height: 50px;
            }
            .search .input{
                border: 0;
                font-size: 18px;
                padding: 15px;
                height: 50px;
                width: 0;
                background: transparent;
                transition: width 0.3s ease;
            }
            .search .btn{
                border: 0;
                background-color: orange;
                color: #fdf2e9;
                border-radius: 50px;
                position: absolute;
                font-size: 24px;
                top: 0;
                left: 0;
                width: 50px;
                height: 50px;
                transition: transform 0.3s ease;
            }
            .search .input:focus, .search .btn:focus{
                outline:0;
            }
            .search.active .input{
                width: 300px;
                background-color: #fff;
                border-radius: 50px 0 0 50px;
            }
            .search.active .btn{
                transform: translateX(270px);
                border-radius: 50px;
                background: #fff;
                color: orange;
            }
            .card-img-top {
                height: 200px;
                object-fit: cover;
            }
            .card {
                margin-bottom: 10px;
            }
            .width{
                width: 960px;
            }
            .margin-top{
                margin-top: 50px;
                margin-bottom: -50px;
            }
            h4{
                margin-top: 100px;
                text-align: center;
                font-weight: bold;
                text-transform: uppercase;
                font-size: 40px;
            }
            .bold{
                font-size: 18px;
                font-weight: 600;
            }
        </style>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !(loginUser.getRoleID().equals("US"))) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            WhistListDAO dao = new WhistListDAO();
            List<WhistListDTO> listProduct = dao.getListProductByID(loginUser.getUserID());
        %>
        <nav class="navbar navbar-expand-lg bg-body-tertiary navbar-light bg-light fixed-top">
            <div class="container-fluid">
                <div class="box">
                    <a class="navbar-brand me-8" href="#"><span class="text-warning">HQA</span> LUXURY</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="user.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle mx-lg-2" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false" data-bs-hover="dropdown">
                                Shop
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item mx-lg-2" href="menProduct.jsp">MEN</a></li>
                                <li><a class="dropdown-item mx-lg-2" href="womenProduct.jsp">WOMEN</a></li>
                                <li><a class="dropdown-item mx-lg-2" href="unisexProduct.jsp">UNISEX</a></li>
                                <li>
                                    <hr class="dropdown-divider mx-lg-2">
                                </li>
                                <li><a class="dropdown-item mx-lg-2" href="usershop.jsp">ALL</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle mx-lg-2" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false" data-bs-hover="dropdown">
                                Account
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item mx-lg-2" href="update.jsp">UPDATE</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="about1.jsp">About</a>
                        </li>
                        <li class="nav-item">
                            <form action="mainController">
                                <button class="btn bold" type="submit" name="action" value="Logout">LOG OUT</button>
                            </form>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="usercart.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="whistList.jsp"><i class="fa-solid fa-heart-circle-plus"></i></a>
                        </li>

                    </ul>
                </div>
                <form action="mainController">
                    <div class="search d-flex">
                        <input class="form-control me-2 cursor input" type="text" name="search" value="<%= search%>" placeholder="Search">
                        <button class="btn" type="submit" name="action" value="search"><i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </form>
            </div>
        </nav>
        <h4>Your Whist List</h4>

        <%
            if (listProduct != null) {
        %>
        <div class="container mt-4 width">
            <div class="row ">

                <%
                    for (WhistListDTO product : listProduct) {
                %>

                <div class="col-md-4 col-sm-6 mb-4 col-lg-3 clear-fix">
                    <div class="card margin-top">
                        <img src="img/<%= product.getImage()%>" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p><%= product.getIdGlasses()%></p>
                            <p class="card-text"><%= product.getDescription()%></p>
                            <p class="card-text"><%= product.getBrand()%></p>
                            <p class="card-text"><%= product.getPrice()%>$</p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error%>
        <%
            }
        %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            const search = document.querySelector('.search');
            const input = document.querySelector('.input');

            // Add event listeners for both hover and mouseleave events
            search.addEventListener('mouseover', () => {
                search.classList.add('active');
                input.focus(); // Optionally focus the input field on hover
            });

            search.addEventListener('mouseleave', () => {
                search.classList.remove('active');
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.dropdown').hover(function () {
                    $(this).find('.dropdown-toggle').dropdown('toggle');
                });
            });
        </script>
    </body>
</html>
