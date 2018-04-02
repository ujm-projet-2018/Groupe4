<%--
  Created by IntelliJ IDEA.
  User: abdelmoghitmadih
  Date: 4/1/18
  Time: 3:20 PM
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
<div class="top-content">


    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">

                    <div class="form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h3>Je recupere mon mot de passe</h3>
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-key"></i>
                            </div>
                        </div>
                        <% boolean showRecoverPwdForm = Boolean.parseBoolean(request.getAttribute("showRecoverPwdForm").toString());%>
                        <% if (!showRecoverPwdForm) {%>
                        <div class="form-bottom">
                            <form role="form" action="" method="post" novalidate="novalidate"
                                  class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="email">Adresse E-mail</label>
                                    <input type="email" name="email" placeholder="E-mail..."
                                           class="form-username form-control" id="email">
                                </div>
                                <input type="hidden" name="type" value="login">
                                <button type="submit" class="btn btn-primary">Valider</button>
                            </form>
                        </div>

                        <% } else { %>

                        <div class="form-bottom">
                            <form role="form" action="" method="post" novalidate="novalidate"
                                  class="login-form">
                                <div class="form-group">
                                    <label class="sr-only" for="pwd">Mot de passel</label>
                                    <input type="password" name="pwd" placeholder="Mot de passe..."
                                           class="form-username form-control" id="pwd">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="confirm_pwd">Confirmation de mot de passe</label>
                                    <input type="password" name="confirm_pwd"
                                           placeholder="Confirmation de mot de passe..."
                                           class="form-password form-control" id="confirm_pwd">
                                </div>
                                <input type="hidden" name="type" value="login">
                                <button type="submit" class="btn btn-primary">Valider</button>
                            </form>
                        </div>

                        <%}%>
                    </div>

                </div>

            </div>

        </div>
    </div>

</div>

</div>
</div>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
