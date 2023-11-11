<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Felicidades, te has autenticado con éxito</h1>

        <%
            User user = (User) session.getAttribute("usuario");

            if (user != null) {
        %>
        <h1>ID: <%= user.getUserID() %></h1>
        <h1>Correo: <%= user.getEmail() %></h1>
        <h1>Contraseña: <%= user.getPassword() %></h1>
        <h1>Nombre: <%= user.getFirstName() %> <%= user.getLastName() %></h1>
        <h1>Nombre de Usuario: <%= user.getUserName() %></h1>
        <h1>Imagen de Usuario: <%= user.getUserImage() %></h1>
        <h1>Ciudad: <%= user.getCity() %></h1>
        <h1>Edad: <%= user.getAge() %></h1>
        <h1>Biografía: <%= user.getBio() %></h1>
        <h1>Número de Teléfono: <%= user.getPhoneNumber() %></h1>
        <h1>Género: <%= user.getGender() %></h1>

        <form action="CerrarSesionServlet" method="post">
            <input type="submit" value="Cerrar Sesión">
        </form>
        <%
            } else {
        %>
        <h1>No se encontraron datos del usuario en la sesión.</h1>
        <%
            }
        %>
    </body>
</html>
