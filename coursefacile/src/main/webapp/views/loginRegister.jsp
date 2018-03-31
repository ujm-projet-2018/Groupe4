<%--
  Created by IntelliJ IDEA.
  User: abdelmoghitmadih
  Date: 3/26/18
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <%@ include file="parts/meta.jsp" %>
    <title>Multi-purpose theme</title>
    <link rel="stylesheet" href="css/form-elements.css">
    <link rel="stylesheet" href="css/loginRegister.css">
    <%@ include file="parts/styles.jsp" %>

</head>
<body class="login-register">
<%@include file="parts/header.jsp" %>
<div class="top-content">


    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">

                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Je me connecte</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form role="form" action="/coursefacile/login" method="post" novalidate="novalidate" class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="login_email">Adresse E-mail</label>
                                    <input type="text" name="login_email" placeholder="E-mail..."
                                           class="form-username form-control" id="login_email">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="login_pwd">Mot de passe</label>
                                    <input type="password"  name="login_pwd" placeholder="Mot de passe..."
                                           class="form-password form-control" id="login_pwd">
                                </div>
                                <input type="hidden" name="type" value="login">
                                <a href="">Mot de passe oublié?</a>
                                <button type="submit" class="btn">Se connecter</button>
                            </form>
                        </div>
                    </div>

                </div>

                <div class="col-sm-1 middle-border"></div>
                <div class="col-sm-1"></div>

                <div class="col-sm-5">

                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Pas encore membre? M'enregister</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-pencil"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                            <form role="form" action="/coursefacile/register" method="post"  novalidate="novalidate" class="registration-form form-validation">
                                <div class="form-group">
                                    <label class="sr-only" for="first_name">First name</label>
                                    <input type="text" name="first_name" placeholder="*Nom..."
                                           class="form-control" id="first_name"  >
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="last_name">Last name</label>
                                    <input type="text" name="last_name" placeholder="*Prénom..."
                                           class="form-control" id="last_name"  >
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="email">Email</label>
                                    <input type="email" name="email" placeholder="*Email..."  class="form-control"
                                           id="email" >
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="pwd">Mot de passe</label>
                                    <input type="password" name="pwd"
                                           placeholder="*Mot de passe (8 caractères min.)..." class="form-control"
                                           id="pwd"   >
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="confirm_pwd">Confirmer le mot de passe</label>
                                    <input type="password" name="confirm_pwd"
                                           placeholder="*Confirmer le mot de passe..." class=" form-control"
                                           id="confirm_pwd"   >
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="description">Apropos de moi</label>
                                    <textarea name="description" placeholder="Apropos de moi..."
                                              class=" form-control" id="description"></textarea>
                                </div>
                                <input type="hidden" name="type" value="register">
                                <button type="submit" class="btn">S'enregistrer</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>


<%@ include file="parts/footer.jsp" %>


<!--[if lt IE 10]>
<script src="assets/js/placeholder.js"></script>
<![endif]-->
</body>
</html>
