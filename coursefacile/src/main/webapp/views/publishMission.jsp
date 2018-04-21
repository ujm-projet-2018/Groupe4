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
	<body onload="completerFormulaire()">
	
		<%@include file="parts/header.jsp" %>
		
		<div id="global">
			<h2 class="title">Publier une mission</h2>
			<div class="container01">
			
			  <form name="publishForm" method="post" action="<%= prefixPath %>/Publish-Mission" onsubmit="return verifierDonnees()">    
			  	<div class="row">
			      <div class="col-25">
			        <label for="ville">Ville / Code postal</label>
			      </div>
			      <div class="col-75">
			        <input type="text" id="ville" name="ville" placeholder="Veuillez indiquer votre ville ..">
			      </div>
                  <input type="text" id="erreur1" name="erreur1" value="La ville n'est pas indiquer !">
			    </div>
			    
                <div class="row">
                  <div class="col-25">
			        <label for="date">Date</label>
			      </div>
                  <div class="col-29">
                  	<input type="text" name="date" id="date" placeholder="Veuillez indiquer la date des courses JJ/MM/AAAA .." >
                  </div>
                  <div id="select1" class="select">
			      	<select id="heure" name="heure" class="inline">
			      		<option value="0"> Heure  </option>
			      	</select> h
                  </div>
                  <div id="select2" class="select">
			      <select id="minute" name="minute">
			        <option value="0"> Minute </option>
			      </select>
                  </div>
                  <input type="text" id="erreur2" name="erreur2" value="La date et/ou l'heure ne sont pas indiquer !">
               	</div>
			    
			    <div class="row">
			      <div class="col-25">
			        <label for="supermarche">Supermarché</label>
			      </div>
			      <div class="col-75">
			        <input type="text" id="supermarche" name="supermarche" placeholder="Veuillez indiquer le supermarché dont vous voulez faire vos courses ..">
			      </div>
                  <input type="text" id="erreur3" name="erreur3" value="Le supermarché n'est pas indiquez !">
			    </div>
			    
			    <div class="row">
			      <div class="col-25">
			        <label for="remuneration">Rémunération</label>
			      </div>
			      <div class="col-75">
			        <input type="text" id="remuneration" name="remuneration" placeholder="Veuillez indiquer le montant que vous voulez payer pour le service ..">
			      </div>
                  <input type="text" id="erreur4" name="erreur4" value="Le montant indiqué n'est pas valide !">
			    </div>
			    
			    <div class="row">
			      <div class="col-25">
			        <label for="description">Description</label>
			      </div>
			      <div class="col-75">
			        <textarea id="description" name="description" placeholder="Décrivez un peu votre demande de service, vous êtes flexible pour la marge horaire ? la composition de vos courses ? ..." style="height:200px"></textarea>
			      </div>
                  <input type="text" id="erreur5" name="erreur5" value="Il est très important de décrire votre demande de service !">
			    </div>
			    
			    <div class="row">
			      <input type="submit" value="Valider">
			    </div>
			    
			  </form>
			</div>
		</div>
		
		<%@ include file="parts/footer.jsp" %>
		
	</body>
</html>