package controllers;

import dao.PublicationDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.Publication;

@WebServlet("/views/user/feed")
public class FeedServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PublicationDAO publicationDAO = new PublicationDAO();
        List<Publication> publications = publicationDAO.getAllPublications();

        request.setAttribute("publications", publications);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/feed.jsp");
        dispatcher.forward(request, response);
    }
}

