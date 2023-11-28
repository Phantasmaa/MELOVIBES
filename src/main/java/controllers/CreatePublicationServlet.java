package controllers;

import dao.PublicationDAO;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import models.PublicationNormal;
import models.User;

@WebServlet("/views/user/createPublication")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class CreatePublicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");

        String content = request.getParameter("publicationTextContent");

        Part imagePart = request.getPart("imageInput");
        InputStream imageStream = imagePart.getInputStream();

        boolean isActive = true;
        Timestamp date = new Timestamp(System.currentTimeMillis());
        int userID = user.getUserID();

        PublicationNormal normalPublication = new PublicationNormal();
        normalPublication.setContent(content);
        normalPublication.setActive(isActive);
        normalPublication.setMarket(false);
        normalPublication.setDate(date);
        normalPublication.setUserID(userID);

        PublicationDAO publicationDAO = new PublicationDAO();
        publicationDAO.createNormalPublication(normalPublication, imageStream);

        response.sendRedirect("feed");
    }
}


