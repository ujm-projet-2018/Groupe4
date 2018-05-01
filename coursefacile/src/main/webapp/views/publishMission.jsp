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
<div class="banner-header publish-mission-bg">
    <div class="header-overlay"></div>
    <div class="row">
        <div class="col-md-12 text-center"><h2 class="title">Publier une mission</h2></div>
    </div>

</div>
<div class="container">
    <div class="row well">
        <div class="col-md-12">
            <form id="publish-mission" class="form-horizontal" name="publishForm" method="post"
                  action="<%= prefixPath %>/Publish-Mission">
                <div class="form-group">
                    <label for="city" class="col-sm-2 control-label">Ville / Code postal</label>
                    <div class="col-sm-10">
                        <div class='input-group'>
                            <input type="text" class="form-control" id="city" name="city"
                                   placeholder="Ville / Code postal"
                                   autocomplete="off">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="date" class="col-sm-2 control-label">Date</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="date" id="date"
                               placeholder="Veuillez indiquer la date des courses JJ/MM/AAAA ..">
                    </div>
                    <div class="col-sm-4">
                        <div class="input-append date form_time" data-date="" data-date-format="hh:ii">
                            <input class="span2 form-control" placeholder="le temps de les courses" size="16"
                                   type="text"
                                   value="">
                            <span class="add-on"><i class="icon-th"></i></span>
                </div>
            </div>
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
                        <input type="text" id="remuneration" name="remuneration" class="form-control"
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
                        <input type="submit" class="btn btn-primary pull-left" value="Valider">
            </div>
                </div>

            </form>
        </div>
    </div>
</div>

<%@ include file="parts/footer.jsp" %>

</body>
</html>