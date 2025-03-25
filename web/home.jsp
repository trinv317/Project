<%-- 
    Document   : Home
    Created on : Jun 9, 2024, 4:00:01 PM
    Author     : lienm
--%>

<%@page import="java.util.List"%>
<%@page import="Product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
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

        </style>
    </head>
    <body>
        <%
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
                            <a class="nav-link mx-lg-2" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="producthome.jsp">Shop</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle mx-lg-2" href="#account" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false" data-bs-hover="dropdown">
                                Account
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item mx-lg-2" href="login.jsp">Login</a></li>
                                <li>
                                    <hr class="dropdown-divider mx-lg-2">
                                </li>
                                <li><a class="dropdown-item mx-lg-2" href="register.jsp">Register</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mx-lg-2" href="about.jsp">About</a>
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

        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/model-1.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Nâng tầm phong cách, khẳng định bản thân cùng <span class="orange">HQA</span><span
                                class="black">LUXURY</span></h5>
                        <p><a href="login.jsp" class="btn btn-warning mt-3">See more</a></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/model2.jpeg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <p><a href="login.jsp" class="btn btn-warning mt-3">See more</a></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/model3.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <p><a href="login.jsp" class="btn btn-warning mt-3">See more</a></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/model4.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <p><a href="login.jsp" class="btn btn-warning mt-3">See more</a></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/model5.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <p><a href="login.jsp" class="btn btn-warning mt-3">See more</a></p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="img/model6.jpeg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <p><a href="login.jsp" class="btn btn-warning mt-3">See more</a></p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev light-gray" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon " aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next light-gray" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- section -->
    </section><!-- about section Ends -->
    <!-- services section Starts -->
    <form action="mainController">
        <section class="services section-padding" id="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-header text-center pb-5">
                            <h2>Ưu Điểm</h2>
                            <p>Nâng tầm nhan sắc, tự tin tỏa sáng cùng <span class="orange">HQA</span><span
                                    class="black">LUXURY</span> - Kính mắt tôn vinh vẻ đẹp của bạn.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-white text-center bg-dark pb-2 clear-fix">
                            <div class="card-body">
                                <i class="fa-solid fa-heart"></i>
                                <h3 class="card-title">Trải Nghiệm số 1</h3>
                                <p class="lead">Trải nghiệm đỉnh cao cùng HQA LUXURY - Kính mắt tôn vinh đẳng cấp
                                    phái đẹp/phái nam.Kính mắt của những người thành công.</p>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-white text-center bg-dark pb-2 clear-fix">
                            <div class="card-body">
                                <i class="fa-regular fa-handshake"></i>
                                <h3 class="card-title">Sự Bền Vững</h3>
                                <p class="lead">Đẳng cấp đồng hành cùng năm tháng.Tự tin thể
                                    hiện phong cách với HQA LUXURY - Kính mắt mang đến sự chính xác hoàn hảo.</p>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-white text-center bg-dark pb-2 clear-fix">
                            <div class="card-body">
                                <i class="fa-regular fa-thumbs-up"></i>
                                <h3 class="card-title">Chất Lượng Hàng Đầu</h3>
                                <p class="lead">Trải nghiệm mua sắm hoàn hảo cùng HQA LUXURY.Kính mắt mang đến sự hài lòng
                                    tuyệt đối cho khách hàng.</p>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- services section Ends -->
        <!-- portfolio strats -->
        <section class="portfolio section-padding" id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-header text-center pb-5">
                            <h2>Uy Tín Số 1</h2>
                            <p> Khẳng định phong cách sành điệu cùng <span class="orange">HQA</span><span
                                    class="black">LUXURY</span> - Kính mắt dẫn đầu xu hướng.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-light text-center bg-white pb-2 clear-fix">
                            <div class="card-body text-dark">
                                <div class="img-area mb-4"><img alt="" class="img-fluid" src="img/sp1.jpg"></div>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4 clear-fix">
                        <div class="card text-light text-center bg-white pb-2">
                            <div class="card-body text-dark">
                                <div class="img-area mb-4"><img alt="" class="img-fluid hei" src="img/sp2.jpg"></div>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4 clear-fix">
                        <div class="card text-light text-center bg-white pb-2">
                            <div class="card-body text-dark">
                                <div class="img-area mb-4"><img alt="" class="img-fluid hei" src="img/sp3.jpg"></div>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- section camket -->
        <section class="services section-padding" id="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-header text-center pb-5">
                            <h2>Cam Kết</h2>
                            <p>Nâng tầm nhan sắc, tự tin tỏa sáng cùng <span class="orange">HQA</span><span
                                    class="black">LUXURY</span> - Kính mắt tôn vinh vẻ đẹp của bạn.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-white text-center bg-primary pb-2 clear-fix">
                            <div class="card-body">
                                <i class="fa-solid fa-truck-fast"></i>
                                <h3 class="card-title">Free Ship</h3>
                                <p class="lead">Freeship mọi giờ, mọi nơi - HQA LUXURY - Mua sắm thả ga, không
                                    lo giới hạn!</p>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-white text-center bg-primary pb-2 clear-fix">
                            <div class="card-body">
                                <i class="fa-solid fa-shop"></i>
                                <h3 class="card-title">Chính Hãng</h3>
                                <p class="lead">HQA LUXURY nói không với hàng giả, hàng nhái. Hãy là người tiêu dùng thông
                                    minh</p>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-12 col-lg-4">
                        <div class="card text-white text-center bg-primary pb-2 clear-fix">
                            <div class="card-body">
                                <i class="fa-regular fa-circle-question"></i>
                                <h3 class="card-title">Hỗ Trợ</h3>
                                <p class="lead">Đội ngũ tư vấn viên chuyên nghiệp, tận tâm. Luôn sẵn sàng hỗ trợ khách hàng
                                    24/7!</p>
                                <button class="btn bg-warning text-dark" name="action" value="Login">See more</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
    
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
