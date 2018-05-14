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
    <title>Details mission | Courses Faciles</title>
    <%@ include file="parts/styles.jsp" %>

</head>
<body>
<%@include file="parts/header.jsp" %>
<div class="banner-header detail-mission-bg no-mg">
    <div class="header-overlay"></div>
    <div class="row">
        <div class="col-md-12 text-center">
            <h2 class="title">${mission.name}</h2>
        </div>
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
                                            <li>
                                                <button class="btn btn-success" data-toggle="modal"
                                                        data-key-word="${mission.destination} ${mission.city.name}"
                                                        id="get-itinerary"
                                                        data-target="#itinerary">${mission.destination} le plus proche
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- Modal -->
                                <div class="modal fade" id="itinerary" tabindex="-1" role="dialog"
                                     aria-labelledby="itinerary">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Meilleur ittineraire</h4>
                                            </div>
                                            <div class="modal-body">

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="btn-group" role="group" aria-label="...">
                                                            <button class="btn btn-default travel-mode"
                                                                    data-travel-mode="DRIVING">
                                                                Conduire
                                                            </button>
                                                            <button class="btn btn-default travel-mode"
                                                                    data-travel-mode="BICYCLING">
                                                                Aller à vélo
                                                            </button>
                                                            <button class="btn btn-default travel-mode"
                                                                    data-travel-mode="TRANSIT">
                                                                Transit
                                                            </button>
                                                            <button class="btn btn-default travel-mode"
                                                                    data-travel-mode="WALKING">
                                                                Randonnée
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="map" class="mg-top-20" style="height: 500px"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn" data-dismiss="modal">Ok</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="excerpt">
                                    <p>
                                        <c:out value="${mission.description}" escapeXml="false"></c:out>
                                    </p>
                                </div>
                                <%
                                    User user = UserHandler.getLoggedInUser(request);
                                %>
                                <c:if test="${user.id ne mission.owner.id}">
                                    <div class="share">
                                        <a class="btn btn-primary"
                                           href="<%=prefixPath%>/book/${mission.id}">Effectuer cette mission</a>
                                    </div>
                                </c:if>
                                <c:if test="${user.id eq mission.owner.id}">
                                    <div class="share">
                                        <a class="btn btn-primary"
                                           href="<%=prefixPath%>/dashboard/update-mission/${mission.id}">Modifier cette
                                            mission</a>
                                    </div>
                                </c:if>
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
                                <h3>Publiée par</h3>
                                <ul>
                                    <li><c:set var="imgUrl"
                                               value="/images/people.png"></c:set> <c:if
                                            test="${not empty mission.owner.image}">
                                        <c:set var="imgUrl" value="${mission.owner.image}"></c:set>
                                    </c:if>
                                        <div class="our-border clearfix">
                                            <div class="our-img">
                                                <a href="<%=prefixPath%>/profile/${mission.owner.id}">
                                                    <img alt="" height="90" width="90" src="<%=prefixPath%>${imgUrl}">
                                                </a>
                                            </div>
                                            <div class="our-info">
                                                <h5>
                                                    <a href="<%=prefixPath%>/profile/${mission.owner.id}">${mission.owner.lname}
                                                        ${mission.owner.fname}</a>
                                                </h5>
                                                <c:if test="${not empty mission.owner.telephone}">
                                                    <span>Call. </span>${mission.owner.telephone}<br/>
                                                </c:if>
                                                <span>Mail. </span><a
                                                    href="mailto:${mission.owner.email}">${mission.owner.email}</a>
                                            </div>
                                        </div>
                                        <c:if test="${not empty user and mission.owner.id ne user.id}">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <a href="<%= prefixPath%>/dashboard/send-messages/${mission.owner.id}"
                                                       class="btn btn-primary">Contacter l'éditeur</a>
                                                </div>
                                            </div>
                                        </c:if>
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
                                            <c:set var="rmImgUrl"
                                                   value="/coursefacile/images/people.png"></c:set>
                                            <c:if test="${not empty rm.owner.image}">
                                                <c:set var="rmImgUrl" value="${rm.owner.image}"></c:set>
                                            </c:if>
                                            <li>
                                                <div class="clearfix">
                                                    <a title="" href="<%=prefixPath%>/mission/${rm.id}"> <img
                                                            alt="" class="thumbnail_pic related-mission"
                                                            src="${rmImgUrl}"> ${rm.name}
                                                    </a>
                                                    <div class="amount">${rm.price}€</div>
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
<script>

</script>
</body>
</html>