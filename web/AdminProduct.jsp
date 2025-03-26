<%-- 
    Document   : AdminProduct
    Created on : Jun 16, 2024, 7:58:44 PM
    Author     : lienm
--%>

<%@page import="Product.ProductError"%>
<%@page import="User.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="Product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="Product.ProductDTO"%>
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
            .bold{
                font-size: 18px;
                font-weight: 600;
            }
            .center{
                margin: 0 auto;
            }
            .margin-top{
                margin: 0 auto;
                margin-top: 150px;
                width: 70%;
            }
            .popup {
                background: transparent;
                z-index: 2;
                width: 100%;
                height: 100%;
                position: absolute;
                top: 100px;
                display: none;
                justify-content: center;
                align-items: center;
                text-align: center;
            }
            .popup h1{
                text-transform: uppercase;
                font-size: 36px;
            }
            .popup-content input {
                margin: 20px auto;
                display: block;
                width: 50%;
                padding: 8px;
                border: 1px solid gray;
            }
            .popup-content {
                min-height: 250px;
                width: 500px;
                background: #fff;
                padding: 20px;
                border-radius: 5px;
                position: relative;
                z-index: 2;
            }

            .error-message {
                color: red;    
            }
            .close {
                position: absolute;
                top: 0;
                right: 0;
                height: 20px;
                width: 20px;
                box-shadow: 6px 6px 29px -4px rgba(0, 0, 0, 0.75);
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !(loginUser.getRoleID().equals("AD"))) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listAll = dao.getListProduct();
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
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
                            <a class="nav-link mx-lg-2" href="admin.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle mx-lg-2" href="#" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false" data-bs-hover="dropdown">
                                Manage
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item mx-lg-2" href="AdminProduct.jsp">Product</a></li>
                                <li><a class="dropdown-item mx-lg-2" href="AdminAccount.jsp">Account</a></li>
                                <li><a class="dropdown-item mx-lg-2" href="AdminInvoice.jsp">Invoice</a></li>
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
                            <button class="btn bold button" id="button" >ADD PRODUCT</button>   
                        </li>
                    </ul>
                </div>
                <form action="mainController">
                    <div class="search d-flex">
                        <input class="form-control me-2 cursor input" type="text" name="search" value="<%= search%>" placeholder="Search">
                        <button class="btn" type="submit" name="action" value="searchAD"><i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </form>
            </div>
        </nav>

        <form action="mainController">
            <div class="popup">
                <div class="popup-content">
                    <h1>New Product</h1>
                    <i class="fa-solid fa-circle-xmark close" style="color: orange;width: 30px"></i>
                    <input type="text" name="idGlasses" placeholder="idGlasses"/>
                    <div class="error-message" id="error-idGlasses">
                        <%= productError.getIdGlasses()%>
                    </div>
                    <input type="text" name="Brand" placeholder="Brand"/>
                    <input type="text" name="Name" placeholder="Name"/>
                    <div class="error-message" id="error-Name">
                        <%= productError.getName()%>
                    </div>
                    <input type="text" name="Description" placeholder="Description"/>
                    <div class="error-message" id="error-Description">
                        <%= productError.getDescription()%>
                    </div>
                    <input type="text" name="Price" placeholder="Price"/>
                    <div class="error-message" id="error-Price">
                        <%= productError.getPrice()%>
                    </div>
                    <input type="text" name="Type" placeholder="Type"/>
                    <input type="text" name="Quantity" placeholder="Quantity"/>
                    <div class="error-message" id="error-Quantity">
                        <%= productError.getQuantity()%>
                    </div>
                    <input type="text" name="Status" placeholder="Status"/>
                    <div class="error-message" id="error-Status">
                        <%= productError.getStatus()%>
                    </div>
                    <input type="file" name="Image" placeholder="Image"/>
                    <button class="btn btn-danger" name="action" value="addNewProduct">SUBMIT</button>
                </div>
            </div>
        </form>

        <div class="container">
            <div class="row ">

                <%
                    for (ProductDTO product : listAll) {

                %>
                <div class="col-lg-3 clear-fix">
                    <div class="card" style="width: 100%; margin: 10px">
                        <img src="img/<%= product.getImage()%>" class="card-img-top">
                        <div class="card-body">
                            <form action="mainController">
                                <input type="text" name="idGlasses" value="<%= product.getIdGlasses()%>" />
                                <input type="text" name="Brand" value="<%= product.getBrand()%>" />
                                <input type="text" name="Name" value="<%= product.getName()%>" />
                                <input type="text" name="Description" value="<%= product.getDescription()%>" />
                                <input type="text" name="Price" value="<%= product.getPrice()%>" />
                                <input type="file" name="Image" value="<%= product.getImage()%>" />
                                <input type="hidden" name="Type" value="<%= product.getType()%>" />
                                <input type="hidden" name="Quantity" value="<%= product.getQuantity()%>"/>
                                <input type="hidden" name="Status" value="<%= product.getStatus()%>" />
                                <button value="UpdateProduct" name="action">Update product</button>
                                <button value="DeleteProduct" name="action">Delete product</button>

                            </form>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <script>
            document.getElementById("button").addEventListener("click", function () {
                document.querySelector(".popup").style.display = "flex";
            });
            document.querySelector(".close").addEventListener("click", function () {
                document.querySelector(".popup").style.display = "none";
            });
        </script>
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
