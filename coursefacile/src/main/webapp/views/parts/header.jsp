<%@ page import="com.coursefacile.model.User" %>
<%@ page import="com.coursefacile.dao.Util" %><%--
  Created by IntelliJ IDEA.
  User: abdelmoghitmadih
  Date: 3/26/18
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target=".navbar-collapse.collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand">
                        <a href="/coursefacile"><h1><img src="images/logo.png" title="Courses Faciles"></h1></a>
                    </div>
                </div>

                <div class="navbar-collapse collapse">
                    <div class="menu">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation"><a href="/coursefacile/" class="active">Accueil</a></li>
                            <li role="presentation"><a href="/coursefacile/services">Services</a></li>
                            <li role="presentation"><a href="/coursefacile/contact">Contact</a></li>
                            <%
                                if (Util.isLoggedIn(request)) {
                                    User user = Util.getLoggedInUser(request);
                                    String imgUrl = user.getImage() == null ? "images/people.png" : user.getImage();
                            %>
                            <li class="user">
                                <a data-toggle="dropdown" href="#" class="dropdown-toggle" aria-expanded="false">
                                    <img class="nav-user-photo" src="<%= imgUrl%>" alt="Jason's Photo">
                                    <span class="user-info">
									<%= user.getFname()%>
								</span>

                                    <i class="ace-icon fa fa-caret-down"></i>
                                </a>
                                <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                    <li>
                                        <a href="/coursefacile/profile">
                                            <i class="ace-icon fa fa-user"></i>
                                            Profile
                                        </a>
                                    </li>

                                    <li class="divider"></li>

                                    <li>
                                        <a href="/coursefacile/logout">
                                            <i class="ace-icon fa fa-power-off"></i>
                                            déconnéxion
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <% } else {%>
                            <li role="presentation"><a href="/coursefacile/login">Connéxion/Inscription</a></li>
                            <%}%>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="global-alert">
    <%= Util.showGlobalAlerts() %>
</div>

