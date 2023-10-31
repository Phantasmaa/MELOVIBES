<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autenticacion</title>
    </head>
    <body>
        <h1>Autenticando ... </h1>
        <jsp:useBean id="user" class="beans.User" scope="session" />
        <jsp:declaration>
            String username;
            String password;
            int log;
        </jsp:declaration>
        <jsp:scriptlet>
            username = request.getParameter("user");
            password = request.getParameter("password");
            log = user.authenticate(username, password);
            if (log == 1) {
                // Inicio de sesión exitoso, guarda la sesión
                HttpSession sesion = request.getSession();
                sesion.setAttribute("logueado", "OK");
                session.setAttribute("user", user);
                // Redirigir a la página de inicio
                response.sendRedirect("../views/user/feed.jsp");
            } else {
                // Autenticación fallida, redirige de nuevo a la página de inicio de sesión con error
                response.sendRedirect("../views/log/login.jsp");
            }
        </jsp:scriptlet>
    </body>
</html>