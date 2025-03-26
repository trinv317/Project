<%-- 
    Document   : AdminInvoice
    Created on : Jun 25, 2024, 4:06:55 AM
    Author     : lienm
--%>

<%@page import="Invoice.InvoiceDTO"%>
<%@page import="java.util.List"%>
<%@page import="Invoice.InvoiceDAO"%>
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
            .bold{
                font-size: 18px;
                font-weight: 600;
            }
            .margin-top{
                margin: 0 auto;
                margin-top: 150px;
                width: 70%;
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
            InvoiceDAO dao = new InvoiceDAO();
            List<InvoiceDTO> listAll = dao.getListInvoice();

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
        <table class="table table-hover margin-top">
            <thead>
                <tr>
                    <th>Invoice ID</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Phone</th>
                    <th>Gmail</th>
                    <th>Address</th>
                    <th>Method Payment</th>
                    <th>Total Bill</th>
                    <th>Date</th>
                    <th>Time</th>

                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (InvoiceDTO invoice : listAll) {

                %>
            <form action="mainController" method="POST">
                <tr>
                    <td>
                        <input type="text" name="invoiceID" value="<%= invoice.getInvoiceID()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="userID" value="<%= invoice.getUserID()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="fullName" value="<%= invoice.getFullName()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="Phone" value="<%= invoice.getPhone()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="Gmail" value="<%= invoice.getGmail()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="Address" value="<%= invoice.getAddress()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="methodPayment" value="<%= invoice.getMethodPayment()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="totalBill" value="<%= invoice.getTotalBill()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="Date" value="<%= invoice.getDate()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="Time" value="<%= invoice.getTime()%>" readonly/>
                    </td>

                </tr>
            </form>
            <%

                }
            %>

        </tbody>
    </table>
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
