<%--
  -- @author walid
  --
  --
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.coursefacile.dao.*" %>
<%@page import="com.coursefacile.controller.*" %>
<%@page import="com.coursefacile.model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="parts/meta.jsp"%>
<title>Tableau de bord | Courses faciles</title>
<%@ include file="parts/styles.jsp"%>
</head>

<body class="fix-header fix-sidebar">
	<%@include file="parts/header.jsp"%>
	<!-- Main wrapper  -->
	<div id="main-wrapper">
		<!-- header header  -->
		<div class="header">
			<nav id="navbar" class="navbar top-navbar navbar-expand-md navbar-light">
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
						</div></li>
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
						</div></li>
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
												<img src="<%=prefixPath%>/images/users/5.jpg" alt="user" class="img-circle">
												<span class="profile-status online pull-right"></span>
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
												<img src="<%=prefixPath%>/images/users/2.jpg" alt="user" class="img-circle">
												<span class="profile-status busy pull-right"></span>
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
												<img src="<%=prefixPath%>/images/users/3.jpg" alt="user" class="img-circle">
												<span class="profile-status away pull-right"></span>
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
												<img src="<%=prefixPath%>/images/users/4.jpg" alt="user" class="img-circle">
												<span class="profile-status offline pull-right"></span>
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
						</div></li>
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
					<li><a class="active" href="<%= prefixPath %>/dashboard" aria-expanded="false"><i
							class="fa fa-tachometer"></i><span class="hide-menu">Tableau de bord
						</span></a>
					</li>
					<li class="nav-label">Missions</li>
					<li><a class="" href="#" aria-expanded="false"><i
							class="fa fa-suitcase"></i><span class="hide-menu">Mes missions </span></a>
					</li>
					<li><a class="" href="#" aria-expanded="false"><i
							class="fa fa-cart-arrow-down"></i><span class="hide-menu">Mes réservations </span></a>
					</li>
					<li class="nav-label">Mon compte</li>
					<li><a class=" " href="#" aria-expanded="false"><i
							class="fa fa-envelope"></i><span class="hide-menu">Messages </a>
					</li>
					<li><a class="" href="#" aria-expanded="false"><i
							class="fa fa-bell-o"></i><span class="hide-menu">Alertes
						</span></a>
					</li>
							<%
								User user = UserHandler.getLoggedInUser(request);
								String imgUrl = user.getImage() == null ? prefixPath + "/images/people.png" : user.getImage();
							%>
					<li><a class="has-arrow " href="#" aria-expanded="false"><i
							id="icone" class="fa fa-wpforms"></i><span class="hide-menu">Profil
						</span></a>
						<ul aria-expanded="false" class="collapse">
							<li><a href="<%=prefixPath%>/profile">Modifier mon
								profil</a></li>
							<li><a href="<%=prefixPath%>/profile/<%=user.getId()%>">Voir
								mon profil public</a></li>
						</ul>
					</li>
					<li class="nav-label">Argent</li>
					<li><a class="" href="#" aria-expanded="false"><i
							class="fa fa-euro"></i><span class="hide-menu">Argent disponnible 
							</span></a>
					</li>
					<li><a class="" href="#" aria-expanded="false"><i
							class="fa fa-credit-card"></i><span class="hide-menu">Paiements effectués</span></a>
					</li>
				</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</div>
		<!-- End Left Sidebar  -->
		<!-- Page wrapper  -->
		<div id="body-dashboard" class="page-wrapper">
			<!-- Bread crumb -->
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<img id="image-dashboard" class="nav-user-photo" src="<%= imgUrl%>" alt="<%= user.getFullName() %>">
					<h3 id="titre-dashboard" class="text-primary">Bonjour <%= user.getFullName() %>
					</h3>
					<div class="link-profil">
						<a class="link-profil" href="<%= prefixPath %>/profile"><i class="fa fa-check text-success"></i>
							Modifier votre profil</a>
						<br>
						<a class="link-profil" href="<%= prefixPath %>/profile/<%= user.getId() %>"><i
								class="fa fa-check text-success"></i> Voir votre profil public</a>
					</div>
					
					<div class="progbar">
						<h3 id="titre-progbar" class="text-primary">Votre niveau d'expérience</h3>
					      <ul class="progressbar">
					          <li class="activated">Débutant</li>
					          <li>Habitué</li>
					          <li>Confirmé</li>
					          <li>Expert</li>
					  	</ul>
					</div>
					
				</div>
			</div>
			<!-- End Bread crumb -->
			<!-- Container fluid  -->
			

			<div class="conteneur">
			
			<div id="verifications">
				<h3>Informations sur votre compte</h3>
				<div id="infos">
					<h4>Vérifications</h4>
					<ul>
						<li><i class="fa fa-check-circle-o"></i> E-mail vérifié </li>
						<li><i class="fa fa-check-circle-o"></i> Téléphone vérifié </li>
					</ul>
					<hr><br>
					<h4 id="activite">Activité</h4>
					<p>Membre depuis : ${user.registerDate}</p>
				</div>
			</div>
			
			</div>
				





				<!-- End PAge Content -->
			</div>
			<!-- End Container fluid  -->
			<!-- footer -->
			<!-- 
			<footer class="footer"> © 2018 All rights reserved. Template
			designed by <a href="https://colorlib.com">Colorlib</a></footer>
			 -->
			<!-- End footer -->
		</div>
		<!-- End Page wrapper  -->
	</div>
	<!-- End Wrapper -->
	<!-- All Jquery -->

</body>

<%@ include file="parts/footer.jsp"%>