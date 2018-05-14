<%--
  Created by IntelliJ IDEA.
  User: abdelmoghitmadih
  Date: 3/16/18
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="fr">
<head>

    <%@ include file="parts/meta.jsp" %>
    <title>Contact</title>
    <%@ include file="parts/styles.jsp" %>

</head>
<body>
<%@include file="parts/header.jsp" %>
<div class="contact">
    <div class="container">
        <div class="text-center">
            <div class="wow bounceInDown" data-wow-offset="0" data-wow-delay="0.3s">
                <h2>Contactez nous</h2>
            </div>
            <div class="wow bounceInDown" data-wow-offset="0" data-wow-delay="0.6s">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut</p>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="col-md-7">
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2800.3894854291743!2d4.421731716439003!3d45.42164945708881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47f5a9725571b3b9%3A0xfe56ce6537a657ae!2sFaculty+of+Science+and+Technology+of+Saint-Etienne!5e0!3m2!1sen!2sfr!4v1525705327601"
                    width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
            </iframe>
        </div>
    </div>

    <div class="contact-info">
        <div class="col-md-5">
            <h2>Equipe Courses Faciles</h2>
            <h3>A votre disposition</h3>
            <p>Fusce fermen tum neque a rutrum varius odio pede
                ullamcorp-er tellus ut dignissim nisi risus non tortor</p>
            <ul>
                <li><i class="fa fa-home fa-2x"></i> Office # 38, Suite 54 Elizebth Street</li>
                <li><i class="fa fa-phone fa-2x"></i> +33 000 129900</li>
                <li><i class="fa fa-envelope fa-2x"></i> info@coursesfaciles.net</li>
            </ul>
        </div>
    </div>
</div>

<form id="contact-form" method="post" action="<%=prefixPath%>/contact" class="contact-form">
    <div class="container">
        <div class="col-md-4">
            <div class="form-group">
                <input type="text" name="name" class="form-control" id="exampleInputName" placeholder="nom">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="email">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group">
                <input type="text" name="tel" class="form-control" id="exampleInputPhone" placeholder="telephone">
            </div>
        </div>
    </div>

    <div class="container">
        <div class="col-lg-12">
            <div class="form-group">
                <textarea class="form-control" name="message" placeholder="votre message ..." rows="5"></textarea>
            </div>
            <div class="form-group">
                <button type="submit" name="submit" class="btn btn-primary">Envoyer</button>
            </div>
        </div>
    </div>

</form>

<%@ include file="parts/footer.jsp" %>

</body>
</html>