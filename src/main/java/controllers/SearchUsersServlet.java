package controllers;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UserDAO;
import jakarta.servlet.http.HttpSession;
import models.User;


@WebServlet("/views/user/SearchUsersServlet")
public class SearchUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Procesa la búsqueda y obtiene los resultados
        String nombre = request.getParameter("searchTerm");
        System.out.println(nombre);

        // Utiliza UserDAO para obtener resultados
        UserDAO userDAO = new UserDAO();
        List<User> searchResults = userDAO.searchUsers(nombre);

        HttpSession session = request.getSession();
        session.setAttribute("searchResults", searchResults);

        response.sendRedirect(request.getContextPath() + "/views/user/searchUsers.jsp");

    }
}


