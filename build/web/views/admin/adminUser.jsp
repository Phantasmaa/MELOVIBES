<%@include file="../../util/validSesion.jsp" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <%@include file="headJSP.jsp" %>
    <title>Editar Usuario Admin | MeloVibe</title>
    <link rel="stylesheet" href="../../content/Styles/Administracion/adminEditarUsuarioStyles.css" />
</head>

<body>
    <div class="row">
        <%@include file="leftMenu.jsp" %>
        <div class="container-fluid col-md-10" id="contenido">
            <div id="bienvenida" class="row justify-content-between">
                <div class="col-2 text-start" onclick="location.href='userList.jsp'" style="cursor: pointer;">
                    <p><i class="bi bi-caret-left-square"></i> Atrás</p>
                </div>
                <div class="col-2 text-end">
                    <p>Editar Perfil</p>
                </div>
            </div>
            <div class="container p-3">
                <div class="row">
                    <div class="col-3 text-center">
                        <div id="profileCard" class="shadow p-3 mb-5">
                            <h2>JeffMusicMan <i class="bi bi-soundwave"></i></h2>
                            <div class="my-4">
                                <img class="profilePicture" src="../../content/Images/Administracion/usuario.png"
                                    alt="profilePicture">
                            </div>
                            <button class="btn btn-lg btn-secondary my-3">Subir Foto <i
                                    class="bi bi-upload"></i></button>
                        </div>
                    </div>
                    <div class="col-9">
                        <div id="profileInfo" class="shadow p-3 mb-5">
                            <h2>Datos Personales</h2>
                            <div class="row">
                                <div class="col-12">
                                    <form>
                                        <div class="row">
                                            <div class="col-12">
                                                <label for="nickname" class="form-label">Nickname</label>
                                                <input type="text" class="form-control" id="nickname"
                                                    placeholder="Nickname">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <label for="name" class="form-label">Nombre</label>
                                                <input type="text" class="form-control" id="name" placeholder="Nombre">
                                            </div>
                                            <div class="col-6">
                                                <label for="surname" class="form-label">Apellido</label>
                                                <input type="text" class="form-control" id="surname"
                                                    placeholder="Apellido">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <label for="city" class="form-label">Ciudad</label>
                                                <input type="text" class="form-control" id="city" placeholder="Ciudad">
                                            </div>
                                            <div class="col-6">
                                                <label for="age" class="form-label">Edad</label>
                                                <input type="email" class="form-control" id="age" placeholder="Edad">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <label for="phoneNumber" class="form-label">Teléfono</label>
                                                <input type="email" class="form-control" id="phoneNumber"
                                                    placeholder="Telefono">
                                            </div>
                                            <div class="col-6">
                                                <label for="email" class="form-label">Correo</label>
                                                <input type="email" class="form-control" id="email"
                                                    placeholder="Correo">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <label for="biography" class="form-label">Biografía</label>
                                                <textarea id="biography" class="form-control" rows="10"
                                                    placeholder="Biografia"></textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="row mt-4 mb-3 justify-content-center">
                                <div class="col-3">
                                    <button class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#eliminationWarningModal">Eliminar Perfil <i class="bi bi-trash"></i></button>
                                </div>
                                <div class="col-3"></div>
                                <div class="col-2">
                                    <button class="btn btn-info" onclick="location.href='userList.jsp'">Cancelar <i class="bi bi-x-circle-fill"></i></button>
                                </div>
                                <div class="col-2">
                                    <button class="btn btn-secondary" onclick="location.href='userList.jsp'">Guardar <i class=" bi bi-floppy"></i></button>
                                </div>
                            </div>
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
                            <button type="button" class="btn btn-danger" onclick="location.href='userList.jsp'">Si, eliminar usuario</button>
                        </div>
                    </div>
                </div>
            </div>

            <script src="../../util/script/logOutScript.js"></script>
</body>

</html>