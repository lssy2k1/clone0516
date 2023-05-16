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

    #loginfail_container {
        padding-top: 220px;
    }

    #loginfail_row {
        margin: 0 auto;
        background-color: rgba(255, 255, 255, 0.26);
        padding: 100px 75px 35px 75px;
    }

    .form-group {
        margin: 20px 0px 70px 0px;
    }

    .item p {
        font-size: 15px;
        margin-left: 45px;
        color: rgb(227, 227, 227);
    }

    .btns {
        color: #f5a425;
    }
</style>

<section class="section main-banner" id="top" data-section="section1">
    <video autoplay muted loop id="bg-video">
        <source src="/assets/images/course-video.mp4" type="video/mp4"/>
    </video>
    <div class="video-overlay header-text">
        <div class="container" id="loginfail_container">
            <div class="row">
                <div class="col-lg-5 align-self-center" id="loginfail_row">
                    <div class="col-lg-12">
                        <div class="item">
                            <h3>LOGIN FAIL</h3>
                            <form id="loginfail_form">
                                <div class="form-group">
                                    <p>Sorry For Inconvenience</p>
                                    <p>Your ID or Password is incorrect.</p>
                                    <p>Please Try Again!</p>
                                    <br>
                                    <br>
                                    <p>Need Help with Your Account?
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
