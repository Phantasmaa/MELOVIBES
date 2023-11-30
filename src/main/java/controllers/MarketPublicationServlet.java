package controllers;

import dao.CommentDAO;
import dao.PublicationDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Comment;
import models.PublicationMarket;
import models.PublicationNormal;

import java.io.IOException;
import java.util.List;

@WebServlet("/views/user/Article")
public class MarketPublicationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int publicationID = Integer.parseInt(request.getParameter("article"));

        HttpSession session = request.getSession();
        PublicationDAO publicationDAO = new PublicationDAO();

        PublicationMarket publication = publicationDAO.getMarketPublicationById(publicationID);
        request.setAttribute("publication",publication);


        CommentDAO commentDAO = new CommentDAO();
        List<Comment> comments = commentDAO.getCommentsByPublicationID(publicationID);
        request.setAttribute("comments",comments);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/articulo.jsp");
        dispatcher.forward(request, response);
    }

}