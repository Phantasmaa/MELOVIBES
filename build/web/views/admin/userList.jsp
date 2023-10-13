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
                    <button class="btn btn-primary my-2" id="btn-crearUsuario">Crear usuario <i
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
                        <h1 class="modal-title fs-5" id="exampleModalLabel">�Est�s seguro de que quieres eliminar este
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

        <script src="../../util/script/logOutScript.js"></script>
    </body>

</html>