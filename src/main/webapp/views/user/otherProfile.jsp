<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.Publication" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>

<% 
    User user = (User) session.getAttribute("usuario");
    //List<Publication> publications = (List<Publication>) request.getAttribute("publications");
    User otherUser = (User) request.getAttribute("otherUser");
    
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png" />
        <title>Perfil | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
        <link rel="stylesheet" href="../../content/Styles/Usuario/otroPerfilStyles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">

    </head>
    <body>

        <div class="row vh-100">

            <%@include file="../menus/leftMenuEmpty.jsp" %>

            <div class="container-fluid col-md-8" id="contenido">

                <div id="bienvenida" class="row justify-content-between">
                    <div onclick="goBack()" class="col-2 text-start backBtn" style="cursor: pointer;">
                        <i class="bi bi-caret-left-square"></i> Atras
                    </div>
                    <div class="col-2 text-end">
                        <b> Perfil </b>
                    </div>
                </div>


                <div class="row">
                    <div class="container-flud col-5 text-center mt-4">

                        <h2><%= otherUser.getUserName() %><i class="bi bi-soundwave"></i></h2>
                        <div class="my-4">
                            <img class="profilePicture" src="<%= otherUser.getUserImage() %>" alt="profilePicture">
                        </div>
                        <div class="stats mt-3">
                            <p><i class="bi bi-music-note-list"></i> Publicaciones <span>120</span></p>
                            <p><i class="bi bi-music-note"></i> Me gustas <span>574</span></p>
                        </div>
                    </div>

                    <div class="container-flud col-md-7 mt-4">
                        <h2>Detalles </h2>
                        <div class="row details">
                            <div class="col-6">
                                <label class="labelInfo">Nickname</label>
                                <p class="Info"><%=otherUser.getUserName()%></p>
                                <label class="labelInfo">Ciudad <i class="bi bi-geo-alt"></i></label>
                                <p class="Info"><%=otherUser.getCity()%></p>
                                <label class="labelInfo">Telefono <i class="bi bi-telephone"></i></label>
                                <p class="Info"><%=otherUser.getPhoneNumber()%></p>
                            </div>
                            <div class="col-6">
                                <label class="labelInfo">Edad <i class="bi bi-cake2"></i></label>
                                <p class="Info"><%=otherUser.getAge()%></p>
                                <label class="labelInfo">Genero <i class="bi bi-person-circle"></i></label>
                                <p class="Info"><%=otherUser.getGender()%></p>
                            </div>
                        </div>
                        <div class="Bio mt-3">
                            <h3>Sobre mi</h3>
                            <p><%if (otherUser.getBio() == null) {%>Sin biografía<%} else {%><%= otherUser.getBio() %><%}%></p>
                        </div>
                    </div>

                    <div class="tabRow row mt-3">
                        <div class="text-center">
                            <p>Publicaciones</p>
                        </div>
                    </div>

                    <div class="text-center px-5 pt-4">

                        <div class="row">
                            <div class="col-12">
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
                                            // int likes = publication.getLikes(); // Asumiendo que Publication tiene un método getLikes()
                                            // int comments = publication.getComments(); // Asumiendo que Publication tiene un método getComments()

                                            // Formatear la fecha
                                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
                                            String formattedDate = dateFormat.format(date);
                                %>
                                <div class="row pt-4">
                                    <div class="col-2">
                                        <a href="otherProfile.jsp">
                                            <img class="postProfilePicture" src="<%=publication.getUser().getUserImage() %>" alt="Profile Picture">
                                        </a>
                                    </div>
                                    <div class="col-10">
                                        <div class="row justify-content-between text-start">
                                            <div class="col-4">
                                                <p class="authorNickname" onclick="location.href = 'otherProfile.jsp'"
                                                   style="cursor: pointer;">
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
                                        <c:if test="${not empty image}">
                                            <div>
                                                <img class="postContentPicture" src="<%= image %>" alt="Post Image">
                                            </div>
                                        </c:if>
                                        <div class="row justify-content-start interactionBtnRow text-start mt-2 mb-2">
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
                                 <hr>
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

            <%@include file="../menus/rightMenu.jsp" %>
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
                            tab3.classList.add("links_feed");



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

              function goBack() {
                  window.history.back();
              }

         </script>

         <script>
         function goToSearch() {
             window.location.href="searchUsers.jsp";
          }
         </script>
    </body>
</html>