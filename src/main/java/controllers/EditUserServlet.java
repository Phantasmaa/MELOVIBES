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

@WebServlet(name = "EditUserServlet", urlPatterns = {"/views/user/EditUserServlet"})

public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("usuario");

        if (user != null) {
            String username = request.getParameter("Nickname");
            String firstName = request.getParameter("Name");
            String lastName = request.getParameter("lastName");
            String city = request.getParameter("City");
            int age = Integer.parseInt(request.getParameter("Age"));
            String phoneNumber = request.getParameter("phoneNumber");
            String gender = request.getParameter("gender");
            String bio = request.getParameter("bio");
            
            UserDAO userDAO = new UserDAO();
            boolean actualizacionExitosa = userDAO.actualizarUsuario(user.getUserID(), username, firstName, lastName, city, age, phoneNumber, gender, bio);

            if (actualizacionExitosa) {
                user.setUserName(username);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setCity(city);
                user.setAge(age);
                user.setPhoneNumber(phoneNumber);
                user.setGender(gender);
                user.setBio(bio);

                response.sendRedirect("feed");
            } else {
                response.sendRedirect("fallo.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
