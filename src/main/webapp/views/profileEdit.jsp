<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>DIGI CAM | MY PAGE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>

    <!-- Facebook and Twitter integration -->
    <%--    <meta property="og:title" content=""/>--%>
    <%--    <meta property="og:image" content=""/>--%>
    <%--    <meta property="og:url" content=""/>--%>
    <%--    <meta property="og:site_name" content=""/>--%>
    <%--    <meta property="og:description" content=""/>--%>
    <%--    <meta name="twitter:title" content=""/>--%>
    <%--    <meta name="twitter:image" content=""/>--%>
    <%--    <meta name="twitter:url" content=""/>--%>
    <%--    <meta name="twitter:card" content=""/>--%>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.css">
    <!-- Flexslider  -->
    <link rel="stylesheet" href="/css/flexslider.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css">

    <!-- Modernizr JS -->
    <script src="/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="/js/respond.min.js"></script>
    <![endif]-->
    <style>
        #digicam {
            display: block;
            width: 100px;
            float: left;
            top: 10px;
            left: 10px;
            position: fixed;
            z-index: 1020;
        }

    </style>
</head>
<body>
<a href="/">
    <img id="digicam" src="/assets/images/digi_logo.png"></a>
<div id="colorlib-page">
    <div class="container-wrap">
        <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle" data-toggle="collapse" data-target="#navbar"
           aria-expanded="false" aria-controls="navbar"><i></i></a>
        <aside id="colorlib-aside" role="complementary" class="border js-fullheight">
            <div class="text-center">
                <div class="author-img"
                     style="background-image: url('https://ca.slack-edge.com/T04HWDY9NPM-U04LTGAEQ5P-976b9c40207e-512')"></div>
                <h1 id="colorlib-logo"><a href="index.html">Jackson Ford</a></h1>
                <span class="position">KB KOOKMIN BANK DIGI CAM 2TH </span>
            </div>
        </aside>

        <div id="colorlib-main">
            <section class="colorlib-contact" data-section="contact">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box"
                             data-animate-effect="fadeInLeft">
                            <span class="heading-meta">Change your story :)</span>
                            <h2 class="colorlib-heading">Profile Edit</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <img style="width: 300px; margin: 20px;"
                                 src="https://cdn-icons-png.flaticon.com/512/1144/1144760.png">
                            <div class="form-group">
                                <input type="file" id="profile_img" class="form-control" placeholder="profile image...">
                            </div>
                        </div>
                        <div class="col-md-7 col-md-push-1">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box"
                                     data-animate-effect="fadeInRight">
                                    <form action="">
                                        <div class="form-group">
                                            <label>MBTI : </label>
                                            <select>
                                                <option>MBIT</option>
                                                <option>ENFP</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <textarea name="" id="introduction" cols="30" rows="7" class="form-control"
                                                      placeholder="introduction"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Name">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Subject">
                                        </div>
                                        <div class="form-group">
                                            <textarea name="" id="message" cols="30" rows="7" class="form-control"
                                                      placeholder="Message"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary btn-send-message"
                                                   value="EDIT">
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div><!-- end:colorlib-main -->
    </div><!-- end:container-wrap -->
</div><!-- end:colorlib-page -->

<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="/js/owl.carousel.min.js"></script>
<!-- Counters -->
<script src="/js/jquery.countTo.js"></script>


<!-- MAIN JS -->
<script src="/js/main.js"></script>

</body>
</html>

