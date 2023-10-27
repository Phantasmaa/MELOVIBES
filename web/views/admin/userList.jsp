<%@include file="../../util/validSesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@include file="headJSP.jsp" %>
        <title>Administrar Perfiles | MeloVibe</title>
        <link rel="stylesheet" href="../../content/Styles/Administracion/adminPerfilesStyles.css" />
    </head>

    <body>
        <div class="row">
            <%@include file="leftMenu.jsp" %>

            <div class="container-fluid col-md-10" id="contenido">
                <div id="bienvenida">Bienvenido, admin!</div>
                <div class="container-fluid p-3">
                    <h4>Lista de Usuarios</h4>
                    <button class="btn btn-primary my-2" data-bs-toggle="modal" id="btn-crearUsuario" 
                            data-bs-target="#CrearUsuarioModal">Crear usuario <i
                            class="bi bi-plus-lg"></i></button>
            
                    <div class="row my-2">
                        <div class="col-10">
                            <input type="text" id="textSearch" class="form-control">
                        </div>
                        <div class="col-2">
                            <button id="btn-buscarUsuario" class="btn btn-primary">Buscar Usuario</button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="">
                            <thead class="text-center">
                                <tr>
                                    <th class="col1 text-center">ID</th>
                                    <th class="col2">Correo</th>
                                    <th class="col3">Nickname</th>
                                    <th class="col4">Nombre</th>
                                    <th class="col5">Apellido</th>
                                    <th class="col6">Acciones</th>
                                </tr>
                            </thead>
                            <tbody class="text-left">
                                <%
                                    for (int i = 0; i < 15; i++) {
                                %>
                                <jsp:include page="modelExample/user.jsp" />
                                <%
                            }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
         
                            
                          
        <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" id="eliminationWarningModal"
             tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">¿Estás seguro de que quieres eliminar este
                            usuario?</h1>
                    </div>
                    <div class="modal-body">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-4 text-center">
                                <img src="../../content/Images/Administracion/warningHexagon.png" alt="warningHexagon"
                                     class="warningHexagon">
                            </div>
                            <div class="col-7 row">
                                <div class="col-4 text-left">
                                    <p class="id">ID:</p>
                                    <p class="email">Correo:</p>
                                    <p class="username">Usuario:</p>
                                    <p class="name">Nombres:</p>
                                    <p class="surname">Apellidos:</p>
                                </div>
                                <div class="col-8 text-left">
                                    <p id="idInfo">45</p>
                                    <p id="emailInfo">correo@ejemplo.com</p>
                                    <p id="username">Fulano</p>
                                    <p id="nameInfo">Pepe</p>
                                    <p id="surnameInfo">Lapeluda</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-danger" onclick="location.href = 'userList.jsp'">Si, eliminar usuario</button>
                    </div>
                </div>
            </div>
        </div>
                            
        <div class="modal fade StylesCrearUsuarioModal" id="CrearUsuarioModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="CrearUsuarioModalLabel" aria-hidden="true">
        <div class="modal-dialog " id="FormularioRegistro">
          <div class="modal-content " id="RegistrarUsuarioCuadroModal">
            <div class="modal-header text-center">
              <h1 class="modal-title fs-5" id="CrearUsuarioModalLabel">Por favor ingrese la información basica para registrar Usuario </h1>
            </div>
            <div class="modal-body" >
                <form class="row align-items-center justify-content-center">
                    <div class="row mb-3">
                        <label for=user" class="col-sm-2 col-form-label">Usuario</label>
                        <div class="col-sm-10">
                          <input id="user" name="user" type="text" class="form-control text-field" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="email" class="col-sm-2 col-form-label">E-mail</label>
                        <div class="col-sm-10">
                            <input id="email" name="email" type="email" class="form-control text-field" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="names" class="col-sm-2 col-form-label">Nombre</label>
                        <div class="col-sm-4">
                            <input id="names" name="names" type="text" class="form-control text-field" required>                        
                        </div>
                        <label for="surname" class="col-sm-2 col-form-label text-start">Apellido</label>
                        <div class="col-sm-4">
                            <input id="surname" name="surname" type="text" class="form-control text-field" required>                      
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="password" class="col-sm-2 col-form-label text-start">Contraseña</label>
                        <div class="col-sm-10">
                            <input id="password" name="password" type="password" class="form-control text-field " required>                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="city" class="col-sm-2 col-form-label">Ciudad</label>
                        <div class="col-sm-6">
                            <input id="city" name="city" type="text" class="form-control text-field" required>
                        </div>
                        <label for="age" class="col-sm-2 col-form-label text-start">Edad</label>
                        <div class="col-sm-2">
                            <input id="age" name="age" type="text" class="form-control text-field" maxlength="2" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="phoneNumber" class="col-sm-2 col-form-label">Teléfono</label>
                        <div class="col-sm-4">
                            <input id="phoneNumber" name="phoneNumber" type="text" class="form-control text-field" maxlength="9" required>
                        </div>
                        <label for="gender" class="col-sm-2 col-form-label text-start">Género</label>
                        <div class="col-sm-4">
                            <select class="form-select" aria-label="Selección Genero" id="GeneroSelect" required>
                                <option disabled selected>Género</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                                <option value="Otro">Otro</option>
                              </select>
                        </div>
                    </div>
                    
                </form>
    
            </div>
            <div class="modal-footer" id="BotonCredencial">
                <button type="button" class="btn btn-secondary mb-3" data-bs-dismiss="modal">Cancelar<i class="bi bi-pause-fill"></i></button>
                <button type="button" class="btn btn-primary mb-3" id="GuardarRegistro">Si, Registrar Usuario <i class="bi bi-play-fill"></i></button>
            </div>                   
          </div>
        </div>
      </div>                
        
                            
        <script src="../../util/script/logOutScript.js"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        
        <script>
                document.addEventListener("DOMContentLoaded", function(event) {
                    var tab1, tab2;
                    tab1 = document.getElementById("LeftMenu-Perfiles");
                    tab2 = document.getElementById("LeftMenu-Publicaciones");
                   
                    tab1.classList.remove("link_feed_selected");
                    tab2.classList.remove("link_feed_selected");
                    
                    tab1.classList.remove("links_feed");
                    tab2.classList.remove("links_feed");
                   
                    
                    tab2.classList.add("links_feed");
                    
                    tab1.classList.add("link_feed_selected");
                    
                });
            </script>
        
    </body>

</html>