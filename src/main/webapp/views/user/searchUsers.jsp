<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>

    <%
    User user = (User) session.getAttribute("usuario");
        List<User> searchResults = (List<User>) session.getAttribute("searchResults");
        session.removeAttribute("searchResults");
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
    <link rel="stylesheet" href="../../content/Styles/Usuario/searchUsersStyles.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">
    <title>Buscar Perfil | MeloVibe</title>
</head>
<body>
<div class="row vh-100">
    <%@include file="../menus/leftMenuEmpty.jsp" %>

    <div class="container-fluid col-md-8" id="contenido">



        <div id="bienvenida" class="row justify-content-between">
            <div id="backBtn" class="col-2 text-start" onclick="goBack()" style="cursor: pointer;">
                <i class="bi bi-arrow-left-circle" href="feed"></i>  Atrás
            </div>
            <div class="col-3"> </div>
            <div class="col-4 text-end mb-3" id="create">
                Búsqueda de usuarios
            </div>
        </div>

        <div class="container-fluid mt-2" id="barra_busqueda">

            <div class="d-flex">
                <!-- Div para la mitad izquierda -->
                <div class="col-md-4">

                   <div class="input-group-text border-0" id="icono_busqueda" style="display: flex;">
                       <form action="SearchUsersServlet" method="GET" style="width: 100%; display: flex;"> <!-- Agregamos el formulario -->
                           <input type="search" name="searchTerm" class="form-control" placeholder="Buscar usuarios" id="buscar" style="flex: 1;">
                           <button type="submit" class="boton-transp" id="btn-search"> <!-- Cambiamos a type="submit" para enviar el formulario -->
                               <i class="bi bi-search"></i>
                           </button>
                       </form>
                   </div>



                </div>

                <!-- Div para la mitad derecha (vacio en este caso) -->
                <div class="col-md-8"></div>
            </div>
        </div>

        <div class="container mt-2 " id="resultadosBusqueda">
            <h2>Resultados de la búsqueda</h2>

            <% if (searchResults != null && !searchResults.isEmpty()) { %>
            <% for (User result : searchResults) { %>
            <div class="recomendado mb-3 ">
                <img src="<%= result.getUserImage() %>" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" style="cursor: pointer;">
                <p><%= result.getUserName() %></p>
                <button class="btn btn-primary pt-1 boton btn-ver" onclick="window.location.href='OtherProfile?userID=<%= result.getUserID() %>'">Ver perfil <i class="bi bi-eye-fill"></i></button>
            </div>
            <% } %>
            <% } else { %>
            <p>No se encontraron resultados.</p>
            <% } %>
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
 function goBack() {
                  window.history.back();
              }

</script>



</body>
</html>