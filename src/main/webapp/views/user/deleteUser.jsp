<%-- 
    Document   : deleteUser
    Created on : 9 nov. 2023, 21:20:34
    Author     : manue
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
</head>
<body>
    <div class="container">
        <h1>Eliminar Perfil</h1>
        <form action="DeleteUserServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="example@gmail.com">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña">
            </div>
            <button type="submit" class="btn btn-danger">Eliminar Perfil</button>
        </form>
    </div>
</body>
</html>
