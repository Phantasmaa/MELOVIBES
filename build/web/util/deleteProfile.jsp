<%@ include file="getUser.jsp" %>
<%@ include file="validSesion.jsp" %>
<%@page import="beans.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
    </head>
    <body>
        <%
            int userID = Integer.parseInt(request.getParameter("userID"));
            
            User u = new User();  
            u.deleteUser(userID);
            
                
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("logueado"); 
            sesion.invalidate();
            // u.getProfile(); // Asume que este método recupera el perfil del usuario           
            //session.setAttribute("profile", u.getProfile());
            response.sendRedirect("../views/log/login.jsp");
        %>
    </body>
</html>
