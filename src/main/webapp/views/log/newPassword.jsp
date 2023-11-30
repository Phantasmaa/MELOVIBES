<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../../content/Images/Autenticacion/logoMeloVibeBrowserTab.png">
    <title>Nueva Contraseña | Melovibe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../../content/Styles/Autenticacion/nuevaContrasena.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-6 banner-container">
                <img src="../../content/Images/Autenticacion/bannerInicioSesion.jpg" class="banner" alt="Banner MeloVibe">
            </div>
            <div class="col-6 row justify-content-center align-content-center">
                <img src="../../content/Images/Autenticacion/logoMeloVibe.png" class="logoMeloVibe" alt="Logo de MeloVibe">
                <div class="col-6 text-center">
                    <p class="fw-bold welcome-msg">Restablece tu contraseña</p>
                    <form action="#" class="row justify-content-around" autocomplete="off">
                        <form action="NewPasswordServlet" class="row justify-content-around" method="post" autocomplete="off">
                            <input id="password" name="password" type="password" class="text-field form-input" placeholder="Ingrese la nueva Contraseña">
                            <input id="passConfirm"  type="password" class="text-field form-input" placeholder="Confirme contraseña">
                            <button id="sendCodeBtn" type="submit" class="btn form-input" onclick="location.href='login.jsp'">Aceptar</button>
                            <p class="form-input">Volver a la <a href="../../" class="link">Página Principal</a></p>
                        </form>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!---JAVASCRIPT--->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>
