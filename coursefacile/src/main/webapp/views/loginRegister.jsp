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
                            <form role="form" action="/coursefacile/login" method="post" class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="form-username">Adresse E-mail</label>
                                    <input type="text" name="email" placeholder="E-mail..."
                                           class="form-username form-control" id="form-username">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">Mot de passe</label>
                                    <input type="password" name="pwd" placeholder="Mot de passe..."
                                           class="form-password form-control" id="form-password">
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
                            <form role="form" action="/coursefacile/register" method="post" class="registration-form">
                                <div class="form-group">
                                    <label class="sr-only" for="form-first-name">First name</label>
                                    <input type="text" name="first-name" placeholder="Nom..."
                                           class="form-first-name form-control" id="form-first-name">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-last-name">Last name</label>
                                    <input type="text" name="last-name" placeholder="Prénom..."
                                           class="form-last-name form-control" id="form-last-name">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-email">Email</label>
                                    <input type="text" name="email" placeholder="Email..." class="form-control"
                                           id="form-email">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-pwd">Mot de passe</label>
                                    <input type="password" name="pwd"
                                           placeholder="Mot de passe (8 caractères min.)..." class="form-control"
                                           id="form-pwd">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-confirm-pwd">Confirmer le mot de passe</label>
                                    <input type="password" name="confirm-pwd"
                                           placeholder="Confirmer le mot de passe..." class=" form-control"
                                           id="form-confirm-pwd">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-description">Apropos de moi</label>
                                    <textarea name="description" placeholder="Apropos de moi..."
                                              class=" form-control" id="form-description"></textarea>
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
<script src="/js/loginRegister.js"></script>

<!--[if lt IE 10]>
<script src="assets/js/placeholder.js"></script>
<![endif]-->
</body>
</html>
