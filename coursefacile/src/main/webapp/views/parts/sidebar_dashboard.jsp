<%@ page import="com.coursefacile.model.User" %>
<%@ page import="com.coursefacile.utilities.Util" %>
<%@ page import="com.coursefacile.dao.UserHandler" %>
<div class="ace-settings-container visible-xs">
    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="show-side-bar">
        <i class="ace-icon fa fa-cog bigger-130"></i>
    </div>

    <div class="ace-settings-box clearfix" id="show-side-bar-box">
        <div class="row-fluid">
            <!-- Sidebar navigation-->
            <nav class="sidebar-nav">
                <ul id="sidebarnav-mobile">
                    <li class="nav-label"></li>
                    <li><a class="active" href="<%=prefixPath%>/dashboard"
                           aria-expanded="false"><i class="fa fa-tachometer"></i><span
                            class="hide-menu">Tableau de bord </span></a></li>
                    <li class="nav-label">Missions</li>
                    <li><a class=" " href="<%=prefixPath%>/dashboard/mesmissions"
                           aria-expanded="false"><i class="fa fa-suitcase"></i><span
                            class="hide-menu">Mes missions </span></a></li>
                    <li><a class=" "
                           href="<%=prefixPath%>/dashboard/mesreservations"
                           aria-expanded="false"><i class="fa fa-cart-arrow-down"></i><span
                            class="hide-menu">Mes réservations </span></a></li>
                    <li class="nav-label">Mon compte</li>
                    <li><a class=" " href="<%=prefixPath%>/dashboard/messages"
                           aria-expanded="false"><i class="fa fa-envelope"></i><span
                            class="hide-menu">Messages</span> </a></li>
                    <li><a class="has-arrow" href="#" aria-expanded="true"><i
                            class="fa fa-wpforms"></i><span class="hide-menu">Profil
					</span></a>
                        <ul aria-expanded="true" class="collapse in">
                            <li><a href="<%=prefixPath%>/profile">Modifier mon profil</a></li>
                            <li><a href="<%=prefixPath%>/profile/<%=user.getId()%>">Voir
                                mon profil public</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- End Sidebar navigation -->

        </div>
    </div><!-- /.pull-left -->

</div>
<!-- /.ace-settings-box -->

<!-- Left Sidebar -->
<div id="sidebar-gauche" class="left-sidebar hidden-xs">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-label"></li>
                <li><a class="active" href="<%=prefixPath%>/dashboard"
                       aria-expanded="false"><i class="fa fa-tachometer"></i><span
                        class="hide-menu">Tableau de bord </span></a></li>
                <li class="nav-label">Missions</li>
                <li><a class=" " href="<%=prefixPath%>/dashboard/mesmissions"
                       aria-expanded="false"><i class="fa fa-suitcase"></i><span
                        class="hide-menu">Mes missions </span></a></li>
                <li><a class=" "
                       href="<%=prefixPath%>/dashboard/mesreservations"
                       aria-expanded="false"><i class="fa fa-cart-arrow-down"></i><span
                        class="hide-menu">Mes réservations </span></a></li>
                <li class="nav-label">Mon compte</li>
                <li><a class=" " href="<%=prefixPath%>/dashboard/messages"
                       aria-expanded="false"><i class="fa fa-envelope"></i><span
                        class="hide-menu">Messages</span> </a></li>
                <!--
                <li><a class=" " href="#" aria-expanded="false"><i
                        class="fa fa-bell-o"></i><span class="hide-menu">Alertes </span></a></li>
                -->
                <li><a class="has-arrow" href="#" aria-expanded="false"><i
                        id="icone" class="fa fa-wpforms"></i><span class="hide-menu">Profil
					</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%=prefixPath%>/profile">Modifier mon profil</a></li>
                        <li><a href="<%=prefixPath%>/profile/<%=user.getId()%>">Voir
                            mon profil public</a></li>
                    </ul>
                </li>
                <!--
                <li class="nav-label">Argent</li>
                <li><a class=" " href="#" aria-expanded="false"><i
                        class="fa fa-euro"></i><span class="hide-menu">Argent
                            disponnible </span></a></li>
                <li><a class=" " href="#" aria-expanded="false"><i
                        class="fa fa-credit-card"></i><span class="hide-menu">Paiements
                            effectu�s</span></a></li>
                -->
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</div>
<!-- End Left Sidebar -->