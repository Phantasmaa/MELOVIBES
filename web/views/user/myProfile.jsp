<%@include file="../../util/validSesion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../util/getUser.jsp" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png"/>
        <title>Mi Perfil | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/miPerfilStyles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="row vh-100">
            <%@include file="leftMenu.jsp" %>

            <div class="container-fluid col-md-10" id="contenido">
                <div class="container-fluid p-3">
                    <div class="row">
                        <div class="col-3 text-center">
                            <div id="profileCard" class="shadow p-3 mb-5">
                                <h2><%= profile.getUserName() %> <i class="bi bi-soundwave"></i></h2>
                                <div class="my-4">
                                    <img class="profilePicture" src="../../content/Images/Administracion/usuario.png"
                                    alt="profilePicture">
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
                                    <p class="Info"><%= profile.getBio() %></p>
                                </div>
                                <div class="col-6 details">
                                    <h3>Detalles</h3>
                                    <div class="row">
                                        <div class="col-6">
                                            <label class="labelInfo">Nickname</label>
                                            <p class="Info"><%= profile.getUserName() %></p>
                                            <label class="labelInfo">Ciudad <i class="bi bi-geo-alt"></i></label>
                                            <p class="Info"><%= profile.getCity() %></p>
                                            <label class="labelInfo">Teléfono <i class="bi bi-telephone"></i></label>
                                            <p class="Info"><%= profile.getPhoneNumber() %></p>
                                        </div>
                                        <div class="col-6">
                                            <label class="labelInfo">Nombre</label>
                                            <p class="Info"><%= user.getFirstName() %></p>
                                            <label class="labelInfo">Edad <i class="bi bi-cake2"></i></label>
                                            <p class="Info"><%= profile.getAge() %> años</p>
                                            <label class="labelInfo">Género <i class="bi bi-person-circle"></i></label>
                                            <p class="Info"><%= profile.getGender() %></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col12">
                                    <div class="text-center p-5 pubs">
                                    <div class="row">
                                        <div class="col-2">
                                            <a href="adminProfiles.jsp"><img class="postProfilePicture"
                                                src="../../content/Images/Administracion/usuario.png" alt=""></a>
                                        </div>
                                        <div class="col-10">
                                            <div class="row justify-content-between text-start">
                                                <div class="col-2">
                                                    <p class="authorNickname" onclick="location.href='adminProfiles.jsp'" style="cursor: pointer;">carlosgz</p>
                                                </div>
                                                <div class="col-2 text-end">
                                                    <p><i class="bi bi-clock"></i> Hoy</p>
                                                </div>
                                            </div>
                                            <p class="text-start postContent"> Lorem ipsum dolor sit amet consectetur
                                                adipisicing
                                                elit. Consequuntur
                                                blanditiis numquam repellendus velit, incidunt aliquid ipsam harum
                                                deserunt tempore officiis perspiciatis! Labore magni velit dolorum porro
                                                ipsam quo exercitationem tempore necessitatibus distinctio pariatur
                                                numquam, qui voluptatum nobis voluptates nam vero.</p>
                                            <div>
                                                <img class="postContentPicture"
                                                    src="../../content/Images/Administracion/postSamplePicture.jpg"
                                                    alt="">
                                            </div>
                                            <div class="row justify-content-start interactionBtnRow text-start mt-2">
                                                <div class="col-2">
                                                    <p><i class="bi bi-music-note-list"></i>10</p>
                                                </div>
                                                <div class="col-2">
                                                    <p><i class="bi bi-music-note liked"></i> 481</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                document.addEventListener("DOMContentLoaded", function(event) {
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
    </body>
</html>