<%@include file="../../util/validSesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <button class="btn btn-primary my-2" id="btn-crearPublicacion" data-bs-toggle="modal"  data-bs-target="#createPublicationModal">Crear Publicación <i
                        class="bi bi-plus-lg"></i></button>
                <div class="row my-2">
                    <div class="col-10">
                        <input type="text" id="textSearch" class="form-control">
                    </div>
                    <div class="col-2">
                        <button id="btn-buscarPublicacion" class="btn btn-primary">Buscar Publicación</button>
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
                    <h1 class="modal-title fs-5" id="exampleModalLabel">¿Estás seguro de que quieres eliminar esta
                        publicación?</h1>
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

    <div class="modal fade" id="editPublicationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h1 class="modal-title fs-5" id="editPublicationLabel">Editar Publicacion</h1>
                </div>
                <div class="modal-body text-center">
                    <div class="my-3">
                        <textarea id="publicationTextContent" cols="60" rows="7" placeholder="Tu publicacion..."
                            spellcheck="false">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Odit nesciunt similique optio officia officiis excepturi quaerat maxime ipsa dolore rerum voluptas maiores dolores, corporis, porro inventore culpa fugit! Officiis debitis voluptatem architecto delectus ipsa obcaecati laudantium pariatur perspiciatis molestiae sunt.</textarea>
                    </div>
                    <div class="publicationImageContainer">
                        <img src="../../content/Images/Administracion/postSamplePicture.jpg" alt="postSamplePicture">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-editPublication">Si, editar publicación</button>
                </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="createPublicationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h1 class="modal-title fs-5" id="createPublicationLabel">Crear Publicacion</h1>
                    </div>
                    <div class="modal-body text-center">
                        <div class="my-3">
                            <textarea id="publicationTextContent" cols="60" rows="7" placeholder="Tu publicacion..."
                                spellcheck="false"></textarea>
                        </div>
                        <div class="publicationImageContainer" style="cursor: pointer;" onclick="uploadImage();">
                            <div class="uploadImage text-center">
                                <p class="">Subir Foto <i class="bi bi-upload"></i></p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-editPublication">Si, crear publicación</button>
                    </div>
                </div>
            </div>
        </div>
                                
                                
    <script src="../../util/script/logOutScript.js"></script>
</body>
<script src="../../util/script/logOutScript.js">     
</script>
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
                   
                    
                    tab1.classList.add("links_feed");
                    
                    tab2.classList.add("link_feed_selected");
                    
                });
                function uploadImage(){
                    alert("Este boton solicitara subir una imagen");
                }
            </script>
</html>
