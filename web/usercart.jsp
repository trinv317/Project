<%-- 
    Document   : usercart
    Created on : Jun 15, 2024, 3:55:05 PM
    Author     : lienm
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="User.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="Product.ProductDAO"%>
<%@page import="Cart.CartDTO"%>
<%@page import="Product.ProductDTO"%>
<%@page import="java.text.DecimalFormat"%>
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
            .table-box {
                width: 90%;
                border-collapse: collapse;
                margin-top: 150px;
                margin-bottom: 20px;
                margin-left: 100px;
            }

            .table-box th, .table-box td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .table-box th {
                background-color: #f2f2f2;
                color: #333;
            }

            .table-box tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .table-box tr:hover {
                background-color: #f1f1f1;
            }

            .table-box input[type="text"] {
                width: 100%;
                padding: 6px;
                margin: 2px 0;
                box-sizing: border-box;
            }

            .table-box button {
                background: none;
                border: none;
                cursor: pointer;
                color: #333;
            }

            .table-box button:hover {
                color: #007BFF;
            }

            .fa-trash, .fa-bag-shopping, .fa-minus, .fa-plus {
                font-size: 1.2em;
            }

            .quantity-control {
                display: flex;
                align-items: center;
            }

            .quantity-control button {
                margin: 0 5px;
            }
            .bold{
                font-size: 18px;
                font-weight: 600;
            }
            .table-box input.idGlasses-input,
            .table-box input.quantity-input,
            .table-box input.price-input {
                width: 50px; /* Đặt chiều rộng hợp lý cho các ô input cần thu nhỏ */
                padding: 1px;
                text-align: center;
            }
            .text-center{
                text-align: center;
            }
            .p{
                margin-top: 100px;
                font-weight: bold;
                text-align: center;
                font-size: 40px;
                margin-bottom: -100px;
            }
            .checkout{
                margin-left: 100px;
                text-transform: uppercase;
                color: black;
                font-weight: bold;
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
                        <button class="btn" type="submit" name="action" value="searchHome"><i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </form>
            </div>
        </nav>


        <p class="p">YOUR CART</p>
        <h4><h4>
                <%
                    long millis = System.currentTimeMillis();
                    java.sql.Date date = new java.sql.Date(millis);
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                    String date1 = sdf.format(date);
                    CartDTO cart = (CartDTO) session.getAttribute("CART");
                    if (cart != null) {
                %>
                <table border="1" class="table-box ">
                    <thead>
                        <tr>
                            <th class="text-center">IDGlasses</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Name</th>
                            <th class="text-center">Type</th>
                            <th class="text-center">Date</th>
                            <th class="text-center">Quantity</th>
                            <th class="text-center">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            float totalPrice = 0;
                            for (ProductDTO p : cart.getCart().values()) {
                                totalPrice += p.getPrice() * p.getQuantity();
                        %>
                    <form action="mainController" method="POST">
                        <tr>
                            <td> 
                                <input type="text" name="idGlasses" value="<%= p.getIdGlasses()%>" readonly=""/>
                            </td>
                            <td><%= p.getPrice()%>$</td>
                            <td> 
                                <input type="text" name="Name" value="<%= p.getName()%>" readonly=""/>
                            </td>
                            <td> 
                                <input type="text" name="Type" value="<%= p.getType()%>" readonly=""/>
                            </td>
                            <td> 
                                <input type="text" name="Date" value="<%= date1%>" readonly=""/>
                            </td>
                            <td class="quantity-control">
                                <button name="action" value="Change Quantity" onclick="increaseQuantity(this)"><i class="fa-solid fa-plus"></i></button>
                                <input type="text" name="Quantity" value="<%= p.getQuantity()%>" required="" id="quantityInput" class="quantity-input">
                                <button name="action" value="Change Quantity" onclick="decreaseQuantity(this)"><i class="fa-solid fa-minus"></i></button>
                            </td>
                            <td>
                                <input type="text" name="totalPrice" value="<%= p.getPrice() * p.getQuantity()%>" required=""/>
                            </td>
                            <td>
                                <button name="action" value="Remove Product">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </td>
                            <td>
                                <button name="action" value="Add To Order">
                                    <i class="fa-solid fa-bag-shopping"></i>
                                </button>
                            </td>

                        </tr>
                        <input type="hidden" name="Description" value="<%= p.getDescription()%>" readonly=""/>
                        <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>" />
                        <input type="hidden" name="methodPayment" value="COD" readonly=""/>

                    </form>

                    <%
                        }
                    %>

                    </tbody>
                </table>
                <a href="checkout.jsp"><button class="btn btn-warning checkout">Go to checkout</button></a>
                <!--        <%
                    DecimalFormat df = new DecimalFormat("0.00");
                    String formattedTotal = df.format(totalPrice);
                %>  
                <div class="flex noti">
                    <h1>Total: <%= formattedTotal%> $  </h1>   
                </div>  -->
                <%
                    }
                %>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script>
                                    function decreaseQuantity(button) {
                                        // Get the quantity input element
                                        const quantityInput = button.parentElement.querySelector('#quantityInput');

                                        // Get the current quantity value (assuming it's a number)
                                        let currentQuantity = parseInt(quantityInput.value, 10);

                                        // Decrement the quantity, ensuring it doesn't go below 0 (optional)
                                        currentQuantity = Math.max(0, currentQuantity - 1);

                                        // Update the input value
                                        quantityInput.value = currentQuantity;
                                    }

                                    function increaseQuantity(button) {
                                        // Similar logic as decreaseQuantity, but incrementing instead
                                        const quantityInput = button.parentElement.querySelector('#quantityInput');
                                        let currentQuantity = parseInt(quantityInput.value, 10);
                                        currentQuantity++;
                                        quantityInput.value = currentQuantity;
                                    }
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
