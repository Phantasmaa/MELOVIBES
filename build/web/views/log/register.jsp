<%@include file="../../util/validSesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../../content/Images/Autenticacion/logoMeloVibeBrowserTab.png">
    <title>Registro | Melovibe</title>
    <!--Stylesheets-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../../content/Styles/Autenticacion/registroStyles.css">
    <!--Javascripts-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

    <script type="text/javascript" src="../../content/Scripts/Autenticacion/registroScripts.js"></script>
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
                    <p class="fw-bold welcome-msg">Información básica</p>
                    <form id="registroForm" action="iniciarSesion.html" class="row justify-content-around" autocomplete="off">
                        <input id="user" name="user" type="text" class="text-field form-input" placeholder="Usuario" required>
                        <input id="email" name="email" type="email" class="text-field form-input" placeholder="Email" required>
                        <input id="names" name="names" type="text" class="text-field form-input col-6" placeholder="Nombres" required>
                        <input id="surname" name="surname" type="text" class="text-field form-input col-6" placeholder="Apellidos" required>
                        
                        <input id="password" name="password" type="password" class="text-field form-input" placeholder="Contraseña" required>
                        <input id="confirmPassword" name="confirmPassword" type="password" class="text-field form-input" placeholder="Confirmar contraseña" required>
                        <span id="mensajeError"></span>

                        <input id="city" name="city" type="text" class="text-field form-input col-8" placeholder="Ciudad" required>
                        <input id="age" name="age" type="text" class="text-field form-input col-4" placeholder="Edad" maxlength="2" required>
                        <input id="phoneNumber" name="phoneNumber" type="text" class="text-field form-input col-6" placeholder="Teléfono" maxlength="9" required>
                        <div class="col-6 mb-3">
                            <select id="gender" name="gender" class="form-select col-6" aria-label="combo box pequeño" required>
                                <option disabled selected>Género</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </div>
                        
                        <button id="registerBtn" type="submit" class="btn form-input" onclick="clicked(event)">Registrarse</button>
                        <p class="form-input">¿Ya tienes una cuenta? <a href="login.jsp" class="link">Inicia Sesión!</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header text-center">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Te has registrado correctamente.</h1>
            </div>
            <div class="modal-footer text-center">
              <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</body>

</html>
