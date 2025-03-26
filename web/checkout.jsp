
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Cart.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Cart.OrderDAO"%>
<%@page import="User.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ESP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            .popup {
                width: 400px;
                background: #fff;
                border-radius: 6px;
                position: absolute;
                top: 0;
                left: 50%;
                transform: translate(-50%, -50%) scale(0.1);
                text-align: center;
                padding: 0 30px 30px;
                color: #333;
                visibility: hidden;
                transition: transform 0.4s, top 0.4s;
            }

            .open-popup {
                visibility: visible;
                top: 50%;
                transform: translate(-50%, -50%) scale(1);
            }

            .popup img {
                width: 100px;
                margin-top: -50px;
                border-radius: 50%;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            .popup h2 {
                font-size: 38px;
                font-weight: 500;
                margin: 30px 0 10px;
            }

            .popup button {
                width: 100%;
                margin-top: 50px;
                padding: 10px 0;
                background: #6fd649;
                color: #fff;
                border: 0;
                outline: none;
                font-size: 18px;
                border-radius: 4px;
                cursor: pointer;
                box-shadow: 0 5px 5px rgba(0, 0, 0, 0.2);
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
            OrderDAO dao = new OrderDAO();
            List<OrderDTO> listAll = dao.getListProductByID(loginUser.getUserID());
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
            String date1 = sdf1.format(date);
            long millis1 = System.currentTimeMillis();
            Timestamp timestamp = new Timestamp(millis);
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm a");
            String formattedTimestamp = sdf.format(timestamp);
        %>

        <div class="container">
            <div class="card text-center">
                <div class="card-header text-bg-primary">
                    <h4>Billing details</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-user"></i></span>
                                <input type="text" class="form-control" value="<%= loginUser.getFullName()%>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-envelope"></i></span>
                                <input type="text" class="form-control" value="<%= loginUser.getGmail()%>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-house-user"></i></span>
                                <input type="text" class="form-control" value="<%= loginUser.getAddress()%>" readonly>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-phone"></i></span>
                                <input type="text" class="form-control" value="<%= loginUser.getPhone()%>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-clock"></i></span>
                                <input type="text" class="form-control" value="<%= formattedTimestamp%>" readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-calendar-days"></i></span>
                                <input type="text" class="form-control" value="<%= date1%>" readonly>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Num</th>
                                <th scope="col">Order ID</th>
                                <th scope="col" >ID Glasses</th>
                                <th scope="col" >Method Payment</th>
                                <th scope="col" >Quantity</th>
                                <th scope="col" >Price</th>

                            </tr>
                        </thead>
                        <tbody>

                            <%
                                float total = 0;
                                int count = 0;
                                for (OrderDTO order : listAll) {
                                    total += order.getTotalPrice();
                                    count++;

                            %>
                        <form action="mainController" method="POST">
                            <tr>
                                <th scope="row"><%= count%></th>
                                <td><input type="text" class="form-control text-center" name="orderID" value="<%= order.getOrderID()%>" readonly></td>
                                <td><input type="text" class="form-control text-center" name="idGlasses" value="<%= order.getIdGlasses()%>" readonly></td>
                                <td><input type="text" class="form-control text-center" name="methodPayment" value="<%= order.getMethodPayment()%>" readonly></td>
                                <td><input type="text" class="form-control text-center" name="Quantity" value="<%= order.getQuantity()%>" readonly></td>
                                <td><input type="text" class="form-control text-center" name="totalPrice" value="<%= order.getTotalPrice()%>" readonly></td>
                                <td><button class="btn btn-danger" name="action" value="deleteOrder"><i class="fa-solid fa-trash-can"></i></button></td>
                            </tr>
                        </form>

                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-8 text-start">
                            <form action="mainController"> 
                                <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>"/>
                                <input type="hidden" name="fullName" value="<%= loginUser.getFullName()%>"/>
                                <input type="hidden" name="Phone" value="<%= loginUser.getPhone()%>" />
                                <input type="hidden" name="Gmail" value="<%= loginUser.getGmail()%>" />
                                <input type="hidden" name="Address" value="<%= loginUser.getAddress()%>"/>
                                <input type="hidden" name="methodPayment" value="COD"/>
                                <input type="hidden" name="totalBill" value="<%= total%>" />
                                <input type="hidden" name="Date" value="<%= date1%>" readonly=""/>
                                <input type="hidden" name="Time" value="<%=formattedTimestamp%>"/>
                                <button class="btn text-bg-success" name="action" value="checkOut">BUY IT</button>   

                            </form>
                            <a href="usershop.jsp"><button class="btn text-bg-primary">TURN BACK</button></a>
                        </div>
                        <div class="col-4">
                            <div class="input-group mb-3">
                                <span class="input-group-text btn btn-danger" id="basic-addon1">Total Bill</span>
                                <input type="number" class="form-control" value="<%=total%>" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex noti">
                <%
                    String message = (String) session.getAttribute("MESSAGE1");
                    if (message == null) {
                        message = "";
                    }
                %>
            </div>
        </div>
        <%-- JavaScript để điều khiển popup --%>
        <div class="popup" id="popup">
            <img src="img/404-tick.png">
            <h2>Thank you!</h2>
            <p>Your details have been successfully submitted. Thank you!</p>
            <button type="button" onclick="closePopup()">OK</button>
        </div>

        <%-- Kiểm tra và mở popup nếu có message --%>
       <script>
            let popup = document.getElementById("popup");
            let message = "<%= session.getAttribute("MESSAGE1") %>";

            if (message !== null && message.trim() !== "") {
                openPopup();
                // Xóa message sau khi đã hiển thị popup
            <% session.removeAttribute("MESSAGE1"); %>
            }

            function openPopup() {
                popup.classList.add("open-popup");
            }

            function closePopup() {
                popup.classList.remove("open-popup");
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>
</html>