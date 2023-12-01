<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Publication" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Base64" %>

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
        <title>Inicio | MeloVibe</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../../content/Styles/Usuario/feedStyles.css">
        <link rel="stylesheet" href="../../content/Styles/Usuario/aboutUsStyles.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300&family=Roboto:wght@300&display=swap" rel="stylesheet">

    </head>
    <body>

        <div class="row vh-100">


            <div class="row">
                    <div class="container p-5">
                        <div class="row">
                            <div class="col-lg-8 mb-4 mt-4">
                                <div id="profileInfo" class="shadow p-4 mb-5" style="background-color: #E5D6E2;">
                                    <h2 style="color: #8D397C;"> Sobre Nosotros</h2>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <p></p>
                                            <p>Hola, <strong>  <%=user.getUserName()%> </strong></p>
                                            <p>¡Bienvenido a MELOVIBE, tu destino único para sumergirte en el fascinante mundo de la música! Nos llena de orgullo ser el punto de encuentro para músicos de todos los niveles, desde apasionados principiantes hasta virtuosos profesionales. En MELOVIBE, nos dedicamos a proporcionar una amplia gama de instrumentos musicales de alta calidad y a construir una comunidad donde la música es el vínculo que nos une.</p>
                                            <hr>
                                            <p>En MELOVIBE, no solo somos una red social, sino una comunidad en constante crecimiento. Conéctate con músicos de todo el mundo, comparte tus creaciones, descubre nuevos géneros y participa en conversaciones apasionantes sobre todo lo relacionado con la música. ¡Juntos creamos la vibrante comunidad musical de MELOVIBE!.</p>
                                            <hr>
                                            <h5 style="color: #8D397C;">Nuestras redes</h5>
                                            <div class="row-center text-center">
                                                <ul class="wrapper">
                                                    <li class="icon facebook">
                                                        <span class="tooltip">Facebook</span>
                                                        <span><i class="bi bi-facebook"></i></span>
                                                    </li>
                                                    <li class="icon twitter">
                                                        <span class="tooltip">Twitter</span>
                                                        <span><i class="bi bi-twitter-x"></i></span>
                                                    </li>
                                                    <li class="icon instagram">
                                                        <span class="tooltip">Instagram</span>
                                                        <span><i class="bi bi-instagram"></i></span>
                                                    </li>
                                                    <li class="icon youtube">
                                                        <span class="tooltip">Youtube</span>
                                                        <span><i class="bi bi-youtube"></i></span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="text-center">
                                    <img id="imagen_cantante" class="img-fluid rounded" src="../../content/Images/Administracion/bateria.png" alt="cantante">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


        </div>



    </body>

</html>