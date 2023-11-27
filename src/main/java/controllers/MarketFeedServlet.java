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
import models.PublicationMarket;
import models.User;

/**
 *
 * @author manue
 */
@WebServlet("/views/user/feedMarket")
public class MarketFeedServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");

        PublicationDAO publicationDAO = new PublicationDAO();
        List<PublicationMarket> publicationsMarket;

        String urlParam = request.getParameter("urlParam");

        if (urlParam == null || "allPublications".equals(urlParam)) {
            publicationsMarket = publicationDAO.getAllMarketPublications();
        } else {
            publicationsMarket = publicationDAO.getMarketPublicationsByUserID(user.getUserID());
        }

        request.setAttribute("publicationsMarket", publicationsMarket);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/marketplaceFeed.jsp");
        dispatcher.forward(request, response);
    }
}

