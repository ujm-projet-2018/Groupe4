<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="alaouiib">
    <%@ include file="parts/meta.jsp" %>
    <title>Course faciles | Profil</title>
    <%@ include file="parts/styles.jsp" %>

</head>
<body>
<%@ include file="parts/header.jsp" %>
<div class="container">
    <div class="span3 well">
        <center>

            <%

                User user = (User)request.getAttribute("user2");
                String imgUrl = prefixPath + "/images/" + user.getImage();

            %>

            <a href="#aboutModal" data-toggle="modal" data-target="#myModal"><img
                    src="<%= imgUrl%>"
                    name="aboutme" width="140" height="140" class="img-circle"></a>
            <h3>${user2.fname}</br> ${user2.lname}</h3>
            <small style="color: #0f0f10">cliquer sur moi pour plus d'information</small>
        </center>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title" id="myModalLabel">A propos de ${user2.fname}</h4>
                </div>
                <div class="modal-body">
                    <center>

                        <img src="<%= imgUrl%>"
                             name="aboutme" width="140" height="140" border="0" class="img-circle"></a>
                        <h3 class="media-heading">${user2.fname} </br>
                            ${user2.lname}

                        </h3>

                        <a src="">
                            <button type="button" class="btn btn-primary">Envoyez moi un message</button>
                        </a>
                    </center>
                    <hr>
                    <center>
                        <p style="color: #0c0c0c" class="text-left"><strong
                                style="color: #0c0c0c">Description: </strong><br>${user2.description}</p>
                        <br>
                    </center>
                </div>
                <div class="modal-footer">
                    <center>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Quitter
                        </button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="parts/footer.jsp" %>

</body>