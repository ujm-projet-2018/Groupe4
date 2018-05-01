<%--
  Created by IntelliJ IDEA.
  User: abdelmoghitmadih
  Date: 3/16/18
  Time: 9:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>

    <%@ include file="parts/meta.jsp" %>
    <title>Courses Faciles</title>
    <%@ include file="parts/styles.jsp" %>

</head>
<body>
<%@include file="parts/header.jsp" %>
<div class="hero-img">
    <div class="hero-text">
        <h2 class="title">Courses Faciles vous facilite la vie</h2>
        <p class="sub-title">Courses facile c'est tout simplement faire des courses facilement</p>
        <div class="container">
            <form class="form-inline" action="/coursefacile/missions" method="GET">
                <div class="form-group has-feedback has-icone col-sm-4 col-md-3 col-md-offset-2">
                    <div class='input-group'>
                        <label for="city" class="control-label sr-only">Ville / Code postal</label>
                        <input type="text" class="form-control" id="city" name="city" placeholder="Ville / Code postal"
                               autocomplete="off">
                        <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-map-marker"></span>
                                </span>
                    </div>
                </div>
                <div class="form-group has-feedback has-icone col-sm-4 col-md-3">
                    <div class='input-group'>
                        <label for="date" class="control-label sr-only">Date</label>
                        <input type="text" class="form-control" name="date" id="date" placeholder="Date">
                        <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                    </div>
                </div>
                <div class="col-sm-4 col-md-2 has-icone">
                    <button type="submit" class="btn btn-primary">Chercher une mission</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="features mg-top-50">
    <div class="container">
        <div class="text-center">
            <div class="row wow bounceInDown" data-wow-offset="0" data-wow-delay="0.3s">
                <div class="col-sm-6">
                    <img src="https://loristalter.com/wp-content/uploads/groceryshopping.jpg" class="img-responsive">
                </div>
                <div class="col-sm-6 info-publish-home">
                    <p class="lead">Vous voulez que quelqu'un fasse des courses à votre place?</p>
                    <a href="/coursefacile/Publish-Mission" class="btn btn-default btn-publish-mission"><i
                            class="fa fa-cart-plus"></i>Publier une mission</a>

                </div>
            </div>
        </div>
    </div>
</div>
<div class="features mg-top-50 ">
    <div class="container">
        <div class="text-center">
            <div class="wow bounceInDown" data-wow-offset="0" data-wow-delay="0.3s">
                <h2>A propos de nous</h2>
            </div>
            <div class="wow bounceInDown" data-wow-offset="0" data-wow-delay="0.6s">
                <p>Bras urna felis accumsan at ultrde cesid posuere masa socis nautoque<br>
                    penat bus maecenas ultrices sed ipsum lorem
                    dolor sit amet sed ipsum consectetur<br></p>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="col-lg-6 wow fadeInRight" data-wow-offset="0" data-wow-delay="0.5s">
        <img src="images/6.jpg" class="img-responsive">
    </div>

    <div class="col-lg-6 wow fadeInLeft" data-wow-offset="0" data-wow-delay="0.5s">
        <img src="images/5.jpg" class="img-responsive">
    </div>
</div>


<div class="container mg-top-50">
    <div class="text-center">
        <div class="wow bounceInDown" data-wow-offset="0" data-wow-delay="0.3s">
            <h3>Faites des courses comme vous voulez plus librement!</h3>
        </div>
    </div>
</div>
<div class="box">
    <div class="wow fadeInLeft" data-wow-offset="0" data-wow-delay="0.4s">
        <div class="col-sm-3">
            <i class="fa fa-cogs fa-3x"></i>
            <h4>Pratique</h4>
        </div>
    </div>
    <div class="wow fadeInLeft" data-wow-offset="0" data-wow-delay="0.8s">
        <div class="col-sm-3">
            <i class="fa fa-leaf fa-3x"></i>
            <h4>Facile</h4>
        </div>
    </div>
    <div class="wow fadeInRight" data-wow-offset="0" data-wow-delay="1.2s">
        <div class="col-sm-3">
            <i class="fa fa-heart-o fa-3x"></i>
            <h4>Assuré</h4>
        </div>
    </div>
    <div class="wow fadeInRight" data-wow-offset="0" data-wow-delay="1.6s">
        <div class="col-sm-3">
            <i class="fa fa-laptop fa-3x"></i>
            <h4>Sécurisé</h4>
        </div>
    </div>
</div>
<div class="container mg-top-50">
    <div class="text-center">
        <div class="wow bounceInDown" data-wow-offset="0" data-wow-delay="0.3s">
            <h3>Ce qui va vous plaire</h3>
        </div>
    </div>
</div>
<div class="main-feature">
    <div class="container">
        <div class="col-md-4 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.3s">
            <div class="media">
                <div class="media-left">
                    <i class="fa fa-rocket fa-3x"></i>
                </div>

                <div class="media-body">
                    <h4 class="media-heading">Avoir le choix</h4>
                    <p>Cras urna felis accumsan at ultricesid posuere masa um socisd natoque penatibus magnisd Lorem
                        ipsum dolor sit ame onsectea dipe.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.6s">
            <div class="media">
                <div class="media-left">
                    <i class="fa fa-camera fa-3x"></i>
                </div>

                <div class="media-body">
                    <h4 class="media-heading">Communauté</h4>
                    <p>Cras urna felis accumsan at ultricesid posuere masa um socisd natoque penatibus magnisd Lorem
                        ipsum dolor sit ame onsectea dipe.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4 wow fadeInUp" data-wow-offset="0" data-wow-delay="0.9s">
            <div class="media">
                <div class="media-left">
                    <i class="fa fa-heart-o fa-3x"></i>
                </div>

                <div class="media-body">
                    <h4 class="media-heading">Assurance</h4>
                    <p>Cras urna felis accumsan at ultricesid posuere masa um socisd natoque penatibus magnisd Lorem
                        ipsum dolor sit ame onsectea dipe.</p>
                </div>
            </div>
        </div>
    </div>


</div>


<%@ include file="parts/footer.jsp" %>

</body>
</html>