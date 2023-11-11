package controllers;

import dao.PublicationDAO;
import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Publication;
import models.User;

@WebServlet("/views/user/createPublication")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class CreatePublicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recuperar los parámetros del formulario
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");
        
        String content = request.getParameter("publicationTextContent");
        // Aquí deberías manejar la carga de archivos (imagen) y guardar la ruta en la base de datos
        String image = "ruta_de_la_imagen"; // Reemplaza con la lógica adecuada
        boolean isActive = true; // Puedes establecerlo como desees
        boolean isMarket = false; // Puedes establecerlo como desees
        Timestamp date = new Timestamp(System.currentTimeMillis()); // Obtener la fecha actual
        int userID = user.getUserID(); // Reemplaza con el ID del usuario actual (puedes obtenerlo de la sesión)

        // Crear un objeto de Publicación
        Publication publication = new Publication();
        publication.setContent(content);
        publication.setImage(image);
        publication.setActive(isActive);
        publication.setMarket(isMarket);
        publication.setDate(date);
        publication.setUserID(userID);

        // Guardar la publicación en la base de datos
        PublicationDAO publicationDAO = new PublicationDAO(); // Asegúrate de tener la conexión a la base de datos configurada
        publicationDAO.createPublication(publication);

        // Redirigir a la página principal o a donde desees después de crear la publicación
        response.sendRedirect("feed");
    }
}

