<%--
  -- @author walid
  --
  --
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <%@ include file="parts/meta.jsp" %>
    <title>Profil | Courses faciles</title>
    <%@ include file="parts/styles.jsp" %>
</head>

<body class="fix-header fix-sidebar">
<%@include file="parts/header.jsp" %>
<!-- Main wrapper  -->
<div id="main-wrapper">
    <%@include file="parts/notification_message.jsp" %>
</div>

<div class="container-fluid">

    <!-- Start Page Content -->
    <div class="row">
        <%
            User user = UserHandler.getLoggedInUser(request);
        %>
        <!-- Sidebar -->
        <%@ include file="parts/sidebar_dashboard.jsp" %>
        <div class="col-sm-10" id="fenetre_chat" style="margin-left: 240px;">
            <div class="chat ">
                <div class="chat-header clearfix">
                    <c:set var="receiverImage" scope="page"
                           value="/images/people.png"/>
                    <c:if test="${not empty receiver.image}">
                        <c:set var="receiverImage" scope="page" value="${receiver.image}"/>
                    </c:if>
                    <a href="<%=prefixPath%>/profile/${receiver.id}"><img class="contact-img"
                                                                          src="<%=prefixPath%>${receiverImage}"
                                                                          alt="avatar"/></a>

                    <div class="chat-about">
                        <div class="chat-with">
                            <a href="<%=prefixPath%>/profile/${receiver.id}">${receiver.fname}
                                ${receiver.lname}</a>
                        </div>
                    </div>
                </div>
                <!-- end chat-header -->

                <div class="chat-history">
                    <div class="loader"></div>
                    <ul>
                        <c:if test="${not empty messages}">
                            <c:forEach items="${messages}" var="msg">
                                <c:if test="${user.id eq msg.sender.id}">
                                    <li class="clearfix">
                                        <div class="message-data align-right">
												<span class="message-data-time"><fmt:formatDate
                                                        pattern="dd-MM-yyyy hh:mm" value="${msg.date}"/> </span> <span
                                                class="message-data-name"> Moi</span><i
                                                class="fa fa-circle me"></i>

                                        </div>
                                        <div class="message other-message float-right">
                                                ${msg.text}</div>
                                    </li>
                                </c:if>
                                <c:if test="${user.id ne msg.sender.id}">
                                    <li>
                                        <div class="message-data">
												<span class="message-data-name"><i
                                                        class="fa fa-circle online"></i>${msg.sender.lname}</span> <span
                                                class="message-data-time"><fmt:formatDate
                                                pattern="dd-MM-yyyy hh:mm" value="${msg.date}"/></span>
                                        </div>
                                        <div class="message my-message">${msg.text}</div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </ul>

                </div>
                <!-- end chat-history -->

                <div class="chat-message clearfix"
                     data-receiver-name="${receiver.fname} ${receiver.lname}"
                     data-receiver="${receiver.id}" data-sender="${user.id}">
                    <label for="message" class="sr-only">Message à envoyer</label>
                    <textarea name="message" id="message"
                              placeholder="Tapez votre Message" rows="3"></textarea>
                    <button id="send-message" class="btn btn-info">Envoyer</button>

                </div>
                <!-- end chat-message -->

            </div>
            <!-- end chat -->
        </div>
    </div>

</div>


<%@ include file="parts/footer.jsp" %>
</body>
</html>