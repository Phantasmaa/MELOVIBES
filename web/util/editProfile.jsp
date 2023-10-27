<%@ include file="getUser.jsp" %>
<%@ include file="validSesion.jsp" %>
<%@page import="beans.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <%
           
            String userName = request.getParameter("Nickname");
            String name = request.getParameter("Name");
            String lastName = request.getParameter("lastName");
            String city = request.getParameter("City");
            int age = Integer.parseInt(request.getParameter("Age"));
            String phoneNumber = request.getParameter("phoneNumber");
            String gender = request.getParameter("gender");
            String bio = request.getParameter("bio");
            int userID = Integer.parseInt(request.getParameter("userID"));
            
            
            
            User u = new User();  
            u.editUser(userName, name, lastName, city, age, phoneNumber, gender, bio, userID);
 /*
            String userName = request.getParameter("Nickname");
            String city = request.getParameter("City");
            int age = Integer.parseInt(request.getParameter("Age"));
            int userID = Integer.parseInt(request.getParameter("userID"));
            
            User u = new User();  
            u.editUser(userName, city, age, userID);*/
                
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("logueado"); 
            sesion.invalidate();
            // u.getProfile(); // Asume que este método recupera el perfil del usuario           
            //session.setAttribute("profile", u.getProfile());
            response.sendRedirect("../views/log/login.jsp");
        %>

    </body>
</html>
