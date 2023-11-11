<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.Publication" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>

<% User user = (User) session.getAttribute("usuario");  %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png" /> 
        <title>Marketplace | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
        <link rel="stylesheet" href="../../content/Styles/Usuario/marketplaceFeedStyles.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="row vh-100">

            <%@include file="leftMenuMarketplace.jsp" %>


            <div class="container-fluid col-md-8" id="contenido">

                <div id="bienvenida" class="row">
                    <div class="col-6 text-start">
                        Bienvenido <b><%= user.getUserName() %></b>
                    </div>
                    <div class="col-4">
                        
                    </div>
                    <div class="col-2 text-end">
                        Publicaciones
                    </div>
                    <div class="col-3 mt-3 text-center marketplaceNavBar active">
                        <p>Recomendados</p>
                    </div>
                    <div class="col-3 mt-3 text-center marketplaceNavBar">
                        <p>Mis Publicaciones</p>
                    </div>
                </div>


                <div class="text-center pt-4" id="pubs">
                    <div class="row">
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                        <div class="col-3 text-start">
                            <div class="articleImg">
                                <img src="../../content/Images/Usuario/postSamplePicture.jpg" alt=""/>
                            </div>
                            <p class="priceLabel">S/. 15.00</p>
                            <p class="articleNameLabel">Hackaton</p>
                        </div>
                    </div>
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
                            
                            function goToPublishArticle(){
                                window.location.href = "createMarketplacePublication.jsp";
                            }
        </script>
    </body>

</html>