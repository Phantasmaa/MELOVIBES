<%@include file="../../util/validSesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Información de Perfil</h1>
        <%@include file="../../util/getUser.jsp" %>
        <p><strong>Nombre de Usuario:</strong> <%= (profile != null) ? profile.getUserName() : "Nombre de Usuario por defecto" %></p>
        <p><strong>Ciudad:</strong> <%= (profile != null) ? profile.getCity() : "Ciudad por defecto" %></p>
        <p><strong>Edad:</strong> <%= (profile != null) ? profile.getAge() : 0 %></p>
        <p><strong>Biografía:</strong> <%= (profile != null) ? profile.getBio() : "Biografía por defecto" %></p>
        <p><strong>Teléfono:</strong> <%= (profile != null) ? profile.getPhoneNumber() : "Teléfono por defecto" %></p>
        <p><strong>Género:</strong> <%= (profile != null) ? profile.getGender() : "Género por defecto" %></p>
    </body>
</html>

