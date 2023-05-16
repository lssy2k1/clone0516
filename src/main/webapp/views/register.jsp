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

    #register_container {
        padding-top: 120px;
    }

    #register_row {
        margin: 0 auto;
        background-color: rgba(255, 255, 255, 0.26);
        padding: 100px 75px 35px 75px;
    }

    .form-group {
        margin-bottom: 10px;
    }

    input[type="text"],
    input[type="password"],
    input[type="number"],
    input[type="email"] {
        height: 50px;
        border-style: none;
        border-radius: 30px;
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        padding-left: 30px;

    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="number"]:focus,
    input[type="email"]:focus,
    input[type="submit"]:focus {
        background-color: rgb(53, 53, 53);
        color: rgb(227, 227, 227);
        box-shadow: none;
        outline: none;
        border: 1px solid #fff;
    }

    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    input[type="number"],
    input[type="number"]::placeholder {
        padding-left: 0px;
        text-align: center;
    }

    input[type="number"] {
        width: 33%;
        display: inline-block;
    }

    #register_btn {
        margin-top: 20px;
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
        font-size: 11px;
        color: rgb(227, 227, 227);
    }

    #button-group {
        padding: 0px 10px 80px 10px;
    }

    .btns {
        color: #f5a425;
    }

    .form-group p {
        text-align: center;
    }
</style>

<script>
    let register_form = {
        init: function () {
            $('#register_btn').attr('disabled', true);
            $('#register_btn').click(function () {
                register_form.send();
            });
            $('#contact3').keyup(function () {
                let id = $('#id').val();
                let pwd = $('#pwd').val();
                let name = $('#name').val();
                let email = $('#email').val();
                let contact1 = $('#contact1').val();
                let contact2 = $('#contact2').val();
                let contact3 = $('#contact3').val();
                if (id.length >= 4 && pwd != '' && name != '' && email != '' && contact1 != '' && contact2 != '' && contact3 != '') {
                    $('#register_btn').attr('disabled', false);
                }
            });
            $('#id').keyup(function () {
                let txt_id = $('#id').val();
                if (txt_id.length <= 4) {
                    $("#id").css("border-bottom", "3px solid #f5a425");
                    $('#check_id').text('The ID must be at least Five Characters long.');
                    return;
                } else {
                    $.ajax({
                        url: '/checkid',
                        data: {id: txt_id},
                        success: function (result) {
                            if (result == 0) {
                                $("#id").css("border-bottom", "none");
                                $('#check_id').text('Available');
                            } else {
                                $('#check_id').text('Already in Use');
                            }
                        }
                    });
                }
            });
            $('#pwd2').blur(function () {
                let pwd = $('#pwd').val();
                let pwd2 = $('#pwd2').val();

                if (pwd !== pwd2) {
                    $("#pwd2").css("border-bottom", "3px solid #f5a425");
                    $('#check_pwd').text('Password Error');
                } else {
                    $("#pwd2").css("border-bottom", "none");
                    $('#check_pwd').text('Correct Password');
                }
            });
            $('#contact1').keyup(function () {
                let contact1 = $('#contact1').val();

                if (contact1.length === 3) {
                    $('#contact2').focus();
                }
            });
            $('#contact2').keyup(function () {
                let contact2 = $('#contact2').val();

                if (contact2.length === 4) {
                    $('#contact3').focus();
                }
            });
            $('#contact3').keyup(function () {
                let contact3 = $('#contact3').val();

                if (contact3.length === 4) {
                    $('contact3').blur();
                    $('register_btn').focus();
                }
            });

        },
        send: function () {
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let name = $('#name').val();
            let email = $('#email').val();
            let contact1 = $('#contact1').val();
            let contact2 = $('#contact2').val();
            let contact3 = $('#contact3').val();

            if (id.length <= 4) {
                $("#id").css("border-bottom", "1px solid #f5a425");
                $('#check_id').text('The ID must be at least Five Characters long.');
                $('#id').focus();
                return;
            }
            if (id.length > 5) {
                $('#check_id').text('');
            }
            if (pwd == '') {
                $('#pwd').focus();
                return;
            }
            if (name == '') {
                $('#name').focus();
                return;
            }
            if (email == '') {
                $('#email').focus();
                return;
            }
            if (contact1 == '') {
                $('contact1').focus();
            }
            if (contact2 == '') {
                $('contact2').focus();
            }
            if (contact3 == '') {
                $('contact3').focus();
            }

            $('#register_form').attr({
                'action': '/registerimpl',
                'method': 'post'
            });
            $('#register_form').submit();
        }
    };

    $(function () {
        register_form.init();
    });
</script>
<section class="section main-banner" id="top" data-section="section1">
    <video autoplay muted loop id="bg-video">
        <source src="/assets/images/course-video.mp4" type="video/mp4"/>
    </video>
    <div class="video-overlay header-text">
        <div class="container" id="register_container">
            <div class="row">
                <div class="col-lg-6 align-self-center" id="register_row">
                    <div class="col-lg-12">
                        <div class="item">
                            <h3>SIGN UP</h3>
                            <form id="register_form" action="/registerimpl" method="post">
                                <div class="form-group">
                                    <input type="text" name="id" class="form-control" id="id" placeholder="ID"
                                           autocomplete="off">
                                    <span id="check_id"></span>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="NAME"
                                           autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="pwd" name="pwd"
                                           placeholder="PASSWORD">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="pwd2"
                                           placeholder="Enter PASSWORD Again">
                                    <span id="check_pwd"></span>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control" id="email" placeholder="email"
                                           autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <input type="number" name="contact1" id="contact1" autocomplete="off"
                                           placeholder="010">
                                    <input type="number" name="contact2" id="contact2" autocomplete="off"
                                           style="width: 32%;" placeholder="1234">
                                    <input type="number" name="contact3" id="contact3" autocomplete="off"
                                           placeholder="5678">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="form-control" id="register_btn" value="REGISTER">
                                </div>
                                <div class="form-group" id="button-group">
                                    <p>After signing up, You can change your <span class="btns">Status Message</span>
                                        and <span class="btns">Profile Photo </span>on MyPage.<br></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
