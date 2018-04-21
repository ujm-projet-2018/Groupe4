<%-- 
    Document   : adDisplayPage
    Created on : Apr 1, 2018, 5:30:27 PM
    Author     : mzemroun
--%>

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
    <div class="container" style="background-color: #CCC">
        <form class="form-inline" action="/coursefacile/missions" method="Post">
            <div class="form-group has-feedback has-icone col-sm-4 col-md-3 col-md-offset-2">
                <label for="city" class="control-label sr-only">Ville / Code postal</label>
                <i class="glyphicon glyphicon-map-marker form-control-feedback icon-align-left"></i>
                <input type="text" class="form-control" id="city" name="city" placeholder="Ville / Code postal"
                       autocomplete="off" value="${city.name}">
            </div>
            <div class="form-group has-feedback has-icone col-sm-3 col-md-3">
                <label for="date" class="control-label sr-only">de</label>
                <i class="glyphicon glyphicon-calendar form-control-feedback icon-align-left"></i>
                <input type="text" class="form-control" name="date" id="date" placeholder="Date" value="${date}">
            </div>
            <div class="col-sm-4 col-md-2 has-icone">
                <button type="submit" class="btn btn-primary">Chercher une mission</button>
            </div>
        </form>
    </div>
    <div class="container">
        <div class="row">
            <div class="grid_list_product st2">
                <ul class="products" id="able-list">
                    <c:forEach items="${Lmissions}" var="post">
                        <li style="display: block;" class="span12 first house offices Residential">
                            <div class="product-item">
                                <div class="row">
                                    <div class="col-md-2 col-sm-4">
                                        <div class="imagewrapper">
                                            <img alt="" class="img-circle" width="140px" height="140px"
                                                 style="border-radius: 50%; vertical-align: middle; margin-top: 14px"
                                                 src="${post.owner.image}">
                                            <span class="price">${post.price}<%out.println(" €");%> </span>

                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                        <div class="list-right-info">
                                            <h3>${post.owner.fname}  ${post.owner.lname}</a></h3>
                                            <p>
                                                    ${post.description}
                                            </p>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <ul class="title-info">
                                                        <li>Ville
                                                            <span> ${post.city.name} ${post.city.postalCode}</span></li>
                                                        <li>Destination <span>${post.destination}</span></li>
                                                    </ul>
                                                </div>
                                                <div class="col-md-4">
                                                    <ul class="title-info">
                                                        <li>Date publication<span><fmt:formatDate pattern="yyyy-MM-dd"
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
                                                    <a class="btn btn-primary" href="#" style="margin-bottom: 12px">Voir
                                                        detail</a>
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
        </div>
        <div class="mx-auto">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<%@ include file="parts/footer.jsp" %>

</body>

</html>
