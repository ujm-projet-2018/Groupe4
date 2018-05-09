<%--
  -- @author walid
  --
  --
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>


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
		<%@include file="parts/notification_message.jsp"%>
		<%
			User user = UserHandler.getLoggedInUser(request);
			String imgUrl = user.getImage() == null ? prefixPath + "/images/people.png" : user.getImage();
		%>
		<!-- End header header -->
		
		<!-- Page wrapper  -->
		<div id="body-dashboard" class="page-wrapper">
			<!-- Bread crumb -->
			<div class="row page-titles">
				<div class="col-md-5 align-self-center">
					<img id="image-dashboard" class="nav-user-photo" src="<%=imgUrl%>"
						alt="<%=user.getFullName()%>">
					<h3 id="titre-dashboard" class="text-primary">
						Bonjour
						<%=user.getFullName()%>
					</h3>
					<div class="link-profil">
						<a class="link-profil" href="<%=prefixPath%>/profile"><i
							class="fa fa-check text-success"></i> Modifier votre profil</a> <br>
						<a class="link-profil"
							href="<%=prefixPath%>/profile/<%=user.getId()%>"><i
							class="fa fa-check text-success"></i> Voir votre profil public</a>
					</div>

					<div class="progbar">
						<h3 id="titre-progbar" class="text-primary">Votre niveau
							d'expérience</h3>
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
			
			<!-- Sidebar -->
			<%@ include file="parts/sidebar_dashboard.jsp" %>
			
			<!-- Container fluid  -->
			<div class="conteneur">

				<div id="verifications">
					<h3>Informations sur votre compte</h3>
					<div id="infos">
						<h4>Vérifications</h4>
						<ul>

							<c:if test="${user.emailChecked eq true}">
								<li id="verifie"><i class="fa fa-check-circle-o"></i>
									E-mail vérifié</li>
							</c:if>
							<c:if test="${user.emailChecked ne true}">
								<li id="nonverifie"><i class="fa fa-check-circle-o"></i>
									E-mail non vérifié</li>
							</c:if>

							<li id="verifie"><i class="fa fa-check-circle-o"></i>
								Téléphone vérifié</li>
						</ul>
						<hr>
						<br>
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