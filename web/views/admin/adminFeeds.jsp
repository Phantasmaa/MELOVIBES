<!DOCTYPE html>
<html lang="es">

<head>
    <%@include file="headJSP.jsp" %>
    <title>Administrar Publicaciones | MeloVibe</title>
    <link rel="stylesheet" href="../../content/Styles/Administracion/adminPublicacionesStyles.css" />
</head>

<body>
    <div class="row">
        <%@include file="leftMenu.jsp" %>

        <div class="container-fluid col-md-10" id="contenido">
            <div id="bienvenida">Bienvenido, admin!</div>
            <div class="container-fluid p-3">
                <h4>Lista de Publicaciones</h4>
                <button class="btn btn-primary my-2" id="btn-crearPublicacion">Crear Publicaci�n <i
                        class="bi bi-plus-lg"></i></button>
                <div class="row my-2">
                    <div class="col-10">
                        <input type="text" id="textSearch" class="form-control">
                    </div>
                    <div class="col-2">
                        <button id="btn-buscarPublicacion" class="btn btn-primary">Buscar Publicaci�n</button>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="">
                        <thead class="text-center">
                            <tr>
                                <th class="col1 text-center">ID</th>
                                <th class="col2">Usuario</th>
                                <th class="col3">Tipo</th>
                                <th class="col4">Fecha</th>
                                <th class="col6">Acciones</th>
                            </tr>
                        </thead>
                        <tbody class="text-left">
                            <%
                                    for (int i = 0; i < 15; i++) {
                                %>
                                <jsp:include page="modelExample/feeds.jsp" />
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
                    <h1 class="modal-title fs-5" id="exampleModalLabel">�Est�s seguro de que quieres eliminar esta
                        publicaci�n?</h1>
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
                                <p class="username">Usuario:</p>
                                <p class="type">Tipo:</p>
                                <p class="date">Fecha:</p>
                            </div>
                            <div class="col-8 text-left">
                                <p id="idInfo">45</p>
                                <p id="usernameInfo">Juanito123</p>
                                <p id="typeInfo">Normal</p>
                                <p id="dateInfo">2023-10-12 18:54:21</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger" onclick="location.href='adminFeeds.jsp'">Si, eliminar publicacion</button>
                </div>
            </div>
        </div>
    </div>

    <script src="../../util/script/logOutScript.js"></script>
</body>
<script src="../../util/script/logOutScript.js">     
</script>
</html>
