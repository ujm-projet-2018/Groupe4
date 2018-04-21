<%@ page import="com.coursefacile.model.User" %>
<%@ page import="com.coursefacile.dao.Util" %>
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
                        <a href="<%= prefixPath %>"><h1><img src="<%= prefixPath %>/images/logo.png"
                                                             title="Courses Faciles"></h1></a>
                    </div>
                </div>

                <div class="navbar-collapse collapse">
                    <div class="menu">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation"><a href="<%= prefixPath %>/" class="active">Accueil</a></li>
                            <li role="presentation"><a href="<%= prefixPath %>/services">Services</a></li>
                            <li role="presentation"><a href="<%= prefixPath %>/contact">Contact</a></li>
                            <%
                                if (Util.isLoggedIn(request)) {
                                    User user = Util.getLoggedInUser(request);
                                    String imgUrl = user.getImage() == null ? prefixPath + "/images/people.png" : user.getImage();
                            %>
                            <li class="user">
                                <a data-toggle="dropdown" href="#" class="dropdown-toggle" aria-expanded="false">
                                    <img class="nav-user-photo" src="<%= imgUrl%>" alt="<%= user.getFullName() %>">
                                    <span class="user-info">
									<%= user.getLname() %> <%= user.getFname().substring(0, 1) %>
								</span>

                                    <i class="ace-icon fa fa-caret-down"></i>
                                </a>
                                <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                    <li>
                                        <a href="<%= prefixPath %>/profile">
                                            <i class="ace-icon fa fa-user"></i>
                                            Profil
                                        </a>
                                    </li>

                                    <li class="divider"></li>
                                    
                                    <li>
                                        <a href="<%= prefixPath %>/dashboard">
                                            <i class="glyphicon glyphicon-tasks"></i>
                                            Tableau de bord
                                        </a>
                                    </li>

                                    <li class="divider"></li>

                                    <li>
                                        <a href="<%= prefixPath %>/logout">
                                            <i class="ace-icon fa fa-power-off"></i>
                                            Deconnexion
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <% } else {%>
                            <li role="presentation"><a href="<%= prefixPath %>/login">Connexion/Inscription</a></li>
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

