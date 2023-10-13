<nav class="col-md-2 d-none d-md-block sidebar pt-2" id="barra_izquierda">
    <div class="d-flex flex-column justify-content-between h-75">
        <div class="text-center">
            <img src="../../content/Images/Administracion/logoMeloVibe.png" alt="logo_melovibe" id="logo"
                class="img-fluid rounded" />
        </div>
        <div id="opciones">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="userList.jsp" id="link_feed_selected"><i
                            class="bi bi-person-fill me-2"></i>Perfiles</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link links_feed" href="adminFeeds.jsp"><i
                            class="bi bi-pass-fill me-2"></i>Publicaciones</a>
                </li>
            </ul>
        </div>

        <div class="row text-center">
            <div class="col-12">
                <h4>SESION ADMINISTRADOR</h4>
            </div>
            <div class="col-12">
                <h4>
                    USUARIO: <p id="username">admin</p>
                </h4>
            </div>
            <div class="col-12">
                <h4>
                    ROL: <p id="role">Administrador</p>
                </h4>
            </div>
        </div>

        <div class="text-center mt-5">
            <button class="btn btn-primary" id="crear_pub" ">
                <i class="bi bi-x-circle me-2" id="desconectar"></i>Cerrar Sesión
            </button>
        </div>
    </div>
</nav>