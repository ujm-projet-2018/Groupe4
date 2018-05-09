<%--
  -- @author walid
  --
  --
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="fr">
<head>

<%@ include file="parts/meta.jsp"%>
<title>Details réservation | Courses Faciles</title>
<%@ include file="parts/styles.jsp"%>

</head>
<body>
	<%@include file="parts/header.jsp"%>
	<div class="banner-header detail-mission-bg no-mg"
		id="details_reservation">
		<div class="header-overlay"></div>
		<div class="row">
			<div class="col-md-12 text-center">
				<h2 class="title">${mission.name}</h2>
			</div>
		</div>

	</div>
	<div class="main-content">
		<div class="properties">
			<div class="container">
				<div class="grid_full_width gird_sidebar">
					<div class="row">

						<!-- Main content -->
						<div class="col-md-8">
							<!-- Property detail -->
							<div class="property_detail">
								<div class="infotext-detail pad-20">
									Rémunération: <span class="price">${mission.price} €</span>
									<div class="row">
										<div class="col-md-6">
											<ul class="title-info">
												<li>Ville <span>${mission.city.name}</span></li>
												<li>Destination <span>${mission.destination}</span></li>
												<li>Date de la mission <span> <fmt:formatDate
															pattern="dd/MM/yyyy   HH:mm:ss"
															value="${mission.missionDate}" /></span></li>
											</ul>
										</div>
										<div class="col-md-6">
											<ul class="title-info">
												<li>Date de publication <span> <fmt:formatDate
															pattern="dd/MM/yyyy   HH:mm:ss"
															value="${mission.publishDate}" /></span></li>
												<li>Date de réservation <span> <fmt:formatDate
															pattern="dd/MM/yyyy   HH:mm:ss"
															value="${mission.reservationDate}" /></span></li>
											</ul>
										</div>
									</div>
									<div class="excerpt">
										<p>
											<c:out value="${mission.description}" escapeXml="false"></c:out>
										</p>
									</div>
									<%
										User user = UserHandler.getLoggedInUser(request);
									%>
									<c:if test="${mission.customer.id eq user.id}">
										<div class="share">
											<a class="btn btn-primary"
												href="<%=prefixPath%>/annulerreservation/${mission.id}">Annuler
												cette réservation</a>
										</div>
									</c:if>
								</div>
							</div>
							<!-- End Property -->
						</div>
						<!-- End Main content -->


						<!-- Sidebar left  -->
						<div class="col-md-4">
							<div class="box-siderbar-container">
								<!-- sidebar-box map-box -->
								<!-- End sidebar-box map-box -->

								<!-- sidebar-box our-box -->
								<div class="sidebar-box our-box">
									<h3>Notre agent</h3>
									<ul>
										<li><c:set var="imgUrl"
												value="/coursefacile/images/people.png"></c:set> <c:if
												test="${not empty mission.owner.image}">
												<c:set var="imgUrl" value="${mission.owner.image}"></c:set>
											</c:if>
											<div class="our-border clearfix">
												<div class="our-img">
													<img alt="" height="90" width="90" src="${imgUrl}">
												</div>
												<div class="our-info">
													<h5>
														<a href="<%=prefixPath%>/profile/${mission.owner.id}">${mission.owner.lname}
															${mission.owner.fname}</a>
													</h5>
													<c:if test="${not empty mission.owner.telephone}">
														<span>Call. </span>${mission.owner.telephone}<br />
													</c:if>
													<span>Mail. </span><a href="mailto:${mission.owner.email}">${mission.owner.email}</a>
												</div>
											</div></li>
									</ul>
								</div>

							</div>
						</div>
						<!-- End Sidebar left  -->

					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="parts/footer.jsp"%>

</body>
</html>