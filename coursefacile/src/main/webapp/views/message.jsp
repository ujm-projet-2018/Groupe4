<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <%@ include file="parts/meta.jsp" %>
    <title>Course faciles | upload</title>
    <%@ include file="parts/styles.jsp" %>
</head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title>
</head>
<body>
<%@ include file="parts/header.jsp" %>
<%

    User user = UserHandler.getLoggedInUser(request);
    String imgUrl = prefixPath + "/images/" + user.getImage();

%>
<div class="container">
    <h2>${requestScope.message} </h2>
    <img src="<%= imgUrl%>" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">


    <a href="<%=prefixPath%>/profile">
        <button type="button" class="btn btn-success">revenir au profil</button>
    </a>
</div>

<%@ include file="parts/footer.jsp" %>

</body>
</html>