<%--
  Created by IntelliJ IDEA.
  User: Phantasma
  Date: 27/11/2023
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nueva contraseña</title>
</head>
<body>
<form action="NewPasswordServlet" class="row justify-content-around" method="post" autocomplete="off">
    <input id="password" name="password" type="password" class="text-field form-input" placeholder="Ingrese la nueva Contraseña">
    <input id="passConfirm"  type="password" class="text-field form-input" placeholder="Confirme contraseña">
    <button id="sendCodeBtn" type="submit" class="btn form-input" onclick="location.href='login.jsp'">Aceptar</button>
    <p class="form-input">Volver a la <a href="../../" class="link">P�gina Principal</a></p>
</form>
</body>
</html>
