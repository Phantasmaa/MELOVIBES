<%@include file="../../util/validSesion.jsp" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <%@include file="headJSP.jsp" %>
    <title>Ver Usuario Admin | MeloVibe</title>
    <link rel="stylesheet" href="../../content/Styles/Administracion/adminVerUsuarioStyles.css" />
</head>

<body>
    <div class="row">
        <%@include file="leftMenu.jsp" %>

        <div class="container-fluid col-md-10" id="contenido">
            <div id="bienvenida" class="row">
                <div class="col-12 text-end">
                    <p>Editar Perfil</p>
                </div>
            </div>
            <div class="container-fluid p-3">
                <div class="row">
                    <div class="col-3 text-center">
                        <div id="profileCard" class="shadow p-3 mb-5">
                            <h2>JeffMusicMan <i class="bi bi-soundwave"></i></h2>
                            <div class="my-4">
                                <img class="profilePicture" src="../../content/Images/Administracion/usuario.png"
                                    alt="profilePicture">
                            </div>
                            <button class="btn btn-lg btn-secondary my-3" onclick="location.href='adminUser.jsp'">Editar perfil <i
                                class="bi bi-pencil"></i></button>
                        </div>
                        <div class="stats mt-5">
                            <p><i class="bi bi-music-note-list"></i> Publicaciones <span>120</span></p>
                            <p><i class="bi bi-music-note"></i> Me gustas <span>574</span></p>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="row">
                            <div class="col-6 details">
                                <h3>Sobre m�</h3>
                                <p class="Info">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequuntur
                                    aperiam recusandae non quis aspernatur illum blanditiis tempore quos sit voluptates
                                    qui mollitia velit minus, tempora repellendus veniam esse a assumenda, illo atque?
                                    Fuga dicta eveniet mollitia iusto porro laborum facilis eligendi! Cum quod commodi
                                    at minus, reprehenderit ratione ut distinctio!</p>
                            </div>
                            <div class="col-6 details">
                                <h3>Detalles</h3>
                                <div class="row">
                                    <div class="col-6">
                                        <label class="labelInfo">Nickname</label>
                                        <p class="Info">JeffMusicMan</p>
                                        <label class="labelInfo">Ciudad <i class="bi bi-geo-alt"></i></label>
                                        <p class="Info">Krakow, Polska</p>
                                        <label class="labelInfo">Telefono <i class="bi bi-telephone"></i></label>
                                        <p class="Info">(+51) xxx-xxx-xxx</p>
                                    </div>
                                    <div class="col-6">
                                        <label class="labelInfo">Nombre</label>
                                        <p class="Info">Jeff Magallanes</p>
                                        <label class="labelInfo">Edad <i class="bi bi-cake2"></i></label>
                                        <p class="Info">21 a�os</p>
                                        <label class="labelInfo">Genero <i class="bi bi-person-circle"></i></label>
                                        <p class="Info">Masculino</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col12">
                                <div class="tabRow row">
                                    <div class="col-2 text-center">
                                        <p><i></i> Mis publicaciones</p>
                                    </div>
                                    <div class="col-2 text-center activo">
                                        <p class="tabSelected"><i class="bi bi-music-note"></i> Me gusta</p>
                                    </div>
                                </div>
                                <div class="text-center p-5">
                                    <div class="row">
                                        <div class="col-2">
                                            <a href="adminPorfiles.jsp"><img class="postProfilePicture"
                                                src="../../content/Images/Administracion/usuario.png" alt=""></a>
                                        </div>
                                        <div class="col-10">
                                            <div class="row justify-content-between text-start">
                                                <div class="col-2">
                                                    <p class="authorNickname" onclick="location.href='adminPorfiles.jsp'" style="cursor: pointer;">Juan Garnizo</p>
                                                </div>
                                                <div class="col-2 text-end">
                                                    <p><i class="bi bi-clock"></i> Hoy</p>
                                                </div>
                                            </div>
                                            <p class="text-start postContent"> Lorem ipsum dolor sit amet consectetur
                                                adipisicing
                                                elit. Consequuntur
                                                blanditiis numquam repellendus velit, incidunt aliquid ipsam harum
                                                deserunt tempore officiis perspiciatis! Labore magni velit dolorum porro
                                                ipsam quo exercitationem tempore necessitatibus distinctio pariatur
                                                numquam, qui voluptatum nobis voluptates nam vero.</p>
                                            <div>
                                                <img class="postContentPicture"
                                                    src="../../content/Images/Administracion/postSamplePicture.jpg"
                                                    alt="">
                                            </div>
                                            <div class="row justify-content-start interactionBtnRow text-start mt-2">
                                                <div class="col-1">
                                                    <p><i class="bi bi-music-note-list"></i>10</p>
                                                </div>
                                                <div class="col-2">
                                                    <p><i class="bi bi-music-note liked"></i> 481</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../../util/script/logOutScript.js"></script>
</body>

</html>