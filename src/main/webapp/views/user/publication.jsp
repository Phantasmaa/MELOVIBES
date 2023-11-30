<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Publication" %>
<%@ page import="models.User" %>
<%@ page import="models.PublicationNormal" %>
<%@ page import="models.Comment" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    User user = (User) session.getAttribute("usuario");
    PublicationNormal publication = (PublicationNormal) request.getAttribute("publication");
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png" />
        <title>Inicio | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>

        <div class="row vh-100">
            <%@include file="../menus/leftMenuPubs.jsp" %>

            <div class="container-fluid col-md-8" id="contenido">

                        <div id="bienvenida" class="row justify-content-between">
                            <div class="col-6 text-start">
                                <a href="feed" class="backBtn">
                                    <i class="bi bi-arrow-left"></i> Atras
                                </a>
                            </div>
                            <div class="col-2 text-end">
                                Publicaciones
                            </div>
                        </div>


                        <div class="text-center pt-4" id="pubs">
                            <!-- Itera sobre las publicaciones del perfil -->

                            <div class="row">
                                <div class="col-2">
                                    <a href="otherProfile.jsp"><img class="postProfilePicture" src="<%=publication.getUser().getUserImage()%>" alt=""> </a>

                                    <%-- src="<%= publication.getProfile().getUserImage() %>" alt="" --%>
                                </div>
                                <div class="col-9">
                                    <div class="row justify-content-between text-start">
                                        <div class="col-4">
                                            <p class="authorNickname"
                                                onclick=""
                                                 style="cursor: pointer;">
                                                 <%=publication.getUser().getUserName()%>
                                            </p>

                                             <%-- <p class="authorNickname"
                                                onclick="location.href = 'otherProfile.jsp?userID=<%= profile.getProfileID() %>'"
                                                style="cursor: pointer;">
                                                <%= publication.getProfile().getUserName() %>
                                            </p> --%>

                                        </div>
                                        <div class="col-2 text-end">
                                            <!-- Muestra la fecha de la publicación -->
                                            <p><i class="bi bi-clock"></i>
                                                <%=publication.getDate()%>
                                            </p>

                                            <%--
                                            <p><i class="bi bi-clock"></i>
                                                <%= publication.getCalendar().getDate() %>
                                            </p>
                                            --%>
                                        </div>
                                    </div>

                                    <p class="text-start postContent">
                                        <%=publication.getContent()%>
                                        </p>

                                    <%--
                                    <p class="text-start postContent">
                                        <%= publication.getContent() %>
                                    </p>
                                    --%>

                                    <div>
                                        <img class="postContentPicture"
                                            src="<%=publication.getImage()%>"
                                            alt="">
                                    </div>
                                    <div class="row justify-content-start interactionBtnRow text-start mt-2">
                                         <div class="col-2">
                                             <p onclick="" id="">
                                             <i class="bi bi-music-note" style="cursor: pointer;"></i> 6 likes
                                             </p>
                                         </div>
                                         <div class="col-4">
                                             <p><button data-bs-toggle="modal" data-bs-target="#comentarModal" class="boton-transp"> <i class="bi bi-music-note-list" style="cursor: pointer;"></i> </button> <%= publication.getNComment() %>  comentarios</p>
                                         </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-around" id="commentsSection">
                                <% if (comments != null && !comments.isEmpty()) { %>
                                <% Collections.reverse(comments); %>
                                <% for (Comment comment : comments) { %>
                                <div class="col-8 row">
                                    <div class="col-2">
                                        <a href="otherProfile.jsp">
                                            <img class="commentProfilePicture" src="<%= comment.getUser().getUserImage() %>" alt="profilePicture">
                                        </a>
                                    </div>
                                    <div class="col-10 row text-start">
                                        <div class="col-12">
                                            <p class="commentAuthorNickname" onclick="" style="cursor: pointer;">
                                                <b><%= comment.getUser().getUserName() %></b> · <%= comment.getDate() %>
                                            </p>
                                        </div>
                                        <div class="col-12">
                                            <p class="commentContent">
                                                <%= comment.getContentComment() %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                                <% } else { %>
                                <p>No hay comentarios disponibles.</p>
                                <% } %>
                            </div>
                        </div>
                    </div>

                <%@include file="../menus/rightMenu.jsp" %>

        </div>

        <div class="modal fade" id="createPublicationModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h1 class="modal-title fs-5" id="createPublicationLabel">Crear Publicación</h1>
                    </div>
                    <div class="modal-body text-center">
                        <!-- Formulario para crear publicación -->
                        <form action="CreateComment?type=normal" method="post" enctype="multipart/form-data">
                            <div class="my-3">
        <textarea name="publicationTextContent" cols="60" rows="7" placeholder="Tu publicación..."
                  spellcheck="false"></textarea>
                            </div>
                            <div class="my-3">
                                <input type="file" name="imageInput" accept="image/*">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-editPublication">Crear publicación</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false"
            id="comentarModal" tabindex="-1" aria-labelledby="comentarModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" >
                    <div class="modal-header">
                        <!-- Botón de cerrar ("x") -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="TamañoModal">
                       <div class="row">

                                               <div class="col-9">
                                                   <div class="row justify-content-between text-start">
                                                       <div class="col-2">
                                                           <p class="authorNickname">
                                                               <%=user.getUserName()%>
                                                           </p>
                                                       </div>
                                                       <div class="col-2 text-end px-0">
                                                           <%
                                                               Date currentDate = new Date();
                                                               SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                                                               String formattedTime = timeFormat.format(currentDate);
                                                           %>
                                                           <p><i class="bi bi-clock"></i> <%=formattedTime%> </p>
                                                       </div>

                                                       <img class="postContentPicture" src="" alt="">
                                                   </div>

                                               </div>
                                           </div>

                        <div class="row align-items-start">
                            <!-- Columna para la foto de perfil -->
                            <div class="col-1 ml-2" id="marginPictureRespuesta">
                                <img class="postProfilePictureRespuesta" src="<%=user.getUserImage()%>" alt="">
                            </div>
                            <div class="col-11">
                                <form action="CreateComment" method="post">
                                    <textarea class="form-control comment-input mt-2" name="commentContent" rows="3" placeholder="Escribe un comentario..."></textarea>
                                    <input type="hidden" name="userID" value="<%=user.getUserID()%>">
                                    <input type="hidden" name="publicationID" value="<%=publication.getPublicationID()%>">
                                    <input type="hidden" name="type" value="normal">

                                    <div class="row">
                                        <div class="col-2 mt-3" style="text-align: right;">
                                            <button type="submit" class="btn-enviar">
                                                Enviar <i class="bi bi-send-fill" style="margin-left: 5px;"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>



                    </div>

                </div>
            </div>


        <script>
            function redirectToOtherProfile(userID) {
                location.href = 'OtherProfile?userID=' + userID;
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function (event) {
                var tab1, tab2, tab3;
                tab1 = document.getElementById("LeftMenu-inicio");
                tab2 = document.getElementById("LeftMenu-marketplace");
                tab3 = document.getElementById("LeftMenu-perfil");
                tab1.classList.remove("link_feed_selected");
                tab2.classList.remove("link_feed_selected");
                tab3.classList.remove("link_feed_selected");
                tab1.classList.remove("links_feed");
                tab2.classList.remove("links_feed");
                tab3.classList.remove("links_feed");
                tab2.classList.add("links_feed");
                tab3.classList.add("links_feed");

                tab1.classList.add("link_feed_selected");

            });

            function uploadImage() {
                alert("Este boton solicitara subir una imagen");
            }
        </script>

        <!-- Script para validar 1000 caracteres en la publicación -->
        <script>
            const itemDescription = document.getElementById("publicationTextContent");
            const maxCharacters = 1000;

            itemDescription.addEventListener("input", function () {
                const remainingCharacters = maxCharacters - itemDescription.value.length;

                if (itemDescription.value.length > maxCharacters) {
                    itemDescription.value = itemDescription.value.slice(0, maxCharacters); // Selecciona solo los primeros 1000 caracteres
                }
            });
        </script>

         <script>
             function toggleLike(publicationID) {
                 var likeButton = document.getElementById('likeButton' + publicationID);
                 var icon = likeButton.querySelector('i');

                 if (icon.classList.contains('liked')) {
                     icon.classList.remove('liked');

                 } else {
                     icon.classList.add('liked');

                 }
             }
         </script>


    </body>

</html>