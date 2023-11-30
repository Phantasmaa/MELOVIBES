<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../../content/Images/Autenticacion/logoMeloVibeBrowserTab.png">
    <title>Restablecer Contrase�a | Melovibe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../../content/Styles/Autenticacion/restablecerContrasena.css">
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
                    <form action="RestorePasswordServlet" class="row justify-content-around" method="post" autocomplete="off">
                        <input id="email" name="email" type="email" class="text-field form-input" placeholder="Email">
                        <button id="sendCodeBtn" type="submit" class="btn form-input" onclick="location.href='login.jsp'">Enviar C�digo</button>
                        <p class="form-input">Volver a la <a href="../../" class="link">Página Principal</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
