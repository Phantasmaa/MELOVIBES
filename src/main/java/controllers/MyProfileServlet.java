package controllers;

import dao.PublicationDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.PublicationNormal;
import models.User;

@WebServlet("/views/user/myprofile")
public class MyProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el usuario de la sesión
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");

        if (user != null) {
            // Obtener el ID del usuario
            int userID = user.getUserID();

            // Obtener las publicaciones del usuario mediante el ID
            PublicationDAO publicationDAO = new PublicationDAO();
            List<PublicationNormal> publications = publicationDAO.getNormalPublicationsByUserID(userID);

            // Establecer las publicaciones en el atributo de la solicitud
            request.setAttribute("publications", publications);

            // Redirigir a la página de perfil
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/myProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            // Manejar el caso en el que no hay un usuario en la sesión
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }
}
