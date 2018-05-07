<%--
  Created by IntelliJ IDEA.
  User: pret
  Date: 05/05/2018
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>

    <%@ include file="parts/meta.jsp" %>
    <title>Courses Faciles</title>
    <%@ include file="parts/styles.jsp" %>

</head>
<body>
<%@include file="parts/header.jsp" %>
<div class="banner-header detail-mission-bg no-mg">
    <div class="header-overlay"></div>
    <div class="row">
        <div class="col-md-12 text-center"><h2 class="title">${mission.name}</h2></div>
    </div>

</div>
<div class="main-content">
    <div class="properties">
        <div class="container">
            <div class="grid_full_width gird_sidebar">
                <div class="row">

                    <!-- Main content -->
                    <div class="col-md-8">
                        <!-- Property detail -->
                        <div class="property_detail">
                            <div class="infotext-detail pad-20">
                                Rémunération: <span class="price">${mission.price} €</span>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul class="title-info">
                                            <li>Ville <span>${mission.city.name}</span></li>
                                            <li>Destination <span>${mission.destination}</span></li>
                                            <li>Date de la mission <span> <fmt:formatDate
                                                    pattern="dd/MM/yyyy   HH:mm:ss"
                                                    value="${mission.missionDate}"/></span></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">
                                        <ul class="title-info">
                                            <li>Date de publication <span> <fmt:formatDate
                                                    pattern="dd/MM/yyyy   HH:mm:ss"
                                                    value="${mission.publishDate}"/></span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="excerpt">
                                    <p>
                                        <c:out value="${mission.description}" escapeXml="false"></c:out>
                                    </p>
                                </div>
                                <div class="share">
                                    <a class="btn btn-primary" href="<%=prefixPath%>/book/${mission.id}">Effectuer cette
                                        mission</a>
                                </div>
                            </div>
                        </div>
                        <!-- End Property -->
                    </div>
                    <!-- End Main content -->


                    <!-- Sidebar left  -->
                    <div class="col-md-4">
                        <div class="box-siderbar-container">
                            <!-- sidebar-box map-box -->
                            <!-- End sidebar-box map-box -->

                            <!-- sidebar-box our-box -->
                            <div class="sidebar-box our-box">
                                <h3>Notre agent</h3>
                                <ul>
                                    <li>
                                        <c:set var="imgUrl" value="/coursefacile/images/people.png"></c:set>
                                        <c:if test="${not empty mission.owner.image}">
                                            <c:set var="imgUrl" value="${mission.owner.image}"></c:set>
                                        </c:if>
                                        <div class="our-border clearfix">
                                            <div class="our-img"><img alt="" height="90" width="90"
                                                                      src="${imgUrl}"></div>
                                            <div class="our-info">
                                                <h5>
                                                    <a href="<%=prefixPath%>/profile/${mission.owner.id}">${mission.owner.lname} ${mission.owner.fname}</a>
                                                </h5>
                                                <c:if test="${not empty mission.owner.telephone}">
                                                    <span>Call. </span>${mission.owner.telephone}<br/>
                                                </c:if>
                                                <span>Mail. </span><a
                                                    href="mailto:${mission.owner.email}">${mission.owner.email}</a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- End sidebar-box our-box -->


                            <!-- sidebar-box product_list_wg -->
                            <c:if test="${not empty relatedMissions}">
                                <div class="sidebar-box">
                                    <h3>Mission dans la même ville</h3>
                                    <ul class="product_list_wg">

                                        <c:forEach var="rm" items="${relatedMissions}">
                                            <c:set var="rmImgUrl" value="/coursefacile/images/people.png"></c:set>
                                            <c:if test="${not empty rm.owner.image}">
                                                <c:set var="rmImgUrl" value="${rm.owner.image}"></c:set>
                                            </c:if>
                                            <li>
                                                <div class="clearfix">
                                                    <a title="" href="<%=prefixPath%>/mission/${rm.id}">
                                                        <img alt="" class="thumbnail_pic related-mission"
                                                             src="${rmImgUrl}">
                                                            ${rm.name}
                                                    </a>
                                                    <div class="amount">${rm.price} €</div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>

                            <!-- End sidebar-box product_list_wg -->

                            <!-- sidebar-box searchbox -->
                            <!-- End sidebar-box searchbox -->

                        </div>
                    </div>
                    <!-- End Sidebar left  -->

                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="parts/footer.jsp" %>

</body>
</html>