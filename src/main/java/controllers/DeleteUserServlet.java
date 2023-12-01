package controllers;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;

import java.io.IOException;

import static util.HashMethod.hashPassword;

@WebServlet(name = "DeleteUserServlet", urlPatterns = {"/views/user/DeleteUserServlet"})

public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        password = hashPassword(password);
        UserDAO userDAO = new UserDAO();

        User user = userDAO.verificarCredenciales(email, password);

        if (user != null) {
            if (userDAO.eliminarUsuario(user.getUserID())) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect("../..");
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            System.out.println("nulo");
            response.sendRedirect("error.jsp");
        }
    }
}
