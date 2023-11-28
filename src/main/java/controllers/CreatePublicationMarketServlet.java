package controllers;

import dao.PublicationDAO;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import models.PublicationMarket;
import models.User;

@WebServlet("/views/user/createPublicationMarket")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class CreatePublicationMarketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("itemTitle");
        double price = Double.parseDouble(request.getParameter("itemPrice"));
        String description = request.getParameter("itemDescription");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");

        int userID = user.getUserID();

        Part imagePart = request.getPart("imageInput");
        InputStream imageStream = imagePart.getInputStream();

        PublicationMarket marketPublication = new PublicationMarket();
        marketPublication.setTitle(title);
        marketPublication.setPrice(price);
        marketPublication.setContent(description);
        marketPublication.setActive(true);
        marketPublication.setDate(new Timestamp(System.currentTimeMillis()));
        marketPublication.setUserID(userID);

        PublicationDAO publicationDAO = new PublicationDAO();
        publicationDAO.createMarketPublication(marketPublication, imageStream);

        response.sendRedirect("feedMarket");
    }
}

