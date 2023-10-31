        <% 
            beans.User user = (beans.User) session.getAttribute("user");
            beans.Profile profile = null;
            
            if (user != null) {
                profile = user.getProfile();
            }
        %>