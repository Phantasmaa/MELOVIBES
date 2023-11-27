package controllers;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import static util.HashMethod.hashPassword;

@WebServlet(name = "NewPasswordServlet", urlPatterns = {"/views/log/NewPasswordServlet"})
public class NewPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        String mail = (String) session.getAttribute("mail");
        String passwordHashed = hashPassword(password);
        UserDAO userDAO = new UserDAO();
        userDAO.changePassword(mail,passwordHashed);
        session.invalidate();
        response.sendRedirect("../../");

    }

}
