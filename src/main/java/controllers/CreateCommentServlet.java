package controllers;

import dao.CommentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Comment;

import java.io.IOException;
import java.sql.Timestamp;


@WebServlet("/views/user/CreateComment")
public class CreateCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String commentContent = request.getParameter("commentContent");
        String type = request.getParameter("type");
        int userID = Integer.parseInt(request.getParameter("userID"));
        int publicationID = Integer.parseInt(request.getParameter("publicationID"));
        Timestamp date = new Timestamp(System.currentTimeMillis());
        Comment comment = new Comment();
        comment.setContentComment(commentContent);
        comment.setUserID(userID);
        comment.setPublicationID(publicationID);
        comment.setDate(date);

        CommentDAO commentDAO = new CommentDAO();
        commentDAO.createComment(comment);

        if(type.equals("normal")){
            response.sendRedirect(request.getContextPath() + "/views/user/Publication?publication=" + publicationID);

        }else{
           response.sendRedirect(request.getContextPath() + "/views/user/Article?article=" + publicationID);

        }




    }

}
