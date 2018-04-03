<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.coursefacile.dao.*" %>
<%@page import="com.coursefacile.controller.*" %>
<%@page import="com.coursefacile.model.*" %>


<!DOCTYPE html>
<html>

<head>

    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="alaouiib">
    <!-- Bootstrap Core CSS -->
    <%--<link href="ElaAdmin-master/css/lib/bootstrap/bootstrap.min.css" rel="stylesheet">--%>
    <%--<!-- Custom CSS -->--%>
    <%--<link href="ElaAdmin-master/css/helper.css" rel="stylesheet">--%>
    <%--<link href="ElaAdmin-master/css/style.css" rel="stylesheet">--%>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:** -->

    <%@ include file="parts/meta.jsp" %>
    <title>Course faciles | Profil</title>
    <%@ include file="parts/styles.jsp" %>
</head>

<body class="fix-header fix-sidebar">
<%@ include file="parts/header.jsp" %>

<div class="page-wrapper">

    <div class="container-fluid">
        <!-- Start Page Content -->
        <div class="row">
            <!-- Column -->
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-two">
                            <header>
                                <div class="avatar">
                                    <img src="${user.image}" alt="Allison Walker"/>
                                </div>
                            </header>

                            <h3>${user.fname} ${user.lname} </h3>
                            <div class="desc">
                                ${user.description} </div>
                            <div class="contacts">
                                <a href=""><i class="fa fa-plus"></i></a>

                                <a href=""><i class="fa fa-whatsapp"></i></a>

                                <a href=""><i class="fa fa-envelope"></i></a>


                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Column -->
            <!-- Column -->
            <div class="col-lg-12">
                <div class="card">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs profile-tab" role="tablist">

                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#settings" role="tab"
                        >Settings</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="home" role="tabpanel">


                            <div class="tab-pane" id="settings" role="tabpanel">
                                <div class="card-body">
                                    <% Util.showGlobalAlerts();%>

                                    <form action="profile" method="post" class="form-horizontal form-material">
                                        <div class="form-group">
                                            <label class="col-md-12"> Nom </label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="Nom..." name="lname"
                                                       class="form-control form-control-line">
                                            </div>
                                        </div>


                                        <c:choose>
                                            <c:when test="${not empty user.fname }">
                                                <div class="form-group">
                                                    <label class="col-md-12">Prenom</label>
                                                    <div class="col-md-12">
                                                        <input type="text" placeholder="Prenom..." name="fname"
                                                               class="form-control form-control-line">
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${empty user.fname }">
                                                <div>
                                                    <div class="form-group">
                                                        <label class="col-md-12">Prenom</label>
                                                        <div class="col-md-12">
                                                            <input type="text" placeholder="Prenom..." name="fname"
                                                                   class="form-control form-control-line">
                                                        </div>
                                                    </div>
                                                    <span
                                                            class="glyphicon glyphicon-remove  form-control-feedback"></span>
                                                    <h1>veuillez entrer votre prenom</h1>
                                                </div>
                                            </c:when>


                                        </c:choose>


                                        <div class="form-group">
                                            <label class="col-md-12">Date de naissance</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="birthDate..." name="birthDate"
                                                       class="form-control form-control-line" value="${user.birthDate}">
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-md-12">date d'enregistrement</label>
                                            <div class="col-md-12">
                                                <input readonly type="text" name="registerDate"
                                                       class="form-control form-control-line"
                                                       value="${user.registerDate}">
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label for="email" class="col-md-12">Email</label>
                                            <div class="col-md-12">
                                                <input type="email" placeholder="Email..."
                                                       class="form-control form-control-line" name="email" id="email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Password</label>
                                            <div class="col-md-12">
                                                <input type="password" value="password" name="password"
                                                       class="form-control form-control-line">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Telephone</label>
                                            <div class="col-md-12">
                                                <input type="text" placeholder="Telephone No.." name="telephone"
                                                       class="form-control form-control-line">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12">Description:</label>
                                            <div class="col-md-12">
                                                <textarea style="resize: none" class="form-control form-control-line"
                                                          rows="5" id="description" name="description"
                                                          placeholder=" Que faites-vous dans votre temps libre ? D'où faite-vous les courses le plus souvent ? ">${user.description}</textarea>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-5 col-xs-6 tital ">
                                                <div class="well well-sm">
                                                    <label for="address"><p>J'habite à:</p></label>

                                                    <textarea style="resize: none" class="form-control" rows="5"
                                                              id="address" name="address"
                                                              placeholder="12 rue dr ezePuel saint etienne">${user.address}</textarea>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button class="btn btn-success">Update Profile</button>
                                                </div>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Column -->

                <!-- End PAge Content -->
            </div>
            <!-- End Container fluid  -->


        </div>

        <!-- End Wrapper -->
        <!-- All Jquery -->
        <script src="ElaAdmin-master/js/lib/jquery/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="ElaAdmin-master/js/lib/bootstrap/js/popper.min.js"></script>
        <script src="ElaAdmin-master/js/lib/bootstrap/js/bootstrap.min.js"></script>
        <!-- slimscrollbar scrollbar JavaScript -->
        <script src="ElaAdmin-master/js/jquery.slimscroll.js"></script>
        <!--Menu sidebar -->
        <script src="ElaAdmin-master/js/sidebarmenu.js"></script>
        <!--stickey kit -->
        <script src="ElaAdmin-master/js/lib/sticky-kit-master/dist/sticky-kit.min.js"></script>
        <!--Custom JavaScript -->
        <script src="ElaAdmin-master/js/custom.min.js"></script>
        <!--[if lt IE 9]>
        <script src="https:**oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https:**oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</body>


</html>