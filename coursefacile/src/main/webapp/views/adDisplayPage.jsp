<%-- 
    Document   : adDisplayPage
    Created on : Apr 1, 2018, 5:30:27 PM
    Author     : mzemroun
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Date"%>
<%@page import="com.coursefacile.controller.MissionListing"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.coursefacile.model.Mission"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.criterion.Criterion"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="com.coursefacile.model.City"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="com.coursefacile.dao.SessionFactoryHelper"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <%
            List<Mission> Lmissions = (ArrayList< Mission>) request.getAttribute("Lmissions");
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
            <div class="container" >
                <form class="form" action="/coursefacile/missions" method="Get">
                <div class="row">
                    <div class="col-md-6" style="margin-top: 22px">
                        <div class='input-group' >
                            <label for="city" class="control-label sr-only">Ville / Code postal</label>
                            <input type="text" class="form-control"  id="city" name="city" placeholder="Ville / Code postal" autocomplete="off">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-map-marker"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-6" style="margin-top: 22px">
                        <div class='input-group' >
                            <label for="date" class="control-label sr-only">Date</label>
                            <input type="text" class="form-control" value="${Date}" name="date" id="date" placeholder="Date" >
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row collapse" id="rechercheAvancéeCollapse">
                    <div class="col-md-4" style="margin-top: 22px">
                        <div class="input-group date form_time">
                            <input type='text' class="form-control" placeholder="De" id="de" name="de" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4" style="margin-top: 22px">
                        <div class="input-group date form_time">
                            <input type='text' class="form-control" placeholder="A" id="a" name="a"  />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>
                    </div>
                    <div class="col-md-4" style="margin-top: 22px">
                        <div class='input-group' >
                            <input type='text' class="form-control" placeholder="prix" id="prix" name="prix" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-euro"></span>
                            </span>
                        </div>
                    </div>
            </div>
                

                    <div class="col-md-offset-8 col-sm-offset-2 col-sm-4 col-md-1 has-icone " >
                        <button type="submit" class="btn btn-primary">Chercher</button>
                    </div>
                     </form>
                    <div class="col-md-3 col-md-offset-0 col-sm-offset-2 col-sm-6">
                        <button data-toggle="collapse" class="btn btn-primary" data-target="#rechercheAvancéeCollapse" aria-expanded="false" aria-controls="rechercheAvancéeCollapse">Recherche avanceé</button>
                    </div>
                

            </div>
              <div class="container" style="margin-top: 12px">
                <div class="row">
                    <div class="grid_list_product st2">
                        <ul class="products" id="able-list">
                            <c:forEach items="${Lmissions}" var="post">
                                <li style="display: block;" class="span12 first house offices Residential">
                                    <div class="product-item">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <div class="imagewrapper">
                                                    <c:set var="image" value="/coursefacile/images/people.png"></c:set>
                                                    <c:if test="${not empty post.owner.image}">
                                                        <c:set var="image" value="${ post.owner.image}"></c:set>
                                                    </c:if>
                                                    <a href="/coursefacile/profile/${post.owner.id}"><img alt=""
                                                                                                          class="img-circle"
                                                                                                          width="140px"
                                                                                                          height="140px"
                                                                                                          style="border-radius: 50%; vertical-align: middle; margin-top: 14px"
                                                                                                          src="${image}"></a>
                                                    <span class="price">${post.price}<%out.println(" €");%> </span>  
                                                </div>
                                            </div>
                                            <div class="col-md-10">
                                                <div class="list-right-info">
                                                    <h3>${post.owner.fname}  ${post.owner.lname}</h3>
                                                    <p>
                                                        ${post.description}
                                                    </p>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <ul class="title-info">
                                                                <li>Ville <span> ${post.city.name}  ${post.city.postalCode}</span> </li>
                                                                <li>Destination <span>${post.destination}</span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <ul class="title-info">
                                                                <li>Date publication<span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${post.publishDate}" /></span></li>
                                                                <li>Date mission  <span><fmt:formatDate pattern = "yyyy-MM-dd" value = "${post.missionDate}" /></span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <ul class="title-info">
                                                                <li>Heure publication<span><fmt:formatDate type = "time" value = "${post.publishDate}" /> </span></li>
                                                                <li>Heure mission  <span><fmt:formatDate type = "time" value = "${post.missionDate}" /></span></li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <a class="btn btn-primary" href="#" style="margin-bottom: 12px">Voir detail</a>
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
                <c:if test="${not empty paginationMax and paginationMax ne 0}">
                <div class="mx-auto">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="<%= ((String)request.getAttribute("currentUrl"))+1%>" tabindex="-1">Previous</a>
                            </li>
                            <% int cpt=1;%>
                            <c:forEach  var="t" begin="1" end="${paginationMax-1}">
                            <li class="page-item">
                                <a class="page-link" href="<%= ((String)request.getAttribute("currentUrl"))+(cpt+1)%>">
                                    <%=cpt++%>
                                </a>
                            </li>
                             </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="<%= ((String)request.getAttribute("currentUrl"))+2%>">Next</a>
                            </li>
                        </ul>
                    </nav>
                    
                </div>
                </c:if>
            </div>
        </div>
        <%@ include file="parts/footer.jsp" %>

    </body>

</html>
