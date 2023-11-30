<nav class="col-md-2 d-none d-md-block sidebar pt-2" id="barra_izquierda">
    <div class="d-flex flex-column justify-content-between h-100">      
        <div class="text-center">
            <img src="../../content/Images/Administracion/logoMeloVibe.png" alt="logo_melovibe" id="logo" class="img-fluid rounded">
        </div>
        <div id="opciones">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link links_feed" id="LeftMenu-inicio" href="feed"><i class="bi bi-house-door"></i> Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link links_feed link_feed_selected" id="LeftMenu-marketplace" href="feedMarket" ><i class="bi bi-shop"></i>  Marketplace</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link links_feed" id="LeftMenu-perfil" href="myprofile"  ><i class="bi bi-person"></i>  Perfil</a>
                </li>
            </ul>
        </div>
        <div class="text-center">
            <button class="btn btn-primary mt-3" id="crear_pub" onclick="goToPublishArticle();">Publicar articulo <i class="bi bi-music-note-beamed"></i></button> 
        </div>
        <div class="text-center d-flex align-items-center">
            <img id="imagen_cantante" class="img-fluid rounded" src="../../content/Images/Usuario/cantante2.png" alt="cantante">
        </div>

        <div class="mt-auto d-flex align-items-center"  id="nombre_usuario">
            <div id="user_foto">
                <a href="myprofile">
                    <img src="<%=user.getUserImage()%>" alt="usuario" height="40px">
                </a>       
            </div>
            <%= user.getUserName() %>
            
            
            
            <form action="LogOutServlet" method="POST" id="desconectar">
                <button type="submit" class="bi bi-power boton-transp"></button>
            </form>

        </div>

    </div>
</nav>