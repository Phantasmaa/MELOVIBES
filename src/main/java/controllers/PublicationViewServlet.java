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
import models.PublicationNormal;

import java.io.IOException;
import java.util.List;

@WebServlet("/views/user/Publication")
public class PublicationViewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int publicationID = Integer.parseInt(request.getParameter("publication"));

        HttpSession session = request.getSession();
        PublicationDAO publicationDAO = new PublicationDAO();
        PublicationNormal publicaion = publicationDAO.getNormalPublicationById(publicationID);
        request.setAttribute("publication",publicaion);

        CommentDAO commentDAO = new CommentDAO();
        List<Comment> comments = commentDAO.getCommentsByPublicationID(publicationID);
        request.setAttribute("comments",comments);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/publication.jsp");
        dispatcher.forward(request, response);
    }

}
