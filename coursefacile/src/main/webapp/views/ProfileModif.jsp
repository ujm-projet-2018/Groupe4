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
    <!-- header header  -->
    <div class="header">
        <nav id="navbar"
             class="navbar top-navbar navbar-expand-md navbar-light">
            <div class="navbar-collapse">
                <!-- toggle and nav items -->
                <ul class="navbar-nav mr-auto mt-md-0">
                    <!-- This is  -->
                    <li class="nav-item"><a
                            class="nav-link nav-toggler hidden-md-up text-muted  "
                            href="javascript:void(0)"><i class="mdi mdi-menu"></i></a></li>
                    <!-- Messages -->
                    <li id="bouton-dropdown" class="nav-item dropdown mega-dropdown"><a
                            class="nav-link dropdown-toggle text-muted  " href="#"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
                            class="fa fa-th-large"></i></a>
                        <div class="dropdown-menu animated zoomIn">
                            <ul class="mega-dropdown-menu row">


                                <li class="col-lg-3  m-b-30">
                                    <h4 class="m-b-20">CONTACT US</h4> <!-- Contact -->
                                    <form>
                                        <div class="form-group">
                                            <input type="text" class="form-control"
                                                   id="exampleInputname1" placeholder="Enter Name">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control"
                                                   placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
											<textarea class="form-control" id="exampleTextarea" rows="3"
                                                      placeholder="Message"></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-info">Submit</button>
                                    </form>
                                </li>
                                <li class="col-lg-3 col-xlg-3 m-b-30">
                                    <h4 class="m-b-20">List style</h4> <!-- List style -->
                                    <ul class="list-style-none">
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                    </ul>
                                </li>
                                <li class="col-lg-3 col-xlg-3 m-b-30">
                                    <h4 class="m-b-20">List style</h4> <!-- List style -->
                                    <ul class="list-style-none">
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                    </ul>
                                </li>
                                <li class="col-lg-3 col-xlg-3 m-b-30">
                                    <h4 class="m-b-20">List style</h4> <!-- List style -->
                                    <ul class="list-style-none">
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                        <li><a href="javascript:void(0)"><i
                                                class="fa fa-check text-success"></i> This Is Another Link</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!-- End Messages -->
                </ul>
                <!-- User profile and search -->
                <ul id="message-notif" class="navbar-nav my-lg-0">

                    <!-- Comment -->
                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle text-muted text-muted  " href="#"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-bell"></i>
                        <div class="notify">
                            <span class="heartbit"></span> <span class="point"></span>
                        </div>
                    </a>
                        <div
                                class="dropdown-menu dropdown-menu-right mailbox animated zoomIn">
                            <ul>
                                <li>
                                    <div class="drop-title">Notifications</div>
                                </li>
                                <li>
                                    <div class="message-center">
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="btn btn-danger btn-circle m-r-10">
                                                <i class="fa fa-link"></i>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>This is title</h5>
                                                <span class="mail-desc">Just see the my new admin!</span> <span
                                                    class="time">9:30 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="btn btn-success btn-circle m-r-10">
                                                <i class="ti-calendar"></i>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>This is another title</h5>
                                                <span class="mail-desc">Just a reminder that you have
													event</span> <span class="time">9:10 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="btn btn-info btn-circle m-r-10">
                                                <i class="ti-settings"></i>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>This is title</h5>
                                                <span class="mail-desc">You can customize this
													template as you want</span> <span class="time">9:08 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="btn btn-primary btn-circle m-r-10">
                                                <i class="ti-user"></i>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>This is another title</h5>
                                                <span class="mail-desc">Just see the my admin!</span> <span
                                                    class="time">9:02 AM</span>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li><a class="nav-link text-center"
                                       href="javascript:void(0);"> <strong>Check all
                                    notifications</strong> <i class="fa fa-angle-right"></i>
                                </a></li>
                            </ul>
                        </div>
                    </li>
                    <!-- End Comment -->
                    <!-- Messages -->
                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle text-muted  " href="#" id="2"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-envelope"></i>
                        <div class="notify">
                            <span class="heartbit"></span> <span class="point"></span>
                        </div>
                    </a>
                        <div
                                class="dropdown-menu dropdown-menu-right mailbox animated zoomIn"
                                aria-labelledby="2">
                            <ul>
                                <li>
                                    <div class="drop-title">You have 4 new messages</div>
                                </li>
                                <li>
                                    <div class="message-center">
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img">
                                                <img src="<%=prefixPath%>/images/users/5.jpg" alt="user"
                                                     class="img-circle"> <span
                                                    class="profile-status online pull-right"></span>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>Michael Qin</h5>
                                                <span class="mail-desc">Just see the my admin!</span> <span
                                                    class="time">9:30 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img">
                                                <img src="<%=prefixPath%>/images/users/2.jpg" alt="user"
                                                     class="img-circle"> <span
                                                    class="profile-status busy pull-right"></span>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>John Doe</h5>
                                                <span class="mail-desc">I've sung a song! See you at</span>
                                                <span class="time">9:10 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img">
                                                <img src="<%=prefixPath%>/images/users/3.jpg" alt="user"
                                                     class="img-circle"> <span
                                                    class="profile-status away pull-right"></span>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>Mr. John</h5>
                                                <span class="mail-desc">I am a singer!</span> <span
                                                    class="time">9:08 AM</span>
                                            </div>
                                        </a>
                                        <!-- Message -->
                                        <a href="#">
                                            <div class="user-img">
                                                <img src="<%=prefixPath%>/images/users/4.jpg" alt="user"
                                                     class="img-circle"> <span
                                                    class="profile-status offline pull-right"></span>
                                            </div>
                                            <div class="mail-contnet">
                                                <h5>Michael Qin</h5>
                                                <span class="mail-desc">Just see the my admin!</span> <span
                                                    class="time">9:02 AM</span>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                                <li><a class="nav-link text-center"
                                       href="javascript:void(0);"> <strong>See all
                                    e-Mails</strong> <i class="fa fa-angle-right"></i>
                                </a></li>
                            </ul>
                        </div>
                    </li>
                    <!-- End Messages -->
                </ul>
            </div>
        </nav>
    </div>
    <!-- End header header -->
    <!-- Left Sidebar  -->
    <div id="sidebar-gauche" class="left-sidebar">
        <!-- Sidebar scroll-->
        <div class="scroll-sidebar">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li class="nav-devider"></li>
                    <li class="nav-label"></li>
                    <li><a class="" href="<%=prefixPath%>/dashboard"
                           aria-expanded="false"><i id="icone" class="fa fa-tachometer"></i><span
                            class="hide-menu">Tableau de bord </span></a></li>
                    <li class="nav-label">Missions</li>
                    <li><a class="" href="#" aria-expanded="false"><i
                            id="icone" class="fa fa-suitcase"></i><span class="hide-menu">Mes
								missions </span></a></li>
                    <li><a class="" href="#" aria-expanded="false"><i
                            id="icone" class="fa fa-cart-arrow-down"></i><span
                            class="hide-menu">Mes réservations </span></a></li>
                    <li class="nav-label">Mon compte</li>
                    <li><a class=" " href="#" aria-expanded="false"><i
                            id="icone" class="fa fa-envelope"></i><span class="hide-menu">Messages
                    </a></li>
                    <li><a class="" href="#" aria-expanded="false"><i
                            id="icone" class="fa fa-bell-o"></i><span class="hide-menu">Alertes
						</span></a></li>
                    <li><a class="has-arrow " href="#" aria-expanded="true"><i
                            id="icone" class="fa fa-wpforms"></i><span class="hide-menu">Profil
						</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="<%=prefixPath%>/profile">Modifier mon
                                profil</a></li>
                            <%
                                User user = UserHandler.getLoggedInUser(request);
                                String imgUrl = user.getImage() == null ? prefixPath + "/images/people.png" : user.getImage();
                            %>
                            <li><a href="<%=prefixPath%>/profile/<%=user.getId()%>">Voir
                                mon profil public</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">Argent</li>
                    <li><a class="" href="#" aria-expanded="false"><i
                            id="icone" class="fa fa-euro"></i><span class="hide-menu">Argent
								disponnible </span></a></li>
                    <li><a class="" href="#" aria-expanded="false"><i
                            id="icone" class="fa fa-credit-card"></i><span class="hide-menu">Paiements
								effectués</span></a></li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->
        </div>
        <!-- End Sidebar scroll-->
    </div>
    <!-- End Left Sidebar  -->
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
                                    <div class="avatar">
                                        <img src="<%=imgUrl%>" alt="Profile picture "/>
                                    </div>
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
                                <form action="<%= prefixPath%>/profile" id="profile-form" method="post"
                                      class="form-horizontal form-material">

                                    <c:choose>
                                        <c:when test="${not empty user.lname }">
                                            <div class="form-group">
                                                <label for="lname" class="col-md-12"> Nom </label>
                                                <div class="col-md-12">
                                                    <input id="lname" type="text" placeholder="Nom..." name="lname"
                                                           class="form-control form-control-line"
                                                           value="${user.lname}">
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${empty user.lname }">
                                            <div>
                                                <div class="form-group">
                                                    <label for="lname" class="col-md-12"> Nom </label>
                                                    <div class="col-md-12">
                                                        <input id="lname" type="text" placeholder="Nom..." name="lname"
                                                               class="form-control form-control-line"
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
                                                    <input id="fname" type="text" placeholder="Prenom..." name="fname"
                                                           class="form-control form-control-line"
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
                                                               name="fname"
                                                               class="form-control form-control-line"
                                                               value="${user.fname}">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>


                                    </c:choose>


                                    <c:choose>
                                        <c:when test="${not empty user.birthDate}">

                                            <div class="form-group">
                                                <label class="col-md-12" for="date">Date de naissance</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder="JJ/MM/AAAA"
                                                           name="birthDate" id="date"
                                                           class="form-control form-control-line"
                                                           value="<fmt:formatDate pattern="dd/MM/yyyy"
                                                                       value="${user.birthDate}"/>">
                                                </div>
                                            </div>

                                        </c:when>
                                        <c:when test="${empty user.birthDate}">
                                            <div>
                                                <div class="form-group">
                                                    <label class="col-md-12" for="date">Date de naissance</label>
                                                    <div class="col-md-12">
                                                        <input type="text" placeholder="JJ/MM/AAAA"
                                                               name="birthDate" id="date"
                                                               class="form-control form-control-line"
                                                               value="<fmt:formatDate pattern="dd/MM/yyyy"
                                                                       value="${user.birthDate}"/>">
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
                                                <label for="password" class="col-md-12">Mot de passe</label>
                                                <div class="col-md-12">
                                                    <input id="password" type="password" name="password"
                                                           class="form-control form-control-line">
                                                </div>
                                            </div>

                                        </c:when>
                                        <c:when test="${empty user.password}">
                                            <div>
                                                <div class="form-group">
                                                    <label for="password" class="col-md-12">Mot de passe</label>
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
                                                          class="form-control form-control-line" rows="5" id="address"
                                                          placeholder="Saisissez votre adresse ">${user.address}</textarea>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <input type="hidden" id="check-submit" name="checkSubmit" value="checked">
                                            <input type="submit" id="confirm" value="Mettre à jour"/>
                                        </div>
                                    </div>
                                </form>
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