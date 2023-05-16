<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%--부트스트랩--%>
<!-- Latest compiled and minified CSS -->
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>

<%--&lt;%&ndash;<!-- jQuery library -->&ndash;%&gt;--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>--%>
<%--<!-- Latest compiled JavaScript -->--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<style>
    .team-list img {
        width: 50%;

    }

    .team-list .content {
        width: 50%;
    }

    .team-list .content .follow {
        position: absolute;
        bottom: 24px;
    }

    .team-list:hover {
        -webkit-transform: scale(1.05);
        transform: scale(1.05);
    }

    .team, .team-list {
        -webkit-transition: all 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) 0s;
        transition: all 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) 0s;
    }

    .team .content .title, .team-list .content .title {
        font-size: 18px;
    }

    .team .overlay {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        opacity: 0;
        -webkit-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }

    .team .member-position, .team .team-social {
        position: absolute;
        bottom: -35px;
        right: 0;
        left: 0;
        margin: auto 10%;
        z-index: 99;
    }

    .team .team-social {
        bottom: 40px;
        opacity: 0;
        -webkit-transition: all 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) 0s;
        transition: all 0.5s cubic-bezier(0.68, -0.55, 0.27, 1.55) 0s;
    }

    .team:hover {
        -webkit-transform: translateY(-7px);
        transform: translateY(-7px);
        -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
    }

    .team:hover .overlay {
        opacity: 0.6;
    }

    .team:hover .team-social {
        opacity: 1;
    }

    @media (max-width: 768px) {
        .team-list img,
        .team-list .content {
            width: 100%;
            float: none !important;
        }

        .team-list img .follow,
        .team-list .content .follow {
            position: relative;
            bottom: 0;
        }
    }

    .social-icon.social li a {
        color: #adb5bd;
        border-color: #adb5bd;
    }

    .social-icon li a {
        color: #35404e;
        border: none;
        display: inline-block;
        height: 32px;
        text-align: center;
        font-size: 15px;
        width: 32px;
        line-height: 30px;
        -webkit-transition: all 0.4s ease;
        transition: all 0.4s ease;
        overflow: hidden;
        position: relative;
    }

    .rounded {
        border-radius: 5px !important;
    }

    .para-desc {
        max-width: 600px;
    }

    .text-muted {
        color: #8492a6 !important;
    }

    .section-title .title {
        letter-spacing: 0.5px;
        font-size: 30px;
    }
</style>


<section class="apply-now" id="apply">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 align-self-center">
                <div class="item">
                    <h3>Digi Members</h3>
                    <span>페이스북, 인스타아이디, email, phone</span>
                </div>

                <div class="item">
                    <section class="section main-banner" id="top" data-section="section1">
                        <div class="container">
                            <div class="row">
                                <c:forEach var="obj" items="${studentList}">
                                    <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                        <div class="team text-center rounded p-3 py-4">
                                            <a href="/student/mypage?id=${obj.id}"> <img
                                                    class="img-fluid avatar avatar-medium shadow rounded-pill"
                                                    src="/uimg/${obj.img}"/></a>
                                            <div class="content mt-3">
                                                <h4 class="title mb-0">${obj.name}</h4>
                                                <small class="text-muted">DIGI CAMPUS 2TH</small>
                                                <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                    <li class="list-inline-item"><a
                                                            href="https://www.facebook.com/${obj.facebook}"
                                                            class="rounded"><img
                                                            src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                    </li>

                                                    <li class="list-inline-item"><a
                                                            href="https://www.instagram.com/${obj.insta}"
                                                            class="rounded"><img
                                                            src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                    </li>
                                                    <li class="list-inline-item"><a href="#" class="rounded"><img
                                                            data-toggle="modal" data-target="#contact${obj.id}"
                                                            src="https://cdn-icons-png.flaticon.com/512/10308/10308259.png"></a>
                                                    </li>
                                                </ul><!--end icon-->
                                            </div>
                                        </div>
                                    </div>
                                    <!--end col-->
                                    <div id="contact${obj.id}" class="modal fade" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">${obj.name}의 연락처</h4>
                                                </div>
                                                <div class="modal-body text-center d-flex flex-column">
                                                    <p style="color: black">PHONE NUMBER : ${obj.contact}</p>
                                                    <span style="color: black">EMAIL : ${obj.email}<a
                                                            href="https://mail.google.com/">
                                                    <img style="width: 15px;"
                                                         src="https://cdn-icons-png.flaticon.com/512/732/732200.png"></a></span>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                                        Close
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>


                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FvQvbP%2FbtquGXAE2mz%2FDGuT1PfA68CUuqN8AzdfLK%2Fimg.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Calvin Carlo</h4>
                                            <small class="text-muted">C.E.O.</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/originals/b7/f4/69/b7f46900a33101dd15e14b6033723279.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Richha Jotchi</h4>
                                            <small class="text-muted">Manager</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FckEugc%2FbtquHRtc6NC%2FrmkohDL9SQGwWwcKj2Po51%2Fimg.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Cristino Murfy</h4>
                                            <small class="text-muted">Accountant</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->
                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbwKVT0%2FbtquFeiHcid%2FL6JoKmQD2IRMXj5dgB7qr1%2Fimg.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Lisa Martin</h4>
                                            <small class="text-muted">Founder</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/originals/61/ae/9f/61ae9f214f56687cb0a689c50682a222.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Calvin Carlo</h4>
                                            <small class="text-muted">C.E.O.</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/736x/5c/5f/28/5c5f2827e401e63aa3fb5edc3dd42162.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Richha Jotchi</h4>
                                            <small class="text-muted">Manager</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/736x/28/4e/75/284e75aebee2c175a515842c4895653d.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Cristino Murfy</h4>
                                            <small class="text-muted">Accountant</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->
                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/originals/ad/f8/1c/adf81ce5823ac3072b7c1e5581a88761.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Lisa Martin</h4>
                                            <small class="text-muted">Founder</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->

                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/originals/47/e0/fd/47e0fd6028b88a97f242406ca5c470d3.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Richha Jotchi</h4>
                                            <small class="text-muted">Manager</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->
                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/736x/10/e8/11/10e8119dabcfa3403301221f65c71b34.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Richha Jotchi</h4>
                                            <small class="text-muted">Manager</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->
                                <div class="col-lg-3 col-md-6 col-12 mt-4 pt-2">
                                    <div class="team text-center rounded p-3 py-4">
                                        <img src="https://i.pinimg.com/736x/10/e8/11/10e8119dabcfa3403301221f65c71b34.jpg"
                                             class="img-fluid avatar avatar-medium shadow rounded-pill" alt="">
                                        <div class="content mt-3">
                                            <h4 class="title mb-0">Richha Jotchi</h4>
                                            <small class="text-muted">Manager</small>
                                            <ul class="list-unstyled mt-3 social-icon social mb-0">

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/733/733547.png"></a>
                                                </li>

                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png"></a>
                                                </li>
                                                <li class="list-inline-item"><a href="javascript:void(0)"
                                                                                class="rounded"><img
                                                        src="https://cdn-icons-png.flaticon.com/512/3536/3536505.png"></a>
                                                </li>
                                            </ul><!--end icon-->
                                        </div>
                                    </div>
                                </div><!--end col-->
                            </div>
                        </div>
                    </section>


                </div>
            </div>
        </div>
    </div>
</section>

