<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<%@ page import="dao.UserDAO" %>
<% User user = (User) session.getAttribute("usuario");%>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../content/Images/logoMeloVibeBrowserTab.png">
        <title>Editar Perfil | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
        <link rel="stylesheet" href="../../content/Styles/Usuario/EditarPerfil.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="row vh-100">

            <%@include file="../menus/leftMenuEmpty.jsp" %>

            <div class="container-fluid col-md-10 row" id="contenido">
                 <div class="col-2"> </div>
                <div class="col-8" id="advertencia">
                                    <div id="profileInfo" class="shadow p-3 mb-5">
                                        <h2>Eliminar Perfil</h2>
                                                        <div class="row mb-3"">
                                                            <div class="col-12">
                                                                <p></p>
                                                                <p>Hola, <strong>Juan Guarnizo!</strong> </p>
                                                                <p>Lamentamos profundamente que hayas decidido dejar de formar parte
                                                                    de nuestra comunidad en MELOVIBE. Para continuar con la eliminación de tu perfil,
                                                                    por favor ingresa los siguientes datos solicitados.</p>
                                                                <hr>
                                                                <h5>Ingrese sus credenciales</h5>
                                                                <form action="DeleteUserServlet" method="post">
                                                                    <div class="row mb-3">
                                                                        <div class="col-1"></div>
                                                                        <div class="col-3">
                                                                            <label for="email" class="form-label mr-2">Correo Electrónico</label>
                                                                        </div>
                                                                        <div class="col-7">
                                                                            <input type="email" class="form-control" id="email" name="email" placeholder="example@gmail.com">
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mb-3">
                                                                        <div class="col-1"></div>
                                                                        <div class="col-3">
                                                                            <label for="password" class="form-label mr-2">Contraseña</label>
                                                                        </div>
                                                                        <div class="col-7">
                                                                            <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña">
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                    <p>Por favor, ten en cuenta que la eliminación de tu cuenta resultará en la pérdida permanente de tu información,
                                                                        historial y cualquier otro dato asociado a tu cuenta. No podrás acceder a tu cuenta después de este
                                                                        proceso y cualquier contenido relacionado se eliminará de forma irreversible.</p>
                                                                    <div class="row mt-4 mb-3 justify-content-center">
                                                                        <div class="col-3">
                                                                                <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminarPerfilModal">Eliminar Perfil <i class="bi bi-trash"></i></button>
                                                                        </div>
                                                                        <div class="col-9"></div>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                        </div>
                                    </div>
                <div class="col-2"> </div>
                </div>
                   </div>
                </body>
                <script>
                    function redirigirAPagina() {
                        window.location.href = 'deleteUser.jsp'; // Redirige a la página deleteUser.jsp
                    }
                </script>
            </html>
