Created by IntelliJ IDEA.
User: abdelmoghitmadih
Date: 4/1/18
Time: 3:20 PM
To change this template use File | Settings | File Templates.
--%>
<% boolean validationStatus = Boolean.parseBoolean(((String) request.getAttribute("validationStatus"))); %>

<!DOCTYPE html>
<html lang="fr">
<head>

    <%@ include file="parts/meta.jsp" %>
    <title>Courses Faciles</title>
    <%@ include file="parts/styles.jsp" %>

</head>
<body>
<%@include file="parts/header.jsp" %>
<div class="container validation-mail">
    <% if (validationStatus) { %>
    <div class="jumbotron">
        <p class="lead text-success">Votre mail est maintenant validé!</p>
        <p class="text-success">vous pouvez à présent creer/effectuer des missions</p>
        <p><a class="btn btn-primary btn-lg" href="<%= prefixPath %>" role="button">Page d'accueil </a></p>
    </div>
    <% } else {
        String urlValidationMail = (String) request.getAttribute("urlValidationMail");
    %>
    <div class="jumbotron validation-page">
        <c:if test="${not empty user and user.emailChecked eq true}">
            <p class="lead text-success">Le lien est déjà utilisé.</p>
            <p class="lead text-success">Votre mail est validé.</p>
        </c:if>
        <c:if test="${not empty user and user.emailChecked ne true}">
        <p class="lead text-danger">Votre mail n'est pas validé.</p>
            <p class="text-danger">Le lien de validation a expiré!</p>
            <p><a class="btn btn-primary btn-lg" href="<%= urlValidationMail %>" role="button">Recevoir un nouvel mail
                de
                validation</a></p>
        </c:if>

    </div>
    <% } %>
</div>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
