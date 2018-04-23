<%--
  Created by : Mohammed LYAHYAOUI
  Date: 04/05/18
  Time: 10:30 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>

    <%@ include file="parts/meta.jsp" %>
    <title>Publication Mission | Courses Faciles</title>
    <%@ include file="parts/styles.jsp" %>

</head>
<body>

<%@include file="parts/header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <h2 class="title">Publier une mission</h2>


            <form name="publishForm" id="publish-mission" method="post" class="form-horizontal"
                  action="<%= prefixPath %>/Publish-Mission">
                <div class="form-group">
                    <label for="city" class="control-label col-sm-2">Ville</label>
                    <div class="col-sm-10">
                        <div class='input-group'>
                            <input type="text" class="form-control" id="city" name="city"
                                   placeholder="Ville / Code postal" autocomplete="off">

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="date" class="col-sm-2 control-label">Date</label>
                    <div class="col-sm-5">
                        <div class='input-group'>
                            <input type="text" class="form-control"
                                   placeholder="Veuillez indiquer la date des courses JJ/MM/AAAA .." name="date"
                                   id="date" placeholder="Date">

                        </div>
                    </div>
                    <div class="col-sm-2">
                        <select id="heure" name="heure" class="form-control">
                            <option value="0"> Heure</option>
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select id="minute" name="minute" class="form-control">
                            <option value="0"> Minute</option>
                        </select>
                    </div>
                    <input type="text" id="erreur2" name="erreur2" value="La date et/ou l'heure ne sont pas indiquer !">
                </div>
                <div class="form-group">
                    <label for="supermarche" class="col-sm-2 control-label">Supermarché</label>
                    <div class="col-sm-10">
                        <input type="text" id="supermarche" class="form-control" name="supermarche"
                               placeholder="Veuillez indiquer le supermarché dont vous voulez faire vos courses ..">
                    </div>
                </div>
                <div class="form-group">
                    <label for="remuneration" class="col-sm-2 control-label">Rémunération</label>
                    <div class="col-sm-10">
                        <input type="text" id="remuneration" class="form-control" name="remuneration"
                               placeholder="Veuillez indiquer le montant que vous voulez payer pour le service ..">
                    </div>
                </div>
                <div class="form-group">
                    <label for="description" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
                    <textarea id="description" class="form-control" name="description"
                              placeholder="Décrivez un peu votre demande de service, vous êtes flexible pour la marge horaire ? la composition de vos courses ? ..."
                              style="height:200px"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <input type="submit" class="btn btn-primary" value="Valider">
                    </div>
                </div>

            </form>
        </div>
    </div>

</div>

<%@ include file="parts/footer.jsp" %>

</body>
</html>