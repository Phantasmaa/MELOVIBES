        <% 
            // Recupera el objeto User de la sesión
            beans.User user = (beans.User) session.getAttribute("user");
            beans.Profile profile = null;

            // Comprueba si el usuario está autenticado y si tiene un perfil asociado
            if (user != null) {
                profile = user.getProfile();
            }
        %>