<%--
  -- @author walid
  --
  --
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="parts/meta.jsp"%>
<title>Mes réservations | Courses faciles</title>
<%@ include file="parts/styles.jsp"%>
</head>

<body class="fix-header fix-sidebar">
	<%@include file="parts/header.jsp"%>
	<!-- Main wrapper  -->
	<div id="main-wrapper">
		<%@include file="parts/notification_message.jsp"%>
		<%
			User user = UserHandler.getLoggedInUser(request);
			String imgUrl = user.getImage() == null ? prefixPath + "/images/people.png" : user.getImage();
		%>
		<!-- End header header -->

		<!-- Page wrapper  -->
		<div id="body-dashboard" class="page-wrapper">

			<!-- Sidebar -->
			<%@ include file="parts/sidebar_dashboard.jsp"%>

			<!-- Container fluid  -->
            <div class="container-fluid">
				<div class="row">
					<div class="grid_list_product st2">
						<ul class="products" id="able-list">
							<c:forEach items="${Lmissions}" var="post">
								<li style="display: block;"
									class="span12 first house offices Residential">
									<div class="product-item">
                                        <div class="row mg-top-20">
                                            <div class="col-md-offset-1 col-md-2">
												<div class="imagewrapper">
													<c:set var="image" value="/coursefacile/images/people.png"></c:set>
													<c:if test="${not empty post.owner.image}">
														<c:set var="image" value="${ post.owner.image}"></c:set>
													</c:if>
													<a href="/coursefacile/profile/${post.owner.id}"><img
														alt="" class="img-circle" width="140px" height="140px"
														style="border-radius: 50%; vertical-align: middle; margin-top: 14px"
														src="${image}"></a> <span class="price" id="prix">${post.price}
														€</span>
												</div>
											</div>
                                            <div class="col-md-8">
												<div class="list-right-info">
													<h3>${post.name}</h3>
                                                    <p class="text-justify">${post.description}</p>
													<div class="row">
														<div class="col-md-3">
															<ul class="title-info">
                                                                <li>Ville: <span> ${post.city.name}</span>
																</li>
                                                                <li>Destination: <span>${post.destination}</span></li>
															</ul>
														</div>
														<div class="col-md-4">
															<ul class="title-info">
                                                                <li>Date réservation: <span><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${post.reservationDate}" /></span></li>
                                                                <li>Date mission: <span><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${post.missionDate}" /></span></li>
															</ul>
														</div>
														<div class="col-md-4">
															<ul class="title-info">
                                                                <li>Heure réservation: <span><fmt:formatDate
                                                                        pattern="HH:mm"
                                                                        type="time" value="${post.reservationDate}" /> </span></li>
                                                                <li>Heure mission: <span><fmt:formatDate
                                                                        pattern="HH:mm" type="time"
                                                                        value="${post.missionDate}"/></span></li>
															</ul>
														</div>
														<div class="col-md-2">
															<a class="btn btn-primary" id="bouton_mes_missions"
																href="<%=prefixPath%>/reservation/${post.id}"
																style="margin-bottom: 12px">Voir détails</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</li>
								<br>
							</c:forEach>
						</ul>
					</div>
				</div>
				<c:if test="${not empty paginationMax and paginationMax ne 0}">
					<div class="mx-auto">
						<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link"
								href="<%=((String) request.getAttribute("currentUrl")) + 1%>"
								tabindex="-1">Previous</a></li>
							<%
								int cpt = 1;
							%>
							<c:forEach var="t" begin="1" end="${paginationMax-1}">
								<li class="page-item"><a class="page-link"
									href="<%=((String) request.getAttribute("currentUrl")) + (cpt + 1)%>">
										<%=cpt++%>
								</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="<%=((String) request.getAttribute("currentUrl")) + 2%>">Next</a>
							</li>
						</ul>
						</nav>

					</div>
				</c:if>
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