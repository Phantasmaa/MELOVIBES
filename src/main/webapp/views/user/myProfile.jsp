<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<%@ page import="models.Publication" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>

<% User user = (User) session.getAttribute("usuario"); %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png"/>
        <title>Mi Perfil | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
        <link rel="stylesheet" href="../../content/Styles/Usuario/miPerfilStyles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="row vh-100">
            <%@include file="../menus/leftMenuEmpty.jsp" %>

            <div class="container-fluid col-md-10" id="contenido">
                <div class="container-fluid p-3">
                    <div class="row">
                        <div class="col-3 text-center">
                            <div id="profileCard" class="shadow p-3 mb-5">
                                <h2><%= user.getUserName() %> <i class="bi bi-soundwave"></i></h2>
                                <div class="my-4">
                                    <img class="profilePicture" src="<%=user.getUserImage() %>" alt="profilePicture">                               

                                </div>
                                <button class="btn btn-lg btn-secondary my-3" onclick= "location.href = 'editProfile.jsp'">Editar perfil 
                                    <i class="bi bi-pencil"></i>  </button>
                            </div>
                            <div class="stats mt-5">
                                <p><i class="bi bi-music-note-list"></i> Publicaciones <span>120</span></p>
                                <p><i class="bi bi-music-note"></i> Me gustas <span>574</span></p>
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="row">
                                <div class="col-6 details">
                                    <h3>Sobre mí</h3>
                                    <p class="Info">
                                        <%if (user.getBio() == null) {%>Sin biografía<%} else {%><%= user.getBio() %><%}%>
                                    </p>

                                </div>
                                <div class="col-6 details">
                                    <h3>Detalles</h3>
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="labelInfo">Nickname</label>
                                            <p class="Info"><%= user.getUserName() %></p>
                                            <label class="labelInfo">Ciudad <i class="bi bi-geo-alt"></i></label>
                                            <p class="Info"><%= user.getCity() %></p>
                                            <label class="labelInfo">Teléfono <i class="bi bi-telephone"></i></label>
                                            <p class="Info"><%= user.getPhoneNumber() %></p>
                                        </div>
                                        <div class="col-6">
                                            <label class="labelInfo">Nombre</label>
                                            <p class="Info"><%= user.getFirstName() + ' ' +user.getLastName() %></p>
                                            <label class="labelInfo">Edad <i class="bi bi-cake2"></i></label>
                                            <p class="Info"><%= user.getAge() %> años</p>
                                            <label class="labelInfo">Género <i class="bi bi-person-circle"></i></label>
                                            <p class="Info"><%= user.getGender() %></p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col12">
                                    <%
                                        List<Publication> publications = (List<Publication>) request.getAttribute("publications");

                                        if (publications != null && !publications.isEmpty()) {
                                            for (Publication publication : publications) {
                                                // Obtener información de la publicación
                                                int publicationID = publication.getPublicationID();
                                                String content = publication.getContent();
                                                String image = publication.getImage();
                                                User publicationUser = publication.getUser();
                                                String authorNickname = publicationUser.getUserName(); // Cambiar a getUserName o el método correcto de User
                                                Timestamp date = publication.getDate();
                                                //int likes = publication.getLikes(); // Asumiendo que Publication tiene un método getLikes()
                                                //int comments = publication.getComments(); // Asumiendo que Publication tiene un método getComments()

                                                // Formatear la fecha
                                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
                                                String formattedDate = dateFormat.format(date);
                                    %>
                                    <div class="row">
                                        <div class="col-2">
                                            <a href="otherProfile.jsp">
                                                <img class="postProfilePicture" src="<%=user.getUserImage() %>" alt="Profile Picture">
                                            </a>
                                        </div>
                                        <div class="col-10">
                                            <div class="row justify-content-between text-start">
                                                <div class="col-2">
                                                    <p class="authorNickname" onclick="location.href = 'otherProfile.jsp'" style="cursor: pointer;">
                                                        <%= authorNickname %>
                                                    </p>
                                                </div>
                                                <div class="col-2 text-end">
                                                    <p><i class="bi bi-clock"></i> <%= formattedDate %></p>
                                                </div>
                                            </div>
                                            <p class="text-start postContent">
                                                <%= content %>
                                            </p>
                                            <%-- Verificar si hay una imagen antes de mostrarla --%>


                                            <div>
                                                <img class="postContentPicture" src="<%= image %>" alt="">
                                            </div>




                                                
                                            <form class="mt-3" action="DeletePublicationNormal" method="post">
                                                <input type="hidden" name="publicationID" value="<%=publicationID %>">
                                                <input type="submit" value="Eliminar Publicación">
                                            </form>

                                            <div class="row justify-content-start interactionBtnRow text-start mt-2">
                                                <div class="col-2">
                                                   <p onclick="toggleLike('<%= publication.getPublicationID() %>')" id="likeButton<%= publication.getPublicationID() %>">
                                                       <i class="bi bi-music-note" style="cursor: pointer;"></i> <%//= publication.getLikes() %> likes
                                                   </p>
                                                </div>
                                                <div class="col-3">
                                                    <p><i class="bi bi-music-note-list"></i> <%= publication.getNComment() %> comentarios</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            }
                                        } else {
                                    %>
                                    <p>No hay publicaciones disponibles.</p>
                                    <%
                                        }
                                    %>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>



        </div>
        <script src="../../util/script/logOutScript.js">
        </script>
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
                tab1.classList.add("links_feed");
                tab2.classList.add("links_feed");

                tab3.classList.add("link_feed_selected");

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