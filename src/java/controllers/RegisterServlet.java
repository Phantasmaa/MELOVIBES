package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDAO;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

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

        boolean registroExitoso = userDAO.registrarUsuario(email, password, firstName, lastName, userName, city, age, phoneNumber, gender);

        if (registroExitoso) {
            response.sendRedirect("si.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}