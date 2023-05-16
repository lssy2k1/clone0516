<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #starRate{
        width: 20px;
        margin-bottom: 2px;
        margin-right: 2px;"
    }
</style>

<section class="heading-page header-text" id="top">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6>Expand Your Career Opportunities NOW</h6>
                <h2>UDEMY COURSES</h2>
            </div>
        </div>
    </div>
</section>

<section class="meetings-page" id="meetings">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="filters">
                            <ul>
                                <li class="active"><a href = "">All</a></li>
                                <li><a href = "">Back-End</a></li>
                                <li>Front-End</li>
                                <li data-filter=".att">Certificate</li>
                                <li data-filter=".att">ETC</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="row grid">
                            <c:forEach var="obj" items="${cpage.getList()}">
                                <div class="col-lg-4 templatemo-item-col all soon">
                                    <div class="meeting-item">
                                        <div class="thumb">
                                            <div class="price">
                                                <span><img src = "/assets/images/rating.png" id = "starRate"> ${obj.rating}</span>
                                            </div>
                                            <a href="${obj.target}"><img src="/uimg/${obj.img}"></a>
                                        </div>
                                        <div class="down-content">
                                            <div class="date">
                                                <h6>${obj.rdate}</h6>
                                            </div>
                                            <a href="${obj.target}"><h4>${obj.title}</h4></a>
                                            <p>강사: ${obj.teacher}</p>
                                            <p>언어: ${obj.topic}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                        <jsp:include page="../page.jsp"/>
                </div>
            </div>
        </div>
    </div>
</section>

