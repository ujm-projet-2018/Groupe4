<%--
  -- @author walid
  --
  --
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <%@ include file="parts/meta.jsp" %>
    <title>Profil public | Courses faciles</title>
    <%@ include file="parts/styles.jsp" %>
</head>

<body class="fix-header fix-sidebar">
<%@include file="parts/header.jsp" %>

<!-- Main wrapper  -->
<div class="public-profile-header">
    <div class="header-overlay"></div>

    <div class="container-fluid">
        <div class="row">

            <div class="col-md-12 text-center">
                <c:set var="imgUrl" value="/coursefacile/images/people.png"></c:set>
                <c:if test="${not empty user2.image}">
                    <c:set var="imgUrl" value="${user2.image}"></c:set>
                </c:if>
                <img src="${imgUrl}" name="aboutme" width="140" height="140" class="img-circle"/>
                <div class="lead color-white">${user2.lname} ${user2.fname}
                </div>


            </div>
        </div>
        <div class="row">

            <div class="col-sm-offset-3 col-sm-6 text-center">
                <c:if test="${user.id eq user2.id}">
                    <a class="btn btn-primary" href="#">Envoyer un message</a>
                </c:if>
                <c:if test="${user.id ne user2.id}">
                    <a class="btn btn-primary" href="<%= prefixPath %>/dashboard/send-messages/${user2.id}">Envoyer un
                        message</a>
                </c:if>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <div class="progress-bar-profil-punlic">
                <h3 class="text-primary text-center">Niveau
                    d'expérience</h3>
                <ul class="progressbar">
                    <li <c:if test="${score ge 0}">class="activated"</c:if>>Débutant</li>
                    <li <c:if test="${score ge 2}">class="activated"</c:if>>Habitué</li>
                    <li <c:if test="${score ge 3}">class="activated"</c:if>>Confirmé</li>
                    <li <c:if test="${score ge 4}">class="activated"</c:if>>Expert</li>
                </ul>
            </div>

        </div>
    </div>

</div>
<div class="container well public-profile-body">
    <!-- Start Page Content -->


    <div class="row">
        <div class="col-md-6">
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-4 control-label">Email Verifié</label>
                    <div class="col-sm-6">
                        <c:if test="${user2.emailChecked eq true}">
                            <p class="form-control-static"><span class="glyphicon glyphicon-ok"></span></p>
                        </c:if>
                        <c:if test="${user2.emailChecked ne true}">
                            <p class="form-control-static"><span class="glyphicon glyphicon-remove"></span></p>
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Téléphone</label>
                    <div class="col-sm-8">
                        <c:if test="${not empty user2.telephone}">
                            <p class="form-control-static">${user2.telephone}</p>
                        </c:if>
                        <c:if test="${empty user2.telephone}">
                            <p class="form-control-static">Non fournie</p>
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Adresse</label>
                    <div class="col-sm-8">
                        <c:if test="${not empty user2.address}">
                            <p class="form-control-static">${user2.address}</p>
                        </c:if>
                        <c:if test="${empty user2.address}">
                            <p class="form-control-static">Non fournie</p>
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Date d'enregistrement</label>
                    <div class="col-sm-8">

                        <p class="form-control-static"><fmt:formatDate pattern="dd/MM/yyyy"
                                                                       value="${user2.registerDate}"/></p>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-6">
            <form class="form-horizontal">
                <c:if test="${not empty age}">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Age</label>
                        <div class="col-sm-10">
                            <p class="form-control-static">${age} ans</p>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user2.description}</p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


</body>

<%@ include file="parts/footer.jsp" %>