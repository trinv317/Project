<%-- 
    Document   : about.jsp
    Created on : Jun 15, 2024, 6:44:22 PM
    Author     : lienm
--%>

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
            .container {
                max-width: 800px;
                margin: 70px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #000;
            }

            h2 {
                font-size: 20px;
                margin-top: 20px;
                color: #000;
            }

            p {
                margin-bottom: 15px;
                font-weight: 600;
            }

            .additional-info {
                margin-top: 20px;
            }

            .additional-info ul {
                padding: 0;
            }

            .additional-info li {
                margin-bottom: 10px;
                margin-left: 25px;
                font-weight: 600;
            }
            .border ul{
                border: 2px solid gray;
                margin: 0 auto;
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
                            <a class="nav-link mx-lg-2" href="#about">About</a>
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
        <div class="container">
            <h1><span class="text-warning">HQA</span> LUXURY - Hành trình từ đam mê đến hiện thực</h1>

            <p>Câu chuyện về <span class="text-warning">HQA</span> LUXURY bắt đầu từ niềm đam mê mãnh liệt của Hoàng Quốc An, người sáng lập thương hiệu.</p>

            <p>Năm 2024, với mong muốn mang đến cho khách hàng những sản phẩm kính mắt chất lượng cao, Quốc An đã dũng cảm biến ước mơ thành hiện thực bằng cách thành lập <span class="text-warning">HQA</span> LUXURY.</p>

            <p>Ban đầu, <span class="text-warning">HQA</span> LUXURY chỉ là một cửa hàng nhỏ bé với nguồn vốn hạn hẹp và số lượng nhân viên ít ỏi. Tuy nhiên, Hoàng Quốc An cùng đội ngũ cộng sự của mình đã không ngừng nỗ lực, học hỏi và cải thiện để từng bước đưa <span class="text-warning">HQA</span> LUXURY phát triển vững mạnh.</p>

            <p><span class="text-warning">HQA</span> LUXURY chú trọng vào việc cung cấp cho khách hàng những sản phẩm kính mắt được tuyển chọn kỹ lưỡng, đảm bảo chất lượng và giá cả hợp lý. Bên cạnh đó, <span class="text-warning">HQA</span> LUXURY còn mang đến cho khách hàng dịch vụ khách hàng chu đáo, tận tâm, luôn sẵn sàng tư vấn và giải đáp mọi thắc mắc của khách hàng.</p>

            <p>Với phương châm "Khách hàng là trọng tâm của mọi hoạt động", HQA LUXURY đã dần khẳng định được vị thế của mình trên thị trường và trở thành địa chỉ tin cậy cho đông đảo khách hàng.</p>

            <p><span class="text-warning">HQA</span> LUXURY đã trải qua nhiều thăng trầm trong suốt quá trình phát triển, nhưng <span class="text-warning">HQA</span> LUXURY và đội ngũ nhân viên của mình luôn giữ vững tinh thần lạc quan để vượt qua mọi khó khăn và gặt hái được nhiều thành công.</p>

            <p><span class="text-warning">HQA</span> LUXURY luôn trân trọng sự ủng hộ của quý khách hàng trong suốt thời gian qua. <span class="text-warning">HQA</span> LUXURY cam kết sẽ tiếp tục nỗ lực để mang đến cho khách hàng những sản phẩm và dịch vụ tốt nhất, góp phần nâng cao chất lượng cuộc sống cho mọi người.</p>

            <p><span class="text-warning">HQA</span> LUXURY - Hơn cả một thương hiệu, đó là niềm đam mê và tâm huyết của Quốc An và đội ngũ nhân viên.</p>

            <section class="additional-info">
                <h2>Thông tin thêm về <span class="text-warning">HQA</span> LUXURY</h2>
                <div class="border">
                    <ul>
                        <li>Doanh thu top 1 việt nam</li>
                        <li>Top 100 luxury shop tiêu biểu của thế giới năm 2024</li>
                        <li>Anh cả trong giới kinh doanh các mặt hàng luxury việt nam</li>
                    </ul>
                </div>
            </section>
        </div>
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
