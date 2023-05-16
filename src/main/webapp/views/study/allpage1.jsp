<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>

    .container3 {
        width: 100%;
        height: 10%;
        margin: 0 auto;
        display: flex;
    }

    .studyItem {
        flex: 1;
        align-itmes: center;
        vertical-align: center;
        justify-content: center;
        text-align: center;
    }

    .studentImg {
        width: 85px;
        height: 85px;
        border-radius: 70%;
    }

    .attached {
        width: 40px;
        height: 40px;
    }

    .rdate {
        font-size: 0.95em;
        font-weight: 500;
        color: rgb(171, 171, 171);
    }

    hr {
        border: none;
        border-top: 0.3px solid #a2a2a2; /* 굵기 조절을 위한 border-top 속성 */
        margin: 5px 0; /* 위아래 마진을 조절 */
        padding: 0; /* 패딩을 제거 */
    }

</style>


<section style="padding: 200px;">
    <div class="container">
        <div class="col-lg-9" style="margin: 0 auto;">
            <c:forEach var="obj" items="${cpage.getList()}">
                <hr>
                <div class=" col-lg-12 container3">
                    <div class="col-lg-2 studyItem" style="text-align: right;">
                        <img class="studentImg" src="/uimg/${obj.studentImg}">
                    </div>
                    <div class="col-lg-6 studyItem"
                         style="text-align: left; display: flex;flex-direction: column;align-items: center;">
                        <p><b>${obj.studentName}</b><br>
                            <span class="rdate">${obj.rdate}</span></p>
                    </div>
                    <div class="col-lg-6 studyItem"
                         style="text-align: left; display: flex;flex-direction: column;align-items: center;">
                        <c:choose>
                            <c:when test="${obj.studentName==loginStudent.name}">
                                <p style="text-align: center;"><a href="/study/edit?id=${obj.id}"><img
                                        src="/assets/images/study_modify.png"
                                        style="width:15px;"></a>
                                    <a href="javascript:void(0)" data-toggle="modal"
                                       data-target="#myDelete${obj.id}"><img
                                            src="/assets/images/study_delete.png"
                                            style="width:15px;"></a><br>
                                <div id="myDelete${obj.id}" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content-->
                                        <div class="modal-content">


                                            <div class="modal-body">
                                                <p style="text-align:center; margin: 20px 0px 20px 0px;">Are you Sure
                                                    you Want to Delete Study Journal
                                                    No.${obj.id}?</p>

                                                <div class="main-button-yellow" style="text-align: center;">
                                                    <a href="/study/delete?id=${obj.id}" id="studyDelete">DELETE</a>
                                                    <a href="#" id="modalCloseButton1" data-dismiss="modal">Close</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <a href="javascript:void(0)" data-toggle="modal"
                                   data-target="#myContents${obj.id}"><span class="rdate" style="font-size: 12px;">Click to View Study Summary!</span></a></p>

                                <!-- Modal -->
                                <div id="myContents${obj.id}" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <img class="studentImg" src="/uimg/${obj.studentImg}"><span
                                                    class="rdate">${obj.rdate}</span>
                                            </div>
                                            <div class="modal-body">
                                                <p>${obj.contents}</p>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="main-button-yellow" style="text-align: center;">
                                                    <a href="#" id="modalCloseButton2" data-dismiss="modal">Close</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </c:when>
                            <c:otherwise>
                                <span class="rdate" style="font-size: 12px;">${obj.contents}</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-lg-6 studyItem"
                         style="text-align: left; display: flex;flex-direction: column;align-items: center;">
                            <span class="rdate"
                                  style="font-size: 12px;">${obj.startTime}<br> - ${obj.endTime}</span></p>
                    </div>
                    <div class="col-lg-3 studyItem"
                         style="display: flex;flex-direction: column;align-items: center;">
                        <a href="/download/${obj.fileName}"><img class="attached" src="/assets/images/attached.png"><br><span class="rdate"
                                                                                      style="font-size: 12px;">${obj.fileName_org}</span></a></p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <jsp:include page="../page.jsp"/>
</section>

<section>
    <div style="width:100%; text-align: center;">

    </div>
</section>



