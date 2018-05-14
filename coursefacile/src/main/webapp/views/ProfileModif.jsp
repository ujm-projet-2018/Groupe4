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
    <title>Profil | Courses faciles</title>
    <%@ include file="parts/styles.jsp" %>
</head>

<body class="fix-header fix-sidebar">
<%@include file="parts/header.jsp" %>
<!-- Preloader - style you can find in spinners.css -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle
                class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2"
                stroke-miterlimit="10"/>
    </svg>
</div>
<!-- Main wrapper  -->
<div id="main-wrapper">
    <%@include file="parts/notification_message.jsp" %>
    <%
        User user = UserHandler.getLoggedInUser(request);
        String imgUrl = user.getImage() == null ? prefixPath + "/images/people.png" : prefixPath + user.getImage();
    %>
    <!-- End header header -->

    <!-- Sidebar -->
    <%@ include file="parts/sidebar_dashboard.jsp" %>

    <!-- Page wrapper  -->
    <div id="body-dashboard" class="page-wrapper">
        <div class="container-fluid">
            <!-- Start Page Content -->
            <div class="row">
                <!-- Column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-two">
                                <header>
                                    <form id="form-edit-profile-photo"
                                          action="<%= prefixPath%>/dashboard/profile/upload-photo" method="post"
                                          enctype="multipart/form-data">
                                        <div class="avatar">
										<span><label class="ace-file-input ace-file-multiple"
                                                     style="width: 100%;">
                                            <input type="file" id="avatar-profile"
                                                   name="avatar"> <span
                                                class="ace-file-container">
													<img src="<%=imgUrl%>" id="profile-photo" alt="Profile picture "/>
											</span>
										</label> </span>
                                        </div>
                                    </form>
                                </header>

                                <h3>${user.lname} ${user.fname}</h3>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Column -->
                <!-- Column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="tab-pane" id="settings" role="tabpanel">
                            <div class="card-body">
                                <form action="" id="profile-form"
                                      method="post" class="form-horizontal form-material">

                                    <c:choose>
                                        <c:when test="${not empty user.lname }">
                                            <div class="form-group">
                                                <label for="lname" class="col-md-12"> Nom </label>
                                                <div class="col-md-12">
                                                    <input id="lname" type="text" placeholder="Nom..."
                                                           name="lname" class="form-control form-control-line"
                                                           value="${user.lname}">
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${empty user.lname }">
                                            <div>
                                                <div class="form-group">
                                                    <label for="lname" class="col-md-12"> Nom </label>
                                                    <div class="col-md-12">
                                                        <input id="lname" type="text" placeholder="Nom..."
                                                               name="lname" class="form-control form-control-line"
                                                               value="${user.lname}">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>


                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${not empty user.fname }">
                                            <div class="form-group">
                                                <label for="fname" class="col-md-12">Prénom</label>
                                                <div class="col-md-12">
                                                    <input id="fname" type="text" placeholder="Prenom..."
                                                           name="fname" class="form-control form-control-line"
                                                           value="${user.fname}">
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${empty user.fname }">
                                            <div>
                                                <div class="form-group">
                                                    <label for="fname" class="col-md-12">Prénom</label>
                                                    <div class="col-md-12">
                                                        <input id="fname" type="text" placeholder="Prenom..."
                                                               name="fname" class="form-control form-control-line"
                                                               value="${user.fname}">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>


                                    </c:choose>


                                    <c:choose>
                                        <c:when test="${not empty user.birthDate}">

                                            <div class="form-group">
                                                <label class="col-md-12" for="date">Date de
                                                    naissance</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="JJ/MM/AAAA"
                                                           name="birthDate" id="date"
                                                           class="form-control form-control-line"
                                                           value="${user.birthDate}">
                                                </div>
                                            </div>

                                        </c:when>
                                        <c:when test="${empty user.birthDate}">
                                            <div>
                                                <div class="form-group">
                                                    <label class="col-md-12" for="date">Date de
                                                        naissance</label>
                                                    <div class="col-md-12">
                                                        <input type="text" placeholder="JJ/MM/AAAA"
                                                               name="birthDate" id="date"
                                                               class="form-control form-control-line"
                                                               value="${user.birthDate}">
                                                    </div>
                                                </div>


                                            </div>
                                        </c:when>


                                    </c:choose>


                                    <div class="form-group">
                                        <label class="col-md-12">Date d'enregistrement</label>
                                        <div class="col-md-12">
                                            <input readonly type="text" name="registerDate"
                                                   class="form-control form-control-line"
                                                   value="${user.registerDate}">
                                        </div>
                                    </div>


                                    <c:choose>
                                        <c:when test="${not empty user.email}">

                                            <div class="form-group">
                                                <label for="email" class="col-md-12">Email</label>
                                                <div class="col-md-12">
                                                    <input type="email" placeholder="Email"
                                                           class="form-control form-control-line" name="email"
                                                           id="email" value="${user.email}">
                                                </div>
                                            </div>

                                        </c:when>
                                        <c:when test="${empty user.email}">
                                            <div>
                                                <div class="form-group">
                                                    <label for="email" class="col-md-12">Email</label>
                                                    <div class="col-md-12">
                                                        <input type="email" placeholder="Email"
                                                               class="form-control form-control-line" name="email"
                                                               id="email" value="${user.email}">
                                                    </div>
                                                </div>


                                            </div>
                                        </c:when>


                                    </c:choose>


                                    <c:choose>
                                        <c:when test="${not empty user.password}">

                                            <div class="form-group">
                                                <label for="password" class="col-md-12">Mot de
                                                    passe</label>
                                                <div class="col-md-12">
                                                    <input id="password" type="password" name="password"
                                                           class="form-control form-control-line">
                                                </div>
                                            </div>

                                        </c:when>
                                        <c:when test="${empty user.password}">
                                            <div>
                                                <div class="form-group">
                                                    <label for="password" class="col-md-12">Mot de
                                                        passe</label>
                                                    <div class="col-md-12">
                                                        <input id="password" type="password" name="password"
                                                               class="form-control form-control-line">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>


                                    </c:choose>


                                    <c:choose>
                                        <c:when test="${not empty user.telephone}">

                                            <div class="form-group">
                                                <label class="col-md-12">Téléphone</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="+33 X XX XX XX XX"
                                                           name="telephone" class="form-control form-control-line"
                                                           value="${user.telephone}">
                                                </div>
                                            </div>

                                        </c:when>
                                        <c:when test="${empty user.telephone}">
                                            <div>

                                                <div class="form-group">
                                                    <label class="col-md-12">Téléphone</label>
                                                    <div class="col-md-12">
                                                        <input type="text" placeholder="+33 X XX XX XX XX"
                                                               name="telephone" class="form-control form-control-line"
                                                               value="${user.telephone}">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>


                                    </c:choose>
                                    <div class="form-group">
                                        <label class="col-md-12">Description</label>
                                        <div class="col-md-12">
												<textarea name="description" style="resize: none"
                                                          class="form-control form-control-line" rows="5"
                                                          id="description" name="description"
                                                          placeholder="Que faites-vous dans votre temps libre ? D'où faites-vous les courses le plus souvent ? ">${user.description}</textarea>

                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-md-12">Adresse</label>
                                        <div class="col-md-12">
												<textarea name="address" style="resize: none"
                                                          class="form-control form-control-line" rows="5"
                                                          id="address"
                                                          placeholder="Saisissez votre adresse ">${user.address}</textarea>

                                        </div>
                                    </div>
                                    <input type="hidden" id="check-submit" name="checkSubmit"
                                           value="checked">
                                </form>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <button class="btn btn-primary" data-toggle="modal"
                                                data-target="#confirm-update">Mettre à jour
                                        </button>
                                        <!-- Button trigger modal -->


                                        <!-- Modal -->
                                        <div class="modal fade" id="confirm-update" tabindex="-1" role="dialog">
                                            <div class="modal-dialog modal-sm" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close"><span
                                                                aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">Entrez votre mot de passe actuel</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="password" placeholder="votre mot de passe actuel"
                                                               class="form-control" id="pwd-confirm">
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger"
                                                                data-dismiss="modal">Annuler
                                                        </button>
                                                        <button type="button" id="confirm" class="btn btn-success">
                                                            Confirmer
                                                        </button>
                                                    </div>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-di-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Column -->
            </div>

            <!-- End PAge Content -->
        </div>
        <!-- End Container fluid  -->
        <!-- End footer -->
    </div>
    <!-- End Page wrapper  -->
</div>


<%@ include file="parts/footer.jsp" %>
</body>
</html>