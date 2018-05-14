<!-- Feuilles de style communs -->
<link href="<%= prefixPath %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= prefixPath %>/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="<%= prefixPath %>/css/font-awesome.min.css" rel="stylesheet">
<link href="<%= prefixPath %>/css/isotope.css" rel="stylesheet">
<link href="<%= prefixPath %>/css/animate.css" rel="stylesheet">
<link href="<%= prefixPath %>/css/prettyPhoto.css" rel="stylesheet">
<link href="<%= prefixPath %>/css/style.css" rel="stylesheet">
<link href="<%= prefixPath %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<%= Util.includeCssOrJs(request, "/|/profile|/Publish-Mission|/dashboard/update-mission/*|/missions*|/dashboard/profile", "/css/datepicker.css")%>
<%-- Login page styles --%>
<%= Util.includeCssOrJs(request, "/|/Publish-Mission|/dashboard/update-mission/*|/missions*", "/css/jquery.autocomplete.css")%>
<%= Util.includeCssOrJs(request, "/login", "/css/form-elements.css")%>
<%= Util.includeCssOrJs(request, "/login", "/css/loginRegister.css")%>
<%-- Dashboard styles --%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*|/dashboard/send-messages/*", "/css/lib/calendar2/semantic.ui.min.css")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*|/dashboard/send-messages/*", "/css/lib/calendar2/pignose.calendar.min.css")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*|/dashboard/send-messages/*", "/css/lib/owl.carousel.min.css")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*|/dashboard/send-messages/*", "/css/lib/owl.theme.default.min.css")%>
<%= Util.includeCssOrJs(request, "/dashboard|/profile/*|/dashboard/*|/dashboard/send-messages/*", "/css/helper.css")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*|/dashboard/send-messages/*", "/css/style_dashboard.css")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*|/dashboard/send-messages/*", "/css/animate_dashboard.css")%>
<%-- Mission Listing styles --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%--<link rel="stylesheet" type="text/css" media="screen"--%>
<%--href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">--%>
<%= Util.includeCssOrJs(request, "/missions|/dashboard/messages|/mission/*|/reservation/*|/dashboard/mesmissions|/dashboard/mesreservations", "/css/style_missionListing.css")%>
<%-- always include this file last --%>
<link href="<%= prefixPath %>/css/main.css" rel="stylesheet">

<link rel="icon" type="image/png"
      href="<%=prefixPath%>/images/favicon_1.png">
<link rel="stylesheet" href="<%= prefixPath %>/css/publishMission.css">  
<script src="<%= prefixPath %>/js/publishMission.js" type="text/javascript"></script> 
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
