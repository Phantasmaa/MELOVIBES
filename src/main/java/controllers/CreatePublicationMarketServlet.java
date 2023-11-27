package controllers;

import dao.PublicationDAO;
import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.PublicationMarket;
import models.User;

@WebServlet("/views/user/createPublicationMarket")

public class CreatePublicationMarketServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("itemTitle");
        double price = Double.parseDouble(request.getParameter("itemPrice"));
        String description = request.getParameter("itemDescription");
        String imageLink = request.getParameter("linkImage");
        
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");


        int userID = user.getUserID();

        PublicationMarket marketPublication = new PublicationMarket();
        marketPublication.setTitle(title);
        marketPublication.setPrice(price);
        marketPublication.setContent(description);
        marketPublication.setImage(imageLink);
        marketPublication.setActive(true);
        marketPublication.setDate(new Timestamp(System.currentTimeMillis()));
        marketPublication.setUserID(userID);


        PublicationDAO publicationDAO = new PublicationDAO();
        publicationDAO.createMarketPublication(marketPublication);


        response.sendRedirect("feedMarket");
    }

}