package controllers;

import dao.PublicationDAO;
import dao.UserDAO;
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


/**
 *
 * @author manue
 */
@WebServlet("/views/user/OtherProfile")
public class OtherProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userID = Integer.parseInt(request.getParameter("userID"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");

        if (userID == user.getUserID()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/myprofile");
            dispatcher.forward(request, response);
        } else {
            UserDAO userDAO = new UserDAO();
            User otherUser = userDAO.asignarDatosOtroUsuario(userID);
            request.setAttribute("otherUser", otherUser);
            PublicationDAO publicationDAO = new PublicationDAO();
            List<PublicationNormal> publications = publicationDAO.getNormalPublicationsByUserID(userID);
            request.setAttribute("publications", publications);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/otherProfile.jsp");
            dispatcher.forward(request, response);

        }

    }
    
    
    
}
