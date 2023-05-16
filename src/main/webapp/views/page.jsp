<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<!-- pagination start -->
<div class="col-lg-12">
    <div class="pagination">
        <ul>
            <c:choose>
                <c:when test="${cpage.getPrePage() != 0}">
                    <li>
                        <a href="/${target}/allpage?pageNo=${cpage.getPrePage()}"><</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="disabled">
                        <a href="#"><</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">
                <c:choose>
                    <c:when test="${cpage.getPageNum() == page}">
                        <li class="active">
                            <a href="/${target}/allpage?pageNo=${page}">${page }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="/${target}/allpage?pageNo=${page}">${page }</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
            <c:choose>
                <c:when test="${cpage.getNextPage() != 0}">
                    <li>
                        <a href="/${target}/allpage?pageNo=${cpage.getNextPage()}">></a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="disabled">
                        <a href="#">></a>
                    </li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
</div>
<!-- pagination end -->