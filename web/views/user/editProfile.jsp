<%@ include file="../../util/getUser.jsp" %>
<%@ include file="../../util/validSesion.jsp" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="beans.User" %>
<%@ page import="beans.Profile" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    //HttpSession session = request.getSession();
    //User user = (User) session.getAttribute("user");
    //Profile profile = user.getProfile();
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../Content/Images/logoMeloVibeBrowserTab.png">
    <title>Editar Perfil | MeloVibe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../Content/Styles/Usuario/EditarPerfil.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
</head>
<body>
    <div class="row vh-100">
        
        <%@include file="leftMenu.jsp" %>
        
        <div class="container-fluid col-md-10" id="contenido">
            <div id="bienvenida">Editar Perfil</div>
            <div class="row">
                <div class="col-md-3" id="CambiarFoto">
                    <div>TeoMusicMan <i class="bi bi-soundwave"></i></div>
                    <div>
                        <img src="../../Content/Images/Administracion/usuario.png" alt="Foto" class="img-fluid rounded-circle mt-4" width="250">
                        <div class="mt-4" ><button type="button" class="btn btn-primary btn-lg" id="Foto">Subir Foto <i class="bi bi-upload"></i></button></div>
                    </div>
                </div>
                <div class="col-md-7" id="EditarDatos">
                    <h4>Datos Personales</h4>
                    <form action="ActualizarPerfilServlet" method="post"> <!-- Cambiar 'ActualizarPerfilServlet' por el nombre de tu servlet de actualización -->
                        <div class="col-md-12 mb-1">
                            <label for="Nickname" class="form-label" >Nickname </label>
                            <input type="text" class="form-control" id="Nickname" name="Nickname" placeholder="Nickname" value="<%= profile.getUserName() %>">
                        </div>
                        <div class="row mb-1">
                            <!-- Resto de los campos de datos personales aquí -->
                        </div>
                        <div class="d-grid gap-4 d-md-flex justify-content-md-between" id="Botones">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#CredencialesModal" id="Eliminar">Eliminar Perfil <i class="bi bi-trash-fill"></i></button>
                            <div class="text-md-end">
                                <button type="button" class="btn btn-secondary btn-md" id="Cancelar" onclick="location.href='feed.jsp'">Cancelar <i class="bi bi-pause-fill"></i></button>
                                <button type="submit" class="btn btn-primary btn-md" id="Guardar">Guardar <i class="bi bi-play-fill"></i></button>
                                    </div>
                                </div>
                        </div>
                    </form>
                </div>          
            </div>
         </div>     
    </div>
    <div class="modal fade" id="CredencialesModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="CredencialesModalModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content" id="Credenciales">
            <div class="modal-header text-center">
              <h1 class="modal-title fs-5" id="CredencialesModalModalLabel">Por Favor, Ingrese sus credenciales</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row align-items-center justify-content-center">
                    <div class="col-4 text-center">
                        <img src="../../Content/Images/Administracion/warningHexagon.png" alt="warningHexagon"
                        class="warningHexagon">
                    </div>
                    <div class="col-7 row">
                        <div class="col-md-12">
                            <label for="Correo" class="form-label">Correo</label>
                            <input id="user" type="email" class="text-field form-input" placeholder="example@gmail.com">
                            <label for="Contraseña" class="form-label">Contraseña</label>
                            <input id="password" type="password" class="text-field form-input" placeholder="Contraseña">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div id="BotonCredencial">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar<i class="bi bi-pause-fill"></i></button>

                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminarPerfilModal" id="Eliminar">Continuar <i class="bi bi-play-fill"></i></button>
                </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="eliminarPerfilModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarPerfilModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content" id="eliminarPerfil">
            <div class="modal-body">
                <div class="row align-items-center justify-content-center">
                    <div class="col-4 text-center" id="PreguntaFinal">
                        <img src="../../Content/Images/Administracion/warningHexagon.png" alt="warningHexagon"
                        class="warningHexagon">
                    </div>
                    <div class="col-7 row">
                        <h4>¿Estas seguro que quieres eliminar tu cuenta?</h4>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div id="BotonCredencial">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar<i class="bi bi-pause-fill"></i></button>
                    <button type="button" class="btn btn-danger"id="Eliminar" onclick="location.href='../log/login.jsp'">Si, eliminar Cuenta<i class="bi bi-trash-fill"></i></button>
                </div>
            </div>
          </div>
        </div>
      </div>
        <script src="../../util/script/logOutScript.js">     
    </script>
</body>
</html>