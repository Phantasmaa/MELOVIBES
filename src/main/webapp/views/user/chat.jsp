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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../../content/Images/Administracion/logoMeloVibeBrowserTab.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
    <link rel="stylesheet" href="../../content/Styles/Usuario/chatStyles.css">


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
    <title>Chat | MeloVibe</title>
</head>
<body>
    <div class="row vh-100">
         <%@include file="../menus/leftMenuEmpty.jsp" %>
        <div class="container-fluid col-md-8" id="contenido">
            <div id="cabecera" class="row justify-content-between">
                  <div id="backBtn" class="col-2 text-start">
                  <i class="bi bi-arrow-left-circle"></i>  Atrás
                  </div>
                  <div class="col-3"> </div>
                  <div class="col-4 text-end mb-3" id="create">
                  Chat
                  </div>
            </div>

             <div class="receptor mt-2">
                  <img src="../../content/Images/Usuario/usuario.png" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="location.href = 'otherProfile.jsp'" style="cursor: pointer;">
                  TeoMusicMan
             </div>



             <div class="row custom-row">
                <div class="col-6" > </div>
                  <div class="col-6 mensaje mb-3 mt-3 ml-3">

                    <p>¡Increíble oferta de amplificador! Me vendría perfecto para mis sesiones de práctica. ??</p>

                    <p> 023-11-14 17:00:00.0  </p>
                   </div>
             </div>

             <div class="row custom-row">
                    <div class="col-6 respuesta mb-3 mt-3">

                    <p>Holaa</p>

                    <p> 023-11-14 17:00:00.0  </p>
                    </div>
              </div>

              <div class="row custom-row">
                 <div class="col-6" > </div>
                 <div class="col-6 mensaje mb-3 mt-3 ml-3">

                 <p>¡Increíble oferta de amplificador! Me vendría perfecto para mis sesiones de práctica. ??</p>

                 <p> 023-11-14 17:00:00.0  </p>
                 </div>
             </div>

             <div class="row custom-row">
                <div class="input-group mb-3">
                     <input type="text" class="form-control mensaje-input"  placeholder="Escribe un comentario" aria-label="Escribe un comentario" aria-describedby="button-addon2">
                     <button class="btn btn-primary mt-1 boton" type="button" >Enviar</button>
                </div>
             </div>


        </div>
        <%@include file="../menus/rightMenu.jsp" %>
    </div>
</body>
</html>