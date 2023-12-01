<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.PublicationMarket" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="models.Comment" %>

<%
    User user = (User) session.getAttribute("usuario");
    PublicationMarket publication = (PublicationMarket) request.getAttribute("publication");
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
    <link rel="stylesheet" href="../../content/Styles/Usuario/articuloStyles.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
    <title>Articulo | MeloVibe</title>
</head>
<body>
     <div class="row vh-100">
          <%@include file="../menus/leftMenuMarketplace.jsp" %>

          <div class="container-fluid col-md-8" id="contenido">

                <div id="bienvenida" class="row justify-content-between">
                   <div class="col-2 text-start">
                      <a href="feedMarket" class="backBtn">
                       <i class="bi bi-caret-left-square"></i> Atrás
                       </a>
                   </div>
                    <div class="col-2 text-end">
                          Articulo
                    </div>
                </div>

                <div class="row custom-row">
                    <div class="container-flud col-5 text-center mt-4">
                        <img class="img-fluid rounded" src="<%=publication.getImage()%>" alt="cantante">
                    </div>

                    <div class="container-flud col-md-7 mt-4 ">
                         <div class="row text-start">
                            <div class="col-7">
                                <h2><%=publication.getTitle()%></h2>
                            </div>
                            <div class="col-2">
                            </div>
                            <div class="col-3 text-end px-0">
                                 <p id="pub_date"><i class="bi bi-clock"></i> <%=publication.getDate()%></p>
                            </div>
                        </div>

                        <div class="mt-1" id="price">S/<%=publication.getPrice()%></div>

                        <div class="mt-2" id="description">
                            <%=publication.getContent()%>
                        </div>

                        <div class="d-flex justify-content-between">
                            <div class="mt-2" id="num_comentario">
                                  <p><i class="bi bi-music-note-list "></i> <%= publication.getNComment() %>  comentarios</p>
                            </div>
                            <button class="btn btn-primary mt-1 boton" onclick="goToChat(<%=publication.getUserID()%>);" style="cursor: pointer;"  type="button">Enviar mensaje <i class="bi bi-chat"></i></button>
                        </div>
                   </div>
                </div>

                <div class="row">
                    <div class="col-2"> </div>
                    <div class="col-8 mt-3">

                        <form action="CreateComment" method="post" >
                            <div class="input-group mb-3 align-items-center">
                                <img src="<%=user.getUserImage()%>" alt="Foto" class="img-fluid rounded-circle mt-2" width="50">
                                <input type="text" class="form-control comentar-input " name="commentContent" placeholder="Escribe un comentario" aria-label="Escribe un comentario" aria-describedby="button-addon2" required>
                                <input type="hidden" name="userID" value="<%=user.getUserID()%>">
                                <input type="hidden" name="type" value="market">
                                <input type="hidden" name="publicationID" value="<%=publication.getPublicationID()%>">
                                <button class="btn btn-primary mt-1 boton" type="submit">Comentar</button>
                            </div>
                        </form>




                        <% if (comments != null && !comments.isEmpty()) { %>
                        <% Collections.reverse(comments); %>
                        <% for (Comment comment : comments) { %>

                        <div class="comentario mb-3" >
                           <div class="col-12 row">
                               <div class="col-2 comPicture" onclick="redirectToOtherProfile(<%= comment.getUser().getUserID() %>)">
                                    <img src="<%= comment.getUser().getUserImage() %>" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="location.href = 'otherProfile.jsp'" style="cursor: pointer;">
                               </div>
                                <div class="col-10 row text-start" id="comentarioCampo">
                                    <div class="col-12 comDetails d-flex justify-content-between ">
                                        <p class="authorNickname" onclick="redirectToOtherProfile(<%= comment.getUser().getUserID() %>)" style="cursor: pointer;">
                                        <%= comment.getUser().getUserName() %>
                                        </p>
                                        <p><i class="bi bi-clock"></i> <%= comment.getDate() %> </p>
                                    </div>
                                <div>
                                   <%= comment.getContentComment() %>
                           </div>
                        </div>

                        </div>
                    </div>
                        <% } %>
                        <% } else { %>
                        <p>No hay comentarios disponibles.</p>
                        <% } %>



                    </div>
                    <div class="col-2"> </div>
                </div>
          </div>

          </div>

         <%@include file="../menus/rightMenu.jsp" %>
         <script>
         function goToChat(id) {
             window.location.href="chat.jsp?sendto="+id;
         }

         function redirectToOtherProfile(userID) {
                         location.href = 'OtherProfile?userID=' + userID;
                     }

         </script>

     </div>


</body>
</html>

