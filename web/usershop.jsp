<%-- 
    Document   : usershop
    Created on : Jun 15, 2024, 4:27:46 PM
    Author     : lienm
--%>

<%@page import="User.UserDTO"%>
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
            .pagination{
                margin: 20px 0;
                user-select: none;
                text-transform: uppercase;
            }
            .page-item.active .page-link {
                background-color: transparent; 
                border: none;
            }
            .pagination li.page-item{
                display: inline-block !important;
                text-align: center;
                margin: 5px;
                box-shadow: 0 5px 25px rgb(1 1 1 / 10%) !important;
            }
            .pagination li.page-item a.page-link{
                color: #fff ;
                background: transparent;
                border: transparent;
                text-decoration: none;
                font-size: 1.2em;
                line-height: 20px;
            }
            .previous-page a.page-link{
                text-decoration: none;
                background: none;
                border: none;
                color: #fff;
            }
            .next-page a.page-link{
                text-decoration: none;
                background: none;
                border: none;
                color: #fff;
            }
            .previous-page, .next-page{
                background: orange;
                width: 60px !important;
                border-radius: 45px !important;
                transition: 0.3s ease;
            }
            .previous-page:hover{
                transform: translateX(-5px);
            }
            .next-page:hover{
                transform: translateX(5px);
            }
            .current-page, .dots{
                background: #ccc;
                width: 45px;
                border-radius: 50px !important;
                cursor: pointer;
            }
            .active{
                background: orange;
            }
            .disable{
                background: black;
            }
            .bold{
                font-size: 18px;
                font-weight: 600;
            }
            .heart{
                background: none;
                border: none;
                color: black;
                outline: none;
            }
            .colorClick{
                color: red;
            }
            .heart:hover{
                color: red;
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
            String option = (String) request.getAttribute("Option");
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listAll = dao.getListProduct();
            String MIN = request.getParameter("MIN");
            if (MIN == null) {
                MIN = "";
            }
            String MAX = request.getParameter("MAX");
            if (MAX == null) {
                MAX = "";
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
            </div>
        </nav>



        <%
            List<ProductDTO> listProduct = (List) request.getAttribute("LIST_PRODUCT");
            if (listProduct != null) {
                if (listProduct.size() > 0) {
        %>

        <div class="container mt-4 width">
            <div class="row">
                <div class="col-3 margin-top border" style="height: 550px">

                    <form action="filterProductController">
                        <h5>Brand</h5>
                        <hr class="my-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Gentle Monster" id="flexRadioDefault1" onchange="this.form.submit()"<%= "Gentle Monster".equals(option) ? "checked" : ""%> >
                            <label class="form-check-label" for="flexRadioDefault1">
                                Gentle Monster
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Gucci" id="flexRadioDefault1" onchange="this.form.submit()" <%= "Gucci".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Gucci
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Dior" id="flexRadioDefault1" onchange="this.form.submit()" <%= "Dior".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Dior
                            </label>
                        </div>
                        <hr class="my-2">
                        <h5>Product</h5>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="New Arrival" id="flexRadioDefault2" onchange="this.form.submit()" <%= "New Arrival".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                New Arrival
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Old" id="flexRadioDefault2" onchange="this.form.submit()" <%= "Old".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                Old
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Luxury" id="flexRadioDefault2" onchange="this.form.submit()" <%= "Luxury".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                Luxury
                            </label>
                        </div>
                        <hr class="my-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="All" id="flexRadioDefault1-1" onchange="this.form.submit()" <%= "All".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                All
                            </label>
                        </div>
                        <hr class="my-2">
                        <h5>Search price</h5>
                        <form action="mainController">
                            <input class="form-control" type="text" placeholder="MIN" value="<%= MIN%>"><hr>
                            <input class="form-control" type="text" placeholder="MAX" value="<%= MAX%>">
                            <button  name="action" value="SearchMinMax">Submit</button>
                        </form>
                    </form>
                </div>
                <div class="col-9">
                    <div class="row">
                        <%
                            for (ProductDTO product : listProduct) {
                        %>
                        <div class="col-md-4 col-sm-6 margin-top border clear-fix">
                            <div class="card-content" style="display: none">
                                <div class="card">
                                    <img src="img/<%= product.getImage()%>" class="card-img-top" alt="<%= product.getName()%>">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= product.getName()%></h5>
                                        <p class="card-text"><%= product.getDescription()%></p>
                                        <p class="card-text"><%= product.getBrand()%></p>
                                        <p class="card-text"><%= product.getPrice()%>$</p>
                                        <form action="mainController">
                                            <td>
                                                <input type="hidden" name="idGlasses" value="<%= product.getIdGlasses()%>" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Brand" value="<%= product.getBrand()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Name" value="<%= product.getName()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Description" value="<%= product.getDescription()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Price" value="<%= product.getPrice()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Image" value="<%= product.getImage()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Type" value="<%= product.getType()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Quantity" value="<%= product.getQuantity()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Status" value="<%= product.getStatus()%>" required="" readonly=""/>
                                            </td>
                                            <button class="btn btn-primary" value="AddToCart" name="action">Add to cart</button>
                                            <button name="action" value="whistList" class="heart" id="insertNewProductController_<%= product.getIdGlasses()%>"><i class="fa-solid fa-heart"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="pagination">
                        <li class="pageitem previous-page disable"><a href="#" class="page-link">Prev</a></li>
                        <li class="pageitem current-page active"><a href="#" class="page-link">1</a></li>
                        <li class="pageitem dots"><a href="#" class="page-link">...</a></li>
                        <li class="pageitem current-page"><a href="#" class="page-link">5</a></li>
                        <li class="pageitem current-page"><a href="#" class="page-link">6</a></li>
                        <li class="pageitem next-page"><a href="#" class="page-link">Next</a></li>
                    </div>
                </div>
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
        } else {
        %>
        <div class="container mt-4 width">
            <div class="row">
                <div class="col-3 margin-top border" style="height: 550px">

                    <form action="filterProductController">
                        <h5>Brand</h5>
                        <hr class="my-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Gentle Monster" id="flexRadioDefault1" onchange="this.form.submit()"<%= "Gentle Monster".equals(option) ? "checked" : ""%> >
                            <label class="form-check-label" for="flexRadioDefault1">
                                Gentle Monster
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Gucci" id="flexRadioDefault1" onchange="this.form.submit()" <%= "Gucci".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Gucci
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Dior" id="flexRadioDefault1" onchange="this.form.submit()" <%= "Dior".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Dior
                            </label>
                        </div>
                        <hr class="my-2">
                        <h5>Product</h5>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="New Arrival" id="flexRadioDefault2" onchange="this.form.submit()" <%= "New Arrival".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                New Arrival
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Old" id="flexRadioDefault2" onchange="this.form.submit()" <%= "Old".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                Old
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="Luxury" id="flexRadioDefault2" onchange="this.form.submit()" <%= "Luxury".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                Luxury
                            </label>
                        </div>
                        <hr class="my-2">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="option" value="All" id="flexRadioDefault1-1" onchange="this.form.submit()" <%= "All".equals(option) ? "checked" : ""%>>
                            <label class="form-check-label" for="flexRadioDefault2">
                                All
                            </label>
                        </div>

                        <hr class="my-2">
                        <h5>Search price</h5>
                        <form action="mainController">
                            <input class="form-control" type="text" placeholder="MIN" value="<%= MIN%>"><hr>
                            <input class="form-control" type="text" placeholder="MAX" value="<%= MAX%>">
                            <button  name="action" value="SearchMinMax">Submit</button>
                        </form>
                    </form>
                </div>
                <div class="col-9">
                    <div class="row">
                        <%
                            if (option != null && !option.equals("All")) {
                                for (ProductDTO product : listAll) {
                                    if (product.getBrand().equals(option) || product.getDescription().equals(option)) {
                        %>
                        <div class="col-md-4 col-sm-6 border clear-fix">
                            <div class="card-content" style="display: none">
                                <div class="card" style="height: 400px">
                                    <img src="img/<%= product.getImage()%>" class="card-img-top">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= product.getName()%></h5>
                                        <p><%= product.getIdGlasses()%></p>
                                        <p class="card-text"><%= product.getPrice()%>$</p>
                                        <form action="mainController">
                                            <td>
                                                <input type="hidden" name="idGlasses" value="<%= product.getIdGlasses()%>" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Brand" value="<%= product.getBrand()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Name" value="<%= product.getName()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Description" value="<%= product.getDescription()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Price" value="<%= product.getPrice()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Image" value="<%= product.getImage()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Type" value="<%= product.getType()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Quantity" value="<%= product.getQuantity()%>" required="" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="hidden" name="Status" value="<%= product.getStatus()%>" required="" readonly=""/>
                                            </td>
                                            <button class="btn btn-primary" value="AddToCart" name="action">Add to cart</button>
                                            <button name="action" value="whistList" class="heart" id="insertNewProductController_<%= product.getIdGlasses()%>"><i class="fa-solid fa-heart"></i></button>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                                }
                            }
                        } else {
                        %>

                        <%
                            for (ProductDTO product : listAll) {
                        %>
                        <div class="col-md-4 col-sm-6 border clear-fix">
                            <div class="card-content" style="display: none">
                                <div class="card" style="height: 400px">
                                    <img src="img/<%= product.getImage()%>" class="card-img-top">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= product.getName()%></h5>
                                        <p><%= product.getIdGlasses()%></p>
                                        <p class="card-text"><%= product.getPrice()%>$</p>

                                        <form action="mainController">
                                            <input type="hidden" name="idGlasses" value="<%= product.getIdGlasses()%>" readonly=""/>
                                            <input type="hidden" name="Brand" value="<%= product.getBrand()%>" required="" readonly=""/>
                                            <input type="hidden" name="Name" value="<%= product.getName()%>" required="" readonly=""/>
                                            <input type="hidden" name="Description" value="<%= product.getDescription()%>" required="" readonly=""/>
                                            <input type="hidden" name="Price" value="<%= product.getPrice()%>" required="" readonly=""/>
                                            <input type="hidden" name="Image" value="<%= product.getImage()%>" required="" readonly=""/>
                                            <input type="hidden" name="Type" value="<%= product.getType()%>" required="" readonly=""/>
                                            <input type="hidden" name="Quantity" value="<%= product.getQuantity()%>" required="" readonly=""/>
                                            <input type="hidden" name="Status" value="<%= product.getStatus()%>" required="" readonly=""/>
                                            <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>" required="" readonly=""/>
                                            <button class="btn btn-primary" value="AddToCart" name="action">Add to cart</button>
                                            <button name="action" value="whistList" class="heart" id="insertNewProductController_<%= product.getIdGlasses()%>"><i class="fa-solid fa-heart"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                                }
                            }
                        %>
                    </div>
                    <div class="pagination">
                        <li class="pageitem previous-page disable"><a href="#" class="page-link">Prev</a></li>
                        <li class="pageitem current-page active"><a href="#" class="page-link">1</a></li>
                        <li class="pageitem dots"><a href="#" class="page-link">...</a></li>
                        <li class="pageitem current-page"><a href="#" class="page-link">5</a></li>
                        <li class="pageitem current-page"><a href="#" class="page-link">6</a></li>
                        <li class="pageitem next-page"><a href="#" class="page-link">Next</a></li>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                document.addEventListener('DOMContentLoaded', () => {
                                    const btnList = document.querySelectorAll('.heart');

                                    // Apply the colorClick class from localStorage
                                    btnList.forEach(btn => {
                                        const btnId = btn.getAttribute('id');
                                        if (localStorage.getItem(btnId) === 'clicked') {
                                            btn.classList.add('colorClick');
                                        }
                                    });

                                    // Add click event listeners
                                    btnList.forEach(btn => {
                                        btn.addEventListener('click', () => {
                                            const btnId = btn.getAttribute('id');
                                            if (btn.classList.contains('colorClick')) {
                                                // If the button is already clicked, remove the colorClick class and clear from localStorage
                                                btn.classList.remove('colorClick');
                                                localStorage.removeItem(btnId);
                                            } else {
                                                // If the button is not clicked, add the colorClick class and set in localStorage
                                                btn.classList.add('colorClick');
                                                localStorage.setItem(btnId, 'clicked');
                                            }
                                        });
                                    });

                                    // Handle logout and clear localStorage
                                    const logoutBtn = document.querySelector('input[name="action"][value="Logout"]');
                                    if (logoutBtn) {
                                        logoutBtn.addEventListener('click', () => {
                                            localStorage.clear();
                                        });
                                    }
                                });

        </script>
        <script type="text/javascript">
            function getPageList(totalPages, page, maxLength) {
                function range(start, end) {
                    return Array.from(Array(end - start + 1), (_, i) => i + start);
                }
                var sideWidth = maxLength < 9 ? 1 : 2;
                var leftWidth = (maxLength - sideWidth * 2 - 3) >> 1;
                var rightWidth = (maxLength - sideWidth * 2 - 3) >> 1;

                if (totalPages <= maxLength) {
                    return range(1, totalPages);
                }
                if (page <= maxLength - sideWidth - 1 - rightWidth) {
                    return range(1, maxLength - sideWidth - 1).concat(0, range(totalPages - sideWidth + 1, totalPages));
                }
                if (page >= maxLength - sideWidth - 1 - rightWidth) {
                    return range(1, sideWidth).concat(0, range(totalPages - sideWidth - 1 - rightWidth - leftWidth, totalPages));
                }
                return range(1, sideWidth).concat(0, range(page - leftWidth, page + rightWidth), 0, range(totalPages - sideWidth + 1, totalPages));
            }
            $(function () {
                var numberOfItems = $(".card-content .card").length;
                var limitPerPage = 6;
                var totalPages = Math.ceil(numberOfItems / limitPerPage);
                var paginationSize = 5;
                var currentPage;

                function showPage(whichPage) {
                    if (whichPage < 1 || whichPage > totalPages)
                        return false;
                    currentPage = whichPage;
                    $(".card-content .card").hide().slice((currentPage - 1) * limitPerPage, currentPage * limitPerPage).show();
                    $(".pagination li").slice(1, -1).remove();
                    getPageList(totalPages, currentPage, paginationSize).forEach(item => {
                        $("<li>").addClass("page-item").addClass(item ? "current-page" : "dots")
                                .toggleClass("active", item === currentPage)
                                .append($("<a>").addClass("page-link")
                                        .attr({href: "javascript:void(0)"})
                                        .text(item || "...")).insertBefore(".next-page");
                    });
                    $(".previous-page").toggleClass("disable", currentPage === 1);
                    $(".next-page").toggleClass("disable", currentPage === totalPages);
                    return true;
                }
                $(".pagination").append(
                        $("<li>").addClass("page-item").addClass("previous-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("Prev")),
                        $("<li>").addClass("page-item").addClass("next-page").append($("<a>").addClass("page-link").attr({href: "javascript:void(0)"}).text("Next")),
                        );
                $(".card-content").show();
                showPage(1);
                $(document).on("click", ".pagination li.current-page:not(.active)", function () {
                    return showPage(+$(this).text());
                });
                $(".next-page").on("click", function () {
                    return showPage(currentPage + 1);
                });
                $(".previous-page").on("click", function () {
                    return showPage(currentPage - 1);
                });
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
