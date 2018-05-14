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
<title>Profil | Courses faciles</title>
<%@ include file="parts/styles.jsp"%>
</head>

<body class="fix-sidebar">
	<%@include file="parts/header.jsp"%>

	<div class="main-content">
		<div class="properties">


			<!-- Main wrapper  -->
			<div id="main-wrapper">
				<%@include file="parts/notification_message.jsp"%>
			</div>



			<div class="container">

				<%
					User user = UserHandler.getLoggedInUser(request);
				%>
				<!-- Sidebar -->
				<%@ include file="parts/sidebar_dashboard.jsp"%>

				<!-- Full width 2 -->
				<div class="grid_full_width" id="fullwidth2">
					<div class="all-text">
						<h2>Mes messages</h2>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<form action="<%=prefixPath%>/dashboard/messages" id="filter"
								method="get">
								<div class="row form-group">
									<div class="col-sm-6">
										<label class="sr-only" for="userName">Contacte</label> <input
											type="text" id="userName" name="userName"
											class="form-control" value="${param.userName}"
											placeholder="Nom ou prénom de l'utilisateur">
									</div>
									<input type="hidden" name="orderBy" id="orderBy">
									<div class="col-sm-4">
										<button class="btn-primary btn no-mg-top"
											id="bouton_mes_missions">Filtrer</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<c:if test="${not empty messages}">
						<div class="row">
							<div class="grid_list_product st2">
								<ul class="products" id="able-list">
									<c:forEach items="${messages}" var="msg">
										<c:set var="contact" scope="page" value="${msg.receiver}"></c:set>
										<c:if test="${msg.sender.id ne user.id}">
											<c:set var="contact" scope="page" value="${msg.sender}"></c:set>
										</c:if>
										<c:set var="image" scope="page"
                                               value="/images/people.png"/>
										<c:if test="${not empty contact.image}">
											<c:set var="image" scope="page" value="${contact.image}" />
										</c:if>
										<li style="display: block;"
											class="col-sm-12 first house offices Residential">
											<div class="product-item">
												<div class="row">
													<div class="col-sm-3">
														<div class="imagewrapper">
															<div class="text-center">
                                                                <img alt="" class="img-user-listing"
                                                                     src="<%=prefixPath%>${image}">
															</div>
														</div>
													</div>
													<div class="col-sm-8">
														<div class="list-right-info">
															<h3>
																<a href="<%=prefixPath%>/profile/${contact.id}" title="">${contact.lname}
																	${contact.fname}</a>
															</h3>
															<p>
																<c:if test="${msg.sender.id eq user.id}">you : </c:if>${msg.text}
															</p>
															<p>
																<fmt:formatDate pattern="dd/MM/yyyy   HH:mm:ss"
																	value="${msg.date}" />
															</p>
															<a
																href="<%=prefixPath%>/dashboard/send-messages/${contact.id}"
																class="btn btn-primary">Envoyer un message</a>
														</div>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- Page-ination -->
						<div class="page-ination">
							<div class="page-in">
								<ul class="clearfix">
									<c:if test="${pagination gt 1}">
										<li><a href="${url}start=1"><img alt=""
												src="<%=prefixPath%>/images/pre2.png"></a></li>
										<li><a
											href="${url}start=${ param.start - 1 ge 1 ? param.start-1 : 1}"><img
												alt="" src="<%=prefixPath%>/images/pre1.png"></a></li>
									</c:if>
									<c:forEach var="i" begin="1" end="${pagination}">
										<li><a
											<c:if test="${param.start eq i}">class="current"</c:if>
											href="${url}start=${i}">${i}</a></li>
									</c:forEach>
									<c:if test="${pagination gt 1}">
										<li><a
											href="${url}start=${ param.start + 1 le pagination ? param.start+1 : pagination}"><img
												alt="" src="<%=prefixPath%>/images/next1.png"></a></li>
										<li><a href="${url}start=${pagination}"><img alt=""
												src="<%=prefixPath%>/images/next2.png"></a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</c:if>
					<c:if test="${not empty contacts}">
						<div class="row">
							<div class="grid_list_product st2">
								<p>Aucun message trouvé</p>
							</div>
						</div>

					</c:if>
					<!-- Page-ination -->

				</div>
				<!-- End  Full width 1 -->
			</div>
		</div>
	</div>


	<%@ include file="parts/footer.jsp"%>
</body>
</html>