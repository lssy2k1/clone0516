<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  center1--%>
<!-- ***** Main Banner Area Start ***** -->


<section class="section main-banner" id="top" data-section="section1">
    <video autoplay muted loop id="bg-video">
        <source src="/assets/images/course-video.mp4" type="video/mp4"/>
    </video>

    <div class="video-overlay header-text">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="caption">
                        <c:choose>
                            <c:when test="${loginStudent==null}">
                                <h6>Hello Student</h6>
                                <h2>Welcome to Education</h2>
                                <p>We provide wide variety of programming courses both back-end and front end. <a rel="nofollow"
                                   href="/register" target="_blank">Click Here to Join us Right Now</a>.
                                    Expand Your Career Opportunities With Us.</p>
                                <div class="main-button-red">
                                    <div class><a href="/register">Join Us Now!</a></div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <h6>Hello ${loginStudent.name}ดิ!</h6>
                                <h2>Welcome to DIGICampus</h2>
                                <p>We provide wide variety of programming courses both back-end and front end.
                                    <a rel="nofollow" href="/lecture/allpage" target="_blank">Click Here to View All Course. </a>
                                    Expand Your Career Opportunities Now With us!</p>
                                <div class="main-button-red">
                                    <div><a href="/att_check" target="_blank">ATTENDANCE</a></div>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ***** Main Banner Area End ***** -->

<section class="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="owl-service-item owl-carousel">

                    <div class="item">
                        <div class="icon">
                            <img src="/assets/images/service-icon-01.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4>Best Education</h4>
                            <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non
                                vestibulum.</p>
                        </div>
                    </div>

                    <div class="item">
                        <div class="icon">
                            <img src="/assets/images/service-icon-02.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4>Best Teachers</h4>
                            <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non
                                vestibulum.</p>
                        </div>
                    </div>

                    <div class="item">
                        <div class="icon">
                            <img src="/assets/images/service-icon-03.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4>Best Students</h4>
                            <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non
                                vestibulum.</p>
                        </div>
                    </div>

                    <div class="item">
                        <div class="icon">
                            <img src="/assets/images/service-icon-02.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4>Online Meeting</h4>
                            <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non
                                vestibulum.</p>
                        </div>
                    </div>

                    <div class="item">
                        <div class="icon">
                            <img src="/assets/images/service-icon-03.png" alt="">
                        </div>
                        <div class="down-content">
                            <h4>Best Networking</h4>
                            <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non
                                vestibulum.</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>