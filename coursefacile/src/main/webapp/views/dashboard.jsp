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
	<!-- Preloader - style you can find in spinners.css -->
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50"> <circle
			class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2"
			stroke-miterlimit="10" /> </svg>
	</div>
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
					<li><a class="" href="<%= prefixPath %>/dashboard" aria-expanded="false"><i
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
					<li><a class="has-arrow  " href="#" aria-expanded="false"><i
							class="fa fa-wpforms"></i><span class="hide-menu">Profil </span></a>
						<ul aria-expanded="false" class="collapse">
							<li><a href="<%= prefixPath %>/profile">Modifier mon profil</a></li>
							<%
			                	User user = Util.getLoggedInUser(request);
			                	String imgUrl = user.getImage() == null ? prefixPath + "/images/people.png" : user.getImage();
			                %>
							<li><a href="<%= prefixPath %>/profile/<%= user.getId() %>">Voir mon profil public</a></li>
						</ul></li>
					<li class="nav-label">Argent </li>
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
					<h3 id="titre-dashboard" class="text-primary">Bonjour <%= user.getFullName() %></h3> 
					<div class="link-profil">
						<a class="link-profil" href="<%= prefixPath %>/profile"><i class="fa fa-check text-success"></i> Modifier votre profil</a>
						<br>
						<a class="link-profil" href="<%= prefixPath %>/profile/<%= user.getId() %>"><i class="fa fa-check text-success"></i> Voir votre profil public</a>
					</div>
				</div>
			</div>
			<!-- End Bread crumb -->
			<!-- Container fluid  -->
			<div class="container-fluid">
				<!-- Start Page Content -->
				<div class="row">
					<div class="col-md-3">
						<div class="card p-30">
							<div class="media">
								<div class="media-left meida media-middle">
									<span><i class="fa fa-usd f-s-40 color-primary"></i></span>
								</div>
								<div class="media-body media-text-right">
									<h2>568120</h2>
									<p class="m-b-0">Total Revenue</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card p-30">
							<div class="media">
								<div class="media-left meida media-middle">
									<span><i
										class="fa fa-shopping-cart f-s-40 color-success"></i></span>
								</div>
								<div class="media-body media-text-right">
									<h2>1178</h2>
									<p class="m-b-0">Sales</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card p-30">
							<div class="media">
								<div class="media-left meida media-middle">
									<span><i class="fa fa-archive f-s-40 color-warning"></i></span>
								</div>
								<div class="media-body media-text-right">
									<h2>25</h2>
									<p class="m-b-0">Stores</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card p-30">
							<div class="media">
								<div class="media-left meida media-middle">
									<span><i class="fa fa-user f-s-40 color-danger"></i></span>
								</div>
								<div class="media-body media-text-right">
									<h2>847</h2>
									<p class="m-b-0">Customer</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row bg-white m-l-0 m-r-0 box-shadow ">

					<!-- column -->
					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Extra Area Chart</h4>
								<div id="extra-area-chart"></div>
							</div>
						</div>
					</div>
					<!-- column -->

					<!-- column -->
					<div class="col-lg-4">
						<div class="card">
							<div class="card-body browser">
								<p class="f-w-600">
									iMacs <span class="pull-right">85%</span>
								</p>
								<div class="progress ">
									<div role="progressbar" style="width: 85%; height: 8px;"
										class="progress-bar bg-danger wow animated progress-animated">
										<span class="sr-only">60% Complete</span>
									</div>
								</div>

								<p class="m-t-30 f-w-600">
									iBooks<span class="pull-right">90%</span>
								</p>
								<div class="progress">
									<div role="progressbar" style="width: 90%; height: 8px;"
										class="progress-bar bg-info wow animated progress-animated">
										<span class="sr-only">60% Complete</span>
									</div>
								</div>

								<p class="m-t-30 f-w-600">
									iPhone<span class="pull-right">65%</span>
								</p>
								<div class="progress">
									<div role="progressbar" style="width: 65%; height: 8px;"
										class="progress-bar bg-success wow animated progress-animated">
										<span class="sr-only">60% Complete</span>
									</div>
								</div>

								<p class="m-t-30 f-w-600">
									Samsung<span class="pull-right">65%</span>
								</p>
								<div class="progress">
									<div role="progressbar" style="width: 65%; height: 8px;"
										class="progress-bar bg-warning wow animated progress-animated">
										<span class="sr-only">60% Complete</span>
									</div>
								</div>

								<p class="m-t-30 f-w-600">
									android<span class="pull-right">65%</span>
								</p>
								<div class="progress m-b-30">
									<div role="progressbar" style="width: 65%; height: 8px;"
										class="progress-bar bg-success wow animated progress-animated">
										<span class="sr-only">60% Complete</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- column -->
				</div>
				<div class="row">
					<div class="col-lg-3">
						<div class="card bg-dark">
							<div class="testimonial-widget-one p-17">
								<div class="testimonial-widget-one owl-carousel owl-theme">
									<div class="item">
										<div class="testimonial-content">
											<img class="testimonial-author-img" src="<%=prefixPath%>/images/avatar/2.jpg"
												alt="" />
											<div class="testimonial-author">John</div>
											<div class="testimonial-author-position">Founder-Ceo.
												Dell Corp</div>

											<div class="testimonial-text">
												<i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet,
												consectetur adipisicing elit, sed do eiusmod tempor
												incididunt ut labore et dolore magna aliqua. Ut enim ad
												minim veniam, quis nostrud exercitation . <i
													class="fa fa-quote-right"></i>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="testimonial-content">
											<img class="testimonial-author-img" src="<%=prefixPath%>/images/avatar/3.jpg"
												alt="" />
											<div class="testimonial-author">Abraham</div>
											<div class="testimonial-author-position">Founder-Ceo.
												Dell Corp</div>

											<div class="testimonial-text">
												<i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet,
												consectetur adipisicing elit, sed do eiusmod tempor
												incididunt ut labore et dolore magna aliqua. Ut enim ad
												minim veniam, quis nostrud exercitation . <i
													class="fa fa-quote-right"></i>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="testimonial-content">
											<img class="testimonial-author-img" src="<%=prefixPath%>/images/avatar/1.jpg"
												alt="" />
											<div class="testimonial-author">Lincoln</div>
											<div class="testimonial-author-position">Founder-Ceo.
												Dell Corp</div>

											<div class="testimonial-text">
												<i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet,
												consectetur adipisicing elit, sed do eiusmod tempor
												incididunt ut labore et dolore magna aliqua. Ut enim ad
												minim veniam, quis nostrud exercitation . <i
													class="fa fa-quote-right"></i>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="testimonial-content">
											<img class="testimonial-author-img" src="<%=prefixPath%>/images/avatar/4.jpg"
												alt="" />
											<div class="testimonial-author">TYRION LANNISTER</div>
											<div class="testimonial-author-position">Founder-Ceo.
												Dell Corp</div>

											<div class="testimonial-text">
												<i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet,
												consectetur adipisicing elit, sed do eiusmod tempor
												incididunt ut labore et dolore magna aliqua. Ut enim ad
												minim veniam, quis nostrud exercitation . <i
													class="fa fa-quote-right"></i>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="testimonial-content">
											<img class="testimonial-author-img" src="<%=prefixPath%>/images/avatar/5.jpg"
												alt="" />
											<div class="testimonial-author">TYRION LANNISTER</div>
											<div class="testimonial-author-position">Founder-Ceo.
												Dell Corp</div>

											<div class="testimonial-text">
												<i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet,
												consectetur adipisicing elit, sed do eiusmod tempor
												incididunt ut labore et dolore magna aliqua. Ut enim ad
												minim veniam, quis nostrud exercitation . <i
													class="fa fa-quote-right"></i>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="testimonial-content">
											<img class="testimonial-author-img" src="<%=prefixPath%>/images/avatar/6.jpg"
												alt="" />
											<div class="testimonial-author">TYRION LANNISTER</div>
											<div class="testimonial-author-position">Founder-Ceo.
												Dell Corp</div>

											<div class="testimonial-text">
												<i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet,
												consectetur adipisicing elit, sed do eiusmod tempor
												incididunt ut labore et dolore magna aliqua. Ut enim ad
												minim veniam, quis nostrud exercitation . <i
													class="fa fa-quote-right"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-9">
						<div class="card">
							<div class="card-title">
								<h4>Recent Orders</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Product</th>
												<th>quantity</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td>
													<div class="round-img">
														<a href=""><img src="<%=prefixPath%>/images/avatar/4.jpg" alt=""></a>
													</div>
												</td>
												<td>John Abraham</td>
												<td><span>iBook</span></td>
												<td><span>456 pcs</span></td>
												<td><span class="badge badge-success">Done</span></td>
											</tr>
											<tr>
												<td>
													<div class="round-img">
														<a href=""><img src="<%=prefixPath%>/images/avatar/2.jpg" alt=""></a>
													</div>
												</td>
												<td>John Abraham</td>
												<td><span>iPhone</span></td>
												<td><span>456 pcs</span></td>
												<td><span class="badge badge-success">Done</span></td>
											</tr>
											<tr>
												<td>
													<div class="round-img">
														<a href=""><img src="<%=prefixPath%>/images/avatar/3.jpg" alt=""></a>
													</div>
												</td>
												<td>John Abraham</td>
												<td><span>iMac</span></td>
												<td><span>456 pcs</span></td>
												<td><span class="badge badge-warning">Pending</span></td>
											</tr>
											<tr>
												<td>
													<div class="round-img">
														<a href=""><img src="<%=prefixPath%>/images/avatar/4.jpg" alt=""></a>
													</div>
												</td>
												<td>John Abraham</td>
												<td><span>iBook</span></td>
												<td><span>456 pcs</span></td>
												<td><span class="badge badge-success">Done</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-8">
						<div class="row">
							<div class="col-lg-6">
								<div class="card">
									<div class="card-title">
										<h4>Message</h4>
									</div>
									<div class="recent-comment">
										<div class="media">
											<div class="media-left">
												<a href="#"><img alt="..." src="<%=prefixPath%>/images/avatar/1.jpg"
													class="media-object"></a>
											</div>
											<div class="media-body">
												<h4 class="media-heading">john doe</h4>
												<p>Cras sit amet nibh libero, in gravida nulla.</p>
												<p class="comment-date">October 21, 2018</p>
											</div>
										</div>
										<div class="media">
											<div class="media-left">
												<a href="#"><img alt="..." src="<%=prefixPath%>/images/avatar/1.jpg"
													class="media-object"></a>
											</div>
											<div class="media-body">
												<h4 class="media-heading">john doe</h4>
												<p>Cras sit amet nibh libero, in gravida nulla.</p>
												<p class="comment-date">October 21, 2018</p>
											</div>
										</div>

										<div class="media">
											<div class="media-left">
												<a href="#"><img alt="..." src="<%=prefixPath%>/images/avatar/1.jpg"
													class="media-object"></a>
											</div>
											<div class="media-body">
												<h4 class="media-heading">john doe</h4>
												<p>Cras sit amet nibh libero, in gravida nulla.</p>
												<p class="comment-date">October 21, 2018</p>
											</div>
										</div>

										<div class="media no-border">
											<div class="media-left">
												<a href="#"><img alt="..." src="<%=prefixPath%>/images/avatar/1.jpg"
													class="media-object"></a>
											</div>
											<div class="media-body">
												<h4 class="media-heading">Mr. Michael</h4>
												<p>Cras sit amet nibh libero, in gravida nulla.</p>
												<div class="comment-date">October 21, 2018</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /# card -->
							</div>
							<!-- /# column -->
							<div class="col-lg-6">
								<div class="card">
									<div class="card-body">
										<div class="year-calendar"></div>
									</div>
								</div>
							</div>


						</div>
					</div>

					<div class="col-lg-4">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Todo</h4>
								<div class="card-content">
									<div class="todo-list">
										<div class="tdl-holder">
											<div class="tdl-content">
												<ul>
													<li><label> <input type="checkbox"><i
															class="bg-primary"></i><span>Build an angular app</span>
															<a href='#' class="ti-close"></a>
													</label></li>
													<li><label> <input type="checkbox" checked><i
															class="bg-success"></i><span>Creating component
																page</span> <a href='#' class="ti-close"></a>
													</label></li>
													<li><label> <input type="checkbox" checked><i
															class="bg-warning"></i><span>Follow back those who
																follow you</span> <a href='#' class="ti-close"></a>
													</label></li>
													<li><label> <input type="checkbox" checked><i
															class="bg-danger"></i><span>Design One page theme</span>
															<a href='#' class="ti-close"></a>
													</label></li>

													<li><label> <input type="checkbox" checked><i
															class="bg-success"></i><span>Creating component
																page</span> <a href='#' class="ti-close"></a>
													</label></li>
												</ul>
											</div>
											<input type="text" class="tdl-new form-control"
												placeholder="Type here">
										</div>
									</div>
								</div>
							</div>
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