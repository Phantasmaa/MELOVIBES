<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="content/Images/Autenticacion/logoMeloVibeBrowserTab.png">
    <title>Iniciar Sesión | Melovibe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="content/Styles/Autenticacion/inciarSesionStyles.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-6 banner-container">
                <img src="content/Images/Autenticacion/bannerInicioSesion.jpg" class="banner" alt="Banner MeloVibe">
            </div>
            <div class="col-6 row justify-content-center align-content-center">
                <img src="content/Images/Autenticacion/logoMeloVibe.png" class="logoMeloVibe" alt="Logo de MeloVibe">
                <div class="col-6 text-center">
                    <p class="fw-bold welcome-msg">Bienvenido, inicie sesión</p>
                    <form action="views/log/LoginServlet" class="row justify-content-around" autocomplete="off" method="post">
                        <input id="user" name="user" type="text" class="text-field form-input" placeholder="Correo">
                        <input id="password" name="password" type="password" class="text-field form-input" placeholder="Contraseña">

                        <div class="input-group form-input justify-content-between">
                            <div>
                                <input id="rememberMeCheck" class="checkbox-round" type="checkbox">
                                <label for="rememberMeCheck" class="ms-1">Recordarme</label>
                            </div>
                            <a href="views/log/restorePassword.jsp" class="link">¿Olvidó su contraseña?</a>
                        </div>
                        <button id="logInBtn" type="submit" class="btn form-input">Iniciar Sesión</button>
                        <p class="form-input">Aún no tienes una cuenta? <a href="views/log/register.jsp" class="link">Regístrate!</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
