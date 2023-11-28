<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Publication" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Base64" %>

<% 
    User user = (User) session.getAttribute("usuario");
    List<Publication> publications = (List<Publication>) request.getAttribute("publications");

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
            <%@include file="leftMenu.jsp" %>

            <div class="container-fluid col-md-8" id="contenido">

                <div id="bienvenida" class="row justify-content-between">
                    <div class="col-6 text-start">
                        Bienvenido <b><%=user.getUserName()%></b>
                    </div>
                    <div class="col-2 text-end">
                        Publicaciones
                    </div>
                </div>

                <div class="text-center pt-4" id="pubs">
                    <% if (publications != null && !publications.isEmpty()) { %>
                    <%   Collections.reverse(publications);
                        for (Publication publication : publications) { %>
                    <div class="row">
                        <div class="col-2">
                            <a href="OtherProfile?userID=<%=publication.getUser().getUserID()%>">
                                <img class="postProfilePicture" src="<%= publication.getUser().getUserImage() %>" alt="">
                            </a>
                        </div>
                        <div class="col-9">
                            <div class="row justify-content-between text-start">
                                <div class="col-4">
                                    <p class="authorNickname" onclick="redirectToOtherProfile(<%= publication.getUser().getUserID() %>)" style="cursor: pointer;">
                                        <%= publication.getUser().getUserName() %>
                                    </p>
                                </div>
                                <div class="col-2 text-end">                                  
                                    <p><i class="bi bi-clock"></i> <%= publication.getDate() %></p>
                                </div>
                            </div>
                            <p class="text-start postContent"><%= publication.getContent() %></p>
                            <div>
                                <img class="postContentPicture" src="<%= publication.getImage() %>" alt="">
                            </div>
                            <div class="row justify-content-start interactionBtnRow text-start mt-2">
                                <div class="col-2">
                                    <p><i class="bi bi-music-note-list" style="cursor: pointer;"></i> <%//= publication.getLikes() %></p>
                                </div>
                                <div class="col-3">
                                    <p><i class="bi bi-music-note liked" style="cursor: pointer;"></i> <%//= publication.getComments() %></p>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <% } %>
                    <% } else { %>
                    <p>No hay publicaciones disponibles.</p>
                    <% } %>
                </div>

            </div>

                <%@include file="rightMenu.jsp" %>

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
                        <form action="createPublication" method="post" enctype="multipart/form-data">
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
    </body>

</html>