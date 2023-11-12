/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.PublicationDAO;
import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.util.List;
import models.Publication;
import models.User;
import util.Conexion;

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

        // Ajusta según tu lógica para cargar los datos del usuario
        if (userID == user.getUserID()) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/myprofile");
            dispatcher.forward(request, response);
        } else {
            UserDAO userDAO = new UserDAO();
            // Crear un objeto otherUser con los datos del usuario
            User otherUser = userDAO.asignarDatosOtroUsuario(userID);
            // Puedes establecer otherUser como atributo de la solicitud para que sea accesible en tu JSP
            request.setAttribute("otherUser", otherUser);
            PublicationDAO publicationDAO = new PublicationDAO();
            List<Publication> publications = publicationDAO.getPublicationsByUserID(userID);
            request.setAttribute("publications", publications);
            //Redirigir a la página de perfil de otro usuario
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/otherProfile.jsp");
            dispatcher.forward(request, response);

        }

    }
}
