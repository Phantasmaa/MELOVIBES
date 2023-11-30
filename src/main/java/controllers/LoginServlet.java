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
import java.sql.SQLException;

import static util.HashMethod.hashPassword;

@WebServlet(name = "LoginServlet", urlPatterns = {"/views/log/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("user");
        String contraseña = request.getParameter("password");

        Connection conexion = Conexion.getConexion();
        UserDAO userDAO = new UserDAO();

        User user = userDAO.verificarCredenciales(usuario, hashPassword(contraseña));

        try {
            conexion.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);
            response.sendRedirect(request.getContextPath() + "/views/user/feed");
        } else {
            request.setAttribute("error", "Credenciales incorrectas");
            response.sendRedirect(request.getContextPath());
        }
    }
}
