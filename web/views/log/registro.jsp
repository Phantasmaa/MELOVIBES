<%-- 
    Document   : registro
    Created on : 26 oct. 2023, 12:47:17
    Author     : manue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         String email = request.getParameter("email");
         String firstName = request.getParameter("names");
         String lastName = request.getParameter("surname");
         String password = request.getParameter("password");
         
         User u = new User();
         u.insertUser(email, firstName, lastName, password);

        %>
        <h1>Hello World!</h1>
    </body>
</html>
