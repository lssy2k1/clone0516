<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
    .item h3 {
        color: #fff;
        text-transform: uppercase;
        font-size: 24px;
        font-weight: 700;
        margin-bottom: 20px;
    }

    #login_container {
        padding-top: 220px;
    }

    #login_row {
        margin: 0 auto;
        background-color: rgba(255, 255, 255, 0.26);
        padding: 100px 75px 35px 75px;
    }

    .form-group {
        margin-top: 20px;
    }

    input[type="text"],
    input[type="password"] {
        height: 50px;
        border-style: none;
        border-radius: 30px;
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        padding-left: 30px;

    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="submit"]:focus {
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        box-shadow: none;
        outline: none;
        border: 1px solid #fff;
    }

    #login_btn {
        height: 50px;
        border-style: none;
        border-radius: 30px;
        border-radius: 30px;
        color: #fff;
        background-color: #f5a425;
        font-size: 15px;
        font-weight: 500;
    }

    .item p {
        font-size: 14px;
        color: rgb(227, 227, 227);
    }

    #button-group {
        padding: 0px 20px 70px 20px;
    }

    .btns {
        color: #f5a425;
    }
</style>

<script>
    $(function () {
        login_form.init();
    });
</script>
</script>
<section class="section main-banner" id="top" data-section="section1">
    <video autoplay muted loop id="bg-video">
        <source src="/assets/images/course-video.mp4" type="video/mp4"/>
    </video>

    <div class="video-overlay header-text">
        <div class="container" id="login_container">
            <div class="row">
                <div class="col-lg-5 align-self-center" id="login_row">
                    <div class="col-lg-12">
                        <div class="item">
                            <h3>LOG IN</h3>
                            <form id="login_form" action="/loginimpl" method="post">
                                <div class="form-group">
                                    <input type="text" name="id" class="form-control" id="id" placeholder="ID" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="form-control" id="login_btn" value="LOGIN">
                                </div>
                                <div class="form-group" id="button-group">
                                    <p style="text-align: left;">Still Not a Member of DIGICampus?
                                        <a href="/register"><span class="btns">Sign Up Now!</span></a></p>
                                    <p style="text-align: right;">Need Help with Your Account?
                                        <a href="/findInfo"><span class="btns">Click Here!</span></a></p>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Main Banner Area End ***** -->
