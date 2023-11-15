<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.Publication" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>

<% 
    User user = (User) session.getAttribute("usuario");
    
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
        <link rel="stylesheet" href="../../content/Styles/Usuario/marketplaceFeedStyles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="row vh-100">

            <%@include file="leftMenuMarketplace.jsp" %>


            <div class="container-fluid col-md-8" id="contenido">

                <div id="bienvenida" class="row justify-content-between">
                    <div id="backBtn" class="col-6 text-start">
                        <i class="bi bi-arrow-left-circle"></i>  Atras
                    </div>
                    <div class="col-3 text-end">
                        Crear Publicacion
                    </div>
                </div>


                <div class="pt-4">
                    <div class="formContainer">
                        <form id="marketPublicationForm" class="row g-3" method="post" action="createPublicationMarket">
                            <div class="col-8">
                                <label for="itemTitle" class="form-label ms-1">Título</label>
                                <input type="text" id="itemTitle" name="itemTitle" class="form-control" required>
                            </div>
                            <div class="col-4">
                                <label for="itemPrice" class="form-label ms-1">Precio en soles</label>
                                <input type="text" id="itemPrice" name="itemPrice" class="form-control" required>
                            </div>
                            <div class="col-12">
                                <label for="itemDescription" class="form-label ms-1">Descripción</label>
                                <textarea class="form-control" id="itemDescription" name="itemDescription" rows="9" required></textarea>
                                <div id="charCountMessage">Caracteres restantes: 1000</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Imagen de referencia</label>
                                <div class="uploadImageContainer text-center">
                                    <p>Ingresa el link de la imagen</p>
                                    <input type="text" id="linkImage" name="linkImage" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-12 justify-content-end">
                                <button class="btn btn-lg btn-cancel me-3" type="button" onclick="cancelPublish();">
                                    Cancelar <i class="bi bi-pause-fill"></i>
                                </button>
                                <button type="submit" class="btn btn-lg btn-publish">Publicar <i class="bi bi-play-circle"></i></button>
                            </div>
                        </form>
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
                                var btnPublishArticle = document.getElementById("crear_pub");
                                btnPublishArticle.style.display = "none";

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

                            function cancelPublish() {
                                alert("Cancelamos la publicacion");
                                window.location.href = "feed.jsp";
                            }

        </script>

        <!-- Script para validar 25 carácteres en el título -->
        <script>
            const itemTitle = document.getElementById("itemTitle");
            const maxChars = 25;

            itemTitle.addEventListener("input", function () {
                if (itemTitle.value.length > maxChars) {
                    itemTitle.value = itemTitle.value.slice(0, maxChars);
                }
            });
        </script>

        <!-- Script para validar 10 enteros y 2 decimales en el precio -->
        <script>
            const itemPrice = document.getElementById("itemPrice");

            itemPrice.addEventListener("input", function () {
                const validPrice = /^[0-9]{1,10}(\.[0-9]{1,2})?$/.test(itemPrice.value);

                if (!validPrice) {
                    itemPrice.setCustomValidity("Ingrese un valor entero o un decimal de 2 decimales.");
                } else {
                    itemPrice.setCustomValidity("");
                }
            });
        </script>

        <!-- Script para validar 1000 caracteres en la descripción -->
        <script>
            const itemDescription = document.getElementById("itemDescription");
            const charCountMessage = document.getElementById("charCountMessage");
            const maxCharacters = 1000;

            itemDescription.addEventListener("input", function () {
                const remainingCharacters = maxCharacters - itemDescription.value.length;
                charCountMessage.textContent = `Caracteres restantes: `;

                const remainingCharactersSpan = document.createElement("span");
                remainingCharactersSpan.textContent = Math.max(remainingCharacters, 0); // Evitamos valores negativos
                charCountMessage.appendChild(remainingCharactersSpan);

                if (itemDescription.value.length > maxCharacters) {
                    itemDescription.value = itemDescription.value.slice(0, maxCharacters); // Selecciona solo los primeros 1000 caracteres
                }
            });
        </script>

    </body>

</html>