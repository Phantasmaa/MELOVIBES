package controllers;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import util.Conexion;

import java.io.IOException;
import java.sql.Connection;

import static util.HashMethod.hashPassword;

@WebServlet(name = "ResgisterServlet", urlPatterns = {"/views/log/ResgisterServlet"})

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userName = request.getParameter("userName");
        String city = request.getParameter("city");
        int age = Integer.parseInt(request.getParameter("age"));
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");

        UserDAO userDAO = new UserDAO();

        boolean registroExitoso = userDAO.registrarUsuario(email, hashPassword(password), firstName, lastName, userName, city, age, phoneNumber, gender);

        if (registroExitoso) {
            Connection conexion = Conexion.getConexion();
            UserDAO userDAO1 = new UserDAO();
            User user = userDAO1.verificarCredenciales(email, hashPassword(password));
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);
            response.sendRedirect(request.getContextPath() + "/views/user/feed");

        } else {
            response.sendRedirect("login.jsp");
        }
    }
}