<%@include file="../../util/validSesion.jsp" %>
<%@page import="beans.Profile" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>

        <%
         String userID = request.getParameter("userID");
         String userName = request.getParameter("user");
         String city = request.getParameter("city");
         String age = request.getParameter("age");
         String phoneNumber = request.getParameter("phoneNumber");
         String gender = request.getParameter("gender");
         Profile p = new Profile();
         p.newProfile(userID,userName,city,Integer.parseInt(age),phoneNumber,gender);
         String Mensaje = "Registro exitoso";
         
        HttpSession sesion = request.getSession();
            sesion.removeAttribute("logueado"); 
            sesion.invalidate();
        
        response.sendRedirect("../log/login.jsp");

        %>

    </body>
</html>
