<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap" rel="stylesheet">
        <title>About Us</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <!-- About Section Begin -->
        <section class="about spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="about__pic">
                            <img src="img/about/about-us.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="about__item">
                            <h4>Who We Are ?</h4>
                            <p>Contextual advertising programs sometimes have strict policies that need to be adhered too.
                            Let’s take Google as an example.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="about__item">
                            <h4>Who We Do ?</h4>
                            <p>In this digital generation where information can be easily obtained within seconds, business
                            cards still have retained their importance.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="about__item">
                            <h4>Why Choose Us</h4>
                            <p>A two or three storey house is the ideal way to maximise the piece of earth on which our home
                            sits, but for older or infirm people.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Section End -->

        <!-- Testimonial Section Begin -->
        <section class="testimonial">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 p-0">
                        <div class="testimonial__text">
                            <span class="icon_quotations"></span>
                            <p>“Going out after work? Take your butane curling iron with you to the office, heat it up,
                                style your hair before you leave the office and you won’t have to make a trip back home.”
                            </p>

                        </div>
                    </div>
                    <div class="col-lg-6 p-0">
                        <div class="testimonial__pic set-bg" data-setbg="img/about/testimonial-pic.jpg"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->
        
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
