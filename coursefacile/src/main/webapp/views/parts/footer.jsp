<%@ page import="com.coursefacile.utilities.Util" %>
<footer>
<div class="footer" id="footer">
    <div class="container-fluid">
			<div class="col-md-4 wow fadeInUp" data-wow-offset="0"
				data-wow-delay="0.2s">
				<h2>Multi</h2>
				<p>In a elit in lorem congue varius. Sed nec arcu. Etiam sit
					amet augue. Fusce fermen tum neque a rutrum varius odio pede
					ullamcorp-er tellus ut dignissim nisi risus non tortor. Aliquam
					mollis neque.</p>

				<ul class="social-network">
					<li><a href="#" data-placement="top" title="Facebook"><i
							class="fa fa-facebook fa-1x"></i></a></li>
					<li><a href="#" data-placement="top" title="Twitter"><i
							class="fa fa-twitter fa-1x"></i></a></li>
					<li><a href="#" data-placement="top" title="Linkedin"><i
							class="fa fa-linkedin fa-1x"></i></a></li>
					<li><a href="#" data-placement="top" title="Pinterest"><i
							class="fa fa-pinterest fa-1x"></i></a></li>
					<li><a href="#" data-placement="top" title="Google plus"><i
							class="fa fa-google-plus fa-1x"></i></a></li>
				</ul>
			</div>

        <div class="col-md-offset-1 col-md-3 wow fadeInUp" data-wow-offset="0"
             data-wow-delay="0.4s">
				<h3>RECENT POSTS</h3>
				<ul>
					<li>Awesome Design with Overviews</li>
					<hr>
					<li>Great Design with Features</li>
					<hr>
					<li>Limitless functions & Works</li>
					<hr>
					<li>Multi is simple and clean design</li>
				</ul>
			</div>

        <div class="col-md-offset-1 col-md-3 wow fadeInUp" data-wow-offset="0"
             data-wow-delay="0.6s">
				<h3>CONTACT INFO</h3>
				<ul>
					<li><i class="fa fa-home fa-2x"></i> Office # 38, Suite 54
						Elizebth Street, Victoria State Newyork, USA 33026</li>
					<hr>
					<li><i class="fa fa-phone fa-2x"></i> +38 000 129900</li>
					<hr>
					<li><i class="fa fa-envelope fa-2x"></i> info@domain.net</li>
				</ul>
			</div>

		</div>
	</div>

	<div class="sub-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
                    &copy; 2018 <a href="<%=prefixPath%>"
                                   title="Courses Faciles">Courses Faciles</a>.
                    Tout droit réservé.
				</div>
				<!--
                    All links in the footer should remain intact.
                    Licenseing information is available at: http://bootstraptaste.com/license/
                    You can buy this theme without footer links online at: http://bootstraptaste.com/buy/?theme=Multi
                -->
				<div class="col-md-6">
					<ul class="pull-right">
                        <li><a href="<%= prefixPath%>">Accueil</a></li>
                        <li><a href="<%= prefixPath%>/services">Services</a></li>
                        <li><a href="<%= prefixPath%>/contact">Contact</a></li>
                        <li><a href="<%= prefixPath%>/sitemap">Site Map</a></li>
					</ul>
				</div>
			</div>
			<div class="pull-right">
				<a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
			</div>
		</div>
	</div>
</footer>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script>
    prefixPath = "<%=prefixPath%>";
</script>
<script src="<%=prefixPath%>/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="<%=prefixPath%>/js/bootstrap.min.js"></script>
<%= Util.includeCssOrJs(request, "*", "/js/wow.min.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/fancybox/jquery.fancybox.pack.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/jquery.easing.1.3.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/jquery.bxslider.min.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/jquery.prettyPhoto.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/jquery.isotope.min.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/jquery.autocomplete.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/bootstrap-datepicker.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/functions.js")%>
<%= Util.includeCssOrJs(request, "*", "/js/jquery.validate.min.js")%>

<script type="text/javascript"
     src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
<%-- Dashboard scripts --%>
<%= Util.includeCssOrJs(request, "/dashboard|/profile|/profile/*|/dashboard/*", "/js/lib/bootstrap/js/popper.min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/profile|/profile/*|/dashboard/*", "/js/jquery.slimscroll.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/profile|/profile/*|/dashboard/*", "/js/sidebarmenu.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/profile|/profile/*|/dashboard/*", "/js/lib/sticky-kit-master/dist/sticky-kit.min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard", "/js/lib/morris-chart/raphael-min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/lib/calendar-2/moment.latest.min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/lib/calendar-2/semantic.ui.min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/lib/calendar-2/prism.min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/lib/calendar-2/pignose.calendar.min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/lib/calendar-2/pignose.init.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/lib/owl-carousel/owl.carousel.min.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/lib/owl-carousel/owl.carousel-init.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/dashboard/*", "/js/scripts.js")%>
<%= Util.includeCssOrJs(request, "/dashboard|/profile|/profile/*|/dashboard/*", "/js/custom.min.js")%>
<%-- DateTimePicker --%>
<%= Util.includeCssOrJs(request, "/mission", "/js/datepicker.js")%>
<%-- Always include this file last --%>
<script src="<%=prefixPath%>/js/bootbox.min.js"></script>
<script type="text/javascript" src="<%=prefixPath%>/js/script.js"></script>



