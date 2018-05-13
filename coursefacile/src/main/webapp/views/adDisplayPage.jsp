<%-- 
    Document   : adDisplayPage
    Created on : Apr 1, 2018, 5:30:27 PM
    Author     : mzemroun
--%>

<%@page import="java.util.Map" %>
<%@page import="java.util.Date" %>
<%@page import="com.coursefacile.controller.MissionListing" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.coursefacile.model.Mission" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="org.hibernate.criterion.Criterion" %>
<%@page import="org.hibernate.Criteria" %>
<%@page import="com.coursefacile.model.City" %>
<%@page import="java.util.List" %>
<%@page import="org.hibernate.Query" %>
<%@page import="org.hibernate.HibernateException" %>
<%@page import="com.coursefacile.dao.SessionFactoryHelper" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@page import="org.hibernate.SessionFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%
        List<Mission> Lmissions = (ArrayList<Mission>) request.getAttribute("Lmissions");
        SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-mm-dd");
        SimpleDateFormat dt2 = new SimpleDateFormat("hh:mm");
        Session session1 = (Session) request.getAttribute("session1");

    %>

    <%@ include file="parts/meta.jsp" %>
    <title>Courses Faciles</title>
    <%@ include file="parts/styles.jsp" %>
</head>
<body>
<%@include file="parts/header.jsp" %>
<div class="main-content">
    <div class="container">
        <form class="form" action="/coursefacile/missions" method="Get">
            <div class="row">
                <div class="col-md-6 mg-top-20">
                    <div class='input-group'>
                        <label for="city" class="control-label sr-only">Ville / Code postal</label>
                        <input type="text" class="form-control" value="${param.city}" id="city" name="city"
                               placeholder="Ville / Code postal"
                               autocomplete="off">
                        <span class="input-group-addon">
                                <span class="glyphicon glyphicon-map-marker"></span>
                            </span>
                    </div>
                </div>
                <div class="col-md-6 mg-top-20">
                    <div class='input-group'>
                        <label for="date" class="control-label sr-only">Date</label>
                        <input type="text" class="form-control" value="${Date}" name="date" id="date"
                               placeholder="Date">
                        <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                    </div>
                </div>
            </div>
            <div class="row collapse" id="rechercheAvancéeCollapse">
                <div class="col-md-4 mg-top-20">
                    <div class="input-group date form_time">
                        <input type='text' class="form-control" placeholder="De" id="de" name="de"/>
                        <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
                <div class="col-md-4 mg-top-20">
                    <div class="input-group date form_time">
                        <input type='text' class="form-control" placeholder="A" id="a" name="a"/>
                        <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                    </div>
                </div>
                <div class="col-md-4 mg-top-20">
                    <div class='form-group'>
                        <%--<input type='range' class="form-control" placeholder="prix min" id="prix" name="prix"/>--%>
                        <div class="col-md-6 mg-top-5">
                            <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
                        </div>
                        <div class="col-md-6 mg-top-10">
                            <input type="hidden" id="minP" name="minP">
                            <input type="hidden" id="maxP" name="maxP">
                            <div class="slider-range-price"></div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-offset-8 col-sm-offset-2 col-sm-4 col-md-1 has-icone ">
                <button type="submit" class="btn btn-primary">Chercher</button>
            </div>
        </form>
        <div class="col-md-3 col-md-offset-0 col-sm-offset-2 col-sm-6">
            <button data-toggle="collapse" class="btn btn-primary" data-target="#rechercheAvancéeCollapse"
                    aria-expanded="false" aria-controls="rechercheAvancéeCollapse">Recherche avanceé
            </button>
        </div>


    </div>
    <div class="container">
        <div class="row mg-top-20 well">
            <div class="col-sm-12">
                <p>Afficher la map avec tout les mission et avec la mission aillaiant le meilleur itineraire</p>
                <form class="form-inline">
                    <div class="form-group">
                        <label for="travel-method">Methode</label>
                        <select type="text" class="form-control" id="travel-method" placeholder="Jane Doe">
                            <option value="WALKING">Randonnée</option>
                            <option value="TRANSIT">Transit</option>
                            <option value="DRIVING">Conduire</option>
                            <option value="BICYCLING">Aller à vélo</option>
                        </select>
                    </div>
                    <button type="submit" id="show-map" class="btn btn-primary no-mg-top">Afficher la map</button>
                </form>

            </div>
        </div>
    </div>
    <div class="container mg-top-10">
        <div class="row">
            <div class="col-sm-12 col-mission-map">

            </div>
        </div>
        <div class="row">
            <c:if test="${not empty Lmissions}">

                <div class="grid_list_product st2">
                    <ul class="products" id="able-list">

                        <% int i = 0;%>
                        <c:forEach items="${Lmissions}" var="post">
                            <%i++;%>
                            <li style="display: block;" class="span12 first house offices Residential mission-item">
                                <div class="product-item">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="imagewrapper">
                                                <c:set var="image" value="/coursefacile/images/people.png"></c:set>
                                                <c:if test="${not empty post.owner.image}">
                                                    <c:set var="image" value="${ post.owner.image}"></c:set>
                                                </c:if>
                                                <a href="/coursefacile/profile/${post.owner.id}"><img alt=""
                                                                                                      accesskey=""
                                                                                                      class="img-circle"
                                                                                                      width="140px"
                                                                                                      height="140px"
                                                                                                      style="border-radius: 50%; vertical-align: middle; margin-top: 14px"
                                                                                                      src="${image}"></a>
                                                <span class="price">${post.price} €</span>
                                            </div>
                                        </div>
                                        <div class="col-md-10">
                                            <div class="list-right-info">
                                                <h3>${post.name}</h3>
                                                <p class="lead">
                                                        ${post.owner.fname} ${post.owner.lname}
                                                </p>
                                                <p>
                                                        ${post.description}
                                                </p>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <ul class="title-info">
                                                            <li>Ville <span> ${post.city.name}</span></li>
                                                            <li>Destination <span>${post.destination}</span></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <ul class="title-info">
                                                            <li>Date publication<span><fmt:formatDate
                                                                    pattern="yyyy-MM-dd"
                                                                    value="${post.publishDate}"/></span>
                                                            </li>
                                                            <li>Date mission <span><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                                   value="${post.missionDate}"/></span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <ul class="title-info">
                                                            <li>Heure publication<span><fmt:formatDate type="time"
                                                                                                       value="${post.publishDate}"/> </span>
                                                            </li>
                                                            <li>Heure mission <span><fmt:formatDate type="time"
                                                                                                    value="${post.missionDate}"/></span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <a class="btn btn-primary"
                                                           href="<%=prefixPath%>/mission/${post.id}"
                                                           style="margin-bottom: 12px">Voir détails</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="grid_full_width">
                    <div class="page-ination">
                        <div class="page-in">
                            <ul class="clearfix">
                                <c:if test="${paginationMax gt 1}">
                                    <li><a href="${currentUrl}1"><img alt="" src="<%=prefixPath%>/images/pre2.png"></a>
                                    </li>
                                    <li><a href="${currentUrl}${ param.start - 1 ge 1 ? param.start-1 : 1}"><img alt=""
                                                                                                                 src="<%=prefixPath%>/images/pre1.png"></a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${paginationMax}">
                                    <li><a
                                            <c:if test="${param.start eq i}">class="current"</c:if>
                                            href="${currentUrl}${i}">${i}</a></li>
                                </c:forEach>
                                <c:if test="${paginationMax gt 1}">
                                    <li>
                                        <a href="${currentUrl}${ param.start + 1 le paginationMax ? param.start+1 : paginationMax}"><img
                                                alt="" src="<%=prefixPath%>/images/next1.png"></a></li>
                                    <li><a href="${currentUrl}${paginationMax}"><img alt=""
                                                                                     src="<%=prefixPath%>/images/next2.png"></a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty Lmissions}">
                <p class="lead">Votre recherche n'a donné aucun résultat</p>
            </c:if>
        </div>


    </div>
</div>
<%@ include file="parts/footer.jsp" %>

</body>

</html>
