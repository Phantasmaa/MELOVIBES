<%@ page import="java.util.Random" %>
<%@ page import="dao.UserDAO" %>
<div class="col-md-2" id="barra_derecha">

                <div class="input-group container-fluid mt-2" id="barra_busqueda" onclick="goToSearch();" style="cursor: pointer;" >
                    <span class="input-group-text border-0" id="icono_busqueda">
                        <i class="bi bi-search"></i>
                    </span>
                    <input type="search" class="form-control" placeholder="Buscar usuarios" id="buscar"/>
                </div>

    <%
        Random random = new Random();
        int userId1 = random.nextInt(10) + 1; // Genera un ID aleatorio entre 1 y 10
        int userId2 = random.nextInt(10) + 1; // Genera otro ID aleatorio entre 1 y 10

        UserDAO userDAO = new UserDAO();

        User recommendedUser1 = userDAO.getUserByID(userId1);
        User recommendedUser2 = userDAO.getUserByID(userId2);

    %>
    <div class="container-fluid mt-3" id="recomendados" >
        Recomendados
        <div class="recomendado">
            <img src="<%=recommendedUser1.getUserImage()%>" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="window.location.href='OtherProfile?userID=<%= recommendedUser1.getUserID() %>'" style="cursor: pointer;">
            <%= recommendedUser1.getUserName() %>
        </div>
        <div class="recomendado">
            <img src="<%=recommendedUser2.getUserImage()%>" alt="Foto" class="img-fluid rounded-circle mt-2" width="50" onclick="window.location.href='OtherProfile?userID=<%= recommendedUser2.getUserID() %>'" style="cursor: pointer;">
            <%= recommendedUser2.getUserName() %>
        </div>
    </div>
                <div class="container-fluid mt-4" id="publicidad">
                    <div id="titulo">Supercombo para apasionados</div>
                    <div class="text-center">
                        <img src="../../content/Images/Usuario/combo.jpg" class="img-fluid" alt="Publicidad"  >
                    </div>
                    #McDonalds #Combos
                    <p>
                        Lleve un sandwich BigMac + papas regulares + gaseosa 12 onzas + cono de helado a solo S/. 10.90.
                    </p>
                </div>

                <div class="container-fluid mt-3" id="contactanos" onclick="window.location.href='aboutUs.jsp'" style="cursor: pointer;">
                    Publica tu anuncio
                    <div id="contacto">Contactanos</div>
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