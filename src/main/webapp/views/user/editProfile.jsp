<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<%@ page import="dao.UserDAO" %>
<% User user = (User) session.getAttribute("usuario");%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../content/Images/logoMeloVibeBrowserTab.png">
        <title>Editar Perfil | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/EditarPerfil.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="row vh-100">

            <%@include file="../menus/leftMenuEmpty.jsp" %>

            <div class="container-fluid col-md-10" id="contenido">
                <div id="bienvenida">Editar Perfil</div>
                <div class="row">
                    <div class="col-md-3" id="CambiarFoto">
                        <div>Mi Foto <i class="bi bi-soundwave"></i></div>
                        <div>
                            <img src="<%=user.getUserImage() %>" alt="Foto" class="img-fluid rounded-circle mt-4" width="250">
                            <div class="mt-4" ><button type="button" class="btn btn-primary btn-lg" id="Foto">Subir Foto <i class="bi bi-upload"></i></button></div>
                        </div>
                    </div>
                    <div class="col-md-7" id="EditarDatos">
                        <h4>Datos Personales</h4>
                        <form action="EditUserServlet" method="post"> 
                            <div class="col-md-12 mb-1">
                                <label for="Nickname" class="form-label" >Nickname </label>
                                <input type="text" class="form-control" id="Nickname" name="Nickname" placeholder="Nickname" value="<%= user.getUserName() %>">
                            </div>
                            <div class="row mb-1">
                                <div class="col-md-6">
                                    <label for="Nombre" class="form-label">Nombre </label>
                                    <input type="text" class="form-control" id="Nombre" name="Name" placeholder="Nombre" value="<%= user.getFirstName() %>" >
                                </div>
                                <div class="col-md-6">
                                    <label for="Apellido" class="form-label">Apellido</label>
                                    <input type="text" class="form-control" id="Apellido" name="lastName" placeholder="Apellido" value="<%= user.getLastName() %>" >
                                </div>
                            </div>
                            <div class="row mb-1">
                                <div class="col-md-6">
                                    <label for="Ciudad" class="form-label">Ciudad </label>
                                    <input type="text" class="form-control" id="Ciudad" name="City" placeholder="Ciudad" value="<%= user.getCity() %>">
                                </div>
                                <div class="col-md-6">
                                    <label for="Edad" class="form-label">Edad</label>
                                    <input type="number" class="form-control" id="Edad" name="Age" placeholder="Edad" value="<%= user.getAge() %>">
                                </div>
                            </div>
                            <div class="row mb-1">
                                <div class="col-md-6">
                                    <label for="Telefono" class="form-label">Teléfono </label>
                                    <input type="tel" class="form-control" id="Telefono" name="phoneNumber" placeholder="(+51) xxx xxx xxx" value="<%= user.getPhoneNumber() %>">
                                </div>
                                <div class="col-md-6">
                                    <label for="Género" class="form-label">Género </label>
                                    <select class="form-select" name="gender" aria-label="Slección Genero">
                                        <option value="Masculino" selected>Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                        <option value="Otro">Otro</option>
                                    </select>
                                </div>
                                <div class="col-md-12 mb-1">
                                    <label for="Biografia" class="form-label" >Biografia </label>
                                    <textarea class="form-control" id="Biografia" name="bio" rows="4" ><%if (user.getBio() == null) {%>Sin biografía<%} else {%><%= user.getBio() %><%}%></textarea>
                                </div>
                                <input type="hidden" name="userID" value="<%= user.getUserID() %>"> 
                                <div class="d-grid gap-4 d-md-flex justify-content-md-between" id="Botones">
                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#CredencialesModal" id="Eliminar" onclick="redirigirAPagina()">Eliminar Perfil <i class="bi bi-trash-fill"></i></button>

                                    <div class="text-md-end">
                                        <button type="button" class="btn btn-secondary btn-md" id="Cancelar" onclick="location.href = 'myprofile'">Cancelar <i class="bi bi-pause-fill"></i></button>
                                        <button type="submit" class="btn btn-primary btn-md" id="Guardar">Guardar <i class="bi bi-play-fill"></i></button>
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>          
            </div>
        </div>     


    </body>

    <script>
        function redirigirAPagina() {
            window.location.href = 'deleteUser.jsp'; // Redirige a la página deleteUser.jsp
        }
    </script>


</html>