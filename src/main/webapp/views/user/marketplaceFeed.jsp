<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.PublicationMarket" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>

<% User user = (User) session.getAttribute("usuario"); 

List<PublicationMarket> publicationsMarket = (List<PublicationMarket>) request.getAttribute("publicationsMarket");
%>
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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    </head>

    <body>
        <div class="row vh-100">

            <%@include file="../menus/leftMenuMarketplace.jsp" %>


            <div class="container-fluid col-md-8" id="contenido">

                <div id="bienvenida" class="row">
                    <div class="col-6 text-start">
                        Bienvenido <b><%= user.getUserName() %></b>
                    </div>
                    <div class="col-3">

                    </div>
                    <div class="col-3 text-end">
                        Publicaciones
                    </div>
                    <%
                        
                    
                    
                    %>

                    <style>
                        .marketplaceNavBar {
                            cursor: pointer;
                        }

                    </style>

                    <div class="col-3 mt-3 text-center marketplaceNavBar active" id="Recomendados" onclick="redirigirAServlet('allPublications', event)">
                        <p>Recomendados</p>
                    </div>
                    <div class="col-3 mt-3 text-center marketplaceNavBar" id="MisPublicaciones" onclick="redirigirAServlet('myPublications', event)">
                        <p>Mis Publicaciones</p>
                    </div>

                </div>


                <div class="text-center pt-4" id="pubs">

                    <% if (publicationsMarket != null && !publicationsMarket.isEmpty()) { %>
                        <% Collections.reverse(publicationsMarket);
                            int count = 0;
                            for (PublicationMarket publicationMarket : publicationsMarket) { %>

                            <% if (count % 4 == 0) { %>
                                <div class="row">
                            <% } %>

                            <div class="col-3 text-start">
                                <div class="articleImg">
                                    <img src="<%=publicationMarket.getImage()%>" alt=""/>
                                </div>
                                <p class="priceLabel mb-1 mt-1"><%=publicationMarket.getPrice()%></p>
                                <p class="articleNameLabel"><%=publicationMarket.getTitle()%></p>
                            </div>

                            <% count++;
                               if (count % 4 == 0 || count == publicationsMarket.size()) { %>
                                </div>
                            <% } %>
                        <% } %>
                    <% } else { %>
                        <p>No hay publicaciones disponibles.</p>
                    <% } %>

                </div>
            </div>

            <%@include file="../menus/rightMenu.jsp" %>

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
                                tab1.classList.add("links_feed");
                                tab3.classList.add("links_feed");

                                tab2.classList.add("link_feed_selected");

                            });

                            function uploadImage() {
                                alert("Este boton solicitara subir una imagen");
                            }

                            function goToPublishArticle() {
                                window.location.href = "createMarketplacePublication.jsp";
                            }
                            
                            
        </script>


       <script>
           // Arreglar la parte visual para indicar si está en recomendados o en mis publicaciones
            function redirigirAServlet(parametro, event) {
            window.location.href = 'feedMarket?urlParam=' + parametro;

            var elements = document.querySelectorAll('.marketplaceNavBar');
            elements.forEach(function (element) {
                element.classList.remove('active');
            });

            // Asignar estado activo al elemento correspondiente
            var selectedElement = event.currentTarget;
            selectedElement.classList.add('active');
        }
       </script>

    </body>

</html>