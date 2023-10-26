<%@include file="../../util/getUser.jsp" %>
<%@include file="../../util/validSesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="beans.Publication" %>
<%@ page import="beans.User" %>
<%@ page import="beans.Profile" %>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png" />
        <title>Perfil | MeloVibe</title>
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
                        Bienvenido <b><%= profile.getUserName() %></b>
                    </div>
                    <div class="col-2 text-end">
                        Publicaciones
                    </div>
                </div>


                <div class="text-center pt-4" id="pubs">

                    <%
                        List<Publication> publications = Publication.getAllPublications(); // Recupera todas las publicaciones
                        for (Publication publication : publications) {
                    %>
                    <div class="row">
                        <div class="col-2">
                            <a href="otherProfile.jsp"><img class="postProfilePicture"
                                                            src="<%= publication.getProfile().getUserImage() %>" alt=""></a>
                        </div>
                        <div class="col-9">
                            <div class="row justify-content-between text-start">
                                <div class="col-4">
                                    <p class="authorNickname" onclick="location.href = 'otherProfile.jsp?userID=<%= profile.getProfileID() %>'" style="cursor: pointer;"><%= publication.getProfile().getUserName() %></p>
                                </div>
                                <div class="col-2 text-end">
                                    
                                    <p><i class="bi bi-clock"></i> <%= publication.getCalendar().getDate() %></p>
                                </div>
                            </div>
                            <p class="text-start postContent"><%= publication.getContent() %></p>
                            <div>
                                <img class="postContentPicture"
                                     src="<%= publication.getImage() %>"
                                     alt="">
                            </div>
                            <div class="row justify-content-start interactionBtnRow text-start mt-2">
                                <div class="col-1">
                                    <p><i class="bi bi-music-note-list" style="cursor: pointer;"></i>10</p>
                                </div>
                                <div class="col-2">
                                    <p><i class="bi bi-music-note liked" style="cursor: pointer;"></i> 481</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>

            <div class="col-md-2" id="barra_derecha">

                <div class="input-group container-fluid mt-2" id="barra_busqueda">
                    <span class="input-group-text border-0" id="icono_busqueda">
                        <i class="bi bi-search"></i>
                    </span>
                    <input type="search" class="form-control" placeholder="Buscar usuarios" id="buscar"/>
                </div>

                <div class="container-fluid mt-3" id="recomendados">
                    Recomendados
                    <div class="recomendado">
                        <img src="../../content/Images/Usuario/usuario.png" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="location.href = 'otherProfile.jsp'" style="cursor: pointer;">
                        TeoMusicMan
                    </div>
                    <div class="recomendado">
                        <img src="../../content/Images/Usuario/usuario.png" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="location.href = 'otherProfile.jsp'" style="cursor: pointer;">
                        TeoMusicMan
                    </div>  
                </div>

                <div class="container-fluid mt-4" id="publicidad">
                    <div id="titulo">Supercombo para apasionados</div>
                    <div class="text-center">
                        <img src="../../content/Images/Usuario/combo.jpg" class="img-fluid" alt="Publicidad"  >
                    </div>
                    #McDonalds #Combos
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, quidem.
                    </p>
                </div>

                <div class="container-fluid mt-3" id="contactanos">
                    ¿Deseas publicar tu anuncio? 
                    <div id="contacto">Contáctanos</div>
                    <div id="info">
                        <i class="bi bi-envelope"></i>
                        <span> melovibe@gmail.com </span>
                    </div>
                    <div id="redes">
                        <i class="bi bi-whatsapp"></i>
                        <i class="bi bi-facebook"></i>
                        <i class="bi bi-instagram"></i>
                        <i class="bi bi-twitter-x"></i>
                    </div>
                </div>    
            </div>

        </div>
        <script src="../../util/script/logOutScript.js">
        </script>
    </body>

</html>