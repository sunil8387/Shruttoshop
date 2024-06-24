<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
        <title>Shopping Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-.lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collection</h6>
                                    <h2>Fall - Winter Collections</h2>
                                    <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                    commitment to exceptional quality.</p>
                                    <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="img/hero/hero-2.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-5 col-lg-7 col-md-8">
                                <div class="hero__text">
                                    <h6>Summer Collection</h6>
                                    <h2>Fall - Winter Collections</h2>
                                    <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                    commitment to exceptional quality.</p>
                                    <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <section class="banner spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 offset-lg-4">
                        <div class="banner__item">
                            <div class="banner__item__pic">
                                <img src="img/banner/banner-1.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Clothing Collections 2030</h2>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="banner__item banner__item--middle">
                            <div class="banner__item__pic">
                                <img src="img/banner/banner-2.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Accessories</h2>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="banner__item banner__item--last">
                            <div class="banner__item__pic">
                                <img src="img/banner/banner-3.jpg" alt="">
                            </div>
                            <div class="banner__item__text">
                                <h2>Shoes Spring 2030</h2>
                                <a href="#">Shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Instagram Section Begin -->
        <section class="instagram spad pb-3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="instagram__pic">
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-1.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-2.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-3.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-4.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-5.jpg"></div>
                            <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-6.jpg"></div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="instagram__text">
                            <h2>Instagram</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua.</p>
                            <h3>#STRUTTOSHOP</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Instagram Section End -->
        
        <%@include file="components/footer.jsp" %>    
        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
