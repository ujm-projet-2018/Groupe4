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

<body class="fix-header fix-sidebar">
<%@ include file="parts/header.jsp" %>

    <center>
        <h1>File Upload</h1>
        <form method="post" action="UploadServlet"
              enctype="multipart/form-data">
        <span class="btn btn-default btn-file">
    Browse <input name="file" type="file">
             <br/> <input type="submit" value="Upload"/>
</span>



</form>

</center>
<%@ include file="parts/footer.jsp" %>

</body>
</html>