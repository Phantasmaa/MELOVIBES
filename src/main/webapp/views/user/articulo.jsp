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
                       <i class="bi bi-caret-left-square"></i> Atras
                   </div>
                    <div class="col-2 text-end">
                          Articulo
                    </div>
                </div>

                <div class="row custom-row">
                    <div class="container-flud col-5 text-center mt-4">
                        <img class="img-fluid rounded" src="../../content/Images/Usuario/cantante2.png" alt="cantante">
                    </div>

                    <div class="container-flud col-md-7 mt-4 ">
                         <div class="row text-start">
                            <div class="col-7">
                                <h2>Título del artículo</h2>
                            </div>
                            <div class="col-2">
                            </div>
                            <div class="col-3 text-end px-0">
                                 <p id="pub_date"><i class="bi bi-clock"></i> 2023-11-14 17:00:00.0 </p>
                            </div>
                        </div>

                        <div class="mt-1" id="price">Precio del articulo</div>

                        <div class="mt-2" id="description">
                            Vendo un potente amplificador de guitarra. Ideal para rock y metal. ?? #GuitarAmpSale
                        </div>

                        <div class="d-flex justify-content-between">
                            <div class="mt-2" id="num_comentario">
                                  <p><i class="bi bi-music-note-list " style="cursor: pointer;"></i> <%//= publication.getComments() %> comentarios</p>
                            </div>
                            <button class="btn btn-primary mt-1 boton"  type="button">Enviar mensaje <i class="bi bi-chat"></i></button>
                        </div>
                   </div>
                </div>

                <div class="row">
                    <div class="col-2"> </div>
                    <div class="col-8">
                         <div class="input-group mb-3">
                             <img src="../../content/Images/Usuario/usuario.png" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="location.href = 'otherProfile.jsp'" style="cursor: pointer;">
                             <input type="text" class="form-control comentar-input"  placeholder="Escribe un comentario" aria-label="Escribe un comentario" aria-describedby="button-addon2">
                             <button class="btn btn-primary mt-1 boton" type="button" >Comentar</button>
                         </div>

                         <div  class="comentario mb-3">
                             <img src="../../content/Images/Usuario/usuario.png" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="location.href = 'otherProfile.jsp'" style="cursor: pointer;">

                             <p class="authorNickname" onclick="" style="cursor: pointer;">
                                 Jeff
                             </p>
                             <p><i class="bi bi-clock"></i> 2023-11-14 17:00:00.0  </p>
                             <div class="mt-1">
                             ¡Increíble oferta de amplificador! Me vendría perfecto para mis sesiones de práctica. ??
                             </div>
                         </div>

              


                    </div>
                    <div class="col-2"> </div>
                </div>
          </div>

          </div>

         <%@include file="../menus/rightMenu.jsp" %>

     </div>


</body>
</html>

