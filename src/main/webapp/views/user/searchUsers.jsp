<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Publication" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../../content/Styles/Usuario/searchUsersStyles.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
     crossorigin="anonymous"></script>
    <title>Buscar Perfil | MeloVibe</title>
</head>
<body>
    <div class="row vh-100">
                <%@include file="../menus/leftMenuEmpty.jsp" %>

                <div class="container-fluid col-md-8" id="contenido">

                 <div id="bienvenida" class="row justify-content-between">
                                    <div id="backBtn" class="col-2 text-start">
                                         <i class="bi bi-arrow-left-circle"></i>  Atrás
                                    </div>
                                    <div class="col-3"> </div>
                                    <div class="col-4 text-end mb-3" id="create">
                                        Búsqueda de usuarios
                                    </div>
                 </div>


                 <div class="container-fluid mt-2" id="barra_busqueda">

                     <div class="d-flex">
                         <!-- Div para la mitad izquierda -->
                         <div class="col-md-6">

                             <div class="input-group-text border-0" id="icono_busqueda">
                                 <i class="bi bi-search"></i>
                                 <input type="search" class="form-control" placeholder="Buscar usuarios" id="buscar"/>
                             </div>

                         </div>

                         <!-- Div para la mitad derecha (vacio en este caso) -->
                         <div class="col-md-6"></div>
                     </div>
                 </div>

                <div class="container mt-2">
                    <div class="mx-auto text-center">
                            <div class="recomendado mb-3">
                                <img src="../../content/Images/Usuario/usuario.png" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" style="cursor: pointer;">
                                <p>TeoMusicMan</p>
                                <button class="btn btn-primary pt-1" id="ver-perfil" onclick="">Ver perfil <i class="bi bi-eye-fill"></i></button>
                            </div>


                    </div>

                </div>


                </div>
                    <%@include file="../menus/rightMenuSearch.jsp" %>
                </div>

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

</body>
</html>